<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
	<title>세션만료</title>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="/assets/js/sweetalert2.all.min.js"></script>

</head>
<body>
	<script type="text/javascript">
		Swal.fire({
			title: '<strong>계정정보 오류</strong>',
			icon: 'info',
			html: '계정정보가 존재하지 않습니다.',
			showCloseButton: true,
			showCancelButton: false,
			focusConfirm: false,
			confirmButtonText: '확인',
			confirmButtonAriaLabel: 'Thumbs up, great!',
		})
				.then((click) => {
					$(location).attr("href","/login.do");
				});
	</script>
</body>
</html>
