/**
 *
 * 기존의 script 파일 수정 없이 이곳에서만 수정요망.
 *
 */

$(function () {
    $('.daterange-btn').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "직접 지정하기",
            "weekLabel": "W",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
                "10월", "11월", "12월"],
        },
        /*"ranges": {
          '오늘': [moment(), moment()],
          '어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          '일주일': [moment().subtract(6, 'days'), moment()],
          '이번달': [moment().startOf('month'), moment().endOf('month')],
          '지난달': [moment().subtract(1, 'month').startOf('month'),
            moment().subtract(1, 'month').endOf('month')],
        },*/
        "startDate": moment().subtract(29, 'days'),
        "endDate": moment()
    }, function (start, end) {
        $('.daterange-sdate').val(start.format('YYYY-MM-DD'));
        $('.daterange-edate').val(end.format('YYYY-MM-DD'));
    });
});

function setDateRangePicker(btnType) {
    switch (btnType) {
        case '1':
            $('#sDate').val(moment().format('YYYY-MM-DD'));
            $('#eDate').val(moment().format('YYYY-MM-DD'));
            break;
        case '2':
            $('#sDate').val(moment().subtract(1, 'days').format('YYYY-MM-DD'));
            $('#eDate').val(moment().subtract(1, 'days').format('YYYY-MM-DD'));
            break;
        case '3':
            $('#sDate').val(moment().startOf('month').format('YYYY-MM-DD'));
            $('#eDate').val(moment().endOf('month').format('YYYY-MM-DD'));
            break;
        case '4':
            $('#sDate').val(
                moment().subtract(1, 'month').startOf('month').format('YYYY-MM-DD'));
            $('#eDate').val(
                moment().subtract(1, 'month').endOf('month').format('YYYY-MM-DD'));
            break;
    }
}
