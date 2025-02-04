<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신처리
	String query = request.getQueryString();
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>result1</title>
</head>
<body>
	<h3>request 데이터 수신</h3>
	<p>
		쿼리스트링 : <%= query %><br>
		아이디 : <%= uid %><br>
		이름 : <%= name %><br>
		나이 : <%= age %><br>	
	</p>
	
	<a href="../1.request.jsp">뒤로가기</a>
</body>
</html>