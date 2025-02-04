<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>redirect2</title>
</head>
<body>
	<h3>리다이렉트 페이지 #2</h3>
	<%
		response.sendRedirect("https://naver.com");
	%>
</body>
</html>