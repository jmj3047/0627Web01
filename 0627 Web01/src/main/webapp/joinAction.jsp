<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>	<!-- DAO인스턴스 -->
<%@ page import = "java.io.PrintWriter" %>	<!-- 출력 도와주는 객체 -->

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
	<!-- JSP에서 클래스의 setter 함수를 호출하는 것과 같은 역할 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Member Action</title>
</head>
<body>

<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	// 회원가입 함수 실행 결과값에 따라서 화면에 출력할 스크립트 생성
	
	//백엔드 유효성 겁사
	if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null || user.getUserGender()==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된부분이 있습니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	}
	// 회원가입 성공
	else if(result==1){ 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} 
	// 중복발생
	else if(result==-1){ 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 이미 존재합니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	} 
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('처리하지 못한 이상한 에러가 발생했습니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	}

%>
</body>
</html>