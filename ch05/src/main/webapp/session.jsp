<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>session</title>
</head>
<body>
	<h3>2.세션</h3>
	
	<h4>세션 로그인 실습</h4>
	<form action="./proc2/loginsession.jsp" method="post">
		<input type="text" name="uid" placeholder="아이디 입력"><br>
		<input type="password" name="pass" placeholder="비밀번호 입력"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>