<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>로그아웃</title>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="/assets/js/jquery.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="/assets/js/sweetalert2.all.min.js"></script>

</head>
<body>
	<script type="text/javascript">
		Swal.fire({
			title: '<strong>로그아웃</strong>',
			icon: 'info',
			html: '로그아웃 되었습니다.',
			showCloseButton: true,
			showCancelButton: false,
			focusConfirm: false,
			confirmButtonText: '확인',
			confirmButtonAriaLabel: 'Thumbs up, great!',
		})
		.then((click) => {
			$(location).attr("href","/index.jsp");
		});
	</script>
	<c:remove var="user_id" scope="session"/>	<!-- 변수를 지워주는 remove -->
	<c:remove var="user_pw" scope="session"/>
</body>
</html>
