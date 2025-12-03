// Highcharts 전역 설정: 모든 차트에서 햄버거 메뉴 + 워터마크 제거
Highcharts.setOptions({
    exporting: {
        enabled: false
    },
    credits: {
        enabled: false
    }
});
const now = new Date();
// 전역 상태
let currentYear = 2025//now.getFullYear();
let currentMonth = 10//now.getMonth() + 1;

let modalJustOpened = false; // 모달 팝업 플래그
let modalChartInstance = null;

// [추가] 캘린더 객체 저장 변수
let fullCalendarInstance = null;


//LRU 캐싱 사용, 가장 최근에 사용하지 않은 데이터 제거.현재 달과 전 달의 2개월치 데이터를 3개까지 보관(총 6개)
const ledgerCache = new Map();
let loaded3MonthCache = {};
// 6개월간 사용자 데이터, 페이지 로딩 시 한번만 호출
let loaded6MonthCache = null;

// 전체 사용자 평균 데이터, 페이지 로딩 시 한번만 호출
let globalAvgLedger = null;
// 전체 사용자 전달 데이터, 카테고리별, 페이지 로딩 시 한번만 호출
let allCategoryStats = [];
// 선택된 카테고리 리스트
let selectedCategories = new Set();

let genderChart = null;
let ageChart = null;

// 카테고리 별 연령대 배열
let AGE_LABELS = [];

function prepareAgeLabels() {
    const ageSet = new Set();

    allCategoryStats.forEach(s => {
        const a = String(s.ageGroup);
        ageSet.add(`${a}대`);
    });

    AGE_LABELS = Array.from(ageSet).sort();
}

function initCharts() {
    genderChart = Highcharts.chart('genderChartContainer', {
        chart: { type: 'column' },
        title: { text: '성별 평균 지출 비교' },
        xAxis: { categories: ['남성', '여성'] },
        series: []
    });

    ageChart = Highcharts.chart('ageChartContainer', {
        chart: { type: 'column' },
        title: { text: '연령대 평균 지출 비교' },
        xAxis: { categories: AGE_LABELS },
        series: []
    });
}

async function loadLedgerChart({ year, month }) {
    const key = `${year}-${month}`;

    // 캐시 확인
    let cached = getCache(key);
    if (cached) {
        drawCategoryPieChart(cached.current.categories);
        drawDailyLineChart(cached.current.daily, cached.prev1.daily);

        // [추가 1] 캐시가 있을 때 캘린더 그리기
        if(cached.current.daily) initCalendar(cached.current.daily);

        return cached;
    }

    // 캐시 없으면 새로 생성
    const bundle = await setCache(key, year, month);

    drawCategoryPieChart(bundle.current.categories);
    drawDailyLineChart(bundle.current.daily, bundle.prev1.daily);
    await renderFullCategoryChart();

    // [추가 2] 데이터를 새로 가져왔을 때 캘린더 그리기
    if(bundle.current.daily) initCalendar(bundle.current.daily);

    return bundle;




}

function drawCategoryPieChart(categories) {
    Highcharts.chart('categoryChart', {
        chart: { type: 'pie' },
        title: { text: currentYear + '년 ' + currentMonth + '월 소비 내역' },
        plotOptions: {
            pie:{
                cursor: 'pointer',
                point:{
                    events:{
                        // 차트 클릭 시 모달 팝업 열리고, 3개월 데이터와 비교
                        click: function(){
                            const category = this.name;
                            const amount = this.y;

                            openModal(
                                category
                            )
                        }
                    }
                }
            }
        },
        series: [{
            name: '금액',
            colorByPoint: true,
            data: categories.map(c => ({
                name: c.categoryName,
                y: c.amount
            }))
        }]
    });
}

// 3개월 평균 데이터와 이번 달 지출 막대 차트로 출력
function drawCategoryComparisonBarChart(categoryList) {
    Highcharts.chart('threeMonthBarChart', {
        chart: { type: 'column' },
        title: {
            text: '이번 달 vs 최근 3개월 평균 (카테고리별)'
        },
        xAxis: {
            categories: categoryList.map(c => c.name),
            crosshair: true
        },
        yAxis: {
            title: { text: '금액(원)' }
        },
        plotOptions: {
            column: {
                grouping: true,
                pointPadding: 0.1,
                borderWidth: 0
            }
        },
        series: [{
            name: '이번 달',
            data: categoryList.map(c => c.current),
            color: '#1976d2'
        }, {
            name: '3개월 평균',
            data: categoryList.map(c => c.average),
            color: '#90caf9'
        }]
    });
}

