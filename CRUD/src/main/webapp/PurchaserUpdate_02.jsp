<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String id = request.getParameter("id");
%>
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
	
	String name = "",tel = "",address = "";
	
	
	String query = "select userid,name,tel,address from purchaserinfo where userid = '" + id+ "'";

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		
		Statement stmt_mysql = conn_mysql.createStatement();
		ResultSet rs = stmt_mysql.executeQuery(query);
		
		while(rs.next()){
			name = rs.getString("name");	
			tel = rs.getString("tel");	
			address = rs.getString("address");	
		}
	
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
		
	}
	
%>

	<h3> 수정 후 확인 버튼을 누르세요!</h3>	
	<form action="PurchaserUpdate_03.jsp" method="post">
		<table>
			<tr>
				<td align = "right">
				사용자 ID : 
				</td>
				<td>
				<input type="text" name="id" value=<%=id%> readonly="readonly">
				</td>
			</tr>
			<tr>
				<td align = "right">
				성명 : 
				</td>
				<td>
				<input type="text" name="name" value = <%=name %> >
				</td>
			</tr>
			<tr>
				<td align = "right">
				전화번호 : 
				</td>
				<td>
				<input type="text" name="tel" value="<%=tel %>">
				</td>
			</tr>
			<tr>
				<td align = "right">
				주소 : 
				</td>
				<td>
				<input type="text" name="address" value=" <%=address%>">
				</td>
			</tr>
			
			<tr>
			</tr>
			
			<tr>
				<td></td>
				<td>
					<br><br>
					<input type="submit" value="화인">
				</td>
			</tr>
	
		</table>
		
	</form>

</body>
</html>