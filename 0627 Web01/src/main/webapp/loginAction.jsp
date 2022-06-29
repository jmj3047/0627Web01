<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>	<!-- DAO인스턴스 -->
<%@ page import = "java.io.PrintWriter" %>	<!-- 출력 도와주는 객체 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
	<!-- JSP에서 클래스의 setter 함수를 호출하는 것과 같은 역할 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Action</title>
</head>
<body>
<%
   // 현재 로그인이 되어있는데 또 로그인할 경우 이미 로그인 되어있음을 알려주기
   String userID = null;
   if(session.getAttribute("userID") != null){ // 세션의 userID가 존재하면 가져오기
      
      userID = (String) session.getAttribute("userID");
   
   }
   if(userID != null){

      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('이미 로그인되었습니다.')");
      script.println("location.href='index.jsp'");
      script.println("</script>");
      
   }

	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	
	// 로그인 함수 실행 결과값에 따라서 화면에 출력할 스크립트 생성
	if(result==1){ // 로그인 성공
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	} else if(result==0){ // 로그인 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	} else if(result==-1){ // 아이디가 없음
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	} else if(result==-2){ // 데이터베이스 오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스에 문제가 발생하였습니다.')");
		script.println("history.back()"); // 뒤로가기
		script.println("</script>");
	}

%>
</body>
</html>