<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>

<title>Insert title here</title>
<style type="text/css">
.main_section {
	min-width: 1460px;
	width: 100%;
	min-height: 2050px;
	background-color: #f2f2f2;
}

.page_wrap {
	width: 1152px;
	margin: 0 auto;
}

.page {
	width: 1160px;
	display: inline-block;
	margin-top: 30px;
}

/******************************** 왼쪽 메뉴 *******************************/
.side {
	float: left;
	margin-left: 10px;
	margin-right: 10px;
	width: 250px;
}

.freelancer_name {
	background-color: white;
	padding: 15px;
	margin-bottom: 15px;
}

.freelancer_name>span:FIRST-CHILD {
	font-size: 16px;
	display: block;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	font-weight: 700;
	margin-bottom: 9px;
	color: #454545;
}

.free_img_div {
	width: 220px;
	font-size: 17px;
	color: #333333;
	font-weight: bold;
	text-align: center;
}

.free_img_div img {
	width: 216px;
	height: 216px;
	border: 1px solid #dedede;
	border-radius: 10%;
}

.free_img_div span {
	margin-top: 20px;
}

.sidebar_menu ul {
	border: 1px solid #dedede;
	border-radius: 3px;
	padding: 4px 8px;
	background-color: white;
	margin-bottom: 10px;
}

.sidebar_menu ul li {
	height: 40px;
	padding: 4px 0;
}

.sidebar_menu ul li a {
	border-radius: 2px;
	display: block;
	padding: 10px 15px;
	font-size: 14px;
	color: #999;
	line-height: 1.4;
}
/******************************** 왼쪽 메뉴 *******************************/
.right_main {
	float: left;
	margin-left: 10px;
	margin-right: 10px;
	width: 870px;
}

.contents_inner {
	padding: 15px 30px 30px 30px;
	background-color: #fff;
	border-radius: 3px;
	margin-bottom: 20px;
}

.title {
	width: 100%;
	height: 60px;
	background-color: white;
	
}


.title>p:FIRST-CHILD {
	margin-top: 20px;
}
.project-unit{
	padding: 25px;
	border: 1px solid #eeeeee;
	height: 180px;
	margin-bottom: 10px;
	background-color: white;
}
.project-head{
	height: 27px;
	margin-bottom: 5px;
}
.project-title{
	color: #3385ff;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
}
.project-body{
	width: 100%;
	height: 120px;
}
.project-info{
	width: 100%;
	margin-bottom: 10px;
}
.fa{
	padding-right: 10px;
	padding-left: 10px;
	border-right: 1px solid #dedede;
	font-size: 14px;
	font-weight: bold;
}
.fa-reg_date{
	padding-left: 10px;
	font-size: small;
	color: #ccc;
	font-size: 12px;
	display: inline-block;
}
.project-contents{
	width: 630px;
	color: #999;
	font-size: 13px;
	text-overflow: ellipsis;
	overflow: hidden;
	max-height: 60px;
	float: left;
	height: 53px;
	vertical-align: middle;
	
}
.project-contents-right{
	font-size: 13px;
	width: 150px;
	float: right;
	height: 54px;
	line-height: 13px;
}
.right-contents-sub{
	border-bottom: 1px solid #dedede;
	margin-bottom: 5px;
	height: 20px;
}
.deadline{
	font-weight: bold;
	margin-left: 5px;
}
.project-bottom{
	margin-top: 10px;
	line-height: 2px;
	background-color: white;
}
.main-cate{
	color: #999;
}
.sub-cate{
	border-right: 1px solid #dedede;
	color: #666;
	margin-right: 10px;
	padding-right: 10px;	
}
.skill-box{
	display: inline-block;
}
.skill-title{
	margin-left: 10px;
	color: #666;
}
.skill-name{
	background-color: #a1a7ad;
	padding: 2px 3px;
}
.skill-box span{
	color: #999;
}
.contents_bottom{
	margin-top: 30px;
	width: 100%;
}
.contents_paging{
	width: 380px;
	margin: 0 auto;
	text-align: center;
	font-weight: bold;
}
.num{
	cursor: pointer;
}
#preview{
	cursor: pointer;
}
#nextview{
	cursor: pointer;
}


</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<section class="main_section">
		<div class="page_wrap">
			<div class="page">

				<div class="side">
					<div class="freelancer_name">
						<span>프리랜서</span>
						<div class="free_img_div">
							<c:if test="${empty member.fProfileImage }">
								<img alt="프로필사진"
									src="${pageContext.request.contextPath }/resources/img/FLU.png">
							</c:if>
							<c:if test="${not empty member.fProfileImage }">
								<img alt="프로필사진"
									src="${pageContext.request.contextPath }/resources/profile/${member.fProfileImage}">
							</c:if>
							<p>
								<span>닉네임</span>
							</p>
						</div>

					</div>
					<div class="sidebar_menu">
						<ul>
					
							<li><a class="menu" id="project_app">지원한 프로젝트</a></li>
							<li><a class="menu" id="project_ing">진행중인 프로젝트</a></li>
							<li><a class="menu" id="project_finish">완료된 프로젝트</a></li>
							<li><a class="menu" id="project_end">종료된 프로젝트</a></li>
						</ul>
					</div>
				</div>



				<!-- 오른쪽 메인페이지 시작 -->

				<div class="right_main">
					<div class="contents_inner">
						<div class="title">

							<p id="t1" style="font-size: 18px; font-weight: bold; margin-bottom: 10px;"></p>
							<p id="t2" style="color: #666; font-size: 14px;"></p>

						</div>
					</div>


					<div class="contents">
						<!-- AJAX로 불러올 부분 -->



					</div>

				</div>

			</div>
		</div>

	</section>

	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>

<script type="text/javascript">
/* 기본적인 세팅 */

$.get("myprojectInner?curPage=1&state=app", function(data){
	 alert(data);
		$(".contents").html(data);
		$("#t1").text("지원한 프로젝트");
		$("#t2").text("내가 지원한 프로젝트입니다.");
}); 
	

$("#project_app").click(function() {
	alert("지원한 프로젝트");
	$.get("myprojectInner?curPage=1&state=app", function(data){
		 alert(data);
			$(".contents").html(data);
			$("#t1").text("지원한 프로젝트");
			$("#t2").text("내가 지원한 프로젝트입니다.");
		}); 
});
$("#project_ing").click(function() {
	alert("진행중인 내 프로젝트");
	$.get("myprojectInner?curPage=1&state=ing", function(data){
		 alert(data);
			$(".contents").html(data);
			$("#t1").text("진행중인 프로젝트");
			$("#t2").text("현재 진행중인 프로젝트입니다.");
		}); 
});

$("#project_finish").click(function() {
	alert("완료된 내 프로젝트");
	$.get("myprojectInner?curPage=1&state=finish", function(data){
		 alert(data);
			$(".contents").html(data);
			$("#t1").text("완료된 프로젝트");
			$("#t2").text("프로젝트 완료 후, 지급을 기다리는 프로젝트입니다.");
		}); 
});

$("#project_end").click(function() {
	alert("종료된 내 프로젝트");
	$.get("myprojectInner?curPage=1&state=payFinish", function(data){
		 alert(data);
			$(".contents").html(data);
			$("#t1").text("종료된 프로젝트");
			$("#t2").text("완전히 끝난 프로젝트입니다.");
		}); 
});



</script>
</html>