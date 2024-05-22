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
              callAsListApi(terminalId);
              callPaymentApi(terminalId);
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
          url: 'https://localhost:17881/biz/terminals/' + terminalId,
          type: 'GET',
          timeout: 3000,
          success: function (data) {
            if(data == ''){
              alert('등록된 단말기 정보가 없습니다.');
              $('#terminalId').focus();
              return false;
            }
            $('#businessNo').text(data.businessNo);
            $('#merchantName').text(data.merchantName);
            $('#presentName').text(data.presentName);
            $('#terminalIdTitle').text(" / " + data.terminalId);
            $('#terminalInfoContent').text(data.toString());

          },
          error: function () {
            console.log('error');
          }
        });
      }

      function callAsListApi(terminalId) {
        $.ajax({
          url: 'https://localhost:17881/support/asList/terminals/' + terminalId,
          type: 'GET',
          success: function (data) {
            console.log(data);
            if(data.length > 0) {
              let element = '';
              let progressStatus ='';
              $('#accordion').empty();
              for(let i = 0; i < data.length; i++) {
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
                element += '<div class="accordion-header collapsed" role="button" data-toggle="collapse" data-target="#panel-body-' + i + '" aria-expanded="false">';
                element += '<h4>' + data[i].regDate + ' (' + '진행상태: ' + progressStatus + ')'
                    + '</h4>';
                element += '</div>';
                element += '<div class="accordion-body collapse" id="panel-body-' + i + '" data-parent="#accordion" style="">';
                element += '<p class="mb-0">'
                    + '접수: ' + data[i].regDate + '<br>'
                    + '사업자: ' + data[i].businessNo + ' / ' + data[i].compName + '<br>'
                    + '자판기모델: ' + data[i].vmModelName + '<br>'
                    + '단말기모델: ' + data[i].tidModelName + '<br>'
                    + '접수내용: ' + data[i].trbName + '<br>'
                    + '원인: ' + data[i].rtName + '<br>'
                    + '처리: ' + data[i].atName + '<br>'
                    + '유상유무: ' + (data[i].ctmCharge =='Y' ? "유상" : "무상") + '<br>'
                    + '발생비용: ' + data[i].repairCost + '<br>'
                    + '</p>';
                element += '</div>';
                element += '</div>';
              }

              $('#accordion').append(element);
            }



          },
          error: function () {
            console.log('error');
          }
        });
      }

      function callPaymentApi(terminalId) {
        $.ajax({
          url: 'https://localhost:17881/biz/payments/all/terminals/' + terminalId,
          type: 'GET',
          success: function (data) {
            $('#pgMerchantNo td:nth-child(2)').text(data.pgMerchantNo);
            $('#tmn td:nth-child(2)').text(data.tmn);
            $('#tmn td:nth-child(3)').text(data.tmnRF);
            $('#csb td:nth-child(2)').text(data.csb);
            $('#csb td:nth-child(3)').text(data.csbRF);
            $('#railPlus td:nth-child(2)').text(data.railPlus);
            $('#railPlus td:nth-child(3)').text(data.railPlusRF);
            $('#payco td:nth-child(2)').text(data.payco);
            $('#payco td:nth-child(3)').text(data.paycoRF);
            $('#kcash td:nth-child(2)').text(data.kcash);
            $('#kakaoPayCard td:nth-child(2)').text(data.kakaoPayCard);
            $('#kakaoPayMoney td:nth-child(2)').text(data.kakaoPayMoney);
            $('#zeroPay td:nth-child(2)').text(data.zeroPay);
            $('#zeroPay td:nth-child(3)').text(data.zeroPayRF);
            $('#naverPay td:nth-child(2)').text(data.bcNaverPay);

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
                                <a class="nav-link" id="asList-tab" data-toggle="tab"
                                   href="#asList"
                                   role="tab" aria-controls="asList" aria-selected="true">AS
                                    이력조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="payments-tab" data-toggle="tab"
                                   href="#payments"
                                   role="tab"
                                   aria-controls="payments" aria-selected="false">카드사 가맹점정보
                                    조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab3" data-toggle="tab" href="#"
                                   role="tab" aria-controls="contact" aria-selected="false">샘플</a>
                            </li>
                        </ul>
                        <div class="tab-content px-4" id="myTabContent2">
                            <div class="tab-pane fade active show" id="terminalInfo" role="tabpanel"

                                 aria-labelledby="terminalInfo-tab">
                                <div class="col-12 col-md-12 col-lg-12">
                                    <div class="card profile-widget">
                                        <div class="profile-widget-header">
                                            <div class="profile-widget-items">
                                                <div class="profile-widget-item">
                                                    <div class="profile-widget-item-label">사업자번호
                                                    </div>
                                                    <div class="profile-widget-item-value"
                                                         id="businessNo"></div>
                                                </div>
                                                <div class="profile-widget-item">
                                                    <div class="profile-widget-item-label">가맹점명
                                                    </div>
                                                    <div class="profile-widget-item-value"
                                                         id="merchantName"></div>
                                                </div>
                                                <div class="profile-widget-item">
                                                    <div class="profile-widget-item-label">대표자
                                                    </div>
                                                    <div class="profile-widget-item-value"
                                                         id="presentName"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-widget-description">
                                            <div class="profile-widget-name">단말기 정보
                                                <div class="text-muted d-inline font-weight-normal" id="terminalIdTitle"></div>
                                            </div>
                                            <p id="terminalInfoContent"></p>
                                        </div>
                                    </div>
                                </div>
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
                                <table class="table table-striped">
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
                                </table>
                            </div>
                            <div class="tab-pane fade" id="contact3" role="tabpanel"
                                 aria-labelledby="contact-tab3">
                                준비중입니다.
                            </div>
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
