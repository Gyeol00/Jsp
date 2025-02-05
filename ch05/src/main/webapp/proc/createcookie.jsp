<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>createCookie</title>
</head>
<body>
	<h3>쿠키생성</h3>
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
			cookie.setMaxAge(60 * 3); // 60초 * 3 = 3분
			cookie.setPath(ctxPath); // 쿠키의 유효범위 지정 
						
			// 응답객체로 클라이언트에게 쿠키 전송
			response.addCookie(cookie);
				
			// 성공 페이지 이동
			response.sendRedirect("./successLogin.jsp");
		} else {
			
			//out.println("<h4>아이디 또는 비밀번호가 틀립니다.</h4>");
			
			// 실패 페이지 이동
			response.sendRedirect("./failLogin.jsp");
					
		}
	%>
</body>
</html>