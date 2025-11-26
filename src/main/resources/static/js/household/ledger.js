// 전역 상태
let currentYear = 2025;
let currentMonth = 10;

async function loadLedgerChart({ year, month }) {
    const url = `/ledger/chart?year=${year}&month=${month}`;
    fetch(url)
        .then(res => res.json())
        .then(data => {
            drawCategoryPieChart(data.categories);
            drawDailyLineChart(data.daily);
        });
}

function drawCategoryPieChart(categories) {
    Highcharts.chart('categoryChart', {
        chart: { type: 'pie' },
        title: { text: '카테고리별 지출 비율' },
        plotOptions: {
            pie:{
                cursor: 'pointer',
                point:{
                    events:{
                        click: function(){
                            const category = this.name;
                            const amount = this.y;

                            openModal(
                                '모달 팝업 테스트'
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

function openModal(title, htmlBody) {
    document.getElementById("modalTitle").innerText = title;
    document.getElementById("modalBody").innerHTML = htmlBody;
    document.getElementById("chartModal").style.display = "flex";
}

function closeModal() {
    document.getElementById("chartModal").style.display = "none";
}

// 모달 강제로 안뜨게 하는 코드
document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("chartModal").style.display = "none";
});