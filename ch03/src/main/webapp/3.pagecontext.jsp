<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.pageContext</title>
	<!-- 
		날짜 : 2025/02/04
		이름 : 한결
		내용 : JSP 내장객체 pageContext 실습하기
	-->
</head>
<body>
	<h3>3.pageContext 내장 객체</h3>
	
	<h4>forward</h4>
	<a href="./proc/forward1.jsp">포워드 페이지 요청 #1</a><br>
	<a href="./proc/forward2.jsp">포워드 페이지 요청 #2</a><br>
	
	<h4>include</h4>
	<%
		pageContext.include("./inc/_header.jsp");
		pageContext.include("./inc/_footer.jsp");
	%>
	
	<h4>include 지시자</h4>
	<%@ include file="./inc/_header.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>
</body>
</html>