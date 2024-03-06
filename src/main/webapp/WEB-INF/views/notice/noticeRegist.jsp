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
    <title></title>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <div class="row">
        <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
            <div class="card card-primary">
                <div class="card-header"><h4>공지사항 등록</h4></div>
                <div class="card-body">
                    <form role="form" method="POST" name="formData" id="formData" class="needs-validation" novalidate=""
                          action="/notice/noticeInsert.do">
                        <div class="row">
                            <div class="form-group col-6">
                                <label for="paramGroupSeq">그룹등록</label>
                                <select id="paramGroupSeq" name="paramGroupSeq"
                                        class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">>
                                    <c:if test="${role =='system'}">
                                        <option value="0" selected>-전체-</option>
                                        <c:forEach var="getGroupList" items="${getGroupList}">
                                            <option value="${getGroupList.groupSeq}"
                                                    <c:if test="${hmap.paramGroupSeq != null ?
                                                                    getGroupList.groupSeq==hmap.paramGroupSeq : getGroupList.groupSeq==0}">selected</c:if>
                                            >
                                                    ${getGroupList.groupName}
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${role !='system'}">
                                        <c:forEach var="getGroupList" items="${getGroupList}">
                                            <option value="${getGroupList.groupSeq}" <c:if test="${getGroupList.groupSeq==hmap.paramGroupSeq}">selected</c:if>>
                                                    ${getGroupList.groupName}
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                            <div class="form-group col-3">
                                <label for="typeOption">분류</label>
                                <select id="typeOption"
                                        class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">>
                                    <option value="공지사항" selected>
                                        공지사항</option>
                                    <option value="이벤트">
                                        이벤트</option>
                                    <option value="1">
                                        직접입력</option>
                                </select>
                            </div>
                            <div class="form-group col-3">
                                <label for="noticeType">분류타이틀</label>
                                <input id="noticeType" type="text" name="noticeType" class="form-control" required="" autofocus=""
                                       readonly="readonly">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-3">
                                <label for="regDate">공지 시작기간</label>
                                <div class="input-group daterange-btn form-inline">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fas fa-calendar"></i>
                                        </div>
                                    </div>
                                    <input type="text" id="regDate" name="regDate" class="form-control daterange-sdate"
                                           value="${today}" readonly="readonly" placeholder="시작일자">
                                </div>
                            </div>
                            <div class="form-group col-3">
                                <label for="expiryDate">공지 만료기간</label>
                                <div class="input-group daterange-btn form-inline">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fas fa-calendar"></i>
                                        </div>
                                    </div>
                                    <input type="text" id="expiryDate" name="expiryDate" class="form-control daterange-edate"
                                           value="" readonly="readonly" placeholder="종료일자">
                                </div>
                            </div>


                            <div class="form-group col-6">
                                <label class="form-label">사용구분</label>
                                <div class="selectgroup w-100">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="useYN" value="Y" class="selectgroup-input"
                                               checked="checked">
                                        <span class="selectgroup-button">사용</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="useYN" value="N" class="selectgroup-input">
                                        <span class="selectgroup-button">미사용</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-12">
                                <label for="noticeTitle">제목</label>
                                <input id="noticeTitle" type="text" class="form-control" name="noticeTitle"
                                       placeholder="제목 입력" required="" autofocus="" maxlength="25">
                                <div class="invalid-feedback">
                                    25자 이내로 입력해주세요!
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-12">
                                <label for="noticeContent">내용</label>
                                <textarea id="noticeContent" class="summernote-simple" style="display: none;" name="noticeContent"></textarea>
                            </div>
                        </div>
                        <input type="hidden" name="page" value="noticeInsert"/>
                        <div class="row">
                            <div class="form-group col-6">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">
                                    등록
                                </button>
                            </div>
                            <div class="form-group col-6">
                                <button type="button" onclick="location.href='/notice/notice.do'"
                                        class="btn btn-secondary btn-lg btn-block">
                                    목록
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var now = new Date();
        var firstDate = new Date(now.getFullYear(), now.getMonth(), 1);
        var lastDate = new Date(now.getFullYear(), now.getMonth()+1, 0);

        //scriptDateFormat
        $('#regDate').val(scriptDateFormat(firstDate));
        $('#expiryDate').val(scriptDateFormat(lastDate));

        $('#noticeType').val($('#typeOption').val());
        $('#typeOption').change(function () {
            if ($(this).val() == "1") {
                $('#noticeType').val("");
                $("#noticeType").attr("readonly", false);
            } else {
                $('#noticeType').val($(this).val());
                $("#noticeType").attr("readonly", true);
            }
        });
    });
</script>
</body>
</html>
