<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="entity.User1"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	// ↑ 컨텐츠 타입 확인 (바꾸기)
	List<User1> users = new ArrayList<>();
	
	try {
		Context Ctx = (Context) new InitialContext().lookup("java:comp/env");

		DataSource ds = (DataSource) Ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user1");
		
		while(rs.next()) {
			User1 user = new User1();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setHp(rs.getString(3));
			user.setAge(rs.getInt(4));
			users.add(user);
			
			
		}
		rs.close();
		conn.close();
		stmt.close();
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}


	
	// JSON 문자열 생성
	Gson gson = new Gson();
	String strJson = gson.toJson(users);

	System.out.println(strJson);
	
	// JSON 출력
	out.println(strJson);
	
	
	

%>