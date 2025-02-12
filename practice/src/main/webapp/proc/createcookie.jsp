<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>createcookie 연습</title>
</head>
<body>
	<h3>쿠키 생성 연습</h3>
	<%
		// 데이터 수신
		String uid = request.getParameter("uid");
		String pass = request.getParameter("pass");
		
		// 프로젝트 컨텍스트 경로 구하기
		String ctxPath = application.getContextPath();
		
		// 아이디가 abc, 비밀번호가 1234로 간주
		if(uid.equals("abc") && pass.equals("1234")) {
			
			// 쿠키 생성
			Cookie cookie = new Cookie("username", uid);
			cookie.setMaxAge(60 * 3);
			cookie.setPath(ctxPath);
			
			
		}
	
	
	
	
	
	
	%>
	
	
	
	
	
	
</body>
</html>