// 모달 팝업 내 차트
function drawModalComparePieChart(currentAmount, avgAmount, categoryName) {
    Highcharts.chart('modalCategoryChart', {
        chart: { type: 'pie' },
        title: { text: `${categoryName} - 이번 달 / 3개월 평균` },
        plotOptions: {
            pie: {
                size: '70%',                // 파이 반지름 고정
                center: ['50%', '45%'],     // 항상 가운데 비슷한 위치
                dataLabels: {
                    distance: 15,          // 라벨 너무 멀리 안 나가게
                    style: {
                        fontSize: '12px'
                    }
                }
            }
        },
        series: [{
            name: '금액(원)',
            colorByPoint: true,
            data: [
                {
                    name: '이번 달',
                    y: currentAmount
                },
                {
                    name: '최근 3개월 평균',
                    y: avgAmount
                }
            ]
        }]
    });
}

function drawTop3LineChart(containerId, category, history, overspend) {

    const categories = history.map(h => h.month);
    const data = history.map(h => h.total);

    Highcharts.chart(containerId, {
        chart: {
            type: 'line',
            height: 80,          // 🔥 최소 높이
            backgroundColor: 'transparent',
            margin: [10, 0, 10, 0]
        },
        title: { text: null },

        // X축 완전 미니멀
        xAxis: {
            categories,
            tickLength: 0,
            lineWidth: 0,
            labels: { enabled: false } // 글자 제거
        },

        // Y축 완전 미니멀
        yAxis: {
            title: { text: null },
            gridLineWidth: 0,
            labels: { enabled: false },
            tickAmount: 2   // 혹시 모를 흔들림 방지
        },

        // 포인트 표시 제거
        plotOptions: {
            series: {
                lineWidth: 2,
                marker: { enabled: false },
                enableMouseTracking: false // 마우스 오버 효과 제거
            }
        },

        tooltip: { enabled: false }, // 툴팁 제거

        legend: { enabled: false },
        credits: { enabled: false },

        series: [{
            name: category,
            data: data,
            color: overspend ? '#ff4d4d' : '#4a90e2'
        }]
    });
}


function drawDailyLineChart(currentDaily, prevDaily) {
    // prevDaily가 일수 다를 수 있으니 날짜 기준 맞추기
    const prevExpenseAligned = currentDaily.map(d => {
        // 안전하게 날짜 문자열 처리 (YYYY-MM-DD 형식 가정)
        const dateStr = d.date.toString().split('T')[0];
        const day = dateStr.split("-")[2]; // '일' 부분 추출

        // 지난달 데이터에서 같은 '일(Day)' 찾기
        const found = prevDaily.find(p => {
            const pDateStr = p.date.toString().split('T')[0];
            return pDateStr.endsWith(`-${day}`);
        });
        return found ? found.expense : 0;
    });

    Highcharts.chart('dailyChart', {
        chart: { type: 'line' },
        title: { text: '일별 지출/수입 추이' },
        xAxis: {
            // ★ [수정] 날짜(2025-10-01)에서 앞의 연도 5글자를 잘라내고 '10-01'만 표시
            categories: currentDaily.map(d => {
                const dateStr = d.date.toString().split('T')[0];
                return dateStr.substring(5); // "2025-" 제거 -> "10-01"
            }),
            crosshair: true
        },
        yAxis: { title: { text: '금액(원)' } },
        legend: { enabled: true },
        series: [
            {
                name: '지출(이번 달)',
                data: currentDaily.map(d => d.expense),
                color: '#00a8ff'
            },
            {
                name: '지출(지난달)',
                data: prevExpenseAligned,
                color: '#9e9e9e',
                dashStyle: 'ShortDash'
            },
            {
                name: '수입(이번 달)',
                data: currentDaily.map(d => d.income),
                color: '#8e44ad'
            }
        ]
    });
}


// 월 표시 업데이트

function updateMonthLabel() {
    const text = `${currentYear}년 ${currentMonth}월`;

    // 1. 모바일용 라벨 업데이트 (있으면)
    const mobileLabel = document.getElementById("mobileLabel");
    if(mobileLabel) mobileLabel.innerText = text;

    // 2. PC용 라벨 업데이트 (있으면)
    const desktopLabel = document.getElementById("desktopLabel");
    if(desktopLabel) desktopLabel.innerText = text;

    // (구버전 호환성을 위해 기존 ID도 체크)
    const oldLabel = document.getElementById("currentMonthLabel");
    if(oldLabel) oldLabel.innerText = text;
}


// 이전 월 이동
function prevMonth() {
    currentMonth--;
    if (currentMonth === 0) {
        currentMonth = 12;
        currentYear--;
    }
    updateChart();
}


// 다음 월 이동
function nextMonth() {
    currentMonth++;
    if (currentMonth === 13) {
        currentMonth = 1;
        currentYear++;
    }
    updateChart();
}


