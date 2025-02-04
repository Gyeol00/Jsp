<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4.application</title>
	<!-- 
		날짜 : 2025/02/04
		이름 : 한결
		내용 : JSP 내장객체 application 실습하기
		
		application 내장객체
		 - 현재 웹 애플리케이션을 실행하는 WAS(톰캣) 환경 정보 객체
		 - 애플리케이션 환경 정보(Context)를 설정하고 참조 기능 제공
		 - 애플리케이션이 WAS로 실행되는 시스템 경로 기능 제공
	 -->
</head>
<body>
	<h3>4.application 내장객체</h3>
	
	<h4>서버정보</h4>
	<p>
		서버 : <%= application.getServerInfo() %><br>
		Servlet 버전 : <%= application.getMajorVersion() %>.<%= application.getEffectiveMinorVersion() %><br>
		JSP 버전 : <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
	</p>
	
	<h4>환경정보</h4>
	<%
		// 애플리케이션이 WAS에 초기화(최초 실행) 될 때 Context 환경 정보 반영
		String param1 = application.getInitParameter("PARAM1");
		String param2 = application.getInitParameter("PARAM2");
	%>
	<p>
		param1 : <%= param1 %>
		param2 : <%= param2 %>
	</p>
	
	<h4>자원경로</h4>	
	<%= application.getRealPath("./4.application.jsp") %>
</body>
</html>








