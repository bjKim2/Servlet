<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function insert() {
		location.href	=	"AB02.jsp";
	}
</script>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	String sel = request.getParameter("selector");
	String search =request.getParameter("search"); 
	
	String query = "select * from addressBook";
	//String s_query = "select * from addressBook where " + sel + " like " + search+ "%";
		
	PreparedStatement ps = null;
	
/*  if (sel != null){
		query = "select * from addressBook where " + sel + " like '%" + search + "%'";
	}  */
	query  = (sel != null) ? "select * from addressBook where " + sel + " like '%" + search + "%'": "select * from addressBook";
	
	%>
	
	
	<h3>주소록 명단 리스트 </h3>
	<br>
	<form action="AB01.jsp" method="get">
	검색 선택 :
		 <select name="selector">
		 	<option value="seq" selected="selected"> 번호 </option>
		 	<option value="name"> 이름 </option>
		 	<option value="tel"> 전화번호 </option>
		 	<option value="address"> 주소 </option>
		 	<option value="email"> 전자우편 </option>
		 	<option value="rel"> 관게 </option>
			
		</select> 
		<input type="text" name="search" >
		<input type="submit" value="검색">
	</form>
	<br>
	<%
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		Statement stmt_mysql = conn_mysql.createStatement();
		ResultSet rs = stmt_mysql.executeQuery(query);
		int cnt = 0 ;
%>

		
		<table border = "1">
			<tr align="center">
				<th>Seq</th> <th>이름</th><th>전화번호</th> <th>주소</th><th>전자우편</th><th>관계</th>
			</tr>
			
			
<%		while(rs.next()){
	
%>			
			<tr>
				<td>
					<a href ="AB03.jsp?seq=<%=rs.getString(1)%>">
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
				<td>
					<%=rs.getString(6)%>
				</td>
			</tr>

<%	
			cnt++;
		}
%>		
		</table>
		<br>
		<div align="left" style = "width :29%">
		
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
