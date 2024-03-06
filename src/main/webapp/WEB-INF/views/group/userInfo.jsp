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
    <script type="text/javascript" src="/static/assets/js/jquery.js"></script>
    <title></title>
    <script type="text/javascript">
      function confirmUserPost(action) {
        if ($('#userId').val() == "" || $('#userId').val().length < 3) {
          alert("3 글자 이상의 아이디를 입력해주세요.");
          $('#userId').focus();
          return;
        }

        if ($('#userName').val() == "" || $('#userName').val().length < 3) {
          alert("3글자 이상의 사용자명을 입력해주세요.");
          $('#userName').focus();
          return;
        }
        
        $('#useDashboard').val($('#useDashboard:checked').length > 0 ? "Y" : "N");
        $('#useCouponPublish').val($('#useCouponPublish:checked').length > 0 ? "Y" : "N");
        $('#useCouponConfig').val($('#useCouponConfig:checked').length > 0 ? "Y" : "N");
        $('#useCouponIssuanceHistory').val($('#useCouponIssuanceHistory:checked').length > 0 ? "Y" : "N");
        $('#useCouponSalesHistory').val($('#useCouponSalesHistory:checked').length > 0 ? "Y" : "N");

        $.ajax({
          cache: false,
          url: action,
          type: 'POST',
          data: $("#formData").serialize(),
          success: function () {
            Swal.fire({
              title: '<strong>완료</strong>',
              icon: 'success',
              html: '완료되었습니다.',
              showCloseButton: true,
              showCancelButton: false,
              focusConfirm: false,
              confirmButtonText: '확인',
              confirmButtonAriaLabel: 'Thumbs up, great!',
            }).then((click) => {
              window.location.reload();
            });
          }, // success
          error: function () {
            alert("최소 하나 이상의 정보가 필요합니다.");
          }
        });
      }
    </script>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <div class="row">
        <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-4 offset-xl-4">
            <div class="card card-primary">
                <div class="card-header"><h4>계정 수정</h4></div>
                <div class="card-body">
                    <form role="form" method="POST" name="formData" id="formData"
                          class="needs-validation was-validated"
                          novalidate="">
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label for="userId">아이디</label>
                                <input id="userId" type="text" class="form-control" name="userId"
                                       value="${userInfo.userId}" required="" autofocus="">
                                <div class="invalid-feedback">
                                    3글자 이상의 아이디를 입력해주세요!
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label for="userPw">비밀번호</label>
                                <input id="userPw" type="password" class="form-control"
                                       name="userPw"
                                       value="${userInfo.userPw}" required="" autofocus="">
                                <div class="invalid-feedback">
                                    내용을 입력해주세요!
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label for="userName">사용자명</label>
                                <input id="userName" type="text" class="form-control"
                                       name="userName"
                                       value="${userInfo.userName}" required="" autofocus="">
                                <div class="invalid-feedback">
                                    3글자 이상의 사용자명을 입력해주세요.
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <c:if test="${userInfo.role != 'system'}">
                                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                    <label for="groupSeq">그룹등록</label>
                                    <select id="groupSeq" name="groupSeq"
                                            class="form-control select2 select2-hidden-accessible"
                                            tabindex="-1"
                                            aria-hidden="true">>
                                        <c:forEach var="getGroupList" items="${getGroupList}">
                                            <option
                                                    value="${getGroupList.groupSeq}"
                                                    <c:if test="${getGroupList.groupSeq == userInfo.groupSeq}">selected</c:if>
                                            >${getGroupList.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </c:if>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label for="role">권한</label>
                                <select id="role" name="role"
                                        class="form-control select2 select2-hidden-accessible"
                                        tabindex="-1"
                                        aria-hidden="true">
                                    <option value="system"
                                            <c:if test="${userInfo.role == 'system'}">selected</c:if>>
                                        시스템계정(UBCn)
                                    </option>
                                    <%-- 필요없는 기능으로 보류 2023.01.26 twkim--%>
                                    <%--<option value="admin" <c:if test="${userInfo.role == 'admin'}">selected</c:if>>
                                        가맹관리자
                                    </option>--%>
                                    <option value="merchant"
                                            <c:if test="${userInfo.role == 'merchant'}">selected</c:if>>
                                        가맹점(운영자)
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label for="pageAuth">페이지</label>
                                <div class="selectgroup selectgroup-pills" id="pageAuth">
                                    <label class="selectgroup-item">
                                        <input type="checkbox" name="useDashboard" id="useDashboard"
                                               class="selectgroup-input"
                                               <c:if test="${userInfo.useDashboard eq 'Y'.charAt(0)}">checked</c:if>>
                                        <span class="selectgroup-button">Dashboard</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="checkbox" name="useCouponPublish"
                                               id="useCouponPublish" class="selectgroup-input"
                                               <c:if test="${userInfo.useCouponPublish eq 'Y'.charAt(0)}">checked</c:if>>
                                        <span class="selectgroup-button">쿠폰발권</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="checkbox" name="useCouponConfig"
                                               id="useCouponConfig" class="selectgroup-input"
                                               <c:if test="${userInfo.useCouponConfig eq 'Y'.charAt(0)}">checked</c:if>>
                                        <span class="selectgroup-button">쿠폰설정</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="checkbox" name="useCouponIssuanceHistory"
                                               id="useCouponIssuanceHistory"
                                               class="selectgroup-input"
                                               <c:if test="${userInfo.useCouponIssuanceHistory eq 'Y'.charAt(0)}">checked</c:if>>
                                        <span class="selectgroup-button">쿠폰발권내역</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="checkbox" name="useCouponSalesHistory"
                                               id="useCouponSalesHistory" class="selectgroup-input"
                                               <c:if test="${userInfo.useCouponSalesHistory eq 'Y'.charAt(0)}">checked</c:if>>
                                        <span class="selectgroup-button">쿠폰사용내역</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-divider">
                            부가정보
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label for="regDate">생성일자</label>
                                <input id="regDate" type="text" value="${userInfo.regDate}"
                                       class="form-control"
                                       readonly="readonly">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label for="modDate">수정일자</label>
                                <input id="modDate" type="text" value="${userInfo.modDate}"
                                       class="form-control"
                                       readonly="readonly">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                <label class="form-label">사용구분</label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="useYN" value="Y"
                                           class="selectgroup-input"
                                           <c:if test="${userInfo.useYN == 'Y'}">checked</c:if>
                                    >
                                    <span class="selectgroup-button selectgroup-button-icon">사용</span>
                                </label>
                                <label class="selectgroup-item">
                                    <input type="radio" name="useYN" value="N"
                                           class="selectgroup-input"
                                           <c:if test="${userInfo.useYN == 'N'}">checked</c:if>
                                    >
                                    <span class="selectgroup-button selectgroup-button-icon">미사용</span>
                                </label>
                                <%--<div class="selectgroup w-100">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="useYN" value="Y" class="selectgroup-input"
                                               checked="checked">
                                        <span class="selectgroup-button">사용</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="useYN" value="N" class="selectgroup-input">
                                        <span class="selectgroup-button">미사용</span>
                                    </label>
                                </div>--%>
                            </div>
                        </div>
                        <input type="hidden" name="userSeq" value="${userInfo.userSeq}"/>
                        <input type="hidden" name="modAdminId" value="${userId}"/>
                        <div class="row">
                            <div class="form-group col-6">
                                <button type="button"
                                        onclick="confirmUserPost('/ajax/updateUser');"
                                        class="btn btn-primary btn-lg btn-block">
                                    수정
                                </button>
                            </div>
                            <div class="form-group col-6">
                                <button type="button" onclick="location.href='/group/user'"
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
</body>
</html>
