<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String id = request.getParameter("id"),name = request.getParameter("name"),tel = request.getParameter("tel"),address = request.getParameter("address");

	session.setAttribute("id", id);
	session.setAttribute("name", name);
	session.setAttribute("address", address);
	session.setAttribute("tel", tel);
	
	PreparedStatement ps = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		Statement stmt_mysql = conn_mysql.createStatement();
		
		String A = "update purchaserinfo set name = ?, tel = ? , address = ? where userid = ?";
		
		ps = conn_mysql.prepareStatement(A);
		ps.setString(1,name );
		ps.setString(2,tel );
		ps.setString(3,address );
		ps.setString(4,id );
		
		ps.executeUpdate();

		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}
	response.sendRedirect("PurchaserUpdate_04.jsp");
%>

</body>
</html>