// ✔ 차트 업데이트 → API 호출 + 화면 렌더링
// 이번달 데이터 호출 -> 6개월 데이터 호출
async function updateChart() {
    updateMonthLabel();
    await loadLedgerChart({ year: currentYear, month: currentMonth });
    // ★ [추가] 리스트 테이블 로딩/갱신
    initDataTable();
}

async function startDocu() {
    // 1) 전체 평균 데이터 먼저 로드
    globalAvgLedger = await loadGlobalAvgData();

    // 2) 기존 로직들 실행
    await loadLedgerChart({ year: currentYear, month: currentMonth });
    await loadTopData(); // Top3 데이터
    await loadAllCategoryStats(); // 성별 연령대 별 통계
    buildCategorySelectList();
    initCharts();
    prepareAgeLabels();
}

// 초기 로딩
document.addEventListener("DOMContentLoaded", () => {
    startDocu();
});

async function openModal(category) {
    const modal = document.getElementById("chartModal");
    modal.classList.add("show");
    modal.style.display = "flex";

    modalJustOpened = true;
    setTimeout(() => modalJustOpened = false, 100);

    const key = `${currentYear}-${currentMonth}`;

    // 1) 이번 달 데이터는 ledgerCache 에서 가져오기
    const currentMonthAmount = getCategoryFromLedgerCache(key, category);

    if (currentMonthAmount == null) {
        console.warn("현재 월 캐시에서 카테고리를 찾을 수 없습니다:", category);
        return;
    }

    // 2) 3개월 데이터 가져오기 (합계)
    const threeMonthData = await load3MonthData(key);

    const threeMonthCategory = threeMonthData.categories.find(
        c => c.categoryName === category
    );

    if (!threeMonthCategory) {
        console.warn("3개월 데이터에 해당 카테고리가 없습니다:", category);
        return;
    }

    const avg = Number(threeMonthCategory.amount) / 3;

    // 3) 모달 파이 차트 그리기
    drawModalComparePieChart(currentMonthAmount, avg, category);

    // 4) 텍스트 표시 업데이트
    updateModalComparisonView(
        currentMonthAmount,
        avg
    );
}

// 이전 3개월 데이터 호출, 데이터 캐싱
async function load3MonthData(key) {
    if(loaded3MonthCache[key])
        return loaded3MonthCache[key];
    else // 3개월 비교데이터는 단 한개만 캐싱
        loaded3MonthCache = {};
    // 없으면 fetch 해서 가져오고 저장 후 return
    const res = await fetch(`/ledger/request/userLedger/month?year=${currentYear}&month=${currentMonth}&period=3`);
    const data = await res.json();

    loaded3MonthCache[key] = data;
    return data; // 반드시 return 해야함
}

// 이전 6개월 데이터 호출, 데이터 캐싱, 최초 한번만 호출
async function load6MonthData() {
    // 캐시 있으면 그대로 반환
    if (loaded6MonthCache !== null) {
        return loaded6MonthCache;
    }

    // 없으면 fetch 해서 가져오고 저장 후 return
    const last6 = await fetch(`/ledger/request/userLedger/6month?year=${currentYear}&month=${currentMonth}&period=6`);
    const data = await last6.json();
    loaded6MonthCache = data;

    console.log("📌 load6MonthData() 결과(last6):", data);
    return data; // 반드시 return 해야함
}

function closeModal() {
    const modal = document.getElementById("chartModal");
    modal.style.display = "none";
    modal.classList.remove("show");
    if(modalChartInstance) modalChartInstance.destroy();
    setTimeout(() => (modal.style.display = "none"), 250);
}

// 모달 강제로 안뜨게 하는 코드
document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("chartModal").style.display = "none";
});

// 밖에 눌러도 모달 종료
document.addEventListener("click", (e) => {
    const modal = document.getElementById("chartModal");
    const content = document.querySelector(".modal-content");

    if (modal.style.display !== "flex") return; // 안 열려있으면 무시
    if (modalJustOpened) return; // 바로 닫히는 버그 방지
    if (content.contains(e.target)) return; // 내부 클릭은 무시

    closeModal();
});

// esc로 모달 종료
document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") closeModal();
});

