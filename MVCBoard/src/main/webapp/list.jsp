<%@page import="com.javalec.bbs.dto.BDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
</head>
<body>
	<h1>MVC게시판</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="content_view.do?bid=${dto.bid}">${dto.bid}</a></td>
				<td>${dto.bName}</td>
				<td>${dto.bTitle}</td>
				<td>${dto.bDate}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan = "5"><a href="write_view.do"> 글 작성</a></td>
		</tr>
		
	</table>



<br>

<%

	ArrayList<BDto> arr = (ArrayList)request.getAttribute("list");
	
%>
</body>
</html>