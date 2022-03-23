<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function insert() {
		location.href	=	"purchaserSelect05.jsp";
	}
</script>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String url_mysql = "jdbc:mysql://192.168.150.246:3306/eclipse?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	
	String query = "select * from purchaserinfo";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		Statement stmt_mysql = conn_mysql.createStatement();
		ResultSet rs = stmt_mysql.executeQuery(query);
		int cnt = 0 ;
%>
		<h3>고객 명단 리스트</h3>
		<table border = "1">
			<tr align="center">
				<th>UserID</th> <th>이름</th><th>전화번호</th> <th>주소</th><th>입력일자</th>
			</tr>
			
<%		while(rs.next()){
	
%>			
			<tr>
				<td>
					<a href ="purchaserSelect02.jsp?userid=<%=rs.getString(1)%>">
					<%=rs.getString(1)%>
					</a>
				</td>
				<td>
					<%=rs.getString(2)%>
				</td>
				<td>
					<%=rs.getString(3)%>
				</td>
				<td>
					<%=rs.getString(4)%>
				</td>
				<td>
					<%=rs.getString(5)%>
				</td>
			</tr>
			

			
<%	
			cnt++;
		}
	
		
%>		

		</table>
		<br>
		<div align="right" style = "width :29%">
		
				<form action="#">
					<input type="button" value="입력" onclick="insert()">
				</form>
		</div>
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