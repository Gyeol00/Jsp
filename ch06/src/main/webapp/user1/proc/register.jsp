<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	// 숫자로 변환
	//int intAge = Integer.parseInt(age);
	
	// 데이터베이스 처리
	/*
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	*/
	
	try{
		// 1단계 - JDBC 드라이버 로드
		//Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - 데이터베이스 접속
		//Connection conn = DriverManager.getConnection(host, user, pass);
		
		// DBCP 방식
		// JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		// 커넥션 풀에 있는 커넥션을 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		// 3단계 - SQL 실행 객체 생성
		String sql = "INSERT INTO `user1` VALUES (?,?,?,?)";
		
		// conn - 데이터베이스 연결 객체, SQL 쿼리를 실행할 수 있는 메서드 제공
		// prepareStatement(sql) - 주어진 SQL 쿼리를 실행할 준비가 된 preparedStatement
		// 객체를 생성
		// psmt - preparedStatement 객체를 참조하는 변수, SQL 쿼리를 실행하거나 입력 값을 바인딩하거나, 결과를 처리할 수 있다.
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		//psmt.setString(4, intAge);
		
		// 4단계 - SQL 실행
		psmt.executeUpdate();
		
		// 5단계 - 결과셋 처리(SELECT 경우)
		// 6단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
		
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
	// 목록이동
	response.sendRedirect("../list.jsp");
	
	
	
	
%>