// 3개월간 데이터 캐싱(LRU 방식 사용)
async function setCache(key, year, month, maxSize = 3) {
    // 이미 존재하면 최신으로 갱신
    if (ledgerCache.has(key)) {
        const old = ledgerCache.get(key);
        ledgerCache.delete(key);
        ledgerCache.set(key, old);
        return old;
    }

    // 현재 달 데이터
    const current = await fetch(`/api/ledger/dashboard-data?year=${year}&month=${month}`)
        .then(res => res.json());

    // 지난달 계산
    let prev1Year = year;
    let prev1Month = month - 1;
    if (prev1Month === 0) {
        prev1Month = 12;
        prev1Year--;
    }

    const prev1 = await fetch(`/api/ledger/dashboard-data?year=${prev1Year}&month=${prev1Month}`)
        .then(res => res.json());

    const bundle = { current, prev1 };

    // LRU 저장
    ledgerCache.set(key, bundle);

    if (ledgerCache.size > maxSize) {
        const oldestKey = ledgerCache.keys().next().value;
        ledgerCache.delete(oldestKey);
    }

    return bundle;
}

function getCache(key) {
    if (!ledgerCache.has(key)) return null;

    // LRU : 사용된 항목 최신으로 이동
    const value = ledgerCache.get(key);
    ledgerCache.delete(key);
    ledgerCache.set(key, value);

    return value;   // { current: {...}, prev1: {...} }
}


function get3MonthAverage(categoryName, key) {
    const data = loaded3MonthCache[key];

    // categories = 이미 3개월 합계
    const match = data.categories.find(c => c.categoryName === categoryName);

    if (!match) return { values: [], average: 0 };

    const average = Number(match.amount) / 3;

    return {
        values: [match.amount],   // 쓸 필요 없으면 그냥 버려도 됨
        average: average
    };
}

// 비교값 표시
function updateModalComparisonView(curr, avg) {
    document.getElementById("modalCurrentValue").innerText = curr.toLocaleString();
    document.getElementById("modalAverageValue").innerText = avg.toLocaleString();
}

// 특정 카테고리 금액 가져오기
function getCategoryFromLedgerCache(key, categoryName) {
    const bundle = ledgerCache.get(key);
    if (!bundle || !bundle.current) return null;

    const found = bundle.current.categories.find(
        c => c.categoryName === categoryName
    );

    return found ? Number(found.amount) : null;
}

// 3개월간 데이터 + 이번 달 데이터 합쳐서 리턴
async function renderFullCategoryChart() {
    const key = `${currentYear}-${currentMonth}`;

    const cache = ledgerCache.get(key);
    const current = cache.current.categories;

    const threeMonthData = await load3MonthData(key);
    const threeMonth = threeMonthData.categories;

    const list = buildCategoryComparisonList(current, threeMonth);

    drawCategoryComparisonBarChart(list);
}

// 3개월간 데이터의 평균치(모든 카테고리)
function buildCategoryComparisonList(currentCategories, threeMonthCategories) {
    const result = [];

    currentCategories.forEach(cur => {
        const avgData = threeMonthCategories.find(t => t.categoryName === cur.categoryName);
        const avg = avgData ? Number(avgData.amount) / 3 : 0;

        result.push({
            name: cur.categoryName,
            current: Number(cur.amount),
            average: avg
        });
    });

    return result;
}

async function exportExcel(mail) {
    const url = `/excel/export/mail?year=${currentYear}&month=${currentMonth}&email=${mail}`;

    const res = await fetch(url, { method: "GET" });

    if (!res.ok) {
        alert("엑셀 생성 실패");
        return;
    }

}
// top 데이터 관련
/*
 * 초기 로딩 시 6개월치 데이터를 로딩 -> 이번달 내역 중 가장 많은 비중을 차지 하는 3개의 카테고리의 데이터를 선형 차트로 노출
 */

// 6개월치 데이터 로드
async function loadTopData() {
    const last6 = await load6MonthData();  // 6개월 전체 데이터

    const key = `${currentYear}-${currentMonth}`;
    const monthObj = ledgerCache.get(key);

    if (!monthObj || !monthObj.current?.categories) {
        console.log("이번달 데이터 없음");
        return;
    }

    // 1) 이번달 Top3
    const top3 = getTop3FromCategories(monthObj.current.categories);
    console.log("Top3:", top3);

    // 2) 카드 + 차트 업데이트
    updateTop3CardsAndCharts(top3, monthObj.current.categories, last6);
}

// top3 카테고리의 월, 사용 금액 분류
function getHistoryForCategory(monthlyList, categoryName) {
    return monthlyList.map(m => {
        const match = m.summary.categories.find(c => c.categoryName === categoryName);
        return {
            month: m.month,
            total: match ? Number(match.amount) : 0
        };
    });
}

