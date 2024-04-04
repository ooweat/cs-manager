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
        display: inline-block !important;
        position: relative;

      }
      .dp-contents {
        display: contents;
      }
    </style>
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/dashboard.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
<body onload="init('${member.companySeq}');">
<div class="main-content">
    <section class="section">
        <div class="row">
            <div class="col-lg-6 col-md-12 col-12 col-sm-12" id="leftCard">
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
                        <div class="card-body p-0 dp-contents">
                            <canvas id="myChart4"
                                    style="display: block;" class="chartjs-render-monitor"></canvas>
                        </div>
                        <div class="row" id="RT-top5"></div>
                    </div>
                    <div class="card col-lg-6 col-md-12 col-12 col-sm-12">
                        <div class="card-header">
                            <h4>수리내역 TOP 5</h4>
                        </div>
                        <div class="card-body p-0 dp-contents">
                            <canvas id="myChart5"
                                    style="display: block;"class="chartjs-render-monitor"></canvas>
                        </div>
                        <div class="row" id="RA-top5"></div>
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
                        <div class="card-stats-title">접수상태 추이</div>
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
