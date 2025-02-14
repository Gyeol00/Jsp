<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>product::register</title>
</head>
<body>
	<h3>상품등록</h3>
	<a href="/ch06/shop">메인이동</a>
	<a href="/ch06/shop/product/list.jsp">상품목록</a>
	
	<form action="/ch06/shop/product/proc/register.jsp" method="post">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="prodName" placeholder="상품명 입력"></td>				
			</tr>
			<tr>
				<td>재고수량</td>
				<td><input type="number" name="stock" placeholder="재고수량 입력"></td>				
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="number" name="price" placeholder="상품가격 입력"></td>				
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="company" placeholder="제조사 입력"></td>				
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="상품등록">
				</td>				
			</tr>
		</table>
	</form>
</body>
</html>