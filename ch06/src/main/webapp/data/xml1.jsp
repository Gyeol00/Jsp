<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// XML 문자열 생성
	String xml = "<user>";
		   xml += "<uid>a101</uid>";
		   xml += "<name>홍길동</name>";
		   xml += "<age>23</age>";
		   xml += "<addr>부산</addr>";
		   xml += "</user>";
		   
	out.println(xml);


%>