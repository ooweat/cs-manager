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
    <script type="text/javascript" src="/assets/js/dashboard.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
    <script type="text/javascript">
      /* 동적 실행 */
      $(function () {
        $('#${month}').addClass('active');
        if ($('.custom-switch-input:checked').length > 0) {
          $('#onceIssuance').hide();
          $('#multiIssuance').show();
        } else {
          $('#onceIssuance').show();
          $('#multiIssuance').hide();
        }

        let html = "";
        for (let i = 1; i <= 12; i++) {
          html += '<li><a href="dashboard?month=' + ('0' + i).slice(-2) + '" id="' + ('0'
              + i).slice(-2) + '" class="dropdown-item">';
          html += ('0' + i).slice(-2) + '월';
          html += '</a></li>';
          if (i == '${thisMonth}') {
            break;
          }
        }
        $('#monthUl').html(html);

        $('#usableCount').text() < 1 ? $('#publishBtn').hide() : $('#publishBtn').show();

      });

      function issuanceTypeToggle() {
        if ($('.custom-switch-input:checked').length > 0) {
          $('#onceIssuance').hide();
          $('#multiIssuance').show();
        } else {
          $('#onceIssuance').show();
          $('#multiIssuance').hide();
        }
      }

      async function insertGroup() {
        const {value: groupName} = await Swal.fire({
          title: '그룹명을 입력하세요.',
          input: 'text',
          inputLabel: '그룹명: 쿠폰 또는 포인트 사용 시 표기될 상호명',
          inputPlaceholder: '`사업자등록증`의 `상호` 또는 `법인(단체)`명',
          inputAttributes: {
            maxlength: 25,
            autocapitalize: 'off',
            autocorrect: 'off'
          }
        });
        if (groupName.length < 2) {
          alert('상호명은 최소 2글자 이상 입력해주세요.');
          return false;
        }

        $.ajax({
          type: "POST",
          url: "/ajax/insertGroup",
          data: {
            "groupName": groupName,
          },
          dataType: "json",
          cache: false,
          success: function (cmd) {
            if (cmd.code == '0000') {
              alert('등록이 완료되었습니다.');
              window.location.reload();
            }
          }, // success
          error: function () {
            alert('등록이 취소되었습니다.\n' +
                '동일한 그룹명이 존재할 수 있습니다.');
            location.href("/");
          }
        });
      }

      function showFileName() {

      }
    </script>
<body onload="init('${member.companySeq}');">
<div class="main-content">
    <section class="section">
        <div class="section-title row">
            <div class="dropdown d-inline">
                <a class="font-weight-600 dropdown-toggle" data-toggle="dropdown"
                   href="#" id="orders-month" aria-expanded="false"></a> 월
                <ul class="dropdown-menu dropdown-menu-sm"
                    x-placement="bottom-start"
                    style="position: absolute; transform: translate3d(0px, 18px, 0px); top: 0px; left: 0px; will-change: transform;"
                    id="monthUl">
                    <li class="dropdown-title">월 선택</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">
                <div class="section-header col-lg-12 col-md-12 col-12 col-sm-12">
                    <h1>단말기 이력관리</h1>
                </div>
                <div class="card card-statistic-2">
                    <div class="card-stats">
                        <div class="card-stats-title">단말기 모델별 추이
                        </div>
                        <div class="row" id="usageTerminalModelCount">
                        </div>
                    </div>
                    <div class="card-icon shadow-primary bg-primary">
                        <i class="fas fa-archive" style="line-height: 50px !important;"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>이번달 누적 접수 건수</h4>
                        </div>
                        <div class="card-body" id="usageTerminalModelTotalCount">
                        </div>
                    </div>
                </div>
                <div class="row m-0">
                    <div class="card col-lg-6 col-md-12 col-12 col-sm-12">
                        <div class="card-header">
                            <h4>불량내역 TOP 5</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled list-unstyled-border" id="RT-top5">

                            </ul>
                        </div>
                    </div>
                    <div class="card col-lg-6 col-md-12 col-12 col-sm-12">
                        <div class="card-header">
                            <h4>수리내역 TOP 5</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled list-unstyled-border" id="RA-top5">

                            </ul>
                        </div>
                    </div>
                    <div class="card col-lg-12 col-md-12 col-12 col-sm-12">
                        <div class="card-header">
                            <h4>이번달 최신 TOP 5</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled list-unstyled-border" id="repair-recent-top5">

                            </ul>
                            <div class="text-center pt-1 pb-1">
                                <a href="/repairs" class="btn btn-primary btn-lg btn-round">
                                    View All
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">
                <div class="section-header col-lg-12 col-md-12 col-12 col-sm-12">
                    <h1>AS</h1>
                </div>
                <div class="card card-statistic-2">
                    <div class="card-stats">
                        <div class="card-stats-title">단말기 모델별 추이</div>
                        <div class="row" id="usageASCount">
                        </div>
                    </div>
                    <div class="card-icon shadow-primary bg-primary">
                        <i class="fas fa-archive" style="line-height: 50px !important;"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>이번달 누적 접수 건수</h4>
                        </div>
                        <div class="card-body" id="usageASTotalCount">
                        </div>
                    </div>
                </div>
                <div class="row m-0">
                    <div class="card col-lg-12 col-md-12 col-12 col-sm-12">
                        <div class="card-header">
                            <h4>이번달 최신 TOP 5</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled list-unstyled-border" id="as-recent-top5">

                            </ul>
                            <div class="text-center pt-1 pb-1">
                                <a href="/repairs" class="btn btn-primary btn-lg btn-round">
                                    View All
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="/assets/js/dashboard.js"></script>
</body>
</html>
