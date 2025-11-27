// Highcharts 전역 설정: 모든 차트에서 햄버거 메뉴 + 워터마크 제거
Highcharts.setOptions({
    exporting: {
        enabled: false
    },
    credits: {
        enabled: false
    }
});

// 전역 상태
let currentYear = 2025;
let currentMonth = 10;
let modalJustOpened = false; // 모달 팝업 플래그
let modalChartInstance = null;

//LRU 캐싱 사용, 가장 최근에 사용하지 않은 데이터 제거.현재 달과 전 달의 2개월치 데이터를 3개까지 보관(총 6개)
const ledgerCache = new Map();
let loaded3MonthCache = {};

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
async function updateChart() {
    updateMonthLabel();
    await loadLedgerChart({ year: currentYear, month: currentMonth });
}


// 초기 로딩
document.addEventListener("DOMContentLoaded", () => {
    updateChart(); // 첫 화면 렌더링
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
    const res = await fetch(`/ledger/request/userLedger/month?year=${currentYear}&month=${currentMonth}`);
    const data = await res.json();

    loaded3MonthCache[key] = data;
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