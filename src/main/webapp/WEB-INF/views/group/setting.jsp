<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
          name="viewport">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/fancyTable.js"></script>
    <title></title>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>그룹별 쿠폰 설정 관리
                <i class="fas fa-question-circle title-i-line-height text-primary"
                   data-toggle="tooltip" title=""
                   data-original-title="쿠폰 & 포인트와 관련된 기본 설정을 관리"></i>
            </h1>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-header" id="custom-card-header">
                            <h6 class="mt-3">조회결과 <span class="text-muted">( <fmt:formatNumber
                                    value="${searchCount}"
                                    pattern="#,###"/> 건 )</span>
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-md fancy-table">
                                    <thead>
                                    <tr>
                                        <th>그룹명</th>
                                        <th class="text-center">유효기간</th>
                                        <th class="text-center">쿠폰 고정금액</th>
                                        <th class="text-center">발권한도(잔여/최대)</th>
                                        <%--<th class="text-center">그룹번호</th>--%>
                                        <%--<th>UBCn담당자</th>--%>
                                        <th class="text-center">등록일</th>
                                        <th class="text-center">수정일</th>
                                        <th class="text-center">부가기능</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="groupList" items="${groupList}">
                                        <tr onclick="location.href='/group/settingInfo?paramGroupSeq=${groupList.groupSeq}'">
                                            <td><span
                                                    class="btn btn-primary">${groupList.groupName}</span>
                                            </td>
                                            <td class="text-center"><fmt:formatNumber
                                                    value="${groupList.useDay}" pattern="#,###"/>일
                                            </td>
                                            <td class="text-center"><fmt:formatNumber
                                                    value="${groupList.fixAmount}"
                                                    pattern="#,###"/></td>
                                            <td class="text-center">
                                                <fmt:formatNumber
                                                        value="${groupList.mainCompCnt - groupList.usedCount}"
                                                        pattern="#,###"/> /
                                                <fmt:formatNumber value="${groupList.mainCompCnt}"
                                                                  pattern="#,###"/>
                                            </td>
                                                <%--<td class="text-center">${groupList.groupSeq}</td>--%>
                                                <%--<td>${groupList.adminId}</td>--%>
                                            <td class="text-center">${groupList.regDate}</td>
                                            <td class="text-center">
                                                <c:if test="${groupList.modDate == null}">-</c:if>${groupList.modDate}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
  $(".fancy-table").fancyTable({
    sortColumn: 10, // column number for initial sorting
    sortOrder: 'descending', // 'desc', 'descending', 'asc', 'ascending', -1 (descending) and 1 (ascending)
    sortable: true,
    pagination: true, // default: false
    searchable: true,
    globalSearch: true,
    globalSearchExcludeColumns: [0, 20] // exclude column 2 & 5
  });
</script>
</body>
</html>
