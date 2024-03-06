//Page loaded 후 바로 실행
function init(ptnCompSeq) {
  loadingStop();
  //이번달 초기화
  $('#orders-month').text(moment().format('MM'));

  //단말기 이력관리
  callUsageListByTerminalModel(); //단말기 모델별 추이
  callErrorTop5('RT');
  callErrorTop5('RA');
  callRepairTop5();

  callUsageListByAs(ptnCompSeq);

  
  //dashboardToast($('#user_info').text());

}

function callUsageListByAs(ptnCompSeq) {
  let queryString = "?page=1"
      + "&sDate=" + moment().startOf('month').format('YYYY-MM-DD')
      + "&eDate=" + moment().endOf('month').format('YYYY-MM-DD')
      + "&ptnCompSeq=" + ptnCompSeq;
  ;
  $.ajax({
    type: "GET",
    url: "/api/as/as-count" + queryString,
    cache: false,
    success: function (cmd) {
      console.log(cmd);
      let html = '';
      let total = 0;
      if (cmd.data.length > 0) {
        let progressStatus = '';
        for (let i = 0; i < cmd.data.length; i++) {
          switch (cmd.data[i].name) {
            case '1':
              progressStatus = '접수신청';
              break;
            case '2':
              progressStatus = '택배접수';
              break;
            case '3':
              progressStatus = '택배회수';
              break;
            case '4':
              progressStatus = '접수(이관)';
              break;
            case '5':
              progressStatus = '방문예약';
              break;
            case '6':
              progressStatus = '완료대기';
              break;
            case '7':
              progressStatus = '처리완료';
              break;
            case '8':
              progressStatus = '접수취소';
              break;
          }


          html += '<div class="card-stats-item">';
          html += '<div class="card-stats-item-count">' + cmd.data[i].count
              + '</div>';
          html += '<div class="card-stats-item-label">'
              + progressStatus + '</div>';
          html += '</div>';

          total += cmd.data[i].count;
        }
      } else {
        $('#usageASTotalCount').text("0건");
        html += '';
      }
      $('#usageASTotalCount').text(numberWithCommas(total));
      $('#usageASCount').html(html);
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}
function callUsageListByTerminalModel() {
  let queryString = "?page=1"
      + "&sDate=" + moment().startOf('month').format('YYYY-MM-DD')
      + "&eDate=" + moment().endOf('month').format('YYYY-MM-DD');
  $.ajax({
    type: "GET",
    url: "/api/repairs/terminal-model-count" + queryString,
    cache: false,
    success: function (cmd) {
      let html = '';
      let total = 0;
      if (cmd.data.length > 0) {
        for (let i = 0; i < cmd.data.length; i++) {
          html += '<div class="card-stats-item">';
          html += '<div class="card-stats-item-count">' + cmd.data[i].count
              + '</div>';
          html += '<div class="card-stats-item-label">'
              + cmd.data[i].name + '</div>';
          html += '</div>';

          total += cmd.data[i].count;
        }
      } else {
        $('#usageTerminalModelTotalCount').text("0건");
        html += '';
      }
      $('#usageTerminalModelTotalCount').text(numberWithCommas(total));
      $('#usageTerminalModelCount').html(html);
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

function callRepairTop5() {
  let queryString = "?page=1"
      + "&sDate=" + moment().startOf('month').format('YYYY-MM-DD')
      + "&eDate=" + moment().endOf('month').format('YYYY-MM-DD')
  ;

  $.ajax({
    type: "GET",
    url: "/api/repairs" + queryString,
    cache: false,
    success: function (cmd) {
      let html = '';
      if (cmd.data.length > 0) {
        for (let i = 0; i < 5; i++) {
          html += '<li class="media">';
          html += '<div class="media-body">';
          html += '<div class="media-title">' + cmd.data[i].compName + '</div>';
          html += '<div class="text-time">' + convertDateFormat(
              cmd.data[i].createDate) + '</div>';
          html += '<div class="text-muted text-small">'
              + '<div class="bullet"></div>협력사 <a href="#">'
              + cmd.data[i].ptnCompName + '</a></div>';
          html += '<div class="text-muted text-small">'
              + '<div class="bullet"></div>불량내역: <a href="#">'
              + cmd.data[i].trbName + '</a>'
              + '<div class="bullet"></div>수리내역: <a href="#">'
              + cmd.data[i].atName + '</a></div>';
          html += '</div>';
          html += '<div class="media-items">';
          html += '<div class="media-item">';
          html += '<div class="media-value">' + cmd.data[i].cid + '</div>';
          html += '<div class="media-label">CID</div>';
          html += '</div>';
          html += '<div class="media-item">';
          html += '<div class="media-value">' + cmd.data[i].terminalId
              + '</div>';
          html += '<div class="media-label">TID</div>';
          html += '</div>';
          html += '<div class="media-item">';
          html += '<div class="media-value">' + cmd.data[i].serialNo
              + '</div>';
          html += '<div class="media-label">Serial</div>';
          html += '</div>';
          html += '</div>';
          html += '</li>';
        }
      } else {
        html += '';
      }
      $('#repair-recent-top5').html(html);
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

function callErrorTop5(type) {
  let queryString = "?page=1"
      + "&sDate=" + moment().startOf('month').format('YYYY-MM-DD')
      + "&eDate=" + moment().endOf('month').format('YYYY-MM-DD')
      + "&searchType=" + type
  ;

  $.ajax({
    type: "GET",
    url: "/api/repairs/error-top5" + queryString,
    cache: false,
    success: function (cmd) {
      let html = '';
      if (cmd.data.length > 0) {
        for (let i = 0; i < cmd.data.length; i++) {
          html += '<li class="media">';
          html += '<div class="media-body">';
          html += '<div class="float-right">' + cmd.data[i].count + '건 ('
              + Math.round(cmd.data[i].count / Number($('#usageTerminalModelTotalCount').text()) * 100) + '%)</div>';
          html += '<div class="media-title">' + cmd.data[i].name + '</div>'
          html += '</div></li>';
        }
      } else {
        html += '';
      }
      $('#' + type + '-top5').html(html);
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

function callGroupInfo(orginUserSeq) {
  $('#paramUserSeq > option').remove();

  $.ajax({
    type: "POST",
    url: "/ajax/callGroupUserList",
    data: {
      "groupSeq": $('#paramGroupSeq').val(),
    },
    dataType: "json",
    cache: false,
    success: function (result) {
      //$('#paramUserSeq')
      for (let _idx = 0; _idx < result.length; _idx++) {
        let selected = (orginUserSeq == result[_idx].userSeq || result.length
            == 1) ? " selected " : "";
        $('#paramUserSeq').append(
            "<option value=" + result[_idx].userSeq + selected + "  >"
            + result[_idx].userName + "</option>");
      }
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });

  $.ajax({
    type: "POST",
    url: "/ajax/callGroupCouponConfig",
    data: {
      "groupSeq": $('#paramGroupSeq').val(),
    },
    dataType: "json",
    cache: false,
    success: function (result) {
      $('#usableCount').text(result.mainCompCnt - result.usedCount);
      $('#mainCompCnt').text(result.mainCompCnt);
      $('#usableCount').text() < 1 ? $('#publishBtn').hide() : $(
          '#publishBtn').show();
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

/*function updateCouponStat(couponNo, couponStat, obj){
    loadingStart();
    $.ajax({
        type: "POST",
        url: "/ajax/updateCouponStat",
        data:{
            "couponNo": couponNo,
            "couponStat": couponStat
        },
        dataType: "json",
        cache: false,
        success : function(cmd) {
            if(cmd.code == '0000'){
                obj.value=couponStat;
            }
            loadingStop();
        }, // success
        error : function(xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
        }
    });
}*/

/*function couponReSend(couponNo, phone){
    loadingStart();
    $.ajax({
        type: "POST",
        url: "/ajax/couponResend",
        data:{
            "couponNo": couponNo,
            "revMobile": phone
        },
        dataType: "json",
        cache: false,
        success : function(cmd) {
            if(cmd.code == '0000'){
                alert("재발송이 완료되었습니다.");
            }
            loadingStop();
            window.location.reload();
        }, // success
        error : function(xhr, status) {
            alert(xhr + " : " + status);
            location.href("/");
        }
    });
}*/

/*function couponPublish(){
    if($('#paramGroupSeq').val() == 0){
        alert('그룹을 선택해주세요.');
        return false;
    }

    loadingStart();
    //2023.11.17 twkim 엑셀 발권에 따른 분기
    if($('.custom-switch-input:checked').length == 0){
        if($('#couponAmt').val().length<1){
            alert(',(콤마)를 제외한 금액을 입력해주세요.\n최소 금액 100원');
            return false;
        }

        if($('#revMobile').val().length < 13){
            alert('올바른 연락처를 입력해주세요.');
            return false;
        }

        if($('#revMobile').val().length < 1){
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/ajax/couponIssuance",
            data:{
                "groupSeq": $('#paramGroupSeq').val(),
                "userSeq": $('#paramUserSeq').val(),
                "couponType": $('#couponType').val(),
                "couponAmt": $('#couponAmt').val(),
                "revMobile": $('#revMobile').val()
            },
            dataType: "json",
            success : function(cmd) {
                loadingStop();
                console.log(cmd.data);
                if(cmd.code == '0000'){
                    alert('발권이 완료되었습니다.');
                    window.location.reload();
                }
            }, // success
            error : function(xhr, status) {
                alert(xhr + " : " + status);
                window.location.reload();
            }
        });
    }
    if($('.custom-switch-input:checked').length > 0){
        $('#couponAmt').val(0);
        $('#userSeq').val($('#paramUserSeq').val());
        $('#groupSeq').val($('#paramGroupSeq').val());
        let formData = new FormData(document.getElementById("formData"));
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            processData:false,
            contentType:false,
            url: "/ajax/couponExcelIssuance",
            data: formData,
            dataType: "json",
            success : function(cmd) {
                loadingStop();
                console.log(cmd);
                if(cmd>0){
                    alert(cmd+'건 발권 완료되었습니다.');
                    window.location.reload();
                }
            }, // success
            error : function(xhr, status) {
                alert(xhr + " : " + status);
                window.location.reload();
            }
        });
    }
}*/
