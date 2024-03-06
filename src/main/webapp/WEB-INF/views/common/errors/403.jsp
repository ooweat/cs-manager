<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>403 support</title>
<c:set var="root" value="${pageContext.request.contextPath }"/>
	<!-- General CSS Files -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css" >
	<link rel="stylesheet" href="/assets/css/fontawesome.min.css">
	<!-- CSS Libraries -->

	<!-- Template CSS -->
	<link rel="stylesheet" href="/assets/css/style.css">
	<link rel="stylesheet" href="/assets/css/components.css">
</head>
<body>
<div id="app">
	<section class="section">
		<div class="container mt-5">
			<div class="page-error">
				<div class="page-inner">
					<h1>403</h1>
					<div class="page-description">
						권한이 없는 페이지입니다.
					</div>
					<div class="page-search">
						<form>
							<div class="form-group floating-addon floating-addon-not-append">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-search"></i>
										</div>
									</div>
									<input type="text" class="form-control" placeholder="Search">
									<div class="input-group-append">
										<button class="btn btn-primary btn-lg">
											Search
										</button>
									</div>
								</div>
							</div>
						</form>
						<div class="mt-3">
							<a href="/sessionOut.do">Back to Login</a>
						</div>
					</div>
				</div>
			</div>
			<div class="simple-footer mt-5">
				Copyright &copy; UBCn 2021
			</div>
		</div>
	</section>
</div>

<!-- General JS Scripts -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/assets/js/popper.min.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript" src="/assets/js/stisla.js"></script>

<!-- JS Libraies -->

<!-- Template JS File -->
<script type="text/javascript" src="/assets/js/scripts.js"></script>
<script type="text/javascript" src="/assets/js/custom.js"></script>

<!-- Page Specific JS File -->
</body>
</html>
