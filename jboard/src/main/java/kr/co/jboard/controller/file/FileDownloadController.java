package kr.co.jboard.controller.file;

import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jboard.dto.FileDTO;
import kr.co.jboard.service.FileService;

@WebServlet("/file/download.do")
public class FileDownloadController extends HttpServlet {

	private static final long serialVersionUID = 1624825922704067870L;

	private FileService service = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 다운로드할 파일 번호 데이터 수신
		String fno = req.getParameter("fno");
		
		// 파일 정보 조회 서비스 호출 & 다운로드 카운트 증가
		FileDTO fileDTO = service.findFile(fno);
		service.downloadCountUp(fno);
		
		// 파일 정보 객체 공유 참조
		req.setAttribute("fileDTO", fileDTO);
		
		// 파일 다운로드 서비스 호출
		service.downloadFile(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
}
