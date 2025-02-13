<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::list</title>
</head>
<body>
	<h3>user1 목록</h3>
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user1/register.do">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<!-- users 리스트의 각 user1 객체를 반복하면서 그 데이터를 HTML 테이블 형식으로 출력 -->
		<c:forEach var="dto" items="${dtos}"><!-- requestScope 생략 -->
			<tr>
				<td>${dto.getUid()}</td>
				<td>${dto.getName()}</td>
				<td>${dto.hp}</td>
				<td>${dto.age}</td>
				<td>
					<a href="/ch10/user1/modify.do?uid=${dto.uid}">수정</a>
					<a href="/ch10/user1/remove.do?uid=${dto.uid}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>	
</body>
</html>