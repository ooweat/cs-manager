<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--<meta charset="UTF-8">--%>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
          name="viewport">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <title>Static Page</title>
    <script type="text/javascript">
      $(function () {
        if ('${member}' == null || '${member}' == '') {
          alert("세션이 만료되었습니다. \n" +
              "재로그인이 필요하여 로그인 페이지로 이동합니다.")
          window.location.assign('/login');
        }
      });
    </script>
</head>
<body <%--class="sidebar-mini"--%>>
<%--Header--%>
<div class="common-header">
    <div class="navbar-bg"></div>
    <nav class="navbar navbar-expand-lg main-navbar">
        <div class="form-inline mr-auto">
            <ul class="navbar-nav mr-3">
                <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i
                        class="fas fa-bars"></i></a></li>
            </ul>
        </div>
        <ul class="navbar-nav navbar-right">
            <li class="dropdown"><a href="#" data-toggle="dropdown"
                                    class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                <div class="d-sm-none d-lg-inline-block" id="user_info">
                    <i class="fa-sharp fa-solid fa-shop"></i> ${member.userName}[${member.userId}]
                </div>
            </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <c:if test="${userType != null}">
                        <div class="dropdown-title">설정정보</div>
                        <a href="#" onclick="postParams('/employee/management/company/companyInfo',
                                params={paramSeq : ${seq}, page : 'companyInfo'});"
                           class="dropdown-item has-icon">
                            <i class="far fa-user" style="float:none"></i> 계정정보수정
                        </a>
                    </c:if>
                    <a href="#" class="dropdown-item has-icon">
                        <i class="fas fa-user" style="float:none"></i>ID: ${member.userId}
                    </a>
                    <a href="#" class="dropdown-item has-icon">
                        <i class="fas fa-id-card" style="float:none"></i>권한: ${member.userLevel}
                    </a>
                    <a href="#" class="dropdown-item has-icon">
                        <i class="fas fa-id-card" style="float:none"></i>파트너: ${member.companySeq}
                    </a>
                    <%--<div class="dropdown-divider"></div>--%>
                    <a href="/logout" class="dropdown-item has-icon text-danger">
                        <i class="fas fa-sign-out-alt" style="float:none"></i> Logout
                    </a>
                </div>
            </li>
        </ul>
    </nav>
    <%--Sidebar--%>
    <div class="main-sidebar">
        <aside id="sidebar-wrapper">
            <div class="sidebar-brand">
                <a href="#">SUPPORT</a>
            </div>
            <div class="sidebar-brand sidebar-brand-sm">
                <a href="#">SP</a>
            </div>
            <ul class="sidebar-menu">
                <li class="menu-header">고객지원 서비스</li>
                <li class="nav-item"><a class="nav-link" href="/dashboard">
                    <i class="far fa-clipboard"></i> <span>Dashboard(샘플)</span></a></li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link text-decoration-trash"
                       onclick="alert('이관 준비 중인 서비스입니다.');">
                        <i class="fas fa-tools"></i>
                        <span>AS 접수내역</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a href="/repairs" class="nav-link">
                        <i class="fas fa-toolbox"></i>
                        <span>단말기 이력관리</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a href="/settings" class="nav-link">
                        <i class="fas fa-cog"></i>
                        <span>설정</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link text-decoration-trash"
                       onclick="alert('이관 준비 중인 서비스입니다.');">
                        <i class="fas fa-user"></i>
                        <span>사용자 관리</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link has-dropdown text-decoration-trash"
                       data-toggle="dropdown" onclick="alert('이관 준비 중인 서비스입니다.');">
                        <i class="fas fa-toolbox"></i>
                        <span>공지사항(샘플)</span></a>
                    <ul class="dropdown-menu" style="display: none;">
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link has-dropdown text-decoration-trash"
                       data-toggle="dropdown" onclick="alert('이관 준비 중인 서비스입니다.');">
                        <i class="fas fa-toolbox"></i>
                        <span>HCE인증관리(샘플)</span></a>
                    <ul class="dropdown-menu" style="display: none;">
                    </ul>
                </li>
            </ul>

            <div class="mt-4 mb-4 p-3 hide-sidebar-mini">
                <a href="/logout" class="btn btn-danger btn-lg btn-block btn-icon-split">
                    <i class="fas fa-sign-out-alt"></i>Logout
                </a>
            </div>
        </aside>
    </div>
</div>
</body>
</html>
