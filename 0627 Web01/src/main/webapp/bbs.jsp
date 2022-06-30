<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>  <!-- 출력 도와주는 객체 -->
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>게시판</title>
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
<body >
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<table>
				<thead>
					<th>Index</th>
					<th>Title</th>
					<th>Author</th>
					<th>Date</th>
					
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Java</td>
						<td>J</td>
						<td>2022-06-29</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Python</td>
						<td>T</td>
						<td>2022-06-29</td>
					</tr>
					
					<%
						int pageNumber = 1; //1페이지로 기본 설정
						if(request.getParameter("pageNumber")!=null){
							//게시판 목록화면에 이미 페이지번호가 요청된것이 있다면 그 값으로 페이지 세팅
							pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
						}
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i = 0;i<list.size();i++){
							out.println(list.get(i));
						}
						
					%>
				</tbody>
				
			</table>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>	
		</div>
				
	</div>
	
</body>

</html>