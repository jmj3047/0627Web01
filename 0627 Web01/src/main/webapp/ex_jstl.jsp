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

<%-- 
   <c:set var="num" value="30"/>
   <c:if test="${num >= 50}">
      <c:out value="50 이상입니다."/>
   </c:if>
   <c:if test="${num < 50}">
      <c:out value="50 미만입니다."/>
   </c:if>
   
   <%
   int num2 = 300;
   if(num2>=50)
      out.println("num2는 50 이상");
   else
      out.println("num2는 50 미만");
   %>
--%>

   
<%--
   <c:forEach var="k" begin="1" end="50" step="1">
      <c:out value="${k%2==0}"/>
   </c:forEach>
--%>
   
<!-- 자바 영역에 있는 배열에 특정 숫자가 있는지 여부 출력하기 -->
   <%
/*   int [] numArr = {3,6,9,12,15,18,21,24,27,30};
    int a = 12;
   for(int i=0; i<numArr.length; i++){
      if(a==numArr[i]){
         out.println(a + "는 배열에 포함되어 있습니다.");
         break;
      }
      if(i==numArr.length-1){
         out.println(a + "는 배열에 포함되어 있지 않습니다.");
      }
   } */
   %>
   
   <c:set var="a" value="12"/>
   <c:set var="numArr" value="{3,6,9,12,15,18,21,24,27,30}"/>
   <c:forEach var="item" items="${numArr}">
      <c:if test="${item == a}">
         <c:out value="${a}와 일치합니다."/>
      </c:if>
      <c:if test="${item != a}">
         <c:out value="${a}와 일치하지 않습니다."/>
      </c:if>
      <br>
   </c:forEach>
   
   
</body>
</html>