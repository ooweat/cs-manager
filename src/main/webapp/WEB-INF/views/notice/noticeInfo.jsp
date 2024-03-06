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
        <c:if test="${role == 'system'}">
        </c:if>
            <c:choose>
                <c:when test="${role == 'system'}">
                    <div class="col-6"></div>
                </c:when>
                <c:otherwise>
                    <div class="col-8"></div>
                </c:otherwise>
            </c:choose>

            <div class="card profile-widget">
                <div class="profile-widget-header">
                    <img alt="image" src="/assets/img/ubcn_alert.png" class="rounded-circle profile-widget-picture">
                    <div class="profile-widget-items">
                        <div class="profile-widget-item">
                            <div class="profile-widget-item-label">현재 등록된 공지사항</div>
                            <div class="profile-widget-item-value">${searchInfo.noticeTitle}</div>
                        </div>
                        <div class="profile-widget-item">
                            <div class="profile-widget-item-label">그룹</div>
                            <div class="profile-widget-item-value">${searchInfo.groupName}</div>
                        </div>
                        <div class="profile-widget-item">
                            <div class="profile-widget-item-label">분류</div>
                            <div class="profile-widget-item-value">${searchInfo.noticeType}</div>
                        </div>
                    </div>
                </div>
                <div class="profile-widget-description">
                    <div class="card">
                        <div class="card-header">
                            <h4>[${searchInfo.noticeType}] ${searchInfo.noticeTitle}</h4>
                            <div class="text-muted d-inline font-weight-normal">
                                <div class="slash"></div> ( 공지기간 : ${searchInfo.regDate} ~ ${searchInfo.expiryDate} )
                            </div>
                        </div>
                        <div class="card-body">
                            ${searchInfo.noticeContent}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- 시스템계정만 볼 수 있음 --%>
        <c:if test="${role == 'system'}">
        <div class="col-6">
            <div class="card card-primary">
                <div class="card-header"><h4>공지사항 상세정보</h4></div>
                <div class="card-body">
                    <form role="form" method="POST" name="formData" id="formData" class="needs-validation" novalidate=""
                          action="/notice/noticeModify.do">
                        <div class="row">
                            <div class="form-group col-6">
                                <label for="groupSeq">그룹등록</label>
                                <select id="groupSeq" name="groupSeq"
                                        class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">>
                                    <option value="" selected>-그룹선택-</option>
                                    <c:forEach var="getGroupList" items="${getGroupList}">
                                        <option value="${getGroupList.groupSeq}" <c:if test="${getGroupList.groupSeq==searchInfo.groupSeq}">selected</c:if>>
                                                ${getGroupList.groupName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-3">
                                <label for="typeOption">분류</label>
                                <select id="typeOption"
                                        class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">>
                                    <option value="공지사항" <c:if test="${searchInfo.noticeType=='공지사항'}">selected</c:if>>
                                        공지사항</option>
                                    <option value="이벤트" <c:if test="${searchInfo.noticeType=='이벤트'}">selected</c:if>>
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
                                           value="${searchInfo.regDate}" readonly="readonly" placeholder="시작일자">
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
                                           value="${searchInfo.expiryDate}" readonly="readonly" placeholder="종료일자">
                                </div>
                            </div>


                            <div class="form-group col-6">
                                <label class="form-label">사용구분</label>
                                <div class="selectgroup w-100">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="useYN" value="Y" class="selectgroup-input"
                                               <c:if test="${searchInfo.useYN=='Y'}">checked="checked"</c:if>>
                                        <span class="selectgroup-button">사용</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="useYN" value="N" class="selectgroup-input"
                                               <c:if test="${searchInfo.useYN=='N'}">checked="checked"</c:if>>
                                        <span class="selectgroup-button">미사용</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-12">
                                <label for="noticeTitle">제목</label>
                                <input id="noticeTitle" type="text" class="form-control" name="noticeTitle"
                                       value="${searchInfo.noticeTitle}" placeholder="제목 입력" required="" autofocus="">
                                <div class="invalid-feedback">
                                    내용을 입력해주세요!
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-12">
                                <label for="noticeContent">내용</label>
                                <textarea id="noticeContent" class="summernote-simple" style="display: none;" name="noticeContent">
                                    ${searchInfo.noticeContent}
                                </textarea>
                            </div>
                        </div>
                        <input type="hidden" name="noticeSeq" value="${searchInfo.noticeSeq}"/>
                        <input type="hidden" name="page" value="noticeModify"/>
                        <div class="row">
                            <div class="form-group col-6">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">
                                    수정
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
        </c:if>
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
    $('#summernote').summernote({
        height: 300,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",					// 한글 설정
        placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files) {
                uploadSummernoteImageFile(files[0],this);
            },
            onPaste: function (e) {
                var clipboardData = e.originalEvent.clipboardData;
                if (clipboardData && clipboardData.items && clipboardData.items.length) {
                    var item = clipboardData.items[0];
                    if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                        e.preventDefault();
                    }
                }
            }
        }
    });
</script>
</body>
</html>
