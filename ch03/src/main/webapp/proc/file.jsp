<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>file</title>
</head>
<body>
	<h3>파일 요청 페이지</h3>
	<%
		// 해당 jsp 파일을 브라우저에서 출력하지 않고 파일 다운로드
		response.setHeader("Content-Type", "apllication/octet-stream");
	%>
</body>
</html>