// top3 카테고리 분류
function getTop3FromCategories(entries) {

    if (!Array.isArray(entries) || entries.length === 0) {
        return [];
    }

    const sumByCategory = {};

    entries.forEach(entry => {
        const cat = entry.categoryName ?? entry.category;
        const amount = Number(entry.entryAmount ?? entry.amount ?? 0);

        if (!cat) return;

        if (!sumByCategory[cat]) {
            sumByCategory[cat] = 0;
        }
        sumByCategory[cat] += amount;
    });

    const sorted = Object.entries(sumByCategory)
        .sort((a, b) => b[1] - a[1])
        .slice(0, 3);

    return sorted.map(([category]) => category);
}

// top 3 카테고리 선형 차트
function updateTop3CardsAndCharts(top3, thisMonthCategories, last6) {

    if (!globalAvgLedger) {
        console.warn("globalAvg 데이터가 없음");
        globalAvgLedger = [];
    }

    const cardIds = [
        { cat: "top1-category", my: "top1-my", diff: "top1-diff", chart: "top1-chart" },
        { cat: "top2-category", my: "top2-my", diff: "top2-diff", chart: "top2-chart" },
        { cat: "top3-category", my: "top3-my", diff: "top3-diff", chart: "top3-chart" }
    ];

    top3.forEach((category, i) => {
        const card = cardIds[i];

        // 이번달 금액
        const thisItem = thisMonthCategories.find(c => c.categoryName === category);
        const thisMonthTotal = thisItem ? Number(thisItem.amount) : 0;

        document.getElementById(card.cat).textContent = category;
        document.getElementById(card.my).textContent = `${thisMonthTotal.toLocaleString()} 원`;

        // 전체 평균 가져오기
        const globalItem = globalAvgLedger.find(c => c.category  === category);
        const globalValue = globalItem ? Number(globalItem.avg) : 0;

        const diffPercent = globalValue > 0
            ? (((thisMonthTotal - globalValue) / globalValue) * 100).toFixed(1)
            : 0;

        const overspend = globalValue > 0 && thisMonthTotal > globalValue * 1.2;  // 평균보다 20% 초과일 경우 빨간 색으로 차트 생성

        document.getElementById(card.diff).textContent = `${diffPercent}%`;

        // 6개월 라인 차트
        const history = getHistoryForCategory(last6, category);
        drawTop3LineChart(card.chart, category, history, overspend);
    });
}


// 지난 달 사용자 데이터 호출
async function loadGlobalAvgData() {
    try {
        const res = await fetch(`/stats/loadAll`);
        const data = await res.json();
        console.log("글로벌 평균 데이터 로드 완료:", data);
        return data;
    } catch (e) {
        console.error("글로벌 평균 데이터 로드 실패:", e);
        return [];
    }
}

async function loadAllCategoryStats() {
    const res = await fetch('/stats/loadAll_group');
    allCategoryStats = await res.json();
}

function buildCategorySelectList() {
    const categories = new Set();

    allCategoryStats.forEach(stat => {
        categories.add(stat.category);
    });

    const listEl = document.getElementById("categorySelectList");
    listEl.innerHTML = "";

    categories.forEach(cat => {
        const btn = document.createElement("button");
        btn.className = "category-btn";
        btn.textContent = cat;

        btn.addEventListener("click", () => {
            btn.classList.toggle("active");
            toggleCategory(cat);
        });

        listEl.appendChild(btn);
    });
}

function toggleCategory(categoryName) {
    const area = document.getElementById("categoryStatsCharts");

    // 선택 토글 처리
    if (selectedCategories.has(categoryName)) {
        selectedCategories.delete(categoryName);
        removeCategoryFromCharts(categoryName);
    } else {
        selectedCategories.add(categoryName);
        addCategoryToCharts(categoryName);
    }

    // 선택된 카테고리가 하나라도 있으면 열기
    if (selectedCategories.size > 0) {
        openChartArea(area);
    }
    // 모두 해제되면 닫기
    else {
        closeChartArea(area);
    }
}

let clearChartTimeout = null;

function closeChartArea(area) {
    area.classList.remove("open");

    // 이미 예약된 series 제거 작업이 있으면 취소
    if (clearChartTimeout) {
        clearTimeout(clearChartTimeout);
    }

    // 애니메이션 끝난 뒤 시리즈 제거
    clearChartTimeout = setTimeout(() => {
        if (selectedCategories.size === 0) {
            genderChart.series.slice().forEach(s => s.remove());
            ageChart.series.slice().forEach(s => s.remove());
        }
    }, 350);
}

function openChartArea(area) {
    if (!area.classList.contains("open")) {
        area.classList.add("open");

        // 레이아웃이 확정된 후 reflow
        setTimeout(() => {
            genderChart.reflow();
            ageChart.reflow();
        }, 350);
    }
}

