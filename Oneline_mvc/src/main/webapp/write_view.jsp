<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
</head>
<body>
	<h2>글 작성</h2>
	<table border="1">
		<form action="write.do" method="post">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="20"> </td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" size="50"> </td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
		</form>
	</table>
</body>
</html>