<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<%-- 
	2page에서 전달 받은 값들을 DB에 insert 하는 페이지
	insert 후 1page로 간다. 
 --%>
<meta charset="UTF-8">
<title>사용자 정보 받고 전달.</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	//2page에서 온 파라미터들을 변수에 저장
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String email= request.getParameter("email");
	String rel= request.getParameter("rel");
	
	
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	//CUD는 PreparedStatement 문으로 사용 
	PreparedStatement ps = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		String A = "insert into addressBook (name, tel, address, email, rel";
		String B = ") values (?,?,?,?,?)";
		
		ps = conn_mysql.prepareStatement(A+B);
		ps.setString(1, name);
		ps.setString(2, tel);
		ps.setString(3, address);
		ps.setString(4, email);
		ps.setString(5, rel);
		ps.executeUpdate();
		
		ps.close();
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
	response.sendRedirect("AB01.jsp");

%>
</body>
</html>