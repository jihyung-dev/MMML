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

//LRU 캐싱 사용, 가장 최근에 사용하지 않은 데이터 제거.현재 달과 전 달의 2개월치 데이터를 3개까지 보관(총 6개)
const ledgerCache = new Map();
let loaded3MonthCache = {};
// 6개월간 사용자 데이터, 페이지 로딩 시 한번만 호출
let loaded6MonthCache = null;

// 전체 사용자 평균 데이터, 페이지 로딩 시 한번만 호출
let globalAvgLedger = null;

async function loadLedgerChart({ year, month }) {
    const key = `${year}-${month}`;

    // 캐시 확인
    let cached = getCache(key);
    if (cached) {
        drawCategoryPieChart(cached.current.categories);
        drawDailyLineChart(cached.current.daily, cached.prev1.daily);
        return cached;
    }

    // 캐시 없으면 새로 생성
    const bundle = await setCache(key, year, month);

    drawCategoryPieChart(bundle.current.categories);
    drawDailyLineChart(bundle.current.daily, bundle.prev1.daily);
    await renderFullCategoryChart();

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
        const day = d.date.split("-")[2];
        const found = prevDaily.find(p => p.date.endsWith(day));
        return found ? found.expense : 0;
    });

    Highcharts.chart('dailyChart', {
        chart: { type: 'line' },
        title: { text: '일별 지출/수입 추이' },
        xAxis: { categories: currentDaily.map(d => d.date) },
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
    document.getElementById("currentMonthLabel").innerText =
        `${currentYear}년 ${currentMonth}월`;
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
}

async function startDocu() {
    // 1) 전체 평균 데이터 먼저 로드
    globalAvgLedger = await loadGlobalAvgData();

    // 2) 기존 로직들 실행
    await loadLedgerChart({ year: currentYear, month: currentMonth });
    await loadTopData();
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
    const current = await fetch(`/ledger/chart?year=${year}&month=${month}`)
        .then(res => res.json());

    // 지난달 계산
    let prev1Year = year;
    let prev1Month = month - 1;
    if (prev1Month === 0) {
        prev1Month = 12;
        prev1Year--;
    }

    const prev1 = await fetch(`/ledger/chart?year=${prev1Year}&month=${prev1Month}`)
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

