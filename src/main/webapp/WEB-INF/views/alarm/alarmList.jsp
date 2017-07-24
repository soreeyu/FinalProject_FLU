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
	min-width : 1460px;
	width : 100%;
}
.wrap {
	min-width : 1152px;
	width : 60%;
	height: 2000px;
	margin : 0 auto;
}
.message {
	color: #999;
}
.content {
	display: inline;
    float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 790px;
    margin-top: 50px;
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
.empty-notification {
	padding: 20px 30px;
}
.empty-notification-member{
    width: 80%;
    margin: 30px auto;
}
.text-center{
	margin-bottom: 20px;
    color: #666666;
    line-height: 19px;
    text-align: center;
    font-size: 14px;
}
.empty-notification-member a {
	display: block;
    text-align: center;
    font-weight: bold;
    color: #2099bb;
    text-decoration: none;
}
.side-bar {
	display: inline;
    float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 250px;
    margin-top: 50px;
}

.user-name-tag {
	width: 250px;
	height : 100px;
    padding: 15px 15px 19px;
    background-color: #ffffff;
    border: solid 1px #dedede;
    border-bottom-width: 2px;
    border-radius: 2px;
    margin-bottom: 15px;
}
.user-name-tag-heading {
	margin: 0 auto 9px;
    padding-left: 3px;
    padding-bottom: 11px;
    border-bottom: 1px solid #dedede;
    text-align: left;
    font-size: 16px;
    color: #454545;
    line-height: 19px;
}
.user-name-tag-body {
	padding-left: 3px;
    border-top: none;
    background-color: #fff;
}
.user-img {
	height: 50px;
    width: 50px;
    border-radius: 50%;
    float: left;
    border: 1px solid #dedede;
}
.username {
	display: block;
    float: left;
    margin: 0;
    padding-left: 10px;
    width: 165px;
    font-weight: bold;
    line-height: 25px;
    font-size: 15px;
}
.profile-setting {
	display: block;
    float: left;
    width: 165px;
    margin: 0;
    padding-left: 10px;
    line-height: 25px;
    font-size: 12px;
    color: #2099bb;
    text-decoration: none;
}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section class="alramList">

		<div class="wrap">
			<div class="content">
				<div class="content-header">
					<h3>알림</h3>
					<small class="message">${member.nickName}님! 새로운 소식들을 확인하세요.</small>
				</div>
				<div class="content-inner">
					<c:if test="${empty alarm}">
						<div class="empty-notification">
							<c:choose>
								<c:when test="${member.kind eq 'client'}">
									<div class="empty-notification-member">
										<h5 class="text-center">
										새로운 소식이 없습니다.
										<br>
										지금 바로 프로젝트를 등록해보세요.
										</h5>
										<a href="#">프로젝트 등록</a>
									</div>
								</c:when>
								<c:when test="${member.kind eq 'freelancer'}">
									<div class="empty-notification-member">
										<h5 class="text-center">
										새로운 소식이 없습니다.
										<br>
										지금 바로 프로젝트에 지원해보세요.
										</h5>
										<a href="#">프로젝트 찾기</a>
									</div>
								</c:when>
							</c:choose>
						</div>
					</c:if>
					
					<div class="notification">
						<c:forEach items="${alarm}" var="a">
							<div>
							<span>${a.contents}</span>
							<span>${a.reg_date}</span>
							</div>
						</c:forEach>	
					</div>
				</div>
			
			
			</div>
			
			<div class="side-bar">
				<div class="inner">
					<div class="user-name-tag">
							<c:choose>
								<c:when test="${member.kind eq 'client'}">
								<h3 class="user-name-tag-heading">클라이언트</h3>
								</c:when>
								<c:when test="${member.kind eq 'freelancer'}">
								<h3 class="user-name-tag-heading">프리랜서</h3>
								</c:when>
							</c:choose>					
						<div class="user-name-tag-body">
						<c:choose>
							<c:when test="${empty member.fProfileImage}">
							<img class="user-img" alt="" src="${pageContext.request.contextPath}/resources/img/mypage/avatar.jpg">							
							</c:when>
							<c:when test="${not empty memeber.fProfileImage}">
							<img class="user-img" alt="" src="${pageContext.request.contextPath}/resources/profile/${member.fProfileImage}">
							</c:when>
						</c:choose>	
							<h4 class="username">${member.email}</h4>
							<a class="profile-setting"href="./member/personaldataView">기본 정보 수정</a>
							
						</div>
					</div>
				</div>
				
				
			</div>
			
		</div>
	

	</section>
	<c:import url="../temp/footer.jsp"/>
</body>
</html>