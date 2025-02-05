<%@page import="entity.User"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 클라이언트 사용자객체 세션에서 가져오기
	User user = (User) session.getAttribute("username");

	if(user == null) {
		
		// 로그인하지 않고 해당 페이지를 요청할 경우
		response.sendRedirect("../session.jsp?code=102");
		return; // 처리 종료
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginSuccess</title>
</head>
<body>
	<h3>로그인 성공</h3>
	
	<p>
		<%= user.getName() %>님 반갑습니다.
	</p>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>