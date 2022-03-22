<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>약관</h2>
<br>
<% request.setCharacterEncoding("utf-8"); %>

----------------------------------------------------------------<br>
1.회원 정보는 웹사이트의 운영을 위해서만 사용됩니다.<br>
2. 웹사이트의 정상 운영을 방해하는 회원은 탈퇴 처리 합니다.<br>
----------------------------------------------------------------<br>
위의 약관에 동의 하십니까?<br>

<%	

session.setAttribute("id",request.getParameter("id"));
session.setAttribute("pw",request.getParameter("pw"));
session.setAttribute("name",request.getParameter("name"));
%>



<form action="userinsert_03.jsp">
	<input type="radio" name="accept" value="1"> 동의
	<input type="radio" name="accept" value="2"> 동의 하지 않음
	<br>
	<input type="submit" value="확인">

</form>

</body>
</html>