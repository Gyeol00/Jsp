<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	/*
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");

	User user = new User();
	user.setUid(uid);
	user.setName(name);
	user.setHp(hp);
	user.setAge(age);
	*/
%>
<!-- 위랑 같은 코드 / 위 코드 로직을 태그로 처리-->
<jsp:useBean id="user" class="sub1.User">
	<jsp:setProperty property="uid" name="user"/>
	<jsp:setProperty property="name" name="user"/>
	<jsp:setProperty property="hp" name="user"/>
	<jsp:setProperty property="age" name="user"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>userProc</title>
</head>
<body>
	<h3>전송 데이터 출력</h3>
	
	<p>
		아이디 : <%= user.getUid() %><br>
		아이디 : <%= user.getName() %><br>
		아이디 : <%= user.getHp() %><br>
		아이디 : <%= user.getAge() %><br>
	</p>
	
	<a href="../3.useBeanTag.jsp">뒤로가기</a>
	
</body>
</html>