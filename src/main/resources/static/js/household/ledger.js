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
let currentYear = now.getFullYear();
let currentMonth = now.getMonth() + 1;

// 이번 달 vs 3 개월 데이터 비교 플래그
let isThreeMonthBarChartDrawn = false;

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
// 엑셀 데이터
let lastExcelRows = null;
// 일별 데이터 막대 그래프 인스턴스
let dailyLineChartInstance = null;
//top3 차트
const top3ChartInstances = { top1: null, top2: null, top3: null };
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

/**
 * 월별 총 수입과 지출을 계산하여 화면에 표시합니다.
 * @param {object} data - 현재 월의 데이터 객체 (daily 배열 포함)
 */
function updateMonthlyTotals(data) {
    const container = document.getElementById('categorySummary');
    if (!container || !data || !data.daily) return;

    // daily 데이터를 사용하여 총액 계산
    const totalIncome = data.daily.reduce((sum, d) => sum + d.income, 0);
    const totalExpense = data.daily.reduce((sum, d) => sum + d.expense, 0);

    const incomeColor = '#3781d1';
    const expenseColor = '#db6767';

    container.innerHTML = `
        <div style="font-weight: bold; padding: 10px 0; border-top: 1px solid #eee;">
            <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                <span>수입 소계</span>
                <span style="color: ${incomeColor}; font-size: 1.1em;">
                    +${totalIncome.toLocaleString()} 원
                </span>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span>지출 소계</span>
                <span style="color: ${expenseColor}; font-size: 1.1em;">
                    -${totalExpense.toLocaleString()} 원
                </span>
            </div>
        </div>
    `;
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
    if(!isThreeMonthBarChartDrawn)
        await renderFullCategoryChart();

    // [New] 소계 업데이트 // 추가!
    if(bundle.current.daily) updateMonthlyTotals(bundle.current);

    // [추가 2] 데이터를 새로 가져왔을 때 캘린더 그리기
    if(bundle.current.daily) initCalendar(bundle.current.daily);

    return bundle;
}

