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
	height: 2400px;
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
			<h1 class="invitation-heading">안전적, 효율적, 획기적인 플랫폼 제공</h1>
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
			FLU 프로세스
			<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/index/프로세스.png">
		</div>
		<div class="advantage_div">
			장점
		</div>
	</section>
</section>

<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>


</body>
</html>