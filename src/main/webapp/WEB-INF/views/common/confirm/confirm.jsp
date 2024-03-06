<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>컨펌</title>
    <c:set var="root" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="/assets/js/sweetalert2.all.min.js"></script>
</head>
<body>
<c:choose>
    <c:when test="${confirm=='0'}">
        <script type="text/javascript">
            Swal.fire({
                title: '<strong>실패</strong>',
                icon: 'error',
                html: '등록오류 발생!',
                showCloseButton: true,
                showCancelButton: false,
                focusConfirm: false,
                confirmButtonText: '확인',
                confirmButtonAriaLabel: 'Thumbs up, great!',
            }).then((click) => {
                    $(location).attr("href","/${returnPage}.do");
            });
        </script>
    </c:when>
    <c:otherwise>
        <script type="text/javascript">
            Swal.fire({
                title: '<strong>완료</strong>',
                icon: 'success',
                html: '등록이 완료되었습니다.',
                showCloseButton: true,
                showCancelButton: false,
                focusConfirm: false,
                confirmButtonText: '확인',
                confirmButtonAriaLabel: 'Thumbs up, great!',
            })
                .then((click) => {
                    $(location).attr("href","/${returnPage}.do");
                });
        </script>
    </c:otherwise>
</c:choose>
</body>
</html>
