<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>error</title>
</head>
<body>
	<h3>에러발생 페이지</h3>
	<%
		int num1 = 1;
		int num2 = 0;
		
		int result = num1 / num2;	
	%>
	<p>
		결과 : <%= result %>
	</p>
	
</body>
</html>