function drawCategoryPieChart(categories) {
    if (!categories || categories.length === 0) {
        showChartEmpty("categoryChart");
        return;
    }
    showChart("categoryChart");

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

function showEmptyChart(wrapperEl, chartId) {
    // empty overlay 표시
    const emptyEl = wrapperEl.querySelector(".chart-empty");
    if (emptyEl) emptyEl.style.display = "flex";

    // 실제 차트 div 숨김
    const chartEl = wrapperEl.querySelector(`#${chartId}`);
    if (chartEl) chartEl.style.display = "none";
}

function hideEmptyChart(wrapperEl, chartId) {
    const emptyEl = wrapperEl.querySelector(".chart-empty");
    if (emptyEl) emptyEl.style.display = "none";

    const chartEl = wrapperEl.querySelector(`#${chartId}`);
    if (chartEl) chartEl.style.display = "block";
}

// 3개월 평균 데이터와 이번 달 지출 막대 차트로 출력
function drawCategoryComparisonBarChart(categoryList) {
    // const wrapper = document
    //     .getElementById("threeMonthBarChart")
    //     .closest(".bar-chart-wrapper");
    //
    // // ✅ 데이터 없음 처리 (여기가 핵심)
    // if (!Array.isArray(categoryList) || categoryList.length === 0) {
    //     showEmptyChart(wrapper, "threeMonthBarChart");
    //
    //     // 혹시 이전 차트가 있으면 제거
    //     if (threeMonthBarChartInstance.is) {
    //         threeMonthBarChartInstance.destroy();
    //         threeMonthBarChartInstance = null;
    //     }
    //     return;
    // }
    // hideEmptyChart(wrapper, "threeMonthBarChart");
    //
    // isThreeMonthBarChartDrawn = true;
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
function emptyTop3(cardKey) {
    const card = document.querySelector(`.top3-card[data-key="${cardKey}"]`);

    // 1) 이전 차트 완전 제거
    if (top3ChartInstances[cardKey]) {
        top3ChartInstances[cardKey].destroy();
        top3ChartInstances[cardKey] = null;
    }

    // 2) UI 전환
    card.classList.add('is-empty');
}
function showTop3Chart(cardKey, containerId, history, overspend) {
    const card = document.querySelector(`.top3-card[data-key="${cardKey}"]`);

    // 1) empty 상태 해제
    card.classList.remove('is-empty');

    // 2) 기존 차트 제거 (안전장치)
    if (top3ChartInstances[cardKey]) {
        top3ChartInstances[cardKey].destroy();
        top3ChartInstances[cardKey] = null;
    }

    // 3) 새 차트 생성
    top3ChartInstances[cardKey] = Highcharts.chart(containerId, {
        chart: { type: 'line', height: 120, backgroundColor: 'transparent' },
        title: { text: null },
        credits: { enabled: false },
        exporting: { enabled: false },
        xAxis: { visible: false },
        yAxis: { visible: false },
        legend: { enabled: false },
        series: [{
            data: history.map(h => h.total),
            color: overspend ? '#ff4d4d' : '#4a90e2'
        }]
    });
}

function drawTop3LineChart(containerId, category, history, overspend) {

    const categories = history.map(h => h.month);
    const data = history.map(h => h.total);

    return  Highcharts.chart(containerId, {
        chart: {
            type: 'line',
            height: 80,
            backgroundColor: 'transparent',
            margin: [10, 0, 10, 0]
        },
        title: { text: null },

        xAxis: {
            categories,
            tickLength: 0,
            lineWidth: 0,
            labels: { enabled: false }
        },

        yAxis: {
            title: { text: null },
            gridLineWidth: 0,
            labels: { enabled: false },
            tickAmount: 2
        },

        plotOptions: {
            series: {
                lineWidth: 2,
                marker: { enabled: false },
                enableMouseTracking: false
            }
        },

        tooltip: { enabled: false },
        legend: { enabled: false },
        credits: { enabled: false },

        series: [{
            name: category,
            data,
            color: overspend ? '#ff4d4d' : '#4a90e2'
        }]
    });
}

// 일별 데이터(막대 그래프)
function drawDailyLineChart(currentDaily, prevDaily) {
    const wrapper = document
        .getElementById("dailyChart")
        .closest(".bar-chart-wrapper");

    // ✅ 1. 데이터 없음 처리 (여기가 핵심)
    if (
        !Array.isArray(currentDaily) || currentDaily.length === 0 ||
        !Array.isArray(prevDaily) || prevDaily.length === 0
    ) {
        showEmptyChart(wrapper, "dailyChart");

        // 이전 차트 있으면 제거
        if (dailyLineChartInstance) {
            dailyLineChartInstance.destroy();
            dailyLineChartInstance = null;
        }
        return;
    }

    // ✅ 2. 데이터 있으면 empty 숨김
    hideEmptyChart(wrapper, "dailyChart");

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

// 1. 모바일용 라벨 업데이트
    const mobileLabel = document.getElementById("mobileLabel");
    if(mobileLabel) mobileLabel.innerText = text;

    // 2. PC용 상단 라벨 업데이트
    const desktopLabel = document.getElementById("desktopLabel");
    if(desktopLabel) desktopLabel.innerText = text;

    // 3. [핵심] 하단 테이블 위 라벨 업데이트 (이 부분이 없으면 숫자가 안 바뀝니다)
    const bottomLabel = document.getElementById("bottomMonthLabel");
    if(bottomLabel) bottomLabel.innerText = text;

    // 기존 내용
    // const text = `${currentYear}년 ${currentMonth}월`;
    //
    // // 1. 모바일용 라벨 업데이트 (있으면)
    // const mobileLabel = document.getElementById("mobileLabel");
    // if(mobileLabel) mobileLabel.innerText = text;
    //
    // // 2. PC용 라벨 업데이트 (있으면)
    // const desktopLabel = document.getElementById("desktopLabel");
    // if(desktopLabel) desktopLabel.innerText = text;
    //
    // // (구버전 호환성을 위해 기존 ID도 체크)
    // const oldLabel = document.getElementById("currentMonthLabel");
    // if(oldLabel) oldLabel.innerText = text;
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

// 주석처리 확인용 !
// async function startDocu() {
//     // 1) 전체 평균 데이터 먼저 로드
//     globalAvgLedger = await loadGlobalAvgData();
//
//     // 2) 기존 로직들 실행
//     await loadLedgerChart({year: currentYear, month: currentMonth});
//     await loadTopData(); // Top3 데이터
//     await loadAllCategoryStats(); // 성별 연령대 별 통계
//     buildCategorySelectList();
//     initCharts();
//     prepareAgeLabels();
//
//     hideSkeleton();
// }

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
// 2025/12/9 수정 - 데이터 변경 발생 시 다시 호출하는 걸로 변경
async function load6MonthData() {
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


// [New] 마우스 클릭 시작 위치를 저장할 변수
let mouseDownTarget = null;

document.addEventListener('mousedown', (e) => {
    mouseDownTarget = e.target;
});

// =========================================
// 1. 클릭 이벤트 리스너 (모달 외부 클릭 시 닫기)
// =========================================
document.addEventListener("click", (e) => {
    // 1. 기존 차트 모달 닫기
    const chartModal = document.getElementById("chartModal");
    if (chartModal && chartModal.style.display === "flex") {
        const content = chartModal.querySelector(".modal-content");
        if (content && !content.contains(e.target) && !content.contains(mouseDownTarget) && !modalJustOpened) {
            closeModal();
        }
    }

    // 2. 입력/수정 모달(앞쪽) 닫기
    const addModal = document.getElementById("addEntryModal");
    let isAddModalOpen = false; // 플래그 변수
    if (addModal && addModal.style.display === "flex") {
        isAddModalOpen = true; // 열려있음 표시
        const content = addModal.querySelector(".modal-content");
        // 드래그 후 밖에서 뗐을 때 닫힘 방지
        if (content && !content.contains(e.target) && !content.contains(mouseDownTarget) && !modalJustOpened) {
            closeAddEntryModal();
            isAddModalOpen = false; // 닫혔으므로 false
        }
    }

    // 3. [수정됨] 리스트 모달(뒤쪽) 닫기
    const listModal = document.getElementById("dayListModal");
    if (listModal && listModal.style.display === "flex") {
        const content = listModal.querySelector(".modal-content");

        // 캘린더나 이벤트 클릭 방지
        const isCalendarClick = e.target.closest('.fc-daygrid-day') || e.target.closest('.fc-event');

        // ★ [핵심 수정] 앞쪽 모달(addEntryModal)이 열려있으면(!isAddModalOpen) 닫지 않음
        if (content &&
            !content.contains(e.target) &&
            !content.contains(mouseDownTarget) &&
            !isCalendarClick &&
            !modalJustOpened &&
            !isAddModalOpen) { // <--- 이 조건이 추가됨

            closeDayListModal();
        }
    }
});

// =========================================
// 2. 키보드 이벤트 리스너 (ESC 키 누르면 닫기)
// =========================================
document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
        // 열려있는 모달이 있다면 닫기 함수 호출
        // (함수 내부에서 display 체크를 안 한다면 여기서 체크해도 되지만, 보통 닫기 함수만 호출해도 안전함)

        const chartModal = document.getElementById("chartModal");
        if(chartModal && chartModal.style.display === "flex") closeModal();

        const addModal = document.getElementById("addEntryModal");
        if(addModal && addModal.style.display === "flex") closeAddEntryModal();
    }
});

// =========================================
// 3. 캐싱 함수 (이벤트 리스너 밖으로 분리)
// =========================================
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

    // 기존내용
    // const blob = await res.blob();
    // const a = document.createElement("a");
    // a.href = window.URL.createObjectURL(blob);
    // a.download = `ledger_${currentYear}-${currentMonth}.xlsx`;
    // a.click();

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

function updateTop3CardsAndCharts(top3, thisMonthCategories, last6) {
    if (!globalAvgLedger) globalAvgLedger = [];

    // ✅ 1. 무조건 전체 리셋 (핵심)
    for (let i = 0; i < 3; i++) {
        setTop3CardStateByIndex(i, false);
    }

    // ✅ 2. 실제 있는 데이터만 다시 채움
    if (!Array.isArray(top3) || top3.length === 0) return;

    const cardIds = [
        { cat: "top1-category", my: "top1-my", diff: "top1-diff", chart: "top1-chart" },
        { cat: "top2-category", my: "top2-my", diff: "top2-diff", chart: "top2-chart" },
        { cat: "top3-category", my: "top3-my", diff: "top3-diff", chart: "top3-chart" }
    ];

    top3.forEach((category, i) => {
        const card = cardIds[i];

        // ✅ 값 자체가 없으면 empty
        if (!category) {
            console.log("데이터 없음", i)
            // 🔥 기존 차트 제거
            if (top3ChartInstances[i]) {
                top3ChartInstances[i].destroy();
                top3ChartInstances[i] = null;
            }

            setTop3CardStateByIndex(i, false);
            return;
        }

        // 이번달 금액
        const thisItem = thisMonthCategories.find(c => c.categoryName === category);
        const thisMonthTotal = thisItem ? Number(thisItem.amount) : 0;

        document.getElementById(card.cat).textContent = category;
        document.getElementById(card.my).textContent =
            `${thisMonthTotal.toLocaleString()} 원`;

        // 전체 평균
        const globalItem = globalAvgLedger.find(c => c.category === category);
        const globalValue = globalItem ? Number(globalItem.avg) : 0;

        const diffPercent = globalValue > 0
            ? (((thisMonthTotal - globalValue) / globalValue) * 100).toFixed(1)
            : 0;

        const overspend = globalValue > 0 && thisMonthTotal > globalValue * 1.2;

        const diffEl = document.getElementById(card.diff);
        diffEl.textContent = `${diffPercent}%`;
        diffEl.classList.toggle("text-danger", overspend);
        diffEl.classList.toggle("text-primary", !overspend);

        // ✅ 히스토리
        const history = getHistoryForCategory(last6, category);
        const valid = hasValidHistory(history);

        // ✅ 유효하지 않으면 차트 먼저 제거
        if (!valid) {
            if (top3ChartInstances[i]) {
                top3ChartInstances[i].destroy();
                top3ChartInstances[i] = null;
            }
            setTop3CardStateByIndex(i, false);
            return;
        }

        // ✅ 유효 → empty 해제
        setTop3CardStateByIndex(i, true);

        // ✅ 기존 차트 제거 후 재생성 (안전)
        if (top3ChartInstances[i]) {
            top3ChartInstances[i].destroy();
            top3ChartInstances[i] = null;
        }

        top3ChartInstances[i] =
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

// [수정 2] 캘린더 설정 (숫자 중심 정렬 + 건수는 우측 부착)
function initCalendar(dailyData) {
    var calendarEl = document.getElementById('calendar');
    if(fullCalendarInstance) fullCalendarInstance.destroy();
    if (!calendarEl) return;

    fullCalendarInstance = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko',
        initialDate: `${currentYear}-${String(currentMonth).padStart(2, '0')}-01`,
        headerToolbar: false,
        height: '100%',
        eventOrder: 'sortIdx',
        events: createEventsFromDailyData(dailyData),

        // [수정] 화면 그리기 (간격 넓힘 + 밑선 정렬 + 중앙 유지)
        eventContent: function(arg) {
            const title = arg.event.title;
            const count = arg.event.extendedProps.count;

            // 1. 컨테이너: flex로 중앙 정렬 + baseline으로 글자 밑선 기준 정렬
            // 2. 내부 div(relative): 메인 금액을 감싸는 기준점
            // 3. 건수(absolute):
            //    - left: 100% -> 금액 바로 끝에서 시작
            //    - margin-left: 4px -> ★ 여유 있게 띄움 (너무 넓으면 짤리니 적당히)
            //    - bottom: 1px -> ★ 숫자의 바닥 선과 시각적으로 맞춤

            let htmlString = `
                <div class="fc-event-title" style="width: 100%; display: flex; justify-content: center; align-items: baseline;">
                    <div style="position: relative;">
                        <span class="fw-bold calendar-amount" style="letter-spacing: -0.5px;">${title}</span>
                        ${(count && count >= 2) ?
                `<span style="
                                position: absolute; 
                                left: 100%; 
                                bottom: 1px;
                                margin-left: 4px;
                                font-size: 0.75em; 
                                font-weight: normal; 
                                white-space: nowrap; 
                                opacity: 0.9;">(${count})</span>`
                : ''}
                    </div>
                </div>
            `;

            return { html: htmlString };
        },

        dateClick: function(info) { openDayListModal(info.dateStr); },
        eventClick: function(info) { info.jsEvent.preventDefault(); openDayListModal(info.event.startStr); }
    });

    fullCalendarInstance.render();
}

function showEmptyState(){
    document.getElementById("emptyState")?.classList.remove("d-none");
    document.getElementById("ledgerContent")?.classList.add("d-none");
}

function showLedgerContent() {
    document.getElementById("emptyState").classList.add("d-none");
    document.getElementById("ledgerContent").classList.remove("d-none");
}

// 엑셀 파일 업로드
function openExcelUpload() {
    document.getElementById("fileInput")?.click();
}

async function getGroupId() {
    const res = await fetch(`/ledger/request/group_id`, { method: "GET" });

    const data = await res.json(); // await 필수
    console.log("데이터 확인 :", data);

    if (!data.hasGroup) {
        showEmptyState();
        return false;
    } else {
        showLedgerContent();
        return true;
    }
}

async function startDocu() {
    // 로그인 유저의 Group_id 조회(group_id가 존재하지 않을 경우 등록한 가게부 내역이 하나도 없다는 의미)
    const hasGroup = await getGroupId(); // await
    dragElement();
    if (!hasGroup) {
        return;
    }

    showSkeleton();
    updateMonthLabel();

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

    initMonthPicker();

    hideSkeleton();

// ★ 확장된 인터랙티브 투어 시작
    setTimeout(() => {
        startExtendedTour();
    }, 500); // 화면 렌더링 안정화 대기

/*    // ★ [여기 추가] 온보딩 모달 실행
    console.log("온보딩 모달 체크 시작..."); // 디버깅용 로그
    checkAndShowWelcomeModal();*/
}
/*// 2. 모달 띄우기 함수
function checkAndShowWelcomeModal() {
    // 테스트를 위해 아래 if문은 잠시 주석 처리하세요! (무조건 뜨게)
    // if (!localStorage.getItem('welcome_done_v2')) {
    const modal = document.getElementById("welcomeModal");
    if(modal) {
        console.log("모달 찾음! 표시합니다.");
        modal.style.display = "flex";
        modal.classList.add("show");
    } else {
        console.error("HTML에 id='welcomeModal'이 없습니다!");
    }
    // }
}

// 3. 닫기 함수
function closeWelcomeModal() {
    const modal = document.getElementById("welcomeModal");
    if(modal) {
        modal.style.display = "none";
        modal.classList.remove("show");

        // 닫을 때 '봤음' 처리
        localStorage.setItem('welcome_done_v2', 'true');
    }
}*/
// ledger.js - startExtendedTour (최종_완성_v10: X버튼 위치 고정 / 텍스트 줄바꿈 수정)

// [핵심] 투어 종료 전역 함수
window.finishTour = function() {
    document.querySelectorAll('.neon-active').forEach(el => el.classList.remove('neon-active'));
    if(typeof closeAddEntryModal === 'function') closeAddEntryModal();
    if(typeof closeDayListModal === 'function') closeDayListModal();

    const driverOverlay = document.getElementById('driver-popover-item');
    if(driverOverlay) driverOverlay.remove();

    if (window.driverObjInstance) {
        window.driverObjInstance.destroy();
    } else {
        document.body.classList.remove('driver-active');
        document.querySelectorAll('.driver-overlay').forEach(el => el.remove());
        document.querySelectorAll('.driver-popover').forEach(el => el.remove());
    }
}

function startExtendedTour() {
    // if (localStorage.getItem('tour_complete_final_v16')) return;

    // [추가] 현재 년/월을 기반으로 '현재 달 1일' 날짜 문자열 생성
    const dynamicDate = `${currentYear}-${String(currentMonth).padStart(2, '0')}-01`;
    // 1. 투어용 CSS 주입
    const styleId = 'driver-custom-style';
    if (!document.getElementById(styleId)) {
        const style = document.createElement('style');
        style.id = styleId;
        style.innerHTML = `
            /* 버튼 가시성 강제 확보 */
            button.btn-primary.neon-active {
                background-color: #0d6efd !important;
                color: #ffffff !important;
                border-color: #0d6efd !important;
                opacity: 1 !important;
            }

            /* 네온 애니메이션 */
            @keyframes neonPulse {
                0% { box-shadow: 0 0 0 0 rgba(255, 0, 153, 0.7); border-color: #FF0099; transform: scale(1); }
                70% { box-shadow: 0 0 0 10px rgba(255, 0, 153, 0); border-color: #FF0099; transform: scale(1.02); }
                100% { box-shadow: 0 0 0 0 rgba(255, 0, 153, 0); border-color: #FF0099; transform: scale(1); }
            }
            
            /* 기본 네온 클래스 */
            .neon-active {
                position: relative; /* 일반 요소는 relative */
                z-index: 100010 !important;
                border-radius: 6px;
                animation: neonPulse 1.5s infinite;
                pointer-events: auto !important; 
            }

            /* [수정 1] 닫기 버튼 전용 네온 스타일 (위치 튕김 방지) */
            /* absolute 요소에 relative가 적용되어 위치가 깨지는 것을 방지함 */
            .close-btn.neon-active {
                position: absolute !important; 
                top: 15px !important; 
                right: 20px !important;
                border-radius: 50%; /* 원형 유지 */
            }

            /* 모달 컨텐츠 기준점 */
            .modal-content { position: relative !important; }

            /* 모달 닫기 버튼(X) 기본 스타일 */
            .close-btn {
                position: absolute !important;
                top: 15px !important; right: 20px !important;
                font-size: 24px !important; color: #555;
                cursor: pointer; z-index: 100020;
                background: transparent;
                width: 30px; height: 30px; line-height: 1; text-align: center;
            }
            .close-btn:hover { color: #ff4d4d; }

            /* 투어 팝업 닫기 버튼 */
            .tour-close-btn {
                position: absolute; top: 20px; right: 20px;
                font-size: 20px; color: #999; cursor: pointer; z-index: 1000002;
            }

            /* 스크롤 허용 및 폰트 확대 */
            body.driver-active {
                overflow: visible !important; position: static !important; height: auto !important;
            }
            .driver-popover-title { font-size: 24px !important; font-weight: 700 !important; margin: 5px 0 10px 0 !important; }
            .driver-popover-description { font-size: 18px !important; line-height: 1.6 !important; }

            /* 계층 구조 */
            .modal-overlay, .modal { z-index: 100005 !important; }
            .modal-backdrop { opacity: 0 !important; z-index: -1 !important; }
            div#driver-popover-item { z-index: 100006 !important; } 
        `;
        document.head.appendChild(style);
    }

    const driver = window.driver.js.driver;

    const driverObj = driver({
        showProgress: false,
        animate: true,
        allowClose: false,
        doneBtnText: '완료',
        nextBtnText: '네, 좋아요! >',
        prevBtnText: '< 이전',

        onPopoverRendered: (popoverObj) => {
            const popoverNode = document.querySelector('.driver-popover');
            if (!popoverNode || popoverNode.querySelector('.tour-close-btn')) return;

            const closeBtn = document.createElement('div');
            closeBtn.className = 'tour-close-btn';
            closeBtn.innerHTML = '&#10005;';
            closeBtn.onclick = (e) => {
                e.stopPropagation();
                if (confirm('투어를 종료하시겠습니까?')) {
                    window.finishTour();
                }
            };
            popoverNode.appendChild(closeBtn);
        },

        steps: [
            // [Step 0] ~ [Step 10] (기존 동일)
            {
                popover: { title: '👋 환영합니다!', description: '가계부의 핵심 기능을<br>빠르게 체험해볼까요?', align: 'center' }
            },
            {
                element: 'button[onclick="loadLedgerData()"]',
                popover: { title: '1. 데이터 연동', description: '먼저 데이터를 가져옵니다.<br><b>이 버튼을 클릭하세요!</b>', side: "bottom", showButtons: [] },
                onHighlightStarted: (el) => {
                    el.classList.add('neon-active');
                    el.addEventListener('click', () => {
                        el.classList.remove('neon-active');
                        setTimeout(() => driverObj.moveNext(), 800);
                    }, { once: true });
                }
            },
            {
                element: `.fc-daygrid-day[data-date="${dynamicDate}"]`, // ✅ 수정 후
                popover: { title: '2. 캘린더 조회',
                    description: `<b>${currentMonth}월 1일</b>을 클릭하여<br>상세 내역을 확인해보세요.`,
                    side: "top",
                    showButtons: [] }, //
                onHighlightStarted: (el) => {
                    if (!el) { const firstDay = document.querySelector('.fc-daygrid-day'); if(firstDay) el = firstDay; }
                    if (el) {
                        el.classList.add('neon-active');
                        el.addEventListener('click', () => {
                            el.classList.remove('neon-active');
                            setTimeout(() => driverObj.moveNext(), 800);
                        }, { once: true });
                    } else { driverObj.moveNext(); }
                }
            },
            {
                element: '#dayListModal button.btn-primary',
                popover: { title: '3. 내역 등록', description: '새 내역을 등록해봅시다.<br><b>[+추가하기] 버튼을 클릭!</b>', side: "top", showButtons: [] },
                onHighlightStarted: (el) => {
                    const listModal = document.getElementById("dayListModal");
                    if(listModal.style.display !== 'flex') openDayListModal(dynamicDate);    // ✅ 수정 후
                    listModal.style.zIndex = "100005";
                    el.classList.add('neon-active');
                    el.addEventListener('click', () => {
                        el.classList.remove('neon-active');
                        setTimeout(() => driverObj.moveNext(), 100);
                    }, { once: true });
                }
            },
            {
                element: '#addEntryModal .modal-content',
                popover: { title: '4. 정보 입력', description: '데이터는 제가 입력해드릴게요.<br><b>하단의 [저장하기] 버튼을 눌러보세요!</b>', side: "right", showButtons: [] },
                onHighlightStarted: (el) => {
                    const addModal = document.getElementById("addEntryModal");
                    if (!addModal || addModal.style.display === 'none') {
                        const dateText = document.getElementById('dayListDate').innerText || dynamicDate;    // ✅ 수정 후
                        openAddEntryModal(dateText);
                    }
                    addModal.style.zIndex = "100005";
                    document.getElementById("inputAmount").value = "5000";
                    document.getElementById("inputPlace").value = "투어 체험용 커피";
                    document.getElementById("inputMemo").value = "자동 입력됨";
                    const saveBtn = addModal.querySelector('.btn-primary');
                    const newBtn = saveBtn.cloneNode(true);
                    newBtn.removeAttribute('onclick'); newBtn.onclick = null;
                    saveBtn.parentNode.replaceChild(newBtn, saveBtn);
                    newBtn.classList.add('neon-active');
                    newBtn.addEventListener('click', (e) => {
                        e.preventDefault(); e.stopPropagation();
                        newBtn.classList.remove('neon-active');
                        addModal.style.zIndex = "";
                        closeAddEntryModal();
                        const listModal = document.getElementById("dayListModal");
                        listModal.style.display = "flex"; listModal.classList.add("show"); listModal.style.zIndex = "100005";
                        const listGroup = document.getElementById("dayListGroup");
                        if(listGroup) { listGroup.innerHTML = `<li id="tour-item" class="list-group-item list-group-item-action py-3" style="cursor:pointer; background:#fff0e6;"><div class="d-flex justify-content-between align-items-center"><div class="d-flex flex-column"><span class="fw-bold me-2" style="font-size: 1.1rem; color: #333;">☕ 투어 체험용 커피</span></div><div class="text-danger fw-bold" style="font-size: 1.1rem;">-5,000원</div></div></li>`; }
                        setTimeout(() => driverObj.moveNext(), 800);
                    }, { once: true });
                }
            },
            {
                element: '#tour-item',
                popover: { title: '5. 등록 확인', description: '리스트에 내역이 추가되었습니다.<br><b>항목을 클릭해보세요.</b>', side: "left", showButtons: [] },
                onHighlightStarted: (el) => {
                    const listModal = document.getElementById("dayListModal");
                    if (listModal.style.display === 'none') { listModal.style.display = 'flex'; listModal.classList.add('show'); const listGroup = document.getElementById("dayListGroup"); if(listGroup && listGroup.innerHTML.trim() === "") listGroup.innerHTML = `<li id="tour-item">...</li>`; }
                    listModal.style.zIndex = "100005";
                    el.classList.add('neon-active');
                    el.addEventListener('click', () => {
                        el.classList.remove('neon-active');
                        closeDayListModal();
                        const fakeItem = { id: 9999, entryAmount: 5000, occurredAt: '2025-10-01T12:30:00', entryType: 'EXPENSE', categoryName: '식비', placeOfUse: '투어 체험용 커피', memo: '자동 입력됨', payType: 'CARD' };
                        openEditModal(fakeItem);
                        setTimeout(() => driverObj.moveNext(), 500);
                    }, { once: true });
                }
            },
            {
                element: '#addEntryModal .close-btn',
                element: '#addEntryModal .btn-primary:last-child', // ✅ 수정 후 (수정하기 버튼 타겟)
                popover: {
                    title: '6. 금액 수정 및 저장',
                    // 🌟 수정 내용 안내 🌟
                    description: '현재 금액 5,000원을 **4,500원**으로 수정한 뒤, <br>하단의 **[수정하기]** 버튼을 눌러주세요.',
                    side: "top",
                    showButtons: []
                },
                onHighlightStarted: (el) => {
                    // [추가] 금액 입력창에 4500을 직접 입력하도록 하이라이트
                    const amountInput = document.getElementById("inputAmount");
                    if(amountInput) {
                        amountInput.classList.add('neon-active');
                    }

                    const addModal = document.getElementById("addEntryModal");
                    addModal.style.zIndex = "100005";
                    el.classList.add('neon-active');

                    el.addEventListener('click', () => {
                        el.classList.remove('neon-active');
                        if(amountInput) amountInput.classList.remove('neon-active');

                        // 폼 제출 시와 동일하게 모달 닫기
                        addModal.style.zIndex = "";
                        closeAddEntryModal();

                        setTimeout(() => driverObj.moveNext(), 800);
                    }, { once: true });
                }
            },
            {
                element: '#categorySelectList',
                popover: { title: '7. 카테고리 분석', description: '비교하고 싶은 카테고리를<br><b>2개 이상 클릭</b>해주세요!', side: "top", showButtons: [] },
                onHighlightStarted: (el) => {
                    const btns = el.querySelectorAll('.category-btn');
                    btns.forEach(btn => btn.classList.add('neon-active'));
                    btns.forEach(btn => {
                        btn.addEventListener('click', function checkCondition() {
                            setTimeout(() => {
                                if (el.querySelectorAll('.category-btn.active').length >= 2) {
                                    btns.forEach(b => b.classList.remove('neon-active'));
                                    driverObj.moveNext();
                                }
                            }, 100);
                        });
                    });
                }
            },
            {
                element: '#categoryStatsCharts',
                popover: { title: '📊 차트 생성 완료!', description: '확인 후 <b>[다음]</b>을 눌러주세요.', side: "top" },
                onHighlightStarted: (el) => {
                    el.classList.add('open');
                    if(typeof genderChart !== 'undefined') genderChart.reflow();
                    if(typeof ageChart !== 'undefined') ageChart.reflow();
                }
            },
            {
                element: '.table-wrapper [data-bs-toggle="collapse"]',
                popover: { title: '9. 전체 리스트 확인', description: '마지막으로 <b>화살표(▼)를 눌러</b><br>이번 달 전체 내역을 확인해보세요.', side: "top", showButtons: [] },
                onHighlightStarted: (el) => {
                    el.classList.add('neon-active');
                    el.addEventListener('click', () => {
                        el.classList.remove('neon-active');
                        setTimeout(() => driverObj.moveNext(), 600);
                    }, { once: true });
                }
            },
            {
                element: '#ledgerTable tbody tr:first-child',
                popover: { title: '10. 수정 내역 확인', description: '방금 4,500원으로 수정한 내역을<br>리스트에서 **클릭**하여 확인해보세요.', side: "top", showButtons: [] },
                onHighlightStarted: (el) => {
                    if(!el) {
                        const tbody = document.querySelector('#ledgerTable tbody');
                        if(tbody) {
                            const tr = document.createElement('tr');
                            // 🌟 가짜 내역을 4,500원으로 주입 🌟
                            tr.innerHTML = '<td>10-01</td><td><span class="badge bg-danger">지출</span></td><td>식비</td><td>투어용 커피</td><td>투어용</td><td>카드</td><td>4,500원</td>';
                            tbody.prepend(tr);
                            el = tr;
                        }
                    }
                    if(el) {
                        el.classList.add('neon-active');
                        el.addEventListener('click', () => {
                            el.classList.remove('neon-active');
                            // 🌟 열리는 수정 모달에 보여줄 가짜 데이터 🌟
                            const fakeItem = { id: 8888, entryAmount: 4500, occurredAt: '2025-10-01T14:00:00', entryType: 'EXPENSE', categoryName: '식비', placeOfUse: '투어용 커피', memo: '금액 수정 확인', payType: 'CARD' };
                            openEditModal(fakeItem);
                            setTimeout(() => driverObj.moveNext(), 500);
                        }, { once: true });
                    } else {
                        driverObj.moveNext();
                    }
                }
            },
            {
                element: '#addEntryModal .close-btn',
                popover: { title: '11. 수정 완료', description: '내역을 확인하셨다면<br><b>[X] 버튼을 눌러 닫아주세요.</b>', side: "left", showButtons: [] },
                onHighlightStarted: (el) => {
                    const addModal = document.getElementById("addEntryModal");
                    addModal.style.zIndex = "100005";
                    el.classList.add('neon-active');
                    el.addEventListener('click', () => {
                        el.classList.remove('neon-active');
                        addModal.style.zIndex = "";
                        closeAddEntryModal();
                        setTimeout(() => driverObj.moveNext(), 800);
                    }, { once: true });
                }
            },

            // [Step 12] 종료 (텍스트 줄바꿈 수정)
            {
                popover: {
                    title: '🎉 투어 완료!',
                    description: `
                        <div style="text-align: center; margin-top: 10px;">
                            준비가 끝났습니다.<br>이제 효율적으로<br>자산을 관리해보세요!<br><br>
                            <button class="driver-popover-done-btn" onclick="window.finishTour()"
                                    style="padding: 12px 30px; font-size: 16px; font-weight: bold; cursor: pointer; border-radius: 8px;">
                                가계부 시작하기
                            </button>
                        </div>
                    `,
                    align: 'center',
                    side: "center",
                    showButtons: []
                }
            }
        ],

        onDestroyStarted: () => {
            window.finishTour();
            localStorage.setItem('tour_complete_final_v16', 'true');
        }
    });

    window.driverObjInstance = driverObj;
    window.scrollTo(0, 0);
    driverObj.drive();
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
        // [수정] columns 설정: 너비(%) 고정 및 말줄임표(...) 적용
        columns: [
            {
                data: 'occurredAt',
                width: "10%",    // 날짜는 고정폭
                render: function(data) { /* 기존 렌더링 코드 유지 */
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
                width: "7%",     // 뱃지는 작게
                className: "text-center",
                render: function(data) { /* 기존 렌더링 코드 유지 */
                    if(data === 'INCOME') return '<span class="badge bg-primary-subtle text-primary-emphasis rounded-pill">수입</span>';
                    if(data === 'EXPENSE') return '<span class="badge bg-danger-subtle text-danger-emphasis rounded-pill">지출</span>';
                    return data;
                }
            },
            {
                data: 'categoryName',
                width: "12%",    // 카테고리 적당히
                defaultContent: "-"
            },
            {
                data: 'memo',
                width: "20%",    // ★ 메모: 길어질 수 있음 -> 가장 넓게
                defaultContent: "-",
                // [핵심] render 함수로 감싸서 text-ellipsis 적용
                render: function(data) {
                    return `<span class="text-ellipsis" title="${data || ''}">${data || '-'}</span>`;
                }
            },
            {
                data: 'placeOfUse',
                width: "18%",    // ★ 사용처: 길어질 수 있음
                defaultContent: "-",
                // [핵심] render 함수로 감싸서 text-ellipsis 적용
                render: function(data) {
                    const text = data ? data : '(미기재)';
                    const color = data ? '' : 'color:#ccc;';
                    return `<span class="text-ellipsis" style="${color}" title="${text}">${text}</span>`;
                }
            },
            {
                data: 'payType',
                width: "10%",
                className: "text-center",
                defaultContent: "-",
                render: function(data) { /* 기존 코드 유지 */
                    if(data === 'CARD') return '💳 카드';
                    if(data === 'CASH') return '💵 현금';
                    if(data === 'TRANSFER') return '🏦 이체';
                    return data;
                }
            },
            {
                data: 'entryAmount',
                width: "16%",    // 금액은 자릿수가 많을 수 있으므로 넉넉하게
                className: "text-end",
                render: function(data, type, row) { /* 기존 코드 유지 */
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
        language:
        // { url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/ko.json" }
        // [수정] 외부 URL 호출(CORS 에러) 대신 직접 객체를 정의함
            {
                "decimal": "",
                "emptyTable": "데이터가 없습니다",
                "info": "_START_ - _END_ (총 _TOTAL_ 개)",
                "infoEmpty": "0 - 0 (총 0 개)",
                "infoFiltered": "(전체 _MAX_ 개 중 검색결과)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "_MENU_ 개씩 보기",
                "loadingRecords": "로딩 중...",
                "processing": "처리 중...",
                "search": "검색:",
                "zeroRecords": "검색된 데이터가 없습니다",
                "paginate": {
                    "first": "첫 페이지",
                    "last": "마지막 페이지",
                    "next": "다음",
                    "previous": "이전"
                },
                "aria": {
                    "sortAscending": ": 오름차순 정렬",
                    "sortDescending": ": 내림차순 정렬"
                }
            },
        responsive: true,

        // ★ [핵심 1] 레이아웃 커스텀 (dom 설정)
        // 'top-toolbar': 상단 영역 (엑셀 버튼 들어갈 곳)
        // 't': 테이블 (Table)
        // 'bottom-toolbar': 하단 영역 (정보 - 검색 - 페이징)
        dom: '<"top-toolbar" > t <"bottom-toolbar" i f p >',

        // ★ [핵심 2] 요소 이동 및 커스텀
        initComplete: function() {
            // 1) 엑셀 버튼을 상단 툴바(.top-toolbar)로 이동 및 표시
            $('#btnExcelExport')
                .appendTo('.top-toolbar')
                .show();

            // 2) [추가] 하단에 있던 Nav(#tableMonthNav)도 상단 툴바(.top-toolbar)로 이동
            $('#tableMonthNav')
                .appendTo('.top-toolbar')
                .css('display', 'flex'); // 아까 감춰뒀던(display:none) 것을 flex로 보이게 변경

            // 3) 검색창 설정 (기존 코드 유지)
            $('#ledgerTable_filter input')
                .attr('id', 'dt-search-box')
                .attr('name', 'dt-search-box')
                .attr('placeholder', '내역 검색...');
        }

    });
    // ★ [New] 테이블 행 클릭 시 수정 모달 열기
    $('#ledgerTable tbody').on('click', 'tr', function () {
        const data = ledgerTable.row(this).data();
        if(data) {
            openEditModal(data); // 해당 데이터로 수정 모달 오픈
        }
    });
}
// [수정 1] 투명도 로직 변경 (0.2 -> 0.4 시작)
function createEventsFromDailyData(dailyData) {
    const events = [];

    if (!dailyData || !Array.isArray(dailyData)) return events;

    let maxIncome = 1;
    let maxExpense = 1;

    dailyData.forEach(day => {
        if (day.income > maxIncome) maxIncome = day.income;
        if (day.expense > maxExpense) maxExpense = day.expense;
    });

    dailyData.forEach(day => {
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

        const incCount = day.incomeCount || 0;
        const expCount = day.expenseCount || 0;

        // 2. 수입 이벤트
        if (day.income > 0) {
            // ★ [수정] 투명도 0.4부터 시작 (0.4 ~ 1.0)
            const opacity = 0.4 + (day.income / maxIncome) * 0.6;

            events.push({
                title: `+${Number(day.income).toLocaleString()}`,
                start: dateStr,
                // 배경색: 파란색
                backgroundColor: `rgba(0, 123, 255, ${opacity})`,
                borderColor: 'transparent',
                textColor: '#fff',
                display: 'block',
                sortIdx: 0,
                extendedProps: { count: incCount, type: 'INCOME' }
            });
        }

        // 3. 지출 이벤트
        if (day.expense > 0) {
            // ★ [수정] 투명도 0.4부터 시작
            const opacity = 0.4 + (day.expense / maxExpense) * 0.6;

            events.push({
                title: `-${Number(day.expense).toLocaleString()}`,
                start: dateStr,
                // 배경색: 빨간색
                backgroundColor: `rgba(220, 53, 69, ${opacity})`,
                borderColor: 'transparent',
                textColor: '#fff',
                display: 'block',
                sortIdx: 1,
                extendedProps: { count: expCount, type: 'EXPENSE' }
            });
        }
    });

    return events;
}

// json 데이터 로드(개인 거래 내역)
async function loadLedgerData() {
    showSkeleton();
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
        initCache();
        await startDocu();

    }catch{
        console.log("Error");
    }
    hideSkeleton();
}

/**
 * Global Skeleton UI
 * - DOM에 없으면 자동 생성
 * - showSkeleton(): skeleton 노출
 * - hideSkeleton(): skeleton fade-out 후 제거
 */

/**
 * Content 영역을 안전하게 탐색하는 함수
 * (default_layout 렌더링 구조 대응)
 */
function findContentArea() {
    return (
        document.querySelector("main.container > div") ||     // 최우선
        document.querySelector("main .container > div") ||    // fallback
        document.querySelector('[layout\\:fragment="content"]') // 혹시 direct 렌더링된 케이스
    );
}

/** Skeleton DOM이 없으면 생성 */
function ensureSkeletonDom() {
    // 이미 존재하면 패스
    if (document.getElementById("globalSkeleton")) return;

    const contentArea = findContentArea();
    if (!contentArea) {
        console.warn("content 영역을 찾지 못했습니다. Skeleton 생성 실패");
        return;
    }

    const div = document.createElement("div");
    div.id = "globalSkeleton";
    div.style.display = "none"; // 초기에는 보이지 않도록

    div.innerHTML = `
        <div class="singleSkeletonCard"></div>
    `;

    // content 최상단에 삽입
    contentArea.insertBefore(div, contentArea.firstChild);
}

/** Skeleton 표시 */
function showSkeleton() {
    ensureSkeletonDom();

    const skel = document.getElementById("globalSkeleton");
    if (!skel) return;

    // display 켜기
    skel.style.display = "flex";

    // transition 설정
    skel.style.setProperty('transition', 'opacity 0.35s ease', 'important');

    // opacity 0 초기화
    skel.style.setProperty('opacity', '0', 'important');

    // 페이드인
    requestAnimationFrame(() => {
        skel.style.setProperty('opacity', '1', 'important');
    });
}

/** Skeleton 숨기기 */
function hideSkeleton() {
    const skel = document.getElementById("globalSkeleton");
    if (!skel) return;

    skel.style.setProperty('opacity', '0', 'important');

    // [수정] remove() 하지 않고 display만 none으로 변경 (재사용을 위해)
    setTimeout(() => {
        if (skel) {
            // skel.remove(); //  주석 처리 *******************
            skel.style.display = "none";
        }
    }, 350);
}
// =========================================
// [New] 입력 모달(Add Entry) 관련 로직
// =========================================

// [ledger.js] openAddEntryModal 대신 -> openEditModal (수정용)과 통합

// [수정] 1. (기존) 추가 모드 열기
function openAddEntryModal(dateStr) {
    resetEntryForm();
    closeDayListModal();

    document.getElementById("inputDate").value = dateStr;
    const now = new Date();
    document.getElementById("inputTime").value = `${String(now.getHours()).padStart(2,'0')}:${String(now.getMinutes()).padStart(2,'0')}`;

    // ★ [핵심] 버튼 글자를 강제로 '저장하기'로 변경
    // (이전 수정 작업 때문에 '수정하기'로 남아있을 수 있음)
    const btn = document.querySelector('#addEntryModal .btn-primary');
    if(btn) btn.innerText = "저장하기";

    showEntryModal("새 내역 추가");
}

// =========================================
// [누락된 함수 복구] 폼 초기화 함수
// =========================================
function resetEntryForm() {
    // 1. ID 값 초기화 (수정 모드인지 판별용)
    const idField = document.getElementById("entryId");
    if(idField) idField.value = "";

    // 2. 입력 필드들 비우기
    const amount = document.getElementById("inputAmount");
    if(amount) amount.value = "";

    const place = document.getElementById("inputPlace");
    if(place) place.value = "";

    const memo = document.getElementById("inputMemo");
    if(memo) memo.value = "";

    // 3. 시간은 현재 시간으로 리셋 (선택사항)
    const now = new Date();
    const timeField = document.getElementById("inputTime");
    if(timeField) {
        timeField.value = `${String(now.getHours()).padStart(2,'0')}:${String(now.getMinutes()).padStart(2,'0')}`;
    }

    // 4. 삭제 버튼 숨기기 (새로 등록일 때를 대비해 기본 숨김)
    const btnDelete = document.getElementById("btnDelete");
    if(btnDelete) btnDelete.style.display = "none";
}

// [수정] 2. (New) 수정 모드 열기
function openEditModal(item) {
    // 1. 기존 리스트 모달 닫기 (모달 겹침 방지)
    closeDayListModal();

    // 2. 폼 초기화
    resetEntryForm();

    document.getElementById("entryId").value = item.id;
    document.getElementById("inputAmount").value = item.entryAmount;
    document.getElementById("inputPlace").value = item.placeOfUse || "";
    document.getElementById("inputMemo").value = item.memo || "";
    document.getElementById("inputCategory").value = item.categoryName; // 카테고리

    // 날짜/시간 세팅
    if (item.occurredAt) {
        const dt = new Date(item.occurredAt);
        const y = dt.getFullYear();
        const m = String(dt.getMonth() + 1).padStart(2, '0');
        const d = String(dt.getDate()).padStart(2, '0');
        document.getElementById("inputDate").value = `${y}-${m}-${d}`;

        const hh = String(dt.getHours()).padStart(2, '0');
        const mm = String(dt.getMinutes()).padStart(2, '0');
        document.getElementById("inputTime").value = `${hh}:${mm}`;
    }

    // 타입(수입/지출) 라디오 버튼
    const typeVal = item.entryType; // INCOME or EXPENSE
    document.getElementById("inputType").value = typeVal;

    // 결제수단 라디오 버튼
    const payVal = item.payType; // CARD, CASH, TRANSFER
    const radios = document.getElementsByName("payType");
    for (let r of radios) {
        if (r.value === payVal) r.checked = true;
    }

    // ★ [핵심] 버튼 글자를 '수정하기'로 변경
    const btn = document.querySelector('#addEntryModal .btn-primary');
    if (btn) btn.innerText = "수정하기";

    document.getElementById("btnDelete").style.display = "block";
    showEntryModal("내역 수정");
 }

// 공통: 모달 보여주기 (Z-Index 강력 보정)
    function showEntryModal(title) {
        const modal = document.getElementById("addEntryModal");
        const listModal = document.getElementById("dayListModal");

        modal.querySelector("h3").innerText = title;
        modal.classList.add("show");

        // ★ [핵심 해결] Z-Index 계층 정리
        // 기본적으로 부트스트랩 모달은 1050 정도지만,
        // 투어 기능(Driver.js)이 실행되면 리스트 모달이 100000 이상으로 올라갑니다.
        // 따라서 현재 리스트 모달의 Z-Index를 구해서 무조건 그보다 높게 설정해야 합니다.

        let targetZIndex = 1060; // 최소 안전값

        if (listModal && window.getComputedStyle(listModal).display !== 'none') {
            const listZ = window.getComputedStyle(listModal).zIndex;

            // 'auto'가 아니고 숫자라면 파싱
            const currentListZ = (listZ === 'auto' || isNaN(parseInt(listZ)))
                ? 1050
                : parseInt(listZ);

            // 리스트 모달보다 50 더 높게 설정 (확실하게 위로 올림)
            targetZIndex = currentListZ + 50;
        }

        modal.style.zIndex = targetZIndex;
        modal.style.display = "flex";

        // 모달이 열리는 순간에는 외부 클릭 감지 무시 (닫힘 방지)
        modalJustOpened = true;
        setTimeout(() => {
            modalJustOpened = false;
        }, 100);
    }

// 공통: 폼 리셋
function resetEntryForm() {
    document.getElementById("entryId").value = ""; // ID 초기화
    document.getElementById("inputAmount").value = "";
    document.getElementById("inputPlace").value = "";
    document.getElementById("inputMemo").value = "";
    document.getElementById("btnDelete").style.display = "none"; // 삭제 버튼 숨기기
}

function closeAddEntryModal() {
    const modal = document.getElementById("addEntryModal");
    modal.style.display = "none";
    modal.classList.remove("show");
}
async function deleteEntry() {
    const id = document.getElementById("entryId").value;
    if(!id) return;

    if(!confirm("정말 이 내역을 삭제하시겠습니까?")) return;

    try {
        const res = await fetch(`/api/ledger/entry/${id}`, {
            method: 'DELETE'
        });

        if (res.ok) {
            alert("삭제되었습니다.");
            closeAddEntryModal();
            closeDayListModal();

            const key = `${currentYear}-${currentMonth}`;
            ledgerCache.delete(key);
            if (`${currentYear}-${currentMonth}` === `${new Date().getFullYear()}-${new Date().getMonth() + 1}`) {
                // 이번 달 삭제 일 경우 top3까지 수정
                await updateChartWithTop3();
            } else {
                await updateChartNoTop3();
            }
            } else {
                alert("삭제 실패");
            }
        } catch (e) {
            console.error(e);
            alert("에러 발생");
        }
    }
async function updateChartWithTop3(){
    showSkeleton()
    await updateChart();
    await loadTopData();
    hideSkeleton();
}

async function updateChartNoTop3(){
    showSkeleton();
    await updateChart();
    hideSkeleton();
}

// 4. 저장/삭제 로직 수정 (ID 유무에 따라 POST/PUT/DELETE 분기)
async function submitNewEntry() {
    const id = document.getElementById("entryId").value;
    const url = id ? `/api/ledger/entry/${id}` : '/api/ledger/entry';
    const method = id ? 'PUT' : 'POST';

    // ... 값 가져오기 (기존 코드 동일) ...
    const dateVal = document.getElementById("inputDate").value;
    const timeVal = document.getElementById("inputTime").value;
    const type = document.getElementById("inputType").value;
    const category = document.getElementById("inputCategory").value;
    const amount = document.getElementById("inputAmount").value;
    const place = document.getElementById("inputPlace").value;
    const memo = document.getElementById("inputMemo").value;
    const payType = document.querySelector('input[name="payType"]:checked').value;

    if (!amount || amount <= 0) {
        alert("금액을 정확히 입력해주세요.");
        return;
    }

    const fullDateTime = timeVal ? `${dateVal}T${timeVal}:00` : `${dateVal}T00:00:00`;

    const payload = {
        entryType: type,
        amount: Number(amount),
        dateTime: fullDateTime,
        categoryName: category,
        memo: memo,
        place: place,
        payType: payType
    };

    try {
        let url = '/api/ledger/entry';
        let method = 'POST';

        // ★ ID가 있으면 수정 모드!
        if (id) {
            url = `/api/ledger/entry/${id}`;
            method = 'PUT';
        }

        const res = await fetch(url, {
            method: method,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
        });
// 성공 시 모달 둘 다 닫고 캐시 삭제 후 차트 갱신
        if(res.ok) {
            closeDayListModal();
            closeAddEntryModal();
            ledgerCache.delete(`${currentYear}-${currentMonth}`);
            if (`${currentYear}-${currentMonth}` === `${new Date().getFullYear()}-${new Date().getMonth() + 1}`) {
                // 이번 달
                await updateChartWithTop3();
            } else {
                await updateChartNoTop3();
            }
            // 파이썬 호출(유저 카테고리 저장)
            updateCategory(payload);

        } else {
            alert("처리 실패");
        }
    } catch (e) {
        console.error(e);
        alert("에러 발생");
    }
}
// =========================================
// [추가] 연도 이동 로직 (상/하단 공통 사용)
// =========================================
    async function moveYear(offset) {
        currentYear += offset;
        // 연도 변경 후 전체 차트/데이터 갱신
        await updateChart();
    }

// =========================================
// [수정] 일별 리스트 모달 (Day List) - 스켈레톤 + 최소 높이 적용
// =========================================
async function openDayListModal(dateStr) {
    const modal = document.getElementById("dayListModal");
    const listGroup = document.getElementById("dayListGroup");

    // 날짜 제목 설정 (예: 2025-10-15)
    const dateTitle = document.getElementById("dayListDate");
    if(dateTitle) dateTitle.innerText = dateStr;

    // 로딩 표시
    if(listGroup) {
        // ★ [핵심 1] 리스트 컨테이너의 '최소 높이'를 강제로 고정합니다. (약 3개 높이)
        // 데이터가 0~2개여도 이 높이는 유지됩니다.
        listGroup.style.minHeight = "250px";

        // 스켈레톤 UI (로딩 바)
        const skeletonItem = `
            <li class="list-group-item py-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex flex-column w-100 me-3">
                        <div class="placeholder-glow mb-1">
                            <span class="placeholder col-6 rounded"></span>
                        </div>
                        <div class="placeholder-glow">
                            <span class="placeholder col-4 rounded bg-secondary"></span>
                        </div>
                    </div>
                    <div class="placeholder-glow text-end" style="width: 80px;">
                        <span class="placeholder col-12 rounded"></span>
                    </div>
                </div>
            </li>
        `;
        listGroup.innerHTML = skeletonItem.repeat(3);
    }

    if(modal) {
        modal.classList.add("show");
        modal.style.display = "flex";

        // 모달이 열리는 순간 외부 클릭으로 바로 닫히지 않도록 방어
        modalJustOpened = true;
        setTimeout(() => { modalJustOpened = false; }, 100);
    }

    try {
        // API 호출
        const res = await fetch(`/api/ledger/daily-list?date=${dateStr}`);

        if (!res.ok) throw new Error("네트워크 응답 실패");

        const list = await res.json();

        if(listGroup) {
            listGroup.innerHTML = ""; // 기존 내용 비우기

            if(list.length === 0) {
                // ★ [핵심 2] 데이터가 없을 때, 250px 높이의 '정중앙'에 메시지 배치
                // h-100, d-flex, justify-content-center, align-items-center 사용
                listGroup.innerHTML = `
                    <li class="list-group-item text-muted text-center h-100 d-flex flex-column justify-content-center align-items-center border-0">
                        <div style="font-size: 3rem; margin-bottom: 10px;">📭</div>
                        <div>내역이 없습니다.<br><small>새로운 내역을 추가해보세요!</small></div>
                    </li>`;
            } else {
                list.forEach(item => {
                    const li = document.createElement("li");
                    li.className = "list-group-item list-group-item-action py-3";
                    li.style.cursor = "pointer";
                    // 클릭 시 수정 모달로 연결
                    li.onclick = () => openEditModal(item);

                    // 1. 시간 포맷팅
                    let timeStr = "";
                    if(item.occurredAt) {
                        const dateObj = new Date(item.occurredAt);
                        const hours = dateObj.getHours();
                        const minutes = String(dateObj.getMinutes()).padStart(2, '0');
                        const ampm = hours >= 12 ? '오후' : '오전';
                        const displayHour = hours % 12 || 12;
                        timeStr = `${ampm} ${displayHour}:${minutes}`;
                    }

                    // 2. 제목 (사용처 우선, 없으면 카테고리)
                    const mainTitle = item.placeOfUse ? item.placeOfUse : item.categoryName;

                    // 3. 스타일 (지출:빨강, 수입:파랑)
                    const isExpense = item.entryType === 'EXPENSE';
                    const colorClass = isExpense ? 'text-danger' : 'text-primary';
                    const sign = isExpense ? '-' : '+';
                    const moneyStr = Number(item.entryAmount).toLocaleString();

                    // 4. HTML 조립
                    li.innerHTML = `
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex flex-column">
                                <div class="d-flex align-items-baseline">
                                    <span class="fw-bold me-2" style="font-size: 1.1rem; color: #333;">${mainTitle}</span>
                                    <span class="text-muted small" style="font-size: 0.85rem;">${timeStr}</span>
                                </div>
                                ${item.memo ? `<div class="text-secondary mt-1" style="font-size: 0.8rem;">└ ${item.memo}</div>` : ''}
                            </div>
                            <div class="${colorClass} fw-bold" style="font-size: 1.1rem;">
                                ${sign}${moneyStr}원
                            </div>
                        </div>
                    `;
                    listGroup.appendChild(li);
                });
            }
        }
    } catch (e) {
        console.error(e);
        if(listGroup) listGroup.innerHTML = '<li class="list-group-item text-danger">데이터를 불러오지 못했습니다.</li>';
    }
}



function closeWelcomeModal() {
    const modal = document.getElementById("welcomeModal");
    modal.style.display = "none";
    modal.classList.remove("show");

    // 다시 보지 않기 설정
    localStorage.setItem('welcome_done', 'true');
}
// =========================================
// [누락된 함수 복구] 모달 닫기 기능
// =========================================

function closeDayListModal() {
    const modal = document.getElementById("dayListModal");
    if (modal) {
        modal.style.display = "none";
        modal.classList.remove("show");
    }
}


//혹시 안될까봐
// json 데이터 로드(개인 거래 내역)
// async function loadLedgerData() {
//     showSkeleton();
//     try{
//         const url = "/ledger/loadData";
//         const res = await fetch(url, {
//             method: "POST",
//             headers: {"Accept": "application/json", "Content-Type": "application/json"},
//         })
//
//         if(!res.ok){
//             throw new Error("Failed to load ledger data")
//         }
//
//         const result = await res.json();
//         console.log("ledger data loaded:", result);
//
//     }catch{
//         console.log("Error");
//     }
//     hideSkeleton();
// }
//
// /**
//  * Global Skeleton UI
//  * - DOM에 없으면 자동 생성
//  * - showSkeleton(): skeleton 노출
//  * - hideSkeleton(): skeleton fade-out 후 제거
//  */
//
// /**
//  * Content 영역을 안전하게 탐색하는 함수
//  * (default_layout 렌더링 구조 대응)
//  */
// function findContentArea() {
//     return (
//         document.querySelector("main.container > div") ||     // 최우선
//         document.querySelector("main .container > div") ||    // fallback
//         document.querySelector('[layout\\:fragment="content"]') // 혹시 direct 렌더링된 케이스
//     );
// }
//
// /** Skeleton DOM이 없으면 생성 */
// function ensureSkeletonDom() {
//     // 이미 존재하면 패스
//     if (document.getElementById("globalSkeleton")) return;
//
//     const contentArea = findContentArea();
//     if (!contentArea) {
//         console.warn("content 영역을 찾지 못했습니다. Skeleton 생성 실패");
//         return;
//     }
//
//     const div = document.createElement("div");
//     div.id = "globalSkeleton";
//     div.style.display = "none"; // 초기에는 보이지 않도록
//
//     div.innerHTML = `
//         <div class="singleSkeletonCard"></div>
//     `;
//
//     // content 최상단에 삽입
//     contentArea.insertBefore(div, contentArea.firstChild);
// }
//
// /** Skeleton 표시 */
// function showSkeleton() {
//     ensureSkeletonDom();
//
//     const skel = document.getElementById("globalSkeleton");
//     if (!skel) return;
//
//     // display 켜기
//     skel.style.display = "flex";
//
//     // transition 설정
//     skel.style.setProperty('transition', 'opacity 0.35s ease', 'important');
//
//     // opacity 0 초기화
//     skel.style.setProperty('opacity', '0', 'important');
//
//     // 페이드인
//     requestAnimationFrame(() => {
//         skel.style.setProperty('opacity', '1', 'important');
//     });
// }
//
// /** Skeleton 숨기기 */
// function hideSkeleton() {
//     const skel = document.getElementById("globalSkeleton");
//     if (!skel) return;
//
//     skel.style.setProperty('opacity', '0', 'important');
//
//     // fade-out 후 DOM 제거
//     setTimeout(() => {
//         if (skel && skel.parentNode) skel.remove();
//     }, 350);
// 드래그 앤 드랍
function dragElement() {
    const dropZone = document.getElementById('fileDropZone');
    const fileInput = document.getElementById('fileInput');

    dropZone.addEventListener('click', () => fileInput.click());

    dropZone.addEventListener('dragover', (e) => {
        e.preventDefault();
        dropZone.classList.add('drag-over');
    });

    dropZone.addEventListener('dragleave', () => {
        dropZone.classList.remove('drag-over');
    });

    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        dropZone.classList.remove('drag-over');

        const file = e.dataTransfer.files[0];
        handleFileUpload(file);
    });

    fileInput.addEventListener('change', () => {
        const file = fileInput.files[0];
        handleFileUpload(file);
    });

}

function handleFileUpload(file) {
    if (!file) return;

    // 파일 확장자 소문자 추출
    const ext = file.name.split('.').pop().toLowerCase();
    const allowedExt = ["xls", "xlsx", "csv"];

    if (!allowedExt.includes(ext)) {
        alert("엑셀 파일(.xls, .xlsx, .csv)만 업로드 가능합니다!");
        return;
    }

    const formData = new FormData();
    formData.append("file", file);

    fetch("/ledger/import/excel", {
        method: "POST",
        body: formData
    })
        .then(res => res.json())
        .then(info => {
            // 미리보기 데이터 저장
            lastExcelRows = info;  // rows만 따로 저장

            document.getElementById("fileName").textContent = "";
            document.getElementById("fileSize").textContent = "";

            const thead = document.querySelector("#sampleTable thead");
            const tbody = document.querySelector("#sampleTable tbody");
            if (thead) thead.innerHTML = "";
            if (tbody) tbody.innerHTML = "";

            showPreviewSection();

            // Preview 출력
            showPreview({
                fileName: info.fileName,
                fileSize: info.fileSize,
                headers: info.headers,
                rows: info.rows.slice(0, 3) // 화면에 보여줄 샘플만
            });
            // 데이터 전송 버튼 노출
            const btn = document.getElementById("sendDataBtn");
            if (btn) {
                btn.style.display = "inline-block";
            }
        })
        .catch(err => {
            console.error(err);
            alert("파일 미리보기 중 오류가 발생했습니다.");
            hidePreviewSection();

            // 에러 시 버튼 숨김
            const btn = document.getElementById("sendDataBtn");
            if (btn) {
                btn.style.display = "none";
            }
        });
}

function showPreview(info) {
    // 파일 정보 세팅
    document.getElementById("fileName").textContent = info.fileName ?? "";
    document.getElementById("fileSize").textContent = info.fileSize ?? "";

    // Table DOM
    const thead = document.querySelector("#sampleTable thead");
    const tbody = document.querySelector("#sampleTable tbody");

    thead.innerHTML = "";
    tbody.innerHTML = "";

    // BOM 제거 처리 (엑셀 헤더에서만)
    const headers = (info.headers ?? []).map(h => h.replace("\ufeff", "").trim());

    // Header Row 생성
    const trHead = document.createElement("tr");
    headers.forEach(h => {
        const th = document.createElement("th");
        th.textContent = h;
        trHead.appendChild(th);
    });
    thead.appendChild(trHead);

    // Sample Rows 생성
    (info.rows ?? []).forEach(row => {
        const tr = document.createElement("tr");

        row.forEach(col => {
            const td = document.createElement("td");
            td.textContent = col ?? "";
            tr.appendChild(td);
        });

        tbody.appendChild(tr);
    });
}

// 데이터 전송(DB에 들어 갈 수 있도록 유효성 검사)
document.addEventListener("DOMContentLoaded", () => {
    const closeBtn = document.getElementById("previewCloseBtn");
    if (closeBtn) {
        closeBtn.addEventListener("click", () => {
            hidePreviewSection();
        });
    }

    const sendBtn = document.getElementById("sendDataBtn");
    if (sendBtn) {
        sendBtn.addEventListener("click", () => {
            if (!lastExcelRows) {
                alert("전송할 데이터가 없습니다. 먼저 파일을 업로드 해주세요.");
                return;
            }

            fetch("/ledger/import/analyze", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(lastExcelRows)
            })
                .then(async res => {
                    const data = await res.json().catch(() => null);

                    // HTTP Status 자체가 오류인 경우
                    if (!res.ok) {
                        alert(data?.message || data?.error || "서버 처리 중 오류가 발생했습니다.");
                        return;
                    }

                    // 서버 side에서 status=error 준 경우
                    if (data.status === "error") {
                        alert(data.message || "처리 중 오류가 발생했습니다.");
                        return;
                    }
                    // 정상 처리 후 데이터 로딩
                    alert("데이터 입력 완료!");
                    hidePreviewSection();
                    initCache()
                    await startDocu();
                })
                .catch(err => {
                    console.error(err);
                    alert("데이터 분석 요청 중 오류가 발생했습니다.");
                });
        });
    }
});

// Preview 전체 영역 노출
function showPreviewSection() {
    document.getElementById("previewSection").style.display = "block";
}

// Preview 전체 영역 숨김 및 초기화
function hidePreviewSection() {
    const section = document.getElementById("previewSection");
    section.style.display = "none";

    // 기존 데이터 초기화
    document.getElementById("fileName").textContent = "";
    document.getElementById("fileSize").textContent = "";

    const thead = document.querySelector("#sampleTable thead");
    const tbody = document.querySelector("#sampleTable tbody");
    if (thead) thead.innerHTML = "";
    if (tbody) tbody.innerHTML = "";

    // 분석 버튼 숨김
    const btn = document.getElementById("sendDataBtn");
    if (btn) btn.style.display = "none";

    // 파일 input 리셋
    const fileInput = document.getElementById("fileInput");
    if (fileInput) fileInput.value = "";

    // 내부 저장 데이터 초기화
    lastExcelRows = null;
}

// 캐싱 데이터 전부 초기화
function initCache(){
    modalJustOpened = false;
    modalChartInstance = null;
    fullCalendarInstance = null;
    ledgerCache.clear()
    loaded3MonthCache = {};
    loaded6MonthCache = null;
    globalAvgLedger = null;
    allCategoryStats = [];
    selectedCategories = new Set();

    genderChart = null;
    ageChart = null;
    AGE_LABELS = [];
    lastExcelRows = null;
}

function updateCategory(payload){
    console.log(payload)
    console.log(payload.categoryName)
    const res = fetch("ai/update-category",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify({
            transActions: [
                {
                    placeOfUse: payload.place,
                    entryAmount: payload.amount,
                    memo: payload.memo,
                    category: payload.categoryName,
                    occurredAt: normalizeDateTime(payload.dateTime)
                }
            ]
        })
    })
}

function normalizeDateTime(dt) {
    if (!dt) return null;

    // 2025-12-17T10:55:00 → 2025-12-17 10:55:00
    return dt.replace('T', ' ').substring(0, 19);
}

// 차트 데이터가 없을 경우
function showChartEmpty(chartId) {
    const chart = document.getElementById(chartId);
    const empty = chart.parentElement.querySelector(".chart-empty");

    chart.style.display = "none";
    empty.style.display = "flex";
}

// 차트 데이터가 있을 경우
function showChart(chartId) {
    const chart = document.getElementById(chartId);
    const empty = chart.parentElement.querySelector(".chart-empty");

    empty.style.display = "none";
    chart.style.display = "block";
}

// top3 empty 관리
function setTop3CardStateByIndex(index, hasData) {
    const card = document.querySelectorAll(".top3-card")[index];
    if (!card) return;

    const content = card.querySelector(".top3-content");
    const empty = card.querySelector(".top3-empty");
    console.log("TOP", index + 1, "hasData =", hasData);
    if (hasData) {
        empty.style.display = "none";
        content.style.display = "block";
    } else {
        content.style.display = "none";
        empty.style.display = "block";
    }
}

function hasValidHistory(history) {
    return (
        Array.isArray(history) &&
        history.length > 0 &&
        history.some(h => Number(h.total) > 0)
    );
}

// 월 선택기 초기화 함수 (데스크톱 & 모바일 공용)
function initMonthPicker() {
    // 🌟 [확인] 여기에 'monthPickerMobile'이 포함되어야 합니다.
    const pickerIds = ['monthPicker', 'monthPickerMobile'];

    pickerIds.forEach(id => {
        const picker = document.getElementById(id);
        if (!picker) return;

        picker.addEventListener('change', function() {
            if (!this.value) return; // 취소 시 무시

            const [year, month] = this.value.split('-').map(Number);

            if (year && month) {
                currentYear = year;
                currentMonth = month;
                updateChart(); // 화면 갱신
            }
        });
    });
}