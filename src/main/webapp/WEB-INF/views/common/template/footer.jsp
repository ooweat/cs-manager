<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script type="text/javascript">
	// function update_history(root){
	// 	url=root+"/updateHistory.do";
	// 	window.open(url,"","width=580,height=560, scrollbars=yes, resizable=yes, left=-900, top=300");
	// }
</script>
</head>
<body>
	<footer class="main-footer">
		<div class="footer-left">
			Copyright &copy;
		</div>
		<%--<div class="footer-right">
			<a href="#" onclick="update_history('')">Update History</a> v0.0.1
		</div>--%>
	</footer>
</body>
</html>
