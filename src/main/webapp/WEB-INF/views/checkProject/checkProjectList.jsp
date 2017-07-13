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
<td>분야</td>
<td>프로젝트명</td>
<td>작성자</td>
<td>상태</td>
</tr>


<c:forEach items="${list}" var="i">
<tr>
<td>${i.category}</td>
<td><a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a></td>
<td>${i.email }</td>
<td>
<c:if test="${i.state=='check'}">검수 단계</c:if>
<c:if test="${i.state=='done'}">입금 대기중</c:if>
</td>
</tr>
</c:forEach>

</table>
</body>
</html>