<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>권한없음</title>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="/assets/js/sweetalert2.all.min.js"></script>

</head>
<body>
	<script type="text/javascript">
		Swal.fire({
			title: '<strong>권한없음</strong>',
			icon: 'info',
			html: '권한이 없습니다.',
			showCloseButton: true,
			showCancelButton: false,
			focusConfirm: false,
			confirmButtonText: '확인',
			confirmButtonAriaLabel: 'Thumbs up, great!',
		})
		.then((click) => {

			<c:if test="${serviceType=='employee'}">
				$(location).attr("href","/dashboard.do");
			</c:if>
			<c:if test="${serviceType=='bingomu'}">
				$(location).attr("href","/support.do");
			</c:if>
		});
	</script>
</body>
</html>
