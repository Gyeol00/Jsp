<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	// 데이터 수신
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// Gmail 앱 비밀번호
	String appPassword = "hory deui xarf rtdk";
	
	// Gmail SMTP 서버 설정
	Properties prop = new Properties();
	prop.put("mail.smtp.host", "smtp.gmail.com");
	prop.put("mail.smtp.port", "465");
	prop.put("mail.smtp.auth", "true");
	prop.put("mail.smtp.ssl.enable", "true");
	prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	// Gmail SMTP 세션 생성
	Session gmailSession = Session.getInstance(prop, new Authenticator(){
		
		protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
			
			return new PasswordAuthentication(sender, appPassword);
			
		}
	});
	
	// 메일 발송
	Message message = new MimeMessage(gmailSession);
	
	try {
		
		message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		message.setSubject(title);
		message.setContent(content, "tect/html;charset=UTF-8");
		
		// 딜레이가 안 생기려며 스레드 처리
		Transport.send(message);
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	// 폼 이동
	response.sendRedirect("../3.EmailTest.jsp");
	
%>