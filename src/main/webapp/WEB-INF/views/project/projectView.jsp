<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<title>Insert title here</title>
</head>
<body>
<h2>project View</h2>

${dto.projectNum}
${dto.name}
${dto.skill}
${dto.email}
<p>

<c:if test="${member.email==dto.email}">
<a href="projectUpdate?projectNum=${dto.projectNum}">Update</a>
</c:if>
<a href="projectDelete?projectNum=${dto.projectNum}">Delete</a>
</p>
</body>
</html>