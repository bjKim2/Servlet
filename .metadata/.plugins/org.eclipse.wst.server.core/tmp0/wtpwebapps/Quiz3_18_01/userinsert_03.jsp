<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int a = Integer.parseInt(request.getParameter("accept"));
	switch(a){
	case 1:
		response.sendRedirect("userinsert_04.jsp");
		break;
	default:
		
		response.sendRedirect("userinsert_01.jsp");
		break;
	
	}

%>

</body>
</html>