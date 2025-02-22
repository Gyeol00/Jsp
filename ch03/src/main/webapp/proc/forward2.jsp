<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forward2</title>
</head>
<body>
	<h3>포워드 페이지 #2</h3>
	<%
		// forward는 서버 자원내에서 제어권 이동이기 떄문에 원격지 외부 서버 자원으로 이동 불가
		// 다른 JSP페이지나 서블릿 등 서버 내 자원으로 이동만 가능
		pageContext.forward("https://naver.com");
	%>
</body>
</html>