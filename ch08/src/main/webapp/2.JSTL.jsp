<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2.JSTL</title>
	<!-- 
		날짜 : 2025/02/11
		이름 : 한결
		내용 : 8장 표현언어와 JSTL
	 -->
</head>
<body>
	<h3>2.JSTL (Java Standards Tag Library)</h3>
	
	<h4>스크립트릿</h4>
	<%
		// 변수선언
		String str = "hello";
		out.println("<p>str : " + str + "</p>");
	
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		if(num1 < num2) {
			out.println("<p>num1은 num2보다 작다.</p>");
		}
		
		if(num1 > num2) {
			out.println("<p>num1은 num2보다 크다.</p>");
		}else {
			out.println("<p>num1은 num2보다 작다.</p>");
		}
		
		if(num1 > num2) {
			out.println("<p>num1은 num2보다 크다.</p>");
		}else if(num2 > num3) {
			out.println("<p>num2은 num3보다 크다.</p>");
		}else {
			out.println("<p>num3가 가장 크다.</p>");
		}
	
		// 반복문
		for(int i=1; i<=5; i++) {
			out.println("<p>i : " + i + "</p>");
		}
		
		int sum = 0;
		for(int k=1; k<=10; k++) {
			sum += k;
		}
		out.println("<p>1부터 10까지 합 : " + sum + "</P>");
	
		String[] names = {"김유신","김춘추","장보고","강감찬", "이순신"};
		for(String name : names) {
			out.println("<p>name : " + name + "</p>");
		}
		
		// 자주쓰는 문자열 메서드
		String message = "Hello World";
		
		out.println("<p>문자열 길이 : " + message.length() + "</p>");
		out.println("<p>문자열 자르기 : " + message.substring(6, 11) + "</p>");
		out.println("<p>문자열 교체 : " + message.replace("World", "Korea") + "</p>");
		out.println("<p>문자열 인덱스 : " + message.indexOf("e") + "</p>");
	
	
	%>
	
	<h4>JSTL</h4>
	<!-- 변수선언 (위랑 같음) -->
	<c:set var="str" value="hello"/>
	<p>str : ${str}</p>
	
	<c:set var="num1" value="1"/>
	<c:set var="num2" value="2"/>
	<c:set var="num3" value="3"/>
	
	<!-- 조건문 -->
	<c:if test="${num1 lt num2}">
		<p>num1은 num2보다 작다.</p>
	</c:if>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num1은 num2보다 작다.</p>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${num1 gt num2 }">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:when test="${num2 gt num3 }">
			<p>num2은 num3보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num3가 가장 크다.</p>
		</c:otherwise>
	</c:choose>
	
	<!-- 반복문 -->
	<c:forEach var="i" begin="1" end="5">
		<p>i : ${i} </p>
	</c:forEach>
	
	<c:set var="sum" value="0"/>
	<c:forEach var="k" begin="1" end="10">
		<c:set var="sum" value="${sum + k}"/>
	</c:forEach>
	
	<p>1부터 10까지 합 : ${sum}</p>
	
	<!-- 공백 있으면 안됨 -->
	<c:set var="names">김유신,김춘추,장보고,강감찬,이순신</c:set>
	<c:forEach var="name" items="${names}">
		<p>name : ${name}</p>
	</c:forEach>
	
	<!-- 자주쓰는 문자열 처리 -->
	<c:set var="message" value="Hello World"></c:set>
	<p>문자열 길이 : ${f:length(message)}</p>
	<p>문자열 자르기 : ${f:substring(message, 6, 11)}</p>
	<p>문자열 교체 : ${f:replace(message, "World", "Korea")}</p>
	<p>문자열 인덱스 : ${f:indexOf(message, "e")}</p>
	
</body>
</html>








