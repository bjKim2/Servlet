<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 명단 리스트</title>
</head>
<body>
	<h3>고객 명단 리스트</h3>
<%
	request.setCharacterEncoding("utf-8");
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	//servertimezone 이 다르면 now 쓸때 다른나라 시간 나옴 
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String query = "select * from wtest" ;
	String strUserid = null;
	
	
	PreparedStatement ps = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
		
		
		ResultSet rs = stmt_mysql.executeQuery(query);
		int cnt = 0 ;
%>
		<table border = "1">
			<tr>
				<th>번호</th> <th>User ID</th>
			</tr>
		
	
			
<%		while(rs.next()){
	
%>			
			<tr>
				<td>
					<%=rs.getInt(1)%>

				</td>
				<td>
					<%=rs.getString(2)%>
				</td>
			</tr>

			
<%	
			cnt++;
		}
%>
		</table>
		<br>
		<h3> 총 인원은 <%=cnt %> 입니다.</h3>
<%	

		conn_mysql.close();
		
	
	
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
		
	}

%>
	
</body>
</html>