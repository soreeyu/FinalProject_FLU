<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>자기소개</h1>
	
	<div>
	 	안녕하세요
	</div>
	
	<c:choose>
	<c:when test="${ carrer eq null}">
	<div><button id="btn">업데이트 하기</button></div>
	</c:when>
	<c:otherwise>
	<div><button id="btn2">업데이트 하기</button></div>
	</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript">
	$("#btn").click(function() {
		alert("자기소개가 아직 없습니다.");
	});
	
	$("#btn2").click(function() {
		alert("자기소개가 있습니다.")
	});

</script>
</html>