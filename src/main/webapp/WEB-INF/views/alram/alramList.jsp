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
	width : 70%;
	margin : 0 auto;
}
.page {
	margin-left: auto;
    margin-right: auto;
    width: 1080px;
}
.content {
	display: inline;
    float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 790px;
}
.content-header{
	margin: 0;
    margin-bottom: 5px;
    padding: 30px;
    background-color: #fff;
    border-radius: 3px;
    border-bottom-width: 2px;
    border: 1px solid #dedede;
}
.content-inner{
	background-color: #fff;
    border-radius: 3px;
    border-bottom-width: 2px;
    border: 1px solid #dedede;
}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section>
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3>알림</h3>
					<small>님! 새로운 소식들은 확인하세요. <a href="#">알림설정 바로가기</a> </small>
				</div>
				<div class="content-inner">
				
				</div>
			
			
			</div>
			
			<div class="side-bar">
				<div class="inner">
					<div class="user-name-tag">
						<div class="user-name-tag-body">
						</div>
					</div>
				</div>
				
				
			</div>
			
		</div>
	
	
	</section>
	<c:import url="../temp/footer.jsp"/>
</body>
</html>