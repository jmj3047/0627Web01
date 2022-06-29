<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<div>Hello World!</div>
	<div>안녕하세요!</div>
	<%= new java.util.Date() %>
	<br>
	<%
			for(int i=0; i<10; i++){
				out.println(i);
	%>
	<br>
	<%
			}
	%> --%>
	
<!-- 	로그인이 되어있는 상태에서는 로그인, 회원가입 버튼이 안보이도록
	로그인이 안되었을때는 로그인, 회원가입 버튼이 보이도록 -->
	
	
<!-- 	
	<a href="boardList.jsp">게시판 목록</a>
	<br>
	<br>
	<a href="login.jsp">로그인</a>
	<br>
	<br>
	<a href="join.jsp">회원가입</a>
	<br>
	<br>
	<a href="logoutAction.jsp">로그아웃</a> -->

	<jsp:include page="header.html"></jsp:include>




	
</body>
</html>