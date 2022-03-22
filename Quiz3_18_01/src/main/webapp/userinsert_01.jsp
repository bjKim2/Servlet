<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

개인 정보를 입력하세요<br><br>

<form action="userinsert_02.jsp" method="post">
<table>
	<tr>
		<td>
			아이디 : 
		</td>
		<td>	
			<input type="text" name="id"><br>
		</td>
	</tr>	
	<tr>
		<td>
			패스워드 : 
		</td>
		<td>
			<input type="text" name="pw"><br>
		</td>
	</tr>	
	<tr>
		<td>
			이름 : 
		</td>
		<td>
			<input type="text" name="name"><br>
		</td>
	</tr>	
	<tr>
		<td>
		</td>
		<td align= "center">
		
			<input type="submit" value="확인">
		</td>
	</tr>
	
	
	<%session.invalidate(); %>

</table>
</form>

</body>
</html>