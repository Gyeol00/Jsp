<%@page import="javax.naming.InitialContext"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="entity.FileEntity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	String seq = request.getParameter("seq");
	
	// 파일 엔티티 선언
	FileEntity file = null;
	
	// 파일 정보 조회
	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	
		Connection conn = ds.getConnection();
	
		String sql = "select * from `file` where `seq`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, seq);
	
		ResultSet rs = psmt.executeQuery();
	
		if (rs.next()) {
			file = new FileEntity();
			file.setSeq(rs.getInt(1));
			file.setTitle(rs.getString(2));
			file.setName(rs.getString(3));
			file.setoName(rs.getString(4));
			file.setsName(rs.getString(5));
		}
		rs.close();
		psmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	// response는 클라이언트에서 서버로 넘어가는...
	// response 파일 다운로드 헤더 정보. 이해하려하지 말고 그냥 이렇구나~ 하기
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(file.getoName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	// response 파일 스트림 작업
	String path = application.getRealPath("/uploads");
	File target = new File(path + File.separator + file.getsName()); // 경로 + 구분자 + 파일명
	
	try {
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(target));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
		// 파일 전송
		bis.transferTo(bos);
	
		bos.flush(); // 버퍼 비우기
		bos.close();
		bis.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

















