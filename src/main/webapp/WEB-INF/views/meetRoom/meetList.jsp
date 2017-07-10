<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>LIST</h1>
	
	<c:forEach items="${list}" var="i">
		<a href="meetView?num=${i.num}"> <h2> ${i.name} </h2> </a>
		<h2>${i.fname}</h2>
		<h2>${i.time}</h2>
		<h2>${i.holiday}</h2>
		<h2>${i.addr_num}</h2>
		<h2>${i.addr_main}</h2>
		<h2>${i.addr_detail}</h2>
		<h2>${i.homePage}</h2>
	</c:forEach>
	<a href="meetInsert">업체등록</a>

</body>
</html>