<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--
	 1page 테이블 에서 key 값의 하이퍼링크를 누르면 나오는 페이지(3page)
	 1page에서 한 레코드의 키값 하나를 전달받는다.
	 키값으로 DB에서 select 문을 이용해 레코드 전체를 받아와 
	 form 의 input 칸에 초기값으로 설정해둔다. 
--%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	/* 삭제 버튼을 누르면 호출되는 함수 5page로 가면서 키값을 get방식으로 전달 */
 	function del(a) {
 		var b = a.value
		location.href = "AB05.jsp?seq="+b;
		
	} 
</script>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	
	//변수 선언과 초기값 설정
	String email = "";
	String rel ="";
	String name = "";
	String tel = "",address = "";
		
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	//받은 키값으로 맞는 레코드 검색
	String query = "select * from addressBook where seq = '" + seq + "'";
	
	//디비 연동 후 변수에 저장
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
		
		
		Statement stmt_mysql = conn_mysql.createStatement();
		ResultSet rs = stmt_mysql.executeQuery(query);
		
		while(rs.next()){
			name = rs.getString("name");	
			tel = rs.getString("tel");	
			address = rs.getString("address");
			email = rs.getString("email");
			rel = rs.getString("rel");
			
		}
	
		conn_mysql.close();
		
	}catch(Exception e){
		e.printStackTrace();

	}
	


%>
<!--출력  -->
<h1>수정 후 확인을 눌러주세요 </h1>
	<form action="AB04.jsp" method="post" name="memberform">
		<table>
			<tr>
				<td>Seq :</td>
				<td><input type="text" name="seq" value="<%=seq%>" readonly="readonly"></td>
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
				<td>전자 우편 :</td>
				<td><input type="text" name="email" value="<%=email%>"></td>
			</tr>
			<tr>
				<td>관계 :</td>
				<td><input type="text" name="rel" value="<%=rel%>"></td>
			</tr>
		</table>
		<!-- 수정버튼은 submit 삭제버튼은 del 함수 호출(js함수)   -->
		<input type="submit" value="수정">
		<input type="button" value="삭제" onclick="del(seq)">  
		
	</form>
	
</body>
</html>