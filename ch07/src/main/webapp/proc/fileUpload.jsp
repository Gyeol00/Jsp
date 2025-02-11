<%@page import="entity.FileEntity"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.UUID"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.nio.file.Path"%>
<%@page import="org.apache.commons.fileupload2.core.FileItem"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItem"%>
<%@page import="org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload2.core.FileItemFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파일 업로드 디렉터리 경로 설정
	String uploadPath = application.getRealPath("/uploads");

	// 파일 업로드 디렉터리 존재하지 않으면 디렉터리 생성
	File uploadDir = new File(uploadPath);
	if(!uploadDir.exists()){
		uploadDir.mkdir();
	}
	
	// 파일 업로드 처리 객체 생성	
	DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
	JakartaServletFileUpload<DiskFileItem, DiskFileItemFactory> upload = new JakartaServletFileUpload<>(factory);
	
	// 최대 업로드 파일 크기 설정
	upload.setSizeMax(1024 * 1024 * 10); // 10MB
	
	// 파일 엔티티 생성
	FileEntity file = new FileEntity();
	
	// 파일 업로드 스트림 작업
	try {
		List<DiskFileItem> items = upload.parseRequest(request);
		Iterator<DiskFileItem> iter = items.iterator();
		
		// 폼 입력 필드 갯수만큼 반복
		while(iter.hasNext()){
			
			DiskFileItem item = iter.next();
			
			if(item.isFormField()){ // 일반 텍스트 데이터
				
				String fieldName  = item.getFieldName(); // 폼 네임
				String fieldValue = item.getString(Charset.forName("UTF-8"));
				
				System.out.println("fieldName : " + fieldName);
				System.out.println("fieldValue : " + fieldValue);
				
				// 엔티티 초기화
				if(fieldName.equals("title")){
					file.setTitle(fieldValue);
				}else if(fieldName.equals("name")){
					file.setName(fieldValue);
				}
				
			} else { // 첨부파일(파일 입력 필드)
				
				// 확장자 추출
				String fileName = item.getName();
				int idx = fileName.lastIndexOf("."); // 확장자 앞의 .을 구함, 파일명에 .이 있을 수도 있기에 뒤에서부터 찾음
				String ext = fileName.substring(idx);
				
				// 랜덤 파일명 생성
				String savedFileName = UUID.randomUUID().toString() + ext;
				
				// 엔티티 초기화
				file.setoName(fileName);
				file.setsName(savedFileName);
								
				// 파일 저장
				item.write(Path.of(uploadPath, savedFileName));
			}
		}		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	System.out.println(file);	
	
	// 데이터베이스 처리
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		String sql = "insert into `file` (`title`, `name`, `oName`, `sName`) values (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, file.getTitle());
		psmt.setString(2, file.getName());
		psmt.setString(3, file.getoName());
		psmt.setString(4, file.getsName());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 다운로드 페이지 이동
	response.sendRedirect("../2.fileDownload.jsp");

%>