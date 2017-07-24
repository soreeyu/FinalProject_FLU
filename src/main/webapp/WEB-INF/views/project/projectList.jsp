<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<h2>project ${type}</h2>

<table>
	<tr>
		<td>num</td><td>name</td><td>contents</td><td>reg_date</td>
	</tr>
<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.projectNum}</td><td><a href="projectView?projectNum=${dto.projectNum}">${dto.name}</a></td><td>${dto.contents}</td><td>${dto.reg_date}</td>
	</tr>
</c:forEach>

</table>


<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>