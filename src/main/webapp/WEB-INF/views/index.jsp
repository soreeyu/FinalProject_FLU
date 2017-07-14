<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
.main_section{
	min-width: 1460px;
	width: 100%;
	height: 2400px;
	background-color: aqua;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<section class="main_section">
	<section class="advertising">
		<div class="advertising_div">
			광고
		</div>
		<div class="project_quantity_div">
			등록된 프로젝트 갯수
		</div>
	</section>
	<section class="project">
		<div class="project_div">
			등록된 프로젝트
			
			더보기
		</div>
	</section>
	<section class="freelancer">
		<div class="freelancer_div">
			등록된 프리랜서
			
			더보기
		</div>
	</section>
	<section class="process">
		<div class="process_div">
			FLU 프로세스
		</div>
		<div class="advantage_div">
			장점
		</div>
	</section>
</section>

<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>


</body>
</html>