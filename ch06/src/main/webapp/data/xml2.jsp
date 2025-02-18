<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User1"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	List<User1> users = new ArrayList<>();
	
	try {
		Context Ctx = (Context) new InitialContext().lookup("java:comp/env");
	
		DataSource ds = (DataSource) Ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
	
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user1");
	
		while (rs.next()) {
			User1 user = new User1();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setHp(rs.getString(3));
			user.setAge(rs.getInt(4));
			users.add(user);
	
		}
		rs.close();
		conn.close();
		stmt.close();
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	// XML 생성
	Document doc = new Document();
	Element elUsers = new Element("users");
	
	for(User1 user : users) {
		Element elUser= new Element("User");
		Element elUid = new Element("uid");
		Element elName = new Element("name");
		Element elHp = new Element("hp");
		Element elAge = new Element("age");
		
		elUid.setText(user.getUid());
		elName.setText(user.getName());
		elHp.setText(user.getHp());
		elAge.setText(""+user.getAge());
		
		elUser.addContent(elUid);
		elUser.addContent(elName);
		elUser.addContent(elHp);
		elUser.addContent(elAge);
		
		elUsers.addContent(elUser);
		
	}
	
	doc.setRootElement(elUsers);
	
	// xml 출력 서식 설정
	XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
	String xml = outputter.outputString(doc);
	
	// xml 출력
	out.println(xml);
	
	
	
	
	
	
%>