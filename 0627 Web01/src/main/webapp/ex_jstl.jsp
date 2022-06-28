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
int num = 300;
%>
	<c:set var = "num" value="300"/>
	<c:if test = "${num>50}">
		<c:out value = "50보다 큽니다"/>
	</c:if> 
   
   <%-- <c:forEach var="k" begin="1" end="50" step="1">
      <c:out value="${k%2==0}"/>
   </c:forEach>
    --%>
    
    <%
    int num2= 300;
    if (num2>50)
    	out.println("50이상");
    else
    	out.println("50미만");
    %>
    
    
    <!-- //자바영역에 있는 배열에 특정한 숫자가 있으면 화면에 있다고 표시. 없으면 없다고 표시 -->
    <%
    int [] numArr = {3,6,9,12,15,18,21,24,27,30};
    int target = 7;
    
    for (int i = 0; i<numArr.length; i++){
    	if(numArr[i]==target){
    		out.println("target이 있음");
    		break;
    	}else{
    		out.println("target이 없음");
    		break;
    	}
    }
    
    
    %>
</body>
</html>