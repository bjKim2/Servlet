<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function del(seq) {
		if(confirm("정말로 삭제할랑구?")){
			location.href = "del.do?seq=" +seq 			
		}
	}
	function update(seq) {
		location.href = "update_view.do?seq=" +seq 	
		
	}
</script>
<body>

<h1> One line 게시판</h1>
	<div align="center">
	<table border="1" >
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.name}</td>
				<td>${dto.title}</td>
				<td>${dto.date}</td>
				<td><button onclick="del(${dto.seq})"> 삭제 </button> </td>
				<td><button onclick="location.href='update_view.do?seq=${dto.seq}'"> 수정</button> </td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan = "7"><a href="write_view.do"> 글 작성</a></td>
		</tr>
	</table>
	</div>
</body>
</html>