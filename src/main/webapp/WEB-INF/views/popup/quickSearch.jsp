<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
          name="viewport">
    <style type="text/css">
      #payments-table-body td, #tStatus-table-body td {
        padding: 0px 20px !important;
        height: 100%;
        font-size: 12px;
      }
    </style>
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $('#emptyArea').show();
        $('#dataArea').hide();
      });

      function enterEvent() {
        if (event.keyCode == 13) {
          callApi('init', $('#terminalId').val());
        }
      }

      function validCheck(terminalId) {
        if (terminalId == null || terminalId == '') {
          alert('TID를 입력해주세요.');
          return false;
        }

        if (terminalId.length != 10) {
          alert('TID는 10자리 입니다.');
          return false;
        }

        return true;
      }

      function callApi(service, terminalId) {
        let validResult = validCheck(terminalId);

        if (validResult) {
          $('#emptyArea').hide();
          $('#dataArea').show();

          switch (service) {
            case 'init':
              callterminalInfoApi(terminalId);
              callStatusApi(terminalId);
              callAsListApi(terminalId);
              callPaymentApi(terminalId);
              break;
            case 'status':
              callStatusApi(terminalId);
              break;
            case 'terminalInfo':
              callterminalInfoApi(terminalId);
              break;
            case 'asList':
              callAsListApi(terminalId);
              break;
            case 'payments':
              callPaymentApi(terminalId);
              break;
          }
        }
      }

      function callterminalInfoApi(terminalId) {
        $.ajax({
          url: 'https://devapi.ubcn.co.kr:17881/vmms/terminals/' + terminalId,
          type: 'GET',
          timeout: 3000,
          success: function (data) {
            console.log(data);
            $('#terminalInfo-body').empty();
            if (data != '') {
              let element = '';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">사업자정보</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.businessNo + ' ('
                  + data.bizType + '/' + data.presentName + ')" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">자판기모델/코드</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.model + ' ('
                  + data.code + ')" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">모뎀</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.modem + ' ('
                  + data.modemInfo + ')" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">소속</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.company
                  + '" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">조직루트</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.organizationPath
                  + '" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">사용자명(VMMS)</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.userName + ' ('
                  + data.userId + ')" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">설치위치</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.place + ' ('
                  + data.placeCode + '/' + data.placeNo + ')" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">메모</label>';
              element += '<div class="col-sm-9">';
              element += '<textarea class="form-control" rows="10" style="height: 100% !important;" readonly>' + data.memo +'</textarea> <br>'
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">CS메모</label>';
              element += '<div class="col-sm-9">';
              element += '<textarea class="form-control" rows="10" style="height: 100% !important;" readonly>' + data.csMemo +'</textarea> <br>'
              element += '</div>';
              element += '</div>';
              $('#terminalInfo-body').append(element);
            } else {
              $('#terminalInfo-body').append('<div class="page-description">단말기 정보가 없습니다.</div>');
            }
          },
          error: function () {
            console.log('error');
          }
        });
      }

      function callStatusApi(terminalId) {
        $.ajax({
          url: 'https://devapi.ubcn.co.kr:17881/vmms/terminals/' + terminalId + '/status',
          type: 'GET',
          success: function (data) {
            console.log(data);
            $('#tStatus-table-body').empty();
            if (data.length > 0) {
              let element = '';
              for (let i = 0; i < data.length; i++) {
                element += '<tr>';
                element += '<td>' + data[i].responseDate.substring(11) + '</td>';
                element += '<td>' + data[i].pdError + '</td>';
                element += '<td>' + data[i].soldOut + '</td>';
                element += '<td>' + data[i].controlError + '</td>';
                element += '</tr>';
              }

              $('#tStatus-table-body').append(element);
            } else {
              $('#tStatus-table-body').append(
                  '<div class="page-description">상태정보 수신 이력이 없습니다.</div>');
            }
            //
          },
          error: function () {
            console.log('error');
          }
        });
      }

      function callAsListApi(terminalId) {
        $.ajax({
          url: 'https://devapi.ubcn.co.kr:17881/support/asList/terminals/' + terminalId,
          type: 'GET',
          success: function (data) {
            console.log(data);
            $('#accordion').empty();
            if (data.length > 0) {
              let element = '';
              let progressStatus = '';
              for (let i = 0; i < data.length; i++) {
                switch (data[i].progressStatus) {
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
                element += '<div class="accordion">';
                element += '<div class="accordion-header collapsed" role="button" data-toggle="collapse" data-target="#panel-body-'
                    + i + '" aria-expanded="false">';
                element += '<h4>#' + data[i].regDate + ' (' + '진행상태: ' + progressStatus + ')'
                    + '</h4>';
                element += '</div>';
                element += '<div class="accordion-body collapse" id="panel-body-' + i
                    + '" data-parent="#accordion" style="">';
                element += '<p class="mb-0">'
                    + '*1. 접수일자: ' + data[i].regDate + '<br>'
                    + '*2. 사업자정보: ' + data[i].businessNo + ' / ' + data[i].compName + '<br>'
                    + '*3. 자판기모델: ' + data[i].vmModelName + '<br>'
                    + '*4. 단말기모델: ' + data[i].tidModelName + '<br>'
                    + '*5. 접수내용: ' + data[i].trbName + '<br>'
                    + '*6. 원인: ' + data[i].rtName + '<br>'
                    + '*7. 처리: ' + data[i].atName + '<br>'
                    + '*8. 유상여부: ' + (data[i].ctmCharge == 'Y' ? "유상" : "무상") + '<br>'
                    + '*9. 발생비용: ' + data[i].repairCost + '<br>'
                    + '*10. 추가메모: '
                    + '<textarea class="form-control" rows="10" style="height: 100% !important;" readonly>'
                    + data[i].memo
                    +'</textarea> <br>'
                    + '</p>';
                element += '</div>';
                element += '</div>';
              }

              $('#accordion').append(element);
            } else {
              $('#accordion').append('<div class="page-description">AS 이력이 없습니다.</div>');
            }
          },
          error: function () {
            console.log('error');
          }
        });
      }

      function callPaymentApi(terminalId) {
        $.ajax({
          url: 'https://devapi.ubcn.co.kr:17881/biz/payments/all/terminals/' + terminalId,
          type: 'GET',
          success: function (data) {
            console.log(data);

            $('#payments-body').empty();
            if (data != '') {
              let element = '';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">신용</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.pgMerchantNo
                  + '" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">티머니</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.tmn
                  + ' (' + data.tmnRF + ')" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">캐시비</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.csb
                  + ' (' + data.csbRF + ')" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">레일플러스</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.railPlus
                  + ' (' + data.railPlusRF + ')" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">페이코</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.payco
                  + ' (' + data.paycoRF + ')" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">kCash</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.kcash
                  + ' (' + data.kcashRF + ')" readonly>';
              element += '</div>';
              element += '</div>';

              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">카카오페이카드</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.kakaoPayCard
                  + '" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">카카오페이머니</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.kakaoPayMoney
                  + '" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">제로페이</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.zeroPay
                  + ' (' + data.zeroPayRF + ')" readonly>';
              element += '</div>';
              element += '</div>';
              element += '<div class="form-group row mb-1">';
              element += '<label class="col-sm-3 col-form-label align-content-center text-right">네이버페이</label>';
              element += '<div class="col-sm-9">';
              element += '<input type="text" class="form-control" value="' + data.bcNaverPay
                  + '" readonly>';
              element += '</div>';
              element += '</div>';
              $('#payments-body').append(element);
            } else {
              $('#payments-body').append('<div class="page-description">가맹점 정보가 없습니다.</div>');
            }
          },
          error: function () {
            console.log('error');
          }
        });
      }
    </script>
<body>
<div>
    <section class="section">
        <div id="headerArea" class="col-6 m-auto mt-5">
            <div class="page-search">
                <div class="form-group floating-addon floating-addon-not-append">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-search"></i>
                            </div>
                        </div>
                        <input class="form-control" id="terminalId" type="search"
                               placeholder="TID 조회"
                               aria-label="Search" data-width="250" style="width: 250px;"
                               maxlength="10" onkeyup="enterEvent()">
                        <div class="input-group-append">
                            <button class="btn btn-primary btn-lg" type="button"
                                    onclick="callApi('init', $('#terminalId').val());"><i
                                    class="fas fa-search"></i></button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div id="emptyArea" class="col-6 m-auto page-error">
            <div class="page-description">데이터를 조회해주세요.</div>
        </div>
        <div id="dataArea" style="display: none;">
            <div class="col-12 col-sm-12 col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <ul class="nav nav-pills" id="myTab3" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active show" id="terminalInfo-tab"
                                   data-toggle="tab"
                                   href="#terminalInfo"
                                   role="tab" aria-controls="terminalInfo"
                                   aria-selected="true">단말기정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tStatus-tab" data-toggle="tab"
                                   href="#tStatus"
                                   role="tab" aria-controls="tStatus" aria-selected="true">
                                    오늘상태조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="asList-tab" data-toggle="tab"
                                   href="#asList"
                                   role="tab" aria-controls="asList" aria-selected="true">
                                    AS 이력조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="payments-tab" data-toggle="tab"
                                   href="#payments"
                                   role="tab"
                                   aria-controls="payments" aria-selected="false">카드사 가맹점정보
                                    조회</a>
                            </li>
                        </ul>
                        <div class="tab-content px-4" id="myTabContent2">
                            <div class="tab-pane fade active show" id="terminalInfo" role="tabpanel"
                                 aria-labelledby="terminalInfo-tab">
                                <div class="col-10 col-md-10 col-lg-10 m-auto ">
                                    <div class="card">
                                        <div class="card-body" id="terminalInfo-body">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tStatus" role="tabpanel"
                                 aria-labelledby="tStatus-tab">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="col">수집시간</th>
                                        <th scope="col">PDERROR</th>
                                        <th scope="col">품절정보</th>
                                        <th scope="col">고장정보</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tStatus-table-body"></tbody>
                                </table>
                            </div>


                            <div class="tab-pane fade" id="asList" role="tabpanel"
                                 aria-labelledby="asList-tab">
                                <div class="card">
                                    <div class="card-body">
                                        <div id="accordion"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="payments" role="tabpanel"
                                 aria-labelledby="payments-tab">
                                <div class="col-10 col-md-10 col-lg-10 m-auto ">
                                    <div class="card">
                                        <div class="card-body" id="payments-body">

                                        </div>
                                    </div>
                                </div>
                                <%--<table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="col">카드(매입)사</th>
                                        <th scope="col">가맹점번호</th>
                                        <th scope="col">RF가맹점번호</th>
                                    </tr>
                                    </thead>
                                    <tbody id="payments-table-body">
                                    <tr id="pgMerchantNo">
                                        <td>PG/VAN</td>
                                        <td></td>
                                        <td>-</td>
                                    </tr>
                                    <tr id="tmn">
                                        <td>티머니</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="csb">
                                        <td>캐시비</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="railPlus">
                                        <td>레일플러스</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="payco">
                                        <td>페이코</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="kcash">
                                        <td>kcash</td>
                                        <td></td>
                                        <td>-</td>
                                    </tr>
                                    <tr id="kakaoPayCard">
                                        <td>카카오페이카드</td>
                                        <td></td>
                                        <td>-</td>
                                    </tr>
                                    <tr id="kakaoPayMoney">
                                        <td>카카오페이머니</td>
                                        <td></td>
                                        <td>-</td>
                                    </tr>
                                    <tr id="zeroPay">
                                        <td>제로페이</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="naverPay">
                                        <td>네이버페이</td>
                                        <td></td>
                                        <td>-</td>
                                    </tr>
                                    </tbody>
                                </table>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>
