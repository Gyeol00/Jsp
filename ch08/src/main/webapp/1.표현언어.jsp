<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.표현언어</title>
	<!-- 
		날짜 : 2025/02/11
		이름 : 한결
		내용 : JSP 표현언어 실습하기
	 -->
</head>
<body>
	<h3>1.표현언어 (EL:Expression Language)</h3>
	
	<%
		int num1 = 1;
		int num2 = 2;
		
		String str1 = "hello";
		String str2 = "Welcome";
		String str3 = "";
		String str4 = null;
		
		// 표현언어로 출력하기 위해 JSP 내장객체 저장하기
		// request를 가장 자주 씀
		// num1을 pageContext로 저장한 것
		pageContext.setAttribute("num1", num1);
		
		// num2를 request로 저장한 것
		request.setAttribute("num2", num2);
		
		session.setAttribute("str1", str1);
		
		application.setAttribute("str2", str2);
		
		request.setAttribute("str3", str3);
		request.setAttribute("str4", str4);

	%>
	
	<h4>표현식</h4>
	<p>
		num1 : <%= num1 %><br>
		num2 : <%= num2 %><br>
		str1 : <%= str1 %><br>
		str2 : <%= str2 %><br>
		str3 : <%= str3 %><br>
		str4 : <%= str4 %><br>
	</p>
	
	<h4>표현언어</h4>
	<!-- 현재 내장객체가 생략되어 있는 상태 -->
	<p>
		num1 : ${num1} <br>
		num2 : ${num2} <br>
		str1 : ${str1} <br>
		str2 : ${str2} <br>
		str3 : ${str3} <br>
		str4 : ${str4} <br>
	</p>
	
	<h4>표현언어 내장객체</h4>
	<!-- 변수가 저장되어 있는 내장객체를 확실하게 해줘야함. 보통은 생략함. -->
	<p>
		num1 : ${pageScope.num1} <br>
		num2 : ${requestScope.num2} <br>
		str1 : ${sessionScope.str1} <br>
		str2 : ${applicationScope.str2} <br>
		str3 : ${requestScope.str3} <br>
		str4 : ${requestScope.str4} <br>
	</p>
	
	<h4>표현언어 연산자</h4>
	<p>
		num1 + num2 = ${num1 + num2} <br>
		num1 - num2 = ${num1 - num2} <br>
		num1 * num2 = ${num1 * num2} <br>
		num1 / num2 = ${num1 / num2} <br>
		num1 % num2 = ${num1 % num2} <br><br>
		
		num1 > num2 = ${num1 > num2} <br>
		num1 < num2 = ${num1 < num2} <br>
		num1 >= num2 = ${num1 >= num2} <br>
		num1 <= num2 = ${num1 <= num2} <br>
		num1 == num2 = ${num1 == num2} <br>
		num1 != num2 = ${num1 != num2} <br><br>
		
		<!-- 위와 같은 연산자 -->
		num1 gt num2 = ${num1 gt num2} <br>
		num1 lt num2 = ${num1 lt num2} <br>
		num1 ge num2 = ${num1 ge num2} <br>
		num1 le num2 = ${num1 le num2} <br>
		num1 eq num2 = ${num1 eq num2} <br>
		num1 ne num2 = ${num1 ne num2} <br><br>
		
		empty str1 = ${empty str1} <br>
		empty str2 = ${empty str2} <br>
		empty str3 = ${empty str3} <br>
		empty str4 = ${empty str4} <br>
		str1 eq "hello" = ${str1 eq "hello"} <br>
		str2 eq str2 = ${str1 eq str2} <br><br>
		
		
	</p>
	
	
	
	
	

	
</body>
</html>