<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.EmailTest</title>
	<!-- 
		날짜 : 2025/02/10
		이름 : 김철학
		내용 : JSP Email 전송 실습하기
	 -->
</head>
<body>
	<h3>3.Email 실습</h3>
	
	<form action="./proc/sendEmail.jsp" method="post">
		<table border="1">
			<tr>
				<td>보내는 사람</td>
				<td><input type="email" name="sender"></td>
			</tr>
			<tr>
				<td>받는 사람</td>
				<td><input type="email" name="receiver"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="20" cols="60"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="전송하기">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>