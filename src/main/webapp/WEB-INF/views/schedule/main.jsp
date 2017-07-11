<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ScheduleMain</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body>
	<h1>SCHEDULE MAIN</h1>
	<h3>${scheduleNum}</h3>
	<c:forEach items="partList" var="part" varStatus="i">
	 	<h4>${i.index}</h4>
		<h5>${part.partName}</h5>
		<h5>${part.partStartDate}</h5>
		<h5>${part.partName}</h5>
		<h5>${part.partFinishDate}</h5>
		<h5>${part.partNum}</h5>
	</c:forEach>
</body>
</html>