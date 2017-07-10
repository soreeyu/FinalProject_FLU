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
	<h1>view</h1>

	
		<h2>업체 이름 : ${dto.name}</h2>
		<h2>운영 시간 : ${dto.time}</h2>
		<h2>업체 후무 : ${dto.holiday}</h2>
		<h2>주소  : ${dto.addr_main}</h2>
		<h2>홈페이지 : ${dto.homePage}</h2>
		<a href="eachRoom/eachRoomInsert">방 등록</a>
		
</body>
</html>