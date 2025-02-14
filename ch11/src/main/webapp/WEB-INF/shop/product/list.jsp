<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
		<tr>
			<td>d</td>
			<td>d</td>
			<td>d</td>
			<td>d</td>
			<td>d</td>			
			<td>				
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
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