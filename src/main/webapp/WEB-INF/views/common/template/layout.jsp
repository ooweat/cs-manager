<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
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
	<link rel="stylesheet" href="/assets/css/daterangepicker.css">

	<!-- CSS Libraries -->
	<!-- Template CSS -->
	<link rel="stylesheet" href="/assets/css/style.css">
	<link rel="stylesheet" href="/assets/css/custom.css">
	<link rel="stylesheet" href="/assets/css/components.css">
</head>
<body>
	<div id="app">
		<div class="main-wrapper">
			<!-- main layout -->
			<!-- side_menu -->
			<tiles:insertAttribute name="static"/>
			<!-- content -->
			<tiles:insertAttribute name="content"/>
			<!-- footer  -->
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
	<!-- General JS Scripts -->
	<%--<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>--%>
	<script type="text/javascript" src="/assets/js/jquery.js"></script>
	<script type="text/javascript" src="/assets/js/cleave.min.js"></script>
	<script type="text/javascript" src="/assets/js/popper.min.js"></script>
	<script type="text/javascript" src="/assets/js/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment-with-locales.js"></script>
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
	<script type="text/javascript" src="/assets/js/bootstrap-modal.js"></script>
	<script type="text/javascript" src="/assets/js/features-posts.js"></script>
	<script type="text/javascript" src="/assets/js/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" src="/assets/js/chart.min.js" type="text/javascript"></script>
	<%--<script type="text/javascript" src="/assets/js/dropzone.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="/assets/js/components-multiple-upload.js" type="text/javascript"></script>--%>
	<script type="text/javascript" src="/assets/js/custom.js" type="text/javascript"></script>
	<script type="text/javascript" src="/assets/js/toast.js" type="text/javascript"></script>
</body>
</html>
