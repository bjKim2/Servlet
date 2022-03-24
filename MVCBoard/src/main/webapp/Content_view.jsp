<%@page import="com.javalec.bbs.dto.BDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	/* 삭제 버튼을 누르면 호출되는 함수 5page로 가면서 키값을 get방식으로 전달 */
 	function del(a) {
 		var b = a.value
		location.href = "del.do?bid="+b;
		
	}
</script>
<body>

	<h2>글 수정 및 삭제</h2>
	<table border="0">
		<form action="modify.do" method="post">
			<tr>
				<td>번호 :</td>
				<td><input type="text" name="bid" size="5" value="${content_view.bid}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="bName" size="5" value="${content_view.bName }"></td>
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="bTitle" size="5" value="${content_view.bTitle }"></td>
			</tr>
			<tr>
				<td>내용 :</td>
				<td><textarea name="bContent" rows="10" cols="50">${content_view.bContent}</textarea> </td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp;
					<input type="button" value="삭제" onclick="del(bid)">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="list.do">목록 보기</a> 
				
				</td>
			</tr>
			
		</form>
	
	</table>
</body>
</html>