<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
	background-color: #f2f2f2;
}
.advertising_div{
	background: url("${pageContext.servletContext.contextPath}/resources/img/index/background.png");
	background-position: center center;
    height: 368px;
    padding: 0;
    margin-bottom: 0;
}
.list_heading {
	text-align: center;
    margin-bottom: 30px;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
}
.fa-won:before{
    content: "\f159";
}
.project_item{
	display: inline;
    float: left;
    border-radius: 2px;
    -webkit-background-size: 100% 100%;
    -moz-background-size: 100% 100%;
    -o-background-size: 100% 100%;
    background-size: 100% 100%;
    background-position: center center;
    width: 342px;
    height: auto;
    background-color: #fff;
    border: 1px solid #dedede;
    border-bottom: 2px solid #dedede;
    padding: 25px;
    margin-bottom: 10px;
    margin-right: 17px;
}
.project_div .project_item:first-child{
	margin-right: 17px;
    margin-bottom: 15px;
}
.List_contents {
	white-space: nowrap;
	text-overflow : ellipsis; 
	overflow: hidden;
	padding-bottom: 18px;
    margin-bottom: 0;
}
.project_item h4 {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 18px;
    font-weight: bold;
    line-height: 19px;
    padding-bottom: 12px;
}
.project_item h4 a {
    color: #2099bb;
}
.project-element-list {
    padding-bottom: 15px;
    color: #666;
    font-size: 14px;
    margin-top: 0;
    margin-bottom: 0;
}
.project-element-list span:first-child {
    padding-left: 0;
}
.project-element-list span{
	padding-left: 10px;
    padding-right: 10px;
}
.day {
	border-left: 1px solid #dedede;
    border-right: 1px solid #dedede;
}
.project-skill {
    margin-right: 4px;
    background-color: #a1a7ad;
    color: #fff;
    line-height: 1;
    font-weight: normal;
    display: inline;
    padding: .2em .6em .2em;
    font-size: 12px !important;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .2em;
}
.process_header{
	text-align: center;
    line-height: 20px;
    font-weight: bold;
    font-size: 18px;
    color: #454545;
    padding-top: 50px;
    padding-bottom: 30px;
}
.process_div div{
	width: 1060px;
    padding-bottom: 50px;
    margin-right: 0;
}
.process_div div span{
	line-height: 18px;
    font-weight: bold;
    font-size: 15px;
    color: #2d3a45;
    margin-right: 142px;
    font-size: 14px \0;
}
.process_div div span+span{
    margin-right: 160px;
}
.process_div div span+span+span{
    margin-right: 156px;
}
.process_div div span+span+span+span{
    margin-right: 135px;
}
.process_div div span+span+span+span+span {
    margin-right: 0;
}
.join{
	border-left: none;
    border-right: none;
    height: 66px;
    padding: 0;
    background-color: #e7e9ec;
    border-bottom: 1px solid #d2d2d2;
    margin-bottom: 0;
}
.inner{
	margin-left: auto;
    margin-right: auto;
    width: 1060px;
    padding-top: 15px;
}
.text-center{
	line-height: 34px;
    height: 34px;
    font-size: 18px;
    text-align: center;
    vertical-align: middle;
    color: #2d3a45;
    margin-bottom: 20px;
}
.btn{
	display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.428571429;
    border-radius: 2px;
}
.advantage{
    background-color: #fff;
    height: 500px;
    margin-top: 0;
    margin-bottom: 0;
}
.benefit-item {
    float: left;
    margin-top: 30px;
    text-align: center;
}
.benefit-item img {
    margin-left: 99px;
    margin-right: 99px;
}
.benefit-item .benefit-item-title {
    padding-bottom: 10px;
    font-weight: bold;
    font-size: 18px;
    color: #2d3a45;
}
.client {
	margin-top: 0;
    background-color: #4c5c6a !important;
    border-top: 1px solid #293139 !important;
    border-bottom: 1px solid #293139 !important;
    color: #fff !important;
}
.register{
	margin-left: auto;
    margin-right: auto;
    width: 1060px;
    padding-top: 15px;
}
</style>
<script type="text/javascript">
	var message = '${message}';
	if(message!=''){
		alert(message);
	}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"/>
