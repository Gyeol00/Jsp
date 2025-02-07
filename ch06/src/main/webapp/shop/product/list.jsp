<%@page import="entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.Customer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<Product> products = new ArrayList<>();

	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from `product`");
		
		while(rs.next()){
			Product product = new Product();
			product.setProdNo(rs.getInt(1));
			product.setProdName(rs.getString(2));
			product.setStock(rs.getInt(3));
			product.setPrice(rs.getInt(4));
			product.setCompany(rs.getString(5));
			products.add(product);
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>product::list</title>
</head>
<body>
	<h3>상품목록</h3>
	<a href="/ch06/shop">메인이동</a>
	<a href="/ch06/shop/product/register.jsp">상품등록</a>
	<a href="/ch06/shop/order/list.jsp">주문목록</a>
	
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>재고량</th>
			<th>가격</th>
			<th>제조사</th>
			<th>관리</th>
		</tr>
		<% for(Product product : products){ %>
		<tr>
			<td><%= product.getProdNo() %></td>
			<td><%= product.getProdName() %></td>
			<td><%= product.getStock() %></td>
			<td><%= product.getPrice() %></td>
			<td><%= product.getCompany() %></td>			
			<td>				
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
	
	<h4>주문하기</h4>
	<form action="/ch06/shop/order/proc/register.jsp" method="post">
		<table border="1">
			<tr>
				<td>상품번호</td>
				<td><input type="number" name="orderProduct" placeholder="상품번호 입력"></td>
			</tr>
			<tr>
				<td>주문자 아이디</td>
				<td><input type="text" name="orderId" placeholder="주문자 아이디 입력"></td>
			</tr>
			<tr>
				<td>주문수량</td>
				<td><input type="number" name="orderCount" placeholder="주문수량 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="주문하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>