<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function modi() {
	
		
		document.memberform.submit();
	}
	function del() {
		
		location.href = "purchaserSelect04.jsp";
	}

</script>
<body>
<%

	String userid = request.getParameter("userid");
	

	
	request.setCharacterEncoding("utf-8");
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	String name = "";
	String tel = "",address = "";
	
	String query = "select userid,name,tel,address from purchaserinfo where userid = '" + userid+ "'";
	
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
	session.setAttribute("userid",request.getParameter("userid"));
	session.setAttribute("name",request.getParameter("name"));
	session.setAttribute("tel",request.getParameter("tel"));
	session.setAttribute("address",request.getParameter("address"));
%>


<h1>고객 명단 수정 및 삭제</h1>
	<form action="purchaserSelect03.jsp" method="post" name="memberform">
		<table>
			<tr>
				<td>UserId :</td>
				<td><input type="text" name="id" value="<%=userid %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>성명 :</td>
				<td><input type="text" name="name" value="<%=name%>"></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="tel" value="<%=tel%>"></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><input type="text" name="address" value="<%=address%>"></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="button" value="수정" onclick="modi()"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" value="삭제" onclick="del()"></td>
			</tr>
		</table>
	</form>
</body>
</html>