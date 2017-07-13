<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<tr>
<td>name</td>
<td>email</td>
<td>state</td>
</tr>


<c:forEach items="${list}" var="i">
<tr>
<td>${i.name }</td>
<td><a href="./checkMemberView?email=${i.email}">${i.email }</a></td>
<td>
<c:if test="${i.authenticState=='1'}">신원미상</c:if>
<c:if test="${i.authenticState=='2'}">신원확인완료</c:if>
</td>
</tr>
</c:forEach>

</table>

</body>
</html>