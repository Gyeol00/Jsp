package kr.co.jboard.filter;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.jboard.dto.UserDTO;

// 모든 요청에 대해서 필터를 동작시킴
@WebFilter("/*")
public class LoginCheckFilter implements Filter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// httpServlet의 상위 클래스
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

		// 필터가 동작하는지 확인
		logger.debug("LoginCheckFilter...1");

		// 로그인 여부 검사 = 세션 검사
		// 상위 클래스임으로 형변환 필요
		// 다운 캐스팅 / 자바의 다형성
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();

		// user의 로그인에서 확인가능
		UserDTO userDTO = (UserDTO) session.getAttribute("sessUser");

		// 요청 URL 확인
		// 클라이언트 요청한 전체 주소임
		String uri = request.getRequestURI(); // /jboard/article/list.do
		logger.debug("LoginCheckFilter...2" + uri);

		// 컨텍스트인 /jboard 얘를 날려야 함
		String ctxPath = request.getContextPath(); // /jboard
		logger.debug("LoginCheckFilter...3" + ctxPath);

		String path = uri.substring(ctxPath.length()); // /article/*, /user/*
		logger.debug("LoginCheckFilter...4" + path);

		// 로그아웃이 포함이 안되어 있어야 함
		if(path.startsWith("/user") && !path.contains("logout.do") && !path.contains("info.do")) {
			// 로그인 한 상태에서 /user/* 요청일 때
			if(userDTO != null) {
				// 로그인을 안했을 경우 로그인 페이지로 이동
				HttpServletResponse response = (HttpServletResponse) resp;
				response.sendRedirect("/jboard/article/list.do");
				return;
			}
		}else if(path.startsWith("/article")) {
			// 로그인 안한 상태에서 /article/* 요청일 때
			if(userDTO == null) {
				// 로그인을 안했을 경우 로그인 페이지로 이동
				// 필터를 안 넘기고 리다이렉트로 바로 넘김..?
				HttpServletResponse response = (HttpServletResponse) resp;
				response.sendRedirect("/jboard/user/login.do?result=102");

				// 다음으로 넘어가지 않게 끊어야 함
				return;
			}

		}
		// 다음 필터(Controller) 이동
		chain.doFilter(req, resp);

	}

}








