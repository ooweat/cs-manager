<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<title>support</title>
	<!-- Toast Libraries 2021-04-05-->
	<link rel="stylesheet" href="/assets/css/iziToast.css">

	<!-- General CSS Files -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css" >
	<link rel="stylesheet" href="/assets/css/summernote.min.css">
	<link rel="stylesheet" href="/assets/css/fontawesome.min.css">
	<link rel="stylesheet" href="/assets/css/selectric.css">
	<link rel="stylesheet" href="/assets/css/select2.min.css">
	<link rel="stylesheet" href="/assets/css/dropzone.css">
	<link rel="stylesheet" href="/assets/css/navbar.css">
	<link rel="stylesheet" href="/assets/css/daterangepicker.css">

	<!-- CSS Libraries -->
	<!-- Template CSS -->
	<link rel="stylesheet" href="/assets/css/style.css">
	<link rel="stylesheet" href="/assets/css/custom.css">
	<link rel="stylesheet" href="/assets/css/components.css">
</head>
<body>
<tiles:insertAttribute name="content"/>
<div class="navigation">
	<ul class="bottom-nav">
		<li class="nav-item">
			<a class="nav-link" href="/qrcode.do" id="defaultActive1">
				<i class="far fa-user" style="margin-left:0px;"></i>
				<span>내정보</span>
				<div class="slider"></div>
			</a>
		</li>
		<li class="nav-item">
			<a href="/qrcode.do" class="nav-link" id="defaultActive2">
				<i class="fas fa-qrcode" style="margin-left:0px;"></i>
				<span>QR code</span>
				<div class="slider"></div>
			</a>
		</li>
		<li class="nav-item">
			<a href="/memberSales.do?regDate=${tMonth}" class="nav-link" id="defaultActive3">
				<i class="fas fa-shopping-cart" style="margin-left:0px;"></i>
				<span>거래내역</span>
				<div class="slider"></div>
			</a>
		</li>
		<li class="nav-item">
			<a href="/logout" class="nav-link text-danger">
				<i class="fas fa-sign-out-alt" style="margin-left: 0px;"></i>
				<span>로그아웃</span>
			</a>
		</li>
	</ul>
</div>
<%--<script type="text/javascript">
	//page init 시 초기 세팅을 강제화 하기 위해 선언
	$(function () {
		$(".bottom-nav li a").removeClass("active-icon");
		/*$("#defaultActive").addClass("active-icon");*/
	})
</script>--%>
<!-- General JS Scripts -->
<%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>--%>
<script type="text/javascript" src="/assets/js/jquery.js"></script>
<script type="text/javascript" src="/assets/js/cleave.min.js"></script>
<script type="text/javascript" src="/assets/js/popper.min.js"></script>
<script type="text/javascript" src="/assets/js/moment.min.js"></script>
<script type="text/javascript" src="/assets/js/daterangepicker.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript" src="/assets/js/stisla.js"></script>
<script type="text/javascript" src="/assets/js/cleave-phone.us.js"></script>
<script type="text/javascript" src="/assets/js/select2.full.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.selectric.min.js"></script>
<!-- Template JS File -->
<script type="text/javascript" src="/assets/js/iziToast.js"></script>
<script type="text/javascript" src="/assets/js/summernote.min.js"></script>
<script type="text/javascript" src="/assets/js/loadingoverlay.min.js"></script>

<script type="text/javascript" src="/assets/js/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="/assets/js/features-posts.js"></script>
<script type="text/javascript" src="/assets/js/scripts.js"></script>
<script type="text/javascript" src="/assets/js/chart.min.js"></script>
<script type="text/javascript" src="/assets/js/modules-chartjs.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="/assets/js/dropzone.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/assets/js/components-multiple-upload.js" type="text/javascript"></script>--%>
<script type="text/javascript" src="/assets/js/custom.js"></script>
<script type="text/javascript" src="/assets/js/navbar.js"></script>
<%--<script type="text/javascript" src="/assets/js/monthPicker.js"></script>--%>
<script type="text/javascript" src="/assets/js/toast.js"></script>
</body>
</html>
