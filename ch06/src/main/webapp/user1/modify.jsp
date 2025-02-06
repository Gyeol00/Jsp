<%@page import="entity.User1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	User1 user1 = new User1(); // 선언
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "SELECT * FROM `user1` where `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()) {
			// if문에서 User1을 선언할 경우 if문 안에서만 참조를 함 (try문도 같음)
			// User1 user1 = new User1();
			user1 = new User1(); // 생성
			user1.setUid(rs.getString(1));
			user1.setName(rs.getString(2));
			user1.setHp(rs.getString(3));
			user1.setAge(rs.getInt(4));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::modify</title>
</head>
<body>
	<h3>user1 등록</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록이동</a>
		
	<form action="./proc/modify.jsp" method="post">
		<table border="1">
			<tr>
				<!-- 아이디는 보통 PK값이라서 수정을 못하게 막아야 함 -->
				<td>아이디</td>
				<td> <input type="text" name="uid" value="<%= user1.getUid() %>" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td> <input type="text" name="name" value="<%= user1.getName() %>" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td> <input type="text" name="hp" value="<%= user1.getHp() %>" placeholder="휴대폰 입력"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td> <input type="text" name="age" value="<%= user1.getAge() %>" placeholder="나이 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>