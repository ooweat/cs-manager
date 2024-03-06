<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/fancyTable.js"></script>
    <title></title>
    <script type="text/javascript">
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
            if(groupName.length<2){
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
                    alert('등록이 취소되었습니다.');
                    location.href("/");
                }
            });
        }
    </script>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-header">
            <h1>그룹사 관리
                <i class="fas fa-question-circle title-i-line-height text-primary"
                   data-toggle="tooltip" title=""
                   data-original-title="그룹명: 쿠폰 또는 포인트 사용 시 표기될 상호명"></i>
            </h1>
            <div class="row">
                <div class="col-12">
                    <div class="card mb-0">
                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#" onclick="insertGroup()">신규등록 <span
                                            class="badge badge-white">N</span></a>
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
                            <h6 class="mt-3">조회결과 <span class="text-muted">( <fmt:formatNumber value="${searchCount}"
                                                                                               pattern="#,###"/> 건 )</span>
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped table-md fancy-table">
                                    <thead>
                                    <tr>
                                        <th>그룹명</th>
                                        <th class="text-center">그룹번호</th>
                                        <%--<th>UBCn담당자</th>--%>
                                        <th class="text-center">등록일</th>
                                        <th class="text-center">수정일</th>
                                        <th class="text-center">부가기능</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="groupList" items="${groupList}">
                                        <tr onclick="location.href='/group/clientInfo?paramGroupSeq=${groupList.groupSeq}'">
                                        <%--<tr keys="" onclick="postParams('/group/clientInfo',
                                                params={paramGroupSeq : '${groupList.groupSeq}', paramGroupName : '${groupList.groupName}'});">--%>
                                            <td><span class="btn btn-primary">${groupList.groupName}</span></td>
                                            <td class="text-center">${groupList.groupSeq}</td>
                                            <%--<td>${groupList.adminId}</td>--%>
                                            <td class="text-center">${groupList.regDate}</td>
                                            <td class="text-center">
                                                <c:if test="${groupList.modDate == null}">-</c:if>${groupList.modDate}
                                            </td>
                                            <td class="text-center" onclick="postParams('/group/clientInfo',
                                                    params={paramGroupSeq : '${groupList.groupSeq}', paramGroupName : '${groupList.groupName}'});">
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