// 카테고리 추가 제거
function addCategoryToCharts(categoryName) {
    const stat = getStatForCategory(categoryName);
    const color = colorFromCategory(categoryName);

    stat.age = stat.age.map(v => ({
        age: typeof v.age === "string" && v.age.includes("대")
            ? v.age
            : `${v.age}대`,
        value: v.value
    }));

    // (ex: ["20대","30대","40대"])
    const ages = stat.age.map(v => v.age);

    // 숫자 혹은 이상값 필터링
    const validAges = ages.filter(age => /^[0-9]+대$/.test(age));

    // 이미 있는 AGE_LABELS와 합쳐서 순서 유지
    validAges.forEach(age => {
        if (!AGE_LABELS.includes(age)) AGE_LABELS.push(age);
    });

    AGE_LABELS.sort();

    ageChart.xAxis[0].setCategories(AGE_LABELS);

    const ageMap = {};
    stat.age.forEach(v => {
        ageMap[v.age] = v.value;
    });

    const finalAgeData = AGE_LABELS.map(label => {
        return ageMap[label] ?? null;
    });

    genderChart.addSeries({
        name: categoryName,
        data: [
            stat.gender.male ?? null,
            stat.gender.female ?? null
        ],
        color: color
    });

    ageChart.addSeries({
        name: categoryName,
        data: finalAgeData,
        color: color
    });
}

function removeCategoryFromCharts(categoryName) {
    // 성별 차트 제거
    const series1 = genderChart.series.find(s => s.name === categoryName);
    if (series1) series1.remove();

    // 연령대 차트 제거
    const series2 = ageChart.series.find(s => s.name === categoryName);
    if (series2) series2.remove();
}

// 카테고리별 계산
function getStatForCategory(categoryName) {
    const filtered = allCategoryStats.filter(s => s.category === categoryName);

    const genderMap = {};
    const ageMap = {};

    filtered.forEach(s => {
        const g = s.gender;
        const a = String(s.ageGroup); // 숫자 → 문자열 변환
        const avg = Number(s.avg);
        const c = Number(s.count);

        if (!genderMap[g]) genderMap[g] = { sum: 0, count: 0 };
        genderMap[g].sum += avg * c;
        genderMap[g].count += c;

        if (!ageMap[a]) ageMap[a] = { sum: 0, count: 0 };
        ageMap[a].sum += avg * c;
        ageMap[a].count += c;
    });
    return {
        gender: {
            male: genderMap["M"] ? Math.round(genderMap["M"].sum / genderMap["M"].count) : 0,
            female: genderMap["F"] ? Math.round(genderMap["F"].sum / genderMap["F"].count) : 0
        },
        age: Object.entries(ageMap).map(([age, obj]) => ({
            age: `${age}대`,
            value: Math.round(obj.sum / obj.count)
        }))
    }
}

// 카테고리별 차트 색상 해시 기반으로 색 생성 함수
function colorFromCategory(cat) {
    let hash = 0;
    for (let i = 0; i < cat.length; i++) {
        hash = cat.charCodeAt(i) + ((hash << 5) - hash);
    }

    let color = '#';
    for (let i = 0; i < 3; i++) {
        const value = (hash >> (i * 8)) & 0xFF;
        color += ('00' + value.toString(16)).slice(-2);
    }
    return color;
}

// =========================================
// [New] 캘린더 로직 (파일 맨 아래에 붙여넣기)
// =========================================

function initCalendar(dailyData) {
    var calendarEl = document.getElementById('calendar');

    // 1. 기존 캘린더가 있으면 삭제 (월 이동 시 중복 생성 방지)
    if(fullCalendarInstance) {
        fullCalendarInstance.destroy();
    }

    // 2. 캘린더가 들어갈 HTML 요소가 진짜 있는지 확인
    if (!calendarEl) {
        console.warn("HTML에 id='calendar'인 요소가 없습니다.");
        return;
    }

    // 3. 새 캘린더 생성
    fullCalendarInstance = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko', // 한국어 설정
        // 현재 보고 있는 달(currentYear, currentMonth)로 달력 시작
        initialDate: `${currentYear}-${String(currentMonth).padStart(2, '0')}-01`,
        headerToolbar: false, // 상단 기본 버튼 숨김 (우리가 만든 화살표 버튼 사용)
        height: '100%',       // 높이 꽉 채우기

        // ★ [추가] 정렬 기준 설정 ('sortIdx' 라는 우리가 만든 번호를 기준으로 정렬해라!)
        eventOrder: 'sortIdx',

        // ★ 핵심: 리스트 대신 금액 이벤트 생성
        events: createEventsFromDailyData(dailyData),

        // 날짜 클릭 시 동작 (필요시 구현)
        dateClick: function(info) {
            console.log("클릭한 날짜:", info.dateStr);
        }
    });

    fullCalendarInstance.render();
}

