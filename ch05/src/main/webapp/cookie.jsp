<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookie</title>
	<!-- 
		날짜 : 2025/02/05
		이름 : 한결
		내용 : 5장 JSP 쿠키세션 실습
	 -->
</head>
<body>
	<h3>1. 쿠키</h3>
	
	<h4>1. 쿠키 로그인 실습</h4>
	
	<!-- 개인정보가 있기 때문에 method는 post -->
	<form action="./proc/createcookie.jsp" method="post">
		<input type="text" name="uid" placeholder="아이디 입력"><br>
		<input type="password" name="pass" placeholder="비밀번호 입력"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>