<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootstrap.jsp"/>
<title>Insert title here</title>
<style type="text/css">
section {
	min-width : 1152px;
	width : 60%;
	margin : 0 auto;
	height: 1500px;
}
.Room{
	width : 30%;
	float: left;
	position: relative;
	padding: 13px;
	
}


.Room_Img {
	display: block;
    position: relative;
    overflow: hidden;
	width: 345px;
	height: 261px;
}
.Room_Img > img {
	width : 100%;
	height: 100%;
}
.InfoArea{
	position: relative;
    padding: 18px 20px 14px;
    background-color: #fff;
    overflow : hidden;
    white-space: nowrap;
	text-overflow : ellipsis;
    
}

.info {
	padding-bottom: 10px;
}

</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section>
	<c:forEach items="${list}" var="i">
	<div class="Room">
		<div class="Room_Img" >
		<img alt="" src="${pageContext.request.contextPath}/resources/upload/${i.fname}">
		</div>
		<div class="InfoArea">
		<a href="meetView?num=${i.num}" class="info">${i.name}</a><br>
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/location.png">
		<span class="info">${i.addr_main}</span>
		</div>
	</div>
	</c:forEach>
	
	
	
	<c:if test="${member.kind eq admin}">
	<a href="meetInsert" style="float: left;">업체등록</a>	
	</c:if>
	</section>
	<c:import url="../temp/footer.jsp"/>
</body>
</html>