<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		out.println(session.getAttribute("name"));
	%>
	
	<c:choose>
		<c:when test="${sessionScope.name eq 'J'}">
			<c:out value ="J입니다."></c:out>
		</c:when>
		<c:otherwise>
			<c:out value ="J가 아닙니다."></c:out>
		</c:otherwise>
	</c:choose>

</body>
</html>