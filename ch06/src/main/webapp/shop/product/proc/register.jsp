<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	String prodName = request.getParameter("prodName");
	String stock = request.getParameter("stock");
	String price = request.getParameter("price");
	String company = request.getParameter("company");
	
	// 데이터베이스 처리
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO `product` (`prodName`,`stock`,`price`,`company`) VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, prodName);
		psmt.setString(2, stock);
		psmt.setString(3, price);
		psmt.setString(4, company);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록 이동
	response.sendRedirect("/ch06/shop/product/list.jsp");

%>