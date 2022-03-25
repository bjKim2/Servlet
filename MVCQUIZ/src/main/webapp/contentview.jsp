<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(a) {
		if(confirm("정말로 삭제하시겠습니까?"){
		location.href = "delete.do?seq="+a;
			
		}
	}
</script>
</head>
<body>

	<h2>글 수정 및 삭제</h2>
	<table border="1">
		<form action="update.do" method="post">
			<tr>
				<td>번호 :</td>
				<td><input type="text" name="seq" size="5" value="${dto.seq}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="name" size="10" value="${dto.name }"></td>
			</tr>
			<tr>
				<td>번호 :</td>
				<td><input type="text" name="tel" size="15" value="${dto.tel}"></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><input type="text" name="address" size="30" value="${dto.address}"></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" name="email" size="30" value="${dto.email}"></td>
			</tr>
			<tr>
				<td>관계 :</td>
				<td><input type="text" name="rel" size="15" value="${dto.rel}"></td>
			</tr>

			<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp;
				
				<button onclick = "location.href='delete.do?seq=${dto.seq}'"> 삭제</button>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="list.do">목록 보기</a>
				
				</td>
					  
				
			
			</tr>
			
		</form>
	</table>
</body>
</html>