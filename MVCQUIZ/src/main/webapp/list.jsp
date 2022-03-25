<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>MVC 주소록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>이메일</th>
			<th>관게</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="content_view.do?seq=${dto.seq}">${dto.seq}</a></td>
				<td>${dto.name}</td>
				<td>${dto.tel}</td>
				<td>${dto.address}</td>
				<td>${dto.email}</td>
				<td>${dto.rel}</td>
			</tr>
		</c:forEach>
		
	</table>
	
	<form action="search.do" method="post">
	
		&nbsp;<input type="text" name="words" size="50"> 
		<select name="sel">
			<option value="seq">번호</option>
			<option value="name">이름</option>
			<option value="tel">전화번호</option>
			<option value="address">주소</option>
			<option value="email">이메일</option>
			<option value="rel">관계</option>
			
		</select>
		<input type="submit" value="검색"> &nbsp;&nbsp;&nbsp;
			<button  onclick = "location.href ='write_view.do'"> 글 작성 </button>
	</form>



<br>
</body>
</html>