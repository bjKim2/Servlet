<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="com.javalec.base.Student" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:getProperty property="name" name="student" />
	<jsp:getProperty property="age" name="student" />
	<jsp:getProperty property="grade" name="student"/>
	<jsp:getProperty property="studentNum" name="student" />
	${student.name}
	<%=session.getAttribute("student.name") %>
	
	<h1>JavaBean에 저장 되었습니다. </h1>

<%
/* 	
Student student = new Student();
student.setName("홍길동";)
 */
%>
</body>
</html>