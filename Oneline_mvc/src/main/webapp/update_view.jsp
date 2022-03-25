<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
 	function del(a) {
 		var b = a.value
		location.href = "del.do?seq="+b;
		
	}
</script>
<body>
<body>

	<h2>글 수정 </h2>
	<table border="1">
		<form action="update.do" method="post">
			<tr>
				<td>번호 :</td>
				<td><input type="text" name="seq" size="5" value="${update_view.seq}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="name" size="5" value="${update_view.name }"></td>
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="title" size="5" value="${update_view.title }"></td>
			</tr>

			<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp;
					<input type="button" value="삭제" onclick="del(seq)">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="list.do">목록 보기</a> 
				
				</td>
			</tr>
			
		</form>
	
	</table>
</body>
</html>