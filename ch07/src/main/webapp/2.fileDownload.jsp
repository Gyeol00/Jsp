<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.FileEntity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<FileEntity> files = new ArrayList<>();

	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");	
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from `file`");
		while(rs.next()){
			FileEntity file = new FileEntity();
			file.setSeq(rs.getInt(1));
			file.setTitle(rs.getString(2));
			file.setName(rs.getString(3));
			file.setoName(rs.getString(4));
			file.setsName(rs.getString(5));
			files.add(file);		
		}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2.fileDownload</title>
	<!-- 
		날짜 : 2025/02/10
		이름 : 김철학
		내용 : JSP 파일 다운로드 실습하기
	 -->
</head>
<body>
	<h3>2.파일 다운로드 실습</h3>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>원본파일명</th>
			<th>저장파일명</th>
			<th>관리</th>			
		</tr>
		<% for(FileEntity file : files){ %>
		<tr>
			<td><%= file.getSeq() %></td>
			<td><%= file.getTitle() %></td>
			<td><%= file.getName() %></td>
			<td><%= file.getoName() %></td>
			<td><%= file.getsName() %></td>
			<td>
				<a href="./proc/fileDelete.jsp?seq=<%= file.getSeq() %>">삭제</a>
				<a href="./proc/fileDownload.jsp?seq=<%= file.getSeq() %>">다운로드</a>
			</td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>