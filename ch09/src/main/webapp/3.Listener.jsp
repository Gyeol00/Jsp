<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//현재 클라이언트 세션 username 가져오기
	String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3.Listener</title>
<!-- 
		날짜 : 2025/02/12
		이름 : 한결
		내용 : 9장 리스너 실습하기
	 -->
</head>
<body>
	<h3>3.리스너(Listener)</h3>

	<% if(username == null){ %>
	<h4>로그인</h4>
	<form action="/ch09/login.do" method="post">
		<input type="text" name="uid"><br> <input type="password"
			name="pass"><br> <input type="submit" value="로그인">
	</form>
	<% } else { %>
	<h4>로그인 성공</h4>
	<p>
		<%= username %>님 반갑습니다.<br> <a href="/ch09/logout.do">로그아웃</a>
	</p>
	<% } %>
</body>
</html>