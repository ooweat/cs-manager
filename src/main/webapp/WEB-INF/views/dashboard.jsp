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
      canvas{
        display: block;
        position: relative;
        min-width: 306px;
        min-height: 150px;
      }

    </style>
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/dashboard.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
    <script type="text/javascript">
      /* 동적 실행 */
      /*$(function () {
        let html = "";
        for (let i = 1; i <= 12; i++) {
          html += '<li><a href="dashboard?month=' + ('0' + i).slice(-2) + '" id="' + ('0'
              + i).slice(-2) + '" class="dropdown-item">';
          html += ('0' + i).slice(-2) == '${month}' ? '${month}' : ('0' + i).slice(-2);
          html += ' 월</a></li>';
        }
        $('#monthUl').html(html);
        $('#orders-month').text('${month}');
      });*/
    </script>
<body onload="init('${member.companySeq}');">
<div class="main-content">
    <section class="section">
        <%--<div class="section-title row">
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
        </div>--%>
        <div class="row">
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">
                <div class="section-header col-lg-12 col-md-12 col-12 col-sm-12">
                    <h1>단말기 이력관리</h1>
                </div>
                <div class="card card-statistic-2">
                    <div class="card-stats">
                        <div class="card-stats-title">단말기 모델별 추이
                        </div>
                        <div class="row m-0-auto" id="usageTerminalModelCount">
                        </div>
                    </div>
                    <div class="card-icon shadow-primary bg-primary">
                        <i class="fas fa-archive" style="line-height: 50px !important;"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>누적 접수 건수</h4>
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
                            <div class="chartjs-size-monitor"
                                 style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                <div class="chartjs-size-monitor-expand"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                </div>
                                <div class="chartjs-size-monitor-shrink"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                </div>
                            </div>
                            <canvas id="myChart4"
                                    style="display: block;" class="chartjs-render-monitor"></canvas>
                        </div>
                    </div>
                    <div class="card col-lg-6 col-md-12 col-12 col-sm-12">
                        <div class="card-header">
                            <h4>수리내역 TOP 5</h4>
                        </div>
                        <div class="card-body">
                            <div class="chartjs-size-monitor"
                                 style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                <div class="chartjs-size-monitor-expand"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                </div>
                                <div class="chartjs-size-monitor-shrink"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                </div>
                            </div>
                            <canvas id="myChart5"
                                    style="display: block;"class="chartjs-render-monitor"></canvas>
                        </div>
                    </div>
                    <%--<div class="card col-lg-12 col-md-12 col-12 col-sm-12">
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
                    </div>--%>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">
                <div class="section-header col-lg-12 col-md-12 col-12 col-sm-12">
                    <h1>AS</h1>
                </div>
                <div class="card card-statistic-2">
                    <div class="card-stats">
                        <div class="card-stats-title">단말기 모델별 추이</div>
                        <div class="row m-0-auto" id="usageASCount">
                        </div>
                    </div>
                    <div class="card-icon shadow-primary bg-primary">
                        <i class="fas fa-archive" style="line-height: 50px !important;"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>누적 접수 건수</h4>
                        </div>
                        <div class="card-body" id="usageASTotalCount">
                        </div>
                    </div>
                </div>
                <div class="row m-0">
                    <div class="card col-lg-12 col-md-12 col-12 col-sm-12">
                        <div class="card-header">
                            <h4>최신 TOP 5</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled list-unstyled-border" id="as-recent-top5">

                            </ul>
                            <div class="text-center pt-1 pb-1">
                                <a href="/aslist" class="btn btn-primary btn-lg btn-round">
                                    단말기 AS 접수내역
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