// [Helper] 일별 데이터를 FullCalendar 이벤트로 변환 (색상 강제 적용 버전)
function createEventsFromDailyData(dailyData) {
    const events = [];

    // 데이터 검증
    if (!dailyData || !Array.isArray(dailyData)) {
        console.warn("⚠️ 캘린더 데이터가 비어있습니다.");
        return events;
    }

    dailyData.forEach(day => {
        // 날짜 형식 안전 처리
        if (!day.date) return;

        let dateStr = "";
        if (Array.isArray(day.date)) {
            const y = day.date[0];
            const m = String(day.date[1]).padStart(2, '0');
            const d = String(day.date[2]).padStart(2, '0');
            dateStr = `${y}-${m}-${d}`;
        } else {
            dateStr = day.date.toString().split("T")[0];
        }

        // 1. 수입 (파란색 강제 적용)
        if (day.income > 0) {
            events.push({
                title: `+${Number(day.income).toLocaleString()}`,
                start: dateStr,
                // ★ 여기가 핵심 수정: textColor 직접 지정
                textColor: '#004085',
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                display: 'block',
                classNames: ['income-text'], // (혹시 몰라 클래스도 남김)
                // ★ 정렬 순서: 0번 (우선순위 높음 -> 상단 배치)
                sortIdx: 0
            });
        }

        // 2. 지출 (빨간색 강제 적용)
        if (day.expense > 0) {
            events.push({
                title: `-${Number(day.expense).toLocaleString()}`,
                start: dateStr,
                // ★ 여기가 핵심 수정: textColor 직접 지정
                textColor: '#d63031',
                backgroundColor: 'transparent',
                borderColor: 'transparent',
                display: 'block',
                classNames: ['expense-text'],
                // ★ 정렬 순서: 1번 (우선순위 낮음 -> 하단 배치)
                sortIdx: 1
            });
        }
    });

    // 디버깅용: 콘솔에서 날짜와 색상이 들어갔는지 확인
    console.log("✅ 캘린더 이벤트 생성 완료 (첫번째 데이터):", events[0]);
    return events;
}
async function startDocu() {
    // 1) 전체 평균 데이터 먼저 로드
    globalAvgLedger = await loadGlobalAvgData();

    // 2) 차트 및 캘린더 로드
    await loadLedgerChart({ year: currentYear, month: currentMonth });

    // 3) ★ [추가] 리스트 테이블 로드 (이 한 줄이 없어서 처음에 안 나왔던 것!)
    initDataTable();

    // 4) 나머지 로직들 (순서 중요)
    await loadTopData();
    await loadAllCategoryStats();
    buildCategorySelectList();
    initCharts();
    prepareAgeLabels();
}
// =========================================
// [New] DataTables 리스트 로직 (컬럼 확장판)
// =========================================

    let ledgerTable = null;

