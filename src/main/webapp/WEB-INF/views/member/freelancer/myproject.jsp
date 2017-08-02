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
	width: 1152px;
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
	width: 790px;
}

.contents_inner {
	padding: 15px 30px 30px 30px;
	background-color: #fff;
	border-radius: 3px;
}

.title {
	width: 100%;
	height: 100px;
	background-color: white;
	
}

.title>p:FIRST-CHILD {
	float: right;
	margin-top: 7px;
	padding: 6px 12px;
	font-size: 14px;
	text-align: center;
	vertical-align: middle;
	background-color: #66b3ff;
	border-radius: .2em;
	color: white;
	line-height: 1.5;
}

.title>p:FIRST-CHILD {
	margin-top: 20px;
}

.profile_title>p>span {
	font-size: 28px;
	font-weight: bold;
}

.profile_wrap {
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.profile_wrap>p:FIRST-CHILD {
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
}

.no_data_wrap {
	width: 100%;
	height: 170px;
	padding-top: 15px;
	padding-bottom: 15px;
}

.no_data {
	width: 100%;
	height: 100%;
	text-align: center;
	margin: 0 auto;
}

.no_img p {
	font-size: 14px;
	margin-top: 15px;
	color: #999;
}

.no_img p span {
	font-weight: bold;
}

#a {
	color: white;
	background-color: #66b3ff;
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
							<li><a class="menu" id="project_list" href="mypage">나의 프로젝트</a></li>
							<li><a class="menu" id="project_like">관심 프로젝트</a></li>
							<li><a class="menu" id="project_ing">진행중인 프로젝트</a></li>
							<li><a class="menu" id="project_finish">완료된 프로젝트</a></li>
						</ul>
					</div>
				</div>



				<!-- 오른쪽 메인페이지 시작 -->

				<div class="right_main">
					<div class="contents_inner">
						<div class="title">

							<p id="t1">나의 프로젝트</p>
							<p id="t2">나의 전체 프로젝트</p>

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
/*
 project_list 
 project_like
 project_ing
 project_finish*/


</script>
</html>