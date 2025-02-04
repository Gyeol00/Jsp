<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>500</title>
</head>
<body>
	<h3>일시적인 서버 장애가 발생했습니다. 잠시 후 다시 요청하시기 바랍니다.</h3>
	<p>
		에러종류 : <%= exception.getClass().getName() %><br>
		에러내용 : <%= exception.getMessage() %><br>
	</p>
	<a href="../5.exception.jsp">뒤로가기</a>
</body>
</html>