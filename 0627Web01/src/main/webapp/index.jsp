<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div> hello world</div>
	<div> 안녕 세상</div>
	<%= new java.util.Date() %>
	<br>
	<%
		for(int i=0;i<10;i++){
			out.println(i);
		}
	%>
</body>
</html>