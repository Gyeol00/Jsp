<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	// 세션 사용자 정보 삭제
	session.removeAttribute("username");
	session.invalidate();

	// code 상태값 101번 가지고 로그인 페이지 이동
	response.sendRedirect("../session.jsp?code=101");
%>