function initDataTable() {
    if (ledgerTable) {
        ledgerTable.ajax.url(`/api/ledger/transaction-list?year=${currentYear}&month=${currentMonth}`).load();
        return;
    }

    ledgerTable = $('#ledgerTable').DataTable({
        ajax: {
            url: `/api/ledger/transaction-list?year=${currentYear}&month=${currentMonth}`,
            dataSrc: ''
        },
        columns: [
            // ... (기존 컬럼 설정들 100% 동일하게 유지) ...
            {
                data: 'occurredAt',
                width: "12%",
                render: function(data) {
                    if(!data) return "-";
                    const date = new Date(data);
                    const m = String(date.getMonth() + 1).padStart(2, '0');
                    const d = String(date.getDate()).padStart(2, '0');
                    const h = String(date.getHours()).padStart(2, '0');
                    const min = String(date.getMinutes()).padStart(2, '0');
                    return `${m}-${d} <span style="color:#888; font-size:0.9em;">${h}:${min}</span>`;
                }
            },
            {
                data: 'entryType',
                width: "8%",
                className: "text-center",
                render: function(data) {
                    if(data === 'INCOME') return '<span class="badge bg-primary-subtle text-primary-emphasis rounded-pill">수입</span>';
                    if(data === 'EXPENSE') return '<span class="badge bg-danger-subtle text-danger-emphasis rounded-pill">지출</span>';
                    return data;
                }
            },
            {
                data: 'categoryName',
                width: "10%",
                defaultContent: "-"
            },
            { data: 'memo', defaultContent: "-" },
            {
                data: 'placeOfUse',
                width: "15%",
                defaultContent: "-",
                render: function(data) { return data ? data : '<span style="color:#ccc;">(미기재)</span>'; }
            },
            {
                data: 'payType',
                width: "10%",
                className: "text-center",
                defaultContent: "-",
                render: function(data) {
                    if(data === 'CARD') return '💳 카드';
                    if(data === 'CASH') return '💵 현금';
                    if(data === 'TRANSFER') return '🏦 이체';
                    return data;
                }
            },
            {
                data: 'entryAmount',
                width: "12%",
                className: "text-end",
                render: function(data, type, row) {
                    const num = Number(data).toLocaleString();
                    const color = row.entryType === 'INCOME' ? '#3781d1' : '#db6767';
                    return `<span style="color:${color}; font-weight:bold;">${num}원</span>`;
                }
            }
        ],
        // [디자인 옵션]
        order: [[0, 'asc']], // 1일부터 정렬
        pageLength: 10,
        lengthChange: false,
        language: { url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/ko.json" },
        responsive: true,

        // ★ [핵심 1] 레이아웃 커스텀 (dom 설정)
        // 'top-toolbar': 상단 영역 (엑셀 버튼 들어갈 곳)
        // 't': 테이블 (Table)
        // 'bottom-toolbar': 하단 영역 (정보 - 검색 - 페이징)
        dom: '<"top-toolbar" > t <"bottom-toolbar" i f p >',

        // ★ [핵심 2] 요소 이동 및 커스텀
        initComplete: function() {
            // 1) 엑셀 버튼을 상단 툴바(.top-toolbar)로 이사시키고 보이게 하기
            $('#btnExcelExport')
                .appendTo('.top-toolbar')
                .show();

            // 2) 검색창에 ID/Name 부여 (경고 제거용)
            $('#ledgerTable_filter input')
                .attr('id', 'dt-search-box')
                .attr('name', 'dt-search-box')
                .attr('placeholder', '내역 검색...'); // 플레이스홀더 추가
        }
    });

}
// [ledger.js] 맨 아래 함수 교체

function createEventsFromDailyData(dailyData) {
    const events = [];

    if (!dailyData || !Array.isArray(dailyData)) return events;

    // 1. 이번 달의 최대 수입/지출 찾기 (농도 계산용)
    let maxIncome = 0;
    let maxExpense = 0;

    dailyData.forEach(day => {
        if (day.income > maxIncome) maxIncome = day.income;
        if (day.expense > maxExpense) maxExpense = day.expense;
    });

    // 0으로 나누기 방지
    if (maxIncome === 0) maxIncome = 1;
    if (maxExpense === 0) maxExpense = 1;

    dailyData.forEach(day => {
        if (!day.date) return;

        // 날짜 파싱
        let dateStr = "";
        if (Array.isArray(day.date)) {
            const y = day.date[0];
            const m = String(day.date[1]).padStart(2, '0');
            const d = String(day.date[2]).padStart(2, '0');
            dateStr = `${y}-${m}-${d}`;
        } else {
            dateStr = day.date.toString().split("T")[0];
        }

        // 2. 수입 이벤트 생성 (파란색 히트맵)
        if (day.income > 0) {
            // 투명도 계산: 최소 0.2 ~ 최대 1.0
            const opacity = 0.2 + (day.income / maxIncome) * 0.8;

            events.push({
                title: `+${Number(day.income).toLocaleString()}`,
                start: dateStr,
                // 배경색: 파란색(RGB: 0, 123, 255) + 투명도
                backgroundColor: `rgba(0, 123, 255, ${opacity})`,
                borderColor: 'transparent',
                textColor: '#fff', // 배경이 있으니 글씨는 흰색
                display: 'block',
                sortIdx: 0,
                classNames: ['heatmap-event']
            });
        }

        // 3. 지출 이벤트 생성 (빨간색 히트맵)
        if (day.expense > 0) {
            // 투명도 계산
            const opacity = 0.2 + (day.expense / maxExpense) * 0.8;

            events.push({
                title: `-${Number(day.expense).toLocaleString()}`,
                start: dateStr,
                // 배경색: 빨간색(RGB: 220, 53, 69) + 투명도
                backgroundColor: `rgba(220, 53, 69, ${opacity})`,
                borderColor: 'transparent',
                textColor: '#fff', // 글씨는 흰색
                display: 'block',
                sortIdx: 1,
                classNames: ['heatmap-event']
            });
        }
    });

    return events;
}

// json 데이터 로드(개인 거래 내역)
async function loadLedgerData() {
    try{
        const url = "/ledger/loadData";
        const res = await fetch(url, {
            method: "POST",
            headers: {"Accept": "application/json", "Content-Type": "application/json"},
        })

        if(!res.ok){
            throw new Error("Failed to load ledger data")
        }

        const result = await res.json();
        console.log("ledger data loaded:", result);

    }catch{
        console.log("Error");
    }
}