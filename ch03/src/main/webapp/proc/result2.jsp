<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String query = request.getQueryString();
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");	
	String gender = request.getParameter("gender");	
	String addr = request.getParameter("addr");	
	// S는 배열, radio는 중복 선택 X, checkbox는 중복 선택 가능해서 getParameterValues로 한다.
	String[] hobbies = request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>result2</title>
</head>
<body>
	<h3>request 데이터 수신</h3>
	<p>
		쿼리스트링 : <%= query %><br>
		아이디 : <%= uid %><br>
		비밀번호 : <%= pass %><br>
		이름 : <%= name %><br>
		생년월일 : <%= birth %><br>
		성별 : <%= gender %><br>
		주소 : <%= addr %><br>
		취미 : <%
				for(String hobby : hobbies){
					out.println(hobby + ", ");
				}
				%><br>
	</p>
	
	<a href="../1.request.jsp">뒤로가기</a>
</body>
</html>