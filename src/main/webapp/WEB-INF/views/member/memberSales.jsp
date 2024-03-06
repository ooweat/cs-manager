<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/custom.js"></script>
    <title>로그인</title>
    <script type="text/javascript">
        function _handleSubmit(){
            $.ajax({
                type: "GET",
                url: "/memberSales.do",
                data: document.getElementById('formData').submit()
            });
        }

        function handler(){
            $(".bottom-nav li a").removeClass("active-icon");
            $('#defaultActive3').addClass('active-icon active');
        }
    </script>
</head>
<body onload="handler()">
<!-- Main Content -->
<div class="main-content p-4">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
                    <div class="card card-primary">
                        <div class="card-header">
                             <h4>거래내역</h4>
                        </div>
                        <div class="row h-10 width-100-per">
                            <div class="col-12 py-2" align="center">
                                <div class="col-12">
                                    <form id="formData" action="/memberSales.do" method="GET">
                                    <input type="month" id="searchDate" name="regDate" class="border-radius25 text-align-center month-year-input"
                                           min="2021-01" value="${regDate}"  onchange="_handleSubmit()">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card profile-widget">
                                <div class="profile-widget-description">
                                    <div class="summary">
                                        <div class="summary-item mt-0">
                                            <%--<h6>최근 적립목록 <span class="text-muted">(TOP 5)</span></h6>--%>
                                            <ul class="list-unstyled list-unstyled-border">
                                                <c:if test="${fn:length(searchList)>0}">
                                                    <c:forEach var="searchList" items="${searchList}">
                                                        <li class="media">
                                                            <div class="media-body">
                                                                <div class="media-right">
                                                                <c:choose>
                                                                    <%-- 승인되면 --%>
                                                                    <c:when test="${searchList.msgStep=='01'}">
                                                                        <span class="text-danger text-fw-bold">- ${searchList.tranAmt}</span>
                                                                        <span class="text-small text-danger text-fw-bold"> P</span>
                                                                    </c:when>
                                                                    <%-- 취소 되면 + --%>
                                                                    <c:when test="${searchList.msgStep=='02' || searchList.msgStep=='04'}">
                                                                        <span class="text-primary text-fw-bold">+ ${searchList.tranAmt}</span>
                                                                        <span class="text-small text-primary text-fw-bold"> P</span>
                                                                    </c:when>
                                                                </c:choose>
                                                                    <br>
                                                                        <c:choose>
                                                                            <%-- 승인되면 --%>
                                                                            <c:when test="${searchList.msgStep=='01'}">
                                                                                <span class="text-small text-danger text-fw-bold">결제</span>
                                                                            </c:when>
                                                                            <%-- 취소 되면 + --%>
                                                                            <c:when test="${searchList.msgStep=='02'}">
                                                                                <span class="text-small text-primary text-fw-bold">취소</span>
                                                                            </c:when>
                                                                            <c:when test="${searchList.msgStep=='04'}">
                                                                                <span class="text-small text-primary text-fw-bold">적립</span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </span>
                                                                 </div>
                                                                <div class="media-title">
                                                                    <a href="#">'${searchList.colNo}' 번 상품</a>
                                                                    <div class="text-muted text-small">
                                                                        <div class="bullet"></div>
                                                                        잔여 P <fmt:formatNumber value="${searchList.postPoint}" pattern="#,###" />
                                                                    </div>
                                                                </div>
                                                                <div class="text-muted text-small">
                                                                    <div class="bullet"></div>${searchList.regDate}
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${fn:length(searchList) == 0}">
                                                    <div>최근 적립 내용이 없습니다</div>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
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
