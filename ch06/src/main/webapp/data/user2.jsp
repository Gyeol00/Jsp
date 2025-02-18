<%@page import="com.google.gson.Gson"%>
<%@page import="entity.User1"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 객체 생성
	User1 user1 = new User1();
	user1.setUid("a102");
	user1.setName("김유신");
	user1.setHp("010-1234-1002");
	user1.setAge(23);
	
	// JSON 문자열 생성
	Gson gson = new Gson();
	String strJson = gson.toJson(user1);

	System.out.println(strJson);
	
	// JSON 출력
	out.println(strJson);
	
	
	

%>