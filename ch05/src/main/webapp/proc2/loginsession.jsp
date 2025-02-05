<%@page import="entity.User"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	// abc, 1234 회원으로 간주
	if(uid.equals("abc") && pass.equals("1234")) {
		
		// 회원이 맞을 경우
		User user = new User();
		user.setUid(uid);
		user.setPass(pass);
		user.setName("홍길동");
		user.setAge(23);
		
		// ★★★세션 저장★★★
		session.setAttribute("username", user);
		
		// 이동
		response.sendRedirect("./loginSuccess.jsp");
		
	}else {
		
		// 회원이 아닐 경우
		// code=100은 로그인 실패라는 것을 알려주기 위한 코드(상태값). 코드 설정하는 게 좋다.
		response.sendRedirect("../session.jsp?code=100");
	}
	
%>