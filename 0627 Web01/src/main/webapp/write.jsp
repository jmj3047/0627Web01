<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>	<!-- 출력 도와주는 객체 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
		crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
	</head>
	<body class="text-center">
	<jsp:include page="header.jsp"></jsp:include>
	 	<%
	 // 로그인된 사람만 글쓰기 화면으로 전환 가능
	   String userID = null;
  	   String userName = null;
	   if(session.getAttribute("userID") != null){ // 세션의 userID가 존재하면 가져오기
	      
	      userID = (String) session.getAttribute("userID");
	   
	   }else{
		   PrintWriter script = response.getWriter();
		      script.println("<script>");
		      script.println("alert('회원만 사용가능합니다. 로그인해주세요.')");
		      script.println("history.back()");
		      script.println("</script>");
		      
	   }
	
	%>
	
	<div class="container">
		<div class="row">
			<form action="writeAction.jsp"  method="post">
				<table class = "table table-striped">
					<tbody>
						<tr>
							<td>
								<input type="text" class="form-control" placeholder="Title" id="bbsTitle" name = "bbsTitle" maxlength="50"/>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class = "form-control" placeholder = "Write Contents" id = "bbsContent" name="bbsContent" maxlength="2048" rows="10" cols="5"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="Submit" />
			</form>
		 
		</div>
	</div>
		
		
		
		
		
	</body>
</html>