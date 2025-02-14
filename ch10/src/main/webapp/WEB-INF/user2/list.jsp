<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user2::list</title>
</head>
<body>
	<h3>user2 목록</h3>
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user2/register.do">등록하기</a>

	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<a href="/ch10/user2/modify.do">수정</a>
				<a href="/ch10/user2/remove.do">삭제</a>
			</td>
		</tr>
	</table>
</body>
</html>