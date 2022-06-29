<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>	<!-- DAO인스턴스 -->
<%@ page import = "java.io.PrintWriter" %>	<!-- 출력 도와주는 객체 -->

<% request.setCharacterEncoding("UTF-8"); %>
<!-- JSP에서 클래스의 setter 함수를 호출하는 것과 같은 역할 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"></jsp:useBean>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />


<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
	   // 현재 로그인이 되어있는데 또 로그인할 경우 이미 로그인 되어있음을 알려주기
	   String userID = null;
	   if(session.getAttribute("userID") != null){ // 세션의 userID가 존재하면 가져오기
	      
	      userID = (String) session.getAttribute("userID");
	   
	   }
	   //위의 코드에서 세션의 userName을 추출하여 스트링변수에 저장
	   if(userID==null){ // 로그인 성공
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요')");
		script.println("location.href='login.jsp");
		script.println("</script>");
		
		}else{ //유저 아이디가 있을 경우
			//제목이나 내용이 비어있으면
			if(bbs.getBbsTitle()==null|| bbs.getBbsContent()==null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('제목과 내용은 비어있으면 안됩니다.')");
				script.println("history.back()"); // 뒤로가기
				script.println("</script>");
			}
			else{	//비어 있지 않으면
				BbsDAO bbsDAO = new BbsDAO();
				//글쓰기 백로직 실행
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				
				if(result == -1){ //실패
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()"); // 뒤로가기
					script.println("</script>");
				}else{ //성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");	
				}
				
			}
		}
	   
	   	%>
	</body>
</html>