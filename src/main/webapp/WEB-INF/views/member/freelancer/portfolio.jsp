<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>포트 폴리오</h1>
	
	<div>
		대표 포트폴리오
	</div>
	
	<div>
		포트폴리오(0개) (리스트)
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