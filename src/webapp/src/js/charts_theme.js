var ctx = document.getElementById('temperatureContainerUnitChart');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['0', '10', '20', '30', '40', '50', '60'],
        datasets: [{
            label: '[]BA2B',
            data: [2.5, 2.8, 2.7, 2.6, 2.8, 3, 3.2],
            fill: false,
            backgroundColor: 'rgba(106, 116, 201, 1)',
            borderColor: 'rgba(106, 116, 201, 1)',
            borderWidth: 2
        },
        {
            label: '[]BA2B',
            data: [2.5, 2.3, 2, 2.4, 2.8, 4, 4.2],
            fill: false,
            backgroundColor: 'rgba(219, 77, 137, 1)',
            borderColor: 'rgba(219, 77, 137, 1)',
            borderWidth: 2
        },
        {
            label: '[]BA2F',
            data: [2.7, 3, 3.4, 3.4, 3.8, 5,4],
            fill: false,
            backgroundColor: 'rgba(206, 242, 91, 1)',
            borderColor: 'rgba(206, 242, 91, 1)',
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        tooltips: {
            mode: 'index',
            intersect: true,
        },
        hover: {
            mode: 'index',
            intersect: true,
        },
        scales: {
            xAxes: [{
                gridLines: {
                    display: true,
					drawBorder: true,
					drawOnChartArea: true,
					drawTicks: false
                }
            }],
            yAxes: [{
                gridLines: {
                    display: true,
					drawBorder: true,
					drawOnChartArea: true,
					drawTicks: false
                },
                ticks: {
                    min: 0,
                    max: 6,
                    stepSize: 0.5
                }
            }]
        }
    }
});


