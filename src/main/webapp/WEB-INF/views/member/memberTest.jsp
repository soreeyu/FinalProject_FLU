<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${member eq null }">
	<a href="login">로그인</a>
	</c:if>
	<c:if test="${member ne null }">
	<a href="logout">로그아웃</a>
	<a href="mypage">MY PAGE</a>
	</c:if>
	
	<a href="MemberJoin">회원 가입</a>
	


</body>
</html>