// 전역 상태
let currentYear = 2025;
let currentMonth = 10;
let modalJustOpened = false; // 모달 팝업 플래그
let modalChartInstance = null;

//LRU 캐싱 사용, 가장 최근에 사용하지 않은 데이터 제거.
const ledgerCache = new Map();
let loaded3MonthCache = {};

async function loadLedgerChart({ year, month }) {
    // 캐싱용 키 설정
    const key = `${year}-${month}`;

    // 캐싱 작업
    const cached = getCache(key);
    if (cached) {
        console.log("캐시 데이터 사용")
        drawCategoryPieChart(cached.categories);
        drawDailyLineChart(cached.daily);
        return;
    }

    const url = `/ledger/chart?year=${year}&month=${month}`;
    fetch(url)
        .then(res => res.json())
        .then(data => {
            setCache(key, data);

            drawCategoryPieChart(data.categories);
            drawDailyLineChart(data.daily);
        });
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
        credits: { enabled: false },
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

function drawDailyLineChart(daily) {
    Highcharts.chart('dailyChart', {
        chart: { type: 'line' },
        title: { text: '일별 지출/수입 추이' },
        xAxis: {
            categories: daily.map(d => d.date)
        },
        yAxis: {
            title: { text: '금액(원)' }
        },
        series: [{
            name: '지출',
            data: daily.map(d => d.expense)
        }, {
            name: '수입',
            data: daily.map(d => d.income)
        }]
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
function setCache(key, data, maxSize = 3) {
    // 이미 존재하면 제거 후 다시 넣어서 “가장 최근”으로 만들기(중요)
    if (ledgerCache.has(key)) {
        ledgerCache.delete(key);
    }

    // 신규 데이터 삽입
    ledgerCache.set(key, data);

    // 사이즈 초과 시 가장 오래된 항목 삭제(LRU)
    if (ledgerCache.size > maxSize) {
        const oldestKey = ledgerCache.keys().next().value;
        ledgerCache.delete(oldestKey);
    }
}

function getCache(key) {
    if (!ledgerCache.has(key)) {
        return null;
    }

    // 사용했으므로 최신으로 갱신
    const value = ledgerCache.get(key);
    ledgerCache.delete(key);
    ledgerCache.set(key, value);

    return value;
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
    const data = ledgerCache.get(key);  // 또는 ledgerCache[key]

    if (!data || !data.categories) {
        return null;
    }

    const found = data.categories.find(c => c.categoryName === categoryName);
    return found ? Number(found.amount) : null;
}