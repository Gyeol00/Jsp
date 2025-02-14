<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>customer::register</title>
</head>
<body>
	<h3>고객등록</h3>
	<a href="/ch11">메인이동</a>
	<a href="/ch11/shop/customer/list.do">고객목록</a>
	
	<form action="/ch11/shop/customer/register.do" method="post">
		<table border="1">
			<tr>
				<td>고객아이디</td>
				<td><input type="text" name="custId" placeholder="아이디 입력"></td>				
			</tr>
			<tr>
				<td>고객명</td>
				<td><input type="text" name="name" placeholder="이름 입력"></td>				
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" placeholder="휴대폰 입력"></td>				
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" placeholder="주소 입력"></td>				
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="고객등록">
				</td>				
			</tr>
		</table>
	</form>
</body>
</html>