<section class="main_section">
	<section class="advertising">
		<div class="advertising_div">
			<p class="invitation-text-md">웹 개발, 웹 디자인, 워드프레스 제작 등</p>
			<h1 class="invitation-heading">안전! 효율! 획기적인 플랫폼 제공</h1>
			<p class="invitation-text-sm">FLU or UFC 의 새로운 아웃소싱을 시작해 보세요</p>
		</div>
		<div class="project_quantity_div">
			<div class="projectCount">
			<div class="status-box">
			<p>등록된 프로젝트</p>
			<span>${pjcount}</span>
			<span>개</span>
			</div>
			<div class="status-box">
			<p>프로젝트 등록 금액</p>
			<span><fmt:formatNumber value="${budget}" type="currency"/> </span>
			<span>원</span>
			</div>
			<div class="status-box">
			<p>등록된 회원</p>
			<span>${mcount}</span>
			<span>명</span>
			</div>
			</div>
		</div>
			
	</section>
	<section class="project">
		<div class="project_div">
			<div class="list_heading">등록된 프로젝트</div>
			<c:forEach begin="0" end="5" var="i">
			<div class="project_item">
				<h4>
					<a href="${pageContext.servletContext.contextPath}/project/projectView?projectNum=${indexList[i].projectNum}">${indexList[i].name}</a>
				</h4>
				<h5 class="project-element-list">
					<span>
						<i class="fa fa-won"></i>
						<strong>${indexList[i].budget} 원</strong>
					</span>
					<span class="day">
						<i class="fa fa-clock-o"></i>
						<strong>${indexList[i].period} 일</strong>
					</span>
					<span>
						<i class="fa fa-pencil"></i>
						<strong>${indexList[i].appCount}명 지원</strong>
					</span>
				</h5>
				<p class="List_contents">${indexList[i].contents}</p>
				<p class="project-sill-list">
					<c:forEach items="${skills}" var="s">
					<c:forEach items="${s.skills}" var="s2">
					<c:if test="${s.projectNum eq indexList[i].projectNum}">
					<span class="project-skill">${s2}</span>
					</c:if>
					</c:forEach>
					</c:forEach>
				</p>
			</div>
			</c:forEach>
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
			<h4 class="process_header">
			FLU 프로세스
			</h4>
			<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/index/프로세스.png" style="padding-bottom: 10px;">
			<div>
				<span>등록 & 선택</span>
				<span>지원자 미팅</span>
				<span>진행 & 스케줄</span>
				<span>프로젝트 완료</span>
				<span>프로젝트 판매</span>
			</div>
		</div>
	</section>
	<section class="join">
		<div class="inner">
			<div class="text-center">
				회원 가입하실래요?
				<a href="#" class="btn" style="color: #fff; background-color: #2099bb; border-color: #1c87a5; margin-left: 25px;">회원가입하기</a>
			</div>
		</div>
	
	</section>
	<section class="advantage">
		<div class="advantage_div">
			<div class="advantage_header" style="text-align: center;">
				<h4 style="font-weight: bold; font-size: 18px; color: #454545;">완전 빠르고 완전 효율적인 FLU!</h4>
			</div>
			<div class="benefit-item">
				<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/index/benefit_first.png">
				<h3 class="benefit-item-title">프로젝트를 무료로 등록 할수 있어요!</h3>
				<p>
					원하는 프로젝트를
					<br>
					쉽고 빠르게 진행할 수 있습니다.
					<br>
					수많은 FLU 프리랜서들에게
					<br>
					당신의 프로젝트를 소개해 보세요.
				</p>
			</div>
			<div class="benefit-item">
				<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/index/benefit_second.png">
				<h3 class="benefit-item-title">원하는 지원자를 쉽게 찾아볼까요?</h3>
				<p style="color: #454545; margin: 0 0 10px;">
					원하는 프로젝트를
					<br>
					쉽고 빠르게 진행할 수 있습니다.
					<br>
					수많은 FLU 프리랜서들에게
					<br>
					당신의 프로젝트를 소개해 보세요.
				</p>
			</div>
			<div class="benefit-item">
				<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/index/benefit_third.png">
				<h3 class="benefit-item-title">대금은 우리가 지켜줄게요!</h3>
				<p>
					원하는 프로젝트를
					<br>
					쉽고 빠르게 진행할 수 있습니다.
					<br>
					수많은 FLU 프리랜서들에게
					<br>
					당신의 프로젝트를 소개해 보세요.
				</p>
			</div>
		</div>
	</section>
	<section class="client">
		<div class="register">
			<div class="text-center" style="color: white;">
				지금 프로젝트를 한번 등록해 보시겠어요?
				<a href="#" class="btn" style="color: #fff; background-color: #2099bb; border-color: #1c87a5; margin-left: 25px;">프로젝트 등록하기</a>
			</div>
		</div>
	</section>
</section>

<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>


</body>
</html>