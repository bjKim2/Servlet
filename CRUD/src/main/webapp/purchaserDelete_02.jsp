<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	//servertimezone 이 다르면 now 쓸때 다른나라 시간 나옴 
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	String id = request.getParameter("id").trim();
	String name = "";
	String tel = "",address = "";
	
	/* 	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql); */
	
	String query = "select userid,name,tel,address from purchaserinfo where userid = '" + id+ "'";
	String no_id = "select count(*) from purchaserinfo where userid = '" + id+ "'";
	
	//id 가 문자면  '" + id + "'"; 로 마무리
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
		
		/* 아이디가 없을 떄 if문 */
		if(name == ""){
		%>
 			<script type="text/javascript">
	 			function check(){
					alert("아이디가 없습니다.");
						window.location = "purchaserDelete_01.jsp"; // They clicked Yes
				}
				
				check(); 
				
				
			</script>
			
<!--  		<script>
				alert("아이디가 없습니다.");
				location.href = "purchaserDelete_01.jsp";
			</script> 
			 -->
		<%
		
		} 
		conn_mysql.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();

	}
	
%>
	<!--  Id 성명 전화번호 주소  submit -->
	<h3> 삭제할 고객정보를 확인 후  확인 버튼을 누르세요!</h3>	
	<form action="purchaserDelete_03.jsp" method="post">
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
				<input type="text" name="name" value = "<%=name%>" readonly="readonly" >
				</td>
			</tr>
			<tr>
				<td align = "right">
				전화번호 : 
				</td>
				<td>
				<input type="text" name="tel" value="<%=tel %>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td align = "right">
				주소 : 
				</td>
				<td>
				<input type="text" name="address" value=" <%=address%>" readonly="readonly">
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