<%@page import="org.apache.commons.fileupload2.core.DiskFileItem"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.util.UUID"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload2.core.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload2.core.FileItemFactory"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파일 업로드 디렉터리 경로 설정
	String uploadPath = application.getRealPath("./uploads");
	
	// 디렉터리 생성
	File uploadDir = new File(uploadPath);
	if(!uploadDir.exists()) {
		uploadDir.mkdir();	
	}
	
	// 파일 업로드 처리 객체 생성
	DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
	JakartaServletFileUpload<DiskFileItem, DiskFileItemFactory> upload = new JakartaServletFileUpload<>(factory);
	
	// 최대 업로드 파일 크기 설정
	upload.setSizeMax(1024 * 1024 * 10); // 1024 * 1024 = 1바이트 * 10 = 10메가바이트
	
	// 파일 업로드 스트림 작업
	try {
		List<DiskFileItem> items = upload.parseRequest(request);
		Iterator<DiskFileItem> iter = items.iterator();
		
		// 폼 입력 필드 갯수만큼 반복
		while(iter.hasNext()) {
			
			DiskFileItem item = iter.next();
			
			if(item.isFormField()) {
				// 일반 텍스트 데이터
				String fieldName = item.getFieldName(); // 폼 네임
				String fieldValue = item.getString(Charset.forName("UTF-8"));
				
				System.out.println("fieldName : " + fieldName);
				System.out.println("fieldValue : " + fieldValue);
			
			}else {
				// 첨부파일(파일 입력 필드)
				
				// 확장자 추출
				String fileName = item.getName();
				int idx = fileName.lastIndexOf("."); // 확장자 앞의 .을 구함, 파일명에 .이 있을 수도 있기에 뒤에서부터 찾음
				String ext = fileName.substring(idx);
				
				// 랜덤 파일명 생성
				String savedFileName = UUID.randomUUID().toString() + ext;

				// 파일 저장
				item.write(Path.of(uploadPath, savedFileName));
			
			}
		
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	// 데이터베이스 처리
	
	// 다운로드 페이지 이동
	response.sendRedirect("../2.fileDownload.jsp");
	
%>