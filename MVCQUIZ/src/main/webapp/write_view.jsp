<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 작성</title>
</head>
<body>
	<h2>주소록 작성</h2>
	<table border="0">
		<form action="write.do" method="post">
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="name" size="20"> </td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="tel" size="50"> </td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><input type="text" name="address" size="50"> </td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" name="email" size="50"> </td>
			</tr>
			<tr>
				<td>관계 :</td>
				<td><input type="text" name="rel" size="50"> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
		</form>
	</table>

</body>
</html>