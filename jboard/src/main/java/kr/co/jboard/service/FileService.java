package kr.co.jboard.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import kr.co.jboard.dao.FileDAO;
import kr.co.jboard.dto.FileDTO;

public enum FileService {
	
	INSTANCE;	
	private FileDAO dao = FileDAO.getInstance();
	
	public void registerFile(FileDTO dto) {
		dao.insertFile(dto);
	}
	
	public FileDTO findFile(int fno) {
		return dao.selectFile(fno);
	}
	
	public List<FileDTO> findAllFile() {
		return dao.selectAllFile();
	}
	
	public void modifyFile(FileDTO dto) {
		dao.updateFile(dto);
	}
	
	public void deleteFile(int fno) {
		dao.deleteFile(fno);
	}
	
	// 파일 업로드
	public List<FileDTO> uploadFile(HttpServletRequest req) {
		
		List<FileDTO> files = new ArrayList<FileDTO>();
		
		// 파일 업로드 경로 구하기
		// JSP 서버가 아니기 때문에 application 태그가 나올 수 없음
		ServletContext ctx = req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");
		
		// 파일 업로드 디렉터리가 존재하지 않으면 디렉터리 생성
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		try {
			// 첨부파일 객체 가져오기
			// req로 객체 호출, 롸이트 컨트롤러에서 파일 서비스 호출
			// 2개의 파트 객체라서 아래 for문 무조건 2번 반복
			Collection<Part> parts = req.getParts();
			
			// 파일 첨부 안하면 for문 안돔
			// 하나 첨부하면 한번 돌고
			// 두개 첨부하면 두번 돈다
			for(Part part : parts) {
				// 파일명 추출
				String oName = part.getSubmittedFileName();
				
				// 파일을 첨부했으면
				// oName이 null일 때 오류가 나서 if문 정의
				// 빈문자열 출력되므로 !oName.isEmpty() 조건 추가
				if(oName != null && !oName.isEmpty()) {
					
					// 고유 파일명 생성
					int idx = oName.lastIndexOf(".");
					String ext = oName.substring(idx);
					
					String sName = UUID.randomUUID().toString() + ext;
					
					// 파일 저장
					part.write(uploadPath + File.separator + sName);
					
					// FileDTO 객체 생성
					FileDTO dto = new FileDTO();
					dto.setoName(oName);
					dto.setsName(sName);
					
					files.add(dto);
					
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return files;
	}
	
	// 파일 다운로드
	
	
}












