<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- 
	3page에서 삭제를 누르면 오는 페이지(5page)
 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	
	request.setCharacterEncoding("utf-8");
	
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String seq = request.getParameter("seq");
	
	PreparedStatement ps = null;
	//delete 쿼리문(String 형식)
	String A = "delete from addressBook where seq = ?";

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		
		ps = conn_mysql.prepareStatement(A);
		ps.setString(1, seq);
		
		ps.executeUpdate();

		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
	}
	//다시 첫페이지로 이동
	response.sendRedirect("AB01.jsp");
%>
</body>
</html>