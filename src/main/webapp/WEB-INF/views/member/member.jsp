<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/fancyTable.js"></script>
    <title>VendingMachine</title>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>계정 관리</h1>
            <div class="row">
                <div class="col-12">
                    <div class="card mb-0">
                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <%--<a class="nav-link active" href="/member/memberRegist.do">신규등록 <span class="badge badge-white">N</span></a>--%>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-header" id="custom-card-header">
                            <h6 class="mt-3">조회결과 <span class="text-muted">( <fmt:formatNumber value="${searchCount}" pattern="#,###" /> 건 )</span></h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-md fancy-table">
                                    <thead>
                                        <tr>
                                            <th>멤버십 ID</th>
                                            <th>사용자명</th>
                                            <th>사용자 ID</th>
                                            <th>잔여 포인트</th>
                                            <th>부가기능</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="searchList" items="${searchList}">
                                        <tr onclick="postParams('/user/userInfo.do',
                                                params={paramSeq : ${searchList.memberSeq}, page : 'userInfo'});">
<%--                                            <td><span class="btn btn-primary">${searchList.groupName}</span></td>--%>
                                            <td><span id="groupName" class="btn btn-primary">${searchList.memberId}</span></td>
                                            <td>${searchList.memberName}</td>
                                            <td>${searchList.loginId}</td>
                                            <td>
                                                <fmt:formatNumber value="${searchList.vm}" pattern="#,###" /> P
                                            </td>
                                            <td onclick="postParams('/user/userInfo.do',
                                                params={paramSeq : ${searchList.memberSeq}, page : 'userInfo'});">
                                                <a href="#" class="btn btn-primary"><span>관리</span></a>
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
        sortColumn:10, // column number for initial sorting
        sortOrder: 'descending', // 'desc', 'descending', 'asc', 'ascending', -1 (descending) and 1 (ascending)
        sortable: true,
        pagination: true, // default: false
        searchable: true,
        globalSearch: true,
        globalSearchExcludeColumns: [0,20] // exclude column 2 & 5
    });
</script>
</body>
</html>
