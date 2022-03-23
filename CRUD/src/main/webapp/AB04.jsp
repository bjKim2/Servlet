<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%

/* 
	3page 의 폼형식에서 값을 수정하고 전달 받은 페이지(현재 4page)
	DB에서 Update 후 1페이지로 간다. 
	출력이 없는 히든 페이지
*/
	//값받기
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String rel = request.getParameter("rel");
	
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql="qwer1234";
	
	PreparedStatement ps = null;   
	
	//db update 쿼리문을 스트링형식으로 작성 
	String A ="update addressBook set name = ?, tel=?, address=?, email= ?, rel =? where seq = ?";

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		                               
		
		ps = conn_mysql.prepareStatement(A);
		ps.setString(1,name);
		ps.setString(2,tel);
		ps.setString(3,address);
		ps.setString(4,email);
		ps.setString(5,rel);
		ps.setString(6,seq);
		
		ps.executeUpdate();   
		
		conn_mysql.close(); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//update 후 첫페이지로 이동
	response.sendRedirect("AB01.jsp"); 

%>