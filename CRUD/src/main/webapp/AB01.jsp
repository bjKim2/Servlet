<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--
	 첫번쨰 파일 DB 특정 테이블에 저장된 모든 어트리뷰트 출력
	 출력된 테이블 밑에 입력 버튼은 테이블 레코드 추가 페이지로 이동
	 테이블 키 어트리뷰트 밸류 값에 하이퍼 링크를 달아서 수정 및 삭제를 할 수 있는 페이지로 이동 가능
--%>
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
	//파라미터 수신 시 한글 꺠짐 방지
	request.setCharacterEncoding("utf-8");	

	//DB 연결시 입력할 내용
	String url_mysql = "jdbc:mysql://localhost:3306/customer?serverTimezone=Asia/Seoul&characterEncoding=utf-8&useSSL=false";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";
	
	//쿼리문에 넣을 변수 받기
	String sel = request.getParameter("selector");
	String search =request.getParameter("search"); 
	
	//파라미터 들어왓을 때와 안들어왓을 때 삼항연산자로 입력 
	String query  = (sel != null) ? "select * from addressBook where " + sel + " like '%" + search + "%'": "select * from addressBook";
		
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
	//디비 연동(jdbc driver loading,statement문으로 사용  )
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
			
			
<%		
		//모든 레코드 값 받아오기
		while(rs.next()){
	
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
		//connection,statement close 
		conn_mysql.close();
		stmt_mysql.close();
	}catch(Exception e){
		e.printStackTrace();
		e.getMessage();
		
	}

%>
</body>
</html>
