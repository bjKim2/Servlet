<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="com.javalec.base.Student" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <jsp:getProperty property="name" name="abc"/>
	나이 : <jsp:getProperty property="age" name="student"/>
	학년 : <jsp:getProperty property="grade" name="student"/>
	번호 : <jsp:getProperty property="studentNum" name="student"/>

 
</body>
</html>