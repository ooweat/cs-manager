"use strict";
$(function () {

  let listLength = $('.salesSummaryList').length;
  let weekArr = new Array(listLength);
  let salesCntArr = new Array(listLength);
  let salesAmtArr = new Array(listLength);
  
  for(var i=0; i<listLength; i++){
    weekArr[i] = $('.salesSummaryList').eq(i).attr('data-title');
    salesCntArr[i] = $('.salesSummaryList').eq(i).attr('data-cnt');
    salesAmtArr[i] = $('.salesSummaryList').eq(i).attr('data-amt');
  }

  let statistics_chart = document.getElementById("myChart").getContext('2d');
  let myChart = new Chart(statistics_chart, {
    type: 'line',
    data: {
      labels: weekArr,
      datasets: [{
        label: '판매건수',
        data: salesCntArr,
        borderWidth: 5,
        borderColor: '#6777ef',
        backgroundColor: 'transparent',
        pointBackgroundColor: '#fff',
        pointBorderColor: '#6777ef',
        pointRadius: listLength
      }]
    },
    options: {
      legend: {
        display: false
      },
      scales: {
        yAxes: [{
          gridLines: {
            display: false,
            drawBorder: false,
          },
          ticks: {
            stepSize: 1000
          }
        }],
        xAxes: [{
          gridLines: {
            color: '#fbfbfb',
            lineWidth: 2
          }
        }]
      },
    }
  });
});