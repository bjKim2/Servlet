<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkLogin() {
		var form = document.loginForm
		for(i=0; i<form.id.value.length ; i++){
			var ch = form.id.value.charAt(i);	
	
			if((ch<'a' || ch>'z') && (ch>'A'|| ch<'Z')&&(ch>'0' || ch<'9'))
			{
				alert ("아이디는 영문 소문자만 입력가능합니다. ")
				form.id.select()
				return false
			}
			
		}
		
		
		for(i=0; i<form.pw.value.length ; i++){
			ch = form.pw.value.charAt(i);
			if(ch<'0' || ch>'9')
			{
				alert ("패스워드는 숫자만 입력가능 합니다.  ")
				form.id.select()
				return false
			}
		}
	}
</script>

<body>
	<form name="loginForm" action="Validation02P.jsp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="text" name="pw"><br>
		<input type="button" value="OK" onclick="checkLogin()">
			
	</form>
</body>
</html>