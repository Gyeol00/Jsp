<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2.includeTag</title>
	<!-- 
		날짜 : 2025/02/05
		이름 : 한결
		내용 : 4장 JSP 액션태그 실습
	 -->
</head>
<body>
	<h3>2.include 액션태그</h3>
	
	<h4>include 지시자</h4>
	<!-- 정적타임에 삽입 -->
	<%@ include file="./inc/_header.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>
	
	<h4>include 메서드</h4>
	<%
		// 런타임에 삽입
		pageContext.include("./inc/_header.jsp");
		pageContext.include("./inc/_footer.jsp");
	%>
	
	<h4>include 액션태그</h4>
	<!-- 런타임에 삽입 -->
	<jsp:include page="./inc/_header.jsp"></jsp:include>
	<jsp:include page="./inc/_footer.jsp"></jsp:include>

</body>
</html>