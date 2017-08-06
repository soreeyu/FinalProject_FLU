<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	min-height: 1000px;
	background-color: #f2f2f2;
}

.page_wrap {
	min-width: 1152px;
	width: 1152px;
	height: 100%;
	margin: 0 auto;
	margin-top: 30px;
}

.left {
	width: 352px;
	height: 100%;
	float: left;
}

.right {
	width: 800px;
	height: 100%;
	float: left;
}



.user {
	width: 248px;
	padding: 15px 30px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}

.user>span {
	font-size: 18px;
	display: block;
	font-weight: bold;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 9px;
}

.user_name {
	display: inline-block;
}

.user_name>img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	float: left;
	border: 1px solid #dedede;
}

.user_name>span {
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}

.user_name>a {
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}

.user_name>a span {
	font-size: 12px;
	color: blue;
}

.history {
	width: 248px;
	padding: 15px 30px;
	background-color: white;
	margin-bottom: 20px
	border: 1px solid #dedede;
}

.history>span:first-child {
	display: block;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 9px;
}

.history>p {
	padding: 7px; font-size : 17px;
	line-height: 25px;
	margin-top: 5px;
	font-size: 17px;
}

.history>p:HOVER {
	cursor: pointer;
}

.title {
	width: 800px;
	height: 100px;
	background-color: white;
	border: 1px solid #dedede;
}

#t1{

	font-size: x-large;
	margin-top: 20px;
	margin-left: 30px;
	font-weight: bolder;
	color: rgb(85, 85, 85);
	
}

#t2{

	font-size: medium;
	margin-top: 15px;
	margin-left: 30px;
	font-weight: normal;
	color: #999;

}

.contents {
	width: 800px;
	height: 100%;
	background-color: white;
	margin-top: 15px;
	border: 1px solid #dedede;
}


</style>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<section class="main_section">
		<section class="page_wrap">
			<article class="left">
				<div class="user">
					<span>프리랜서</span>
					<div class="user_name">
						<img alt="프로필 사진"
							src="${pageContext.request.contextPath}/resources/img/FLU.png">
						<span>닉네임</span> <a><span>기본 정보 수정</span></a>
					</div>
				</div>
				<div class="history">
					<c:if test="${board=='Check' or board=='Fail'}">
						<p id="checkBTN">
							<a id="check" href="./checkProjectCheckList">검수 전 프로젝트</a>
						</p>
						<p id="failBTN">
							<a id="fail" href="./checkProjectFailList">모집실패 프로젝트</a>
						</p>
					</c:if>
					<c:if test="${board=='Wait' or board=='Finish'}">
						<p id="waitBTN">
							<a id="wait" href="./checkProjectWaitList">입금대기 프로젝트</a>
						</p>
						<p id="finishBTN">
							<a id="finish" href="./checkProjectFinishList">프리랜서 대금관리</a>
						</p>
					</c:if>
					<c:if test="${board=='Client' or board=='Freelancer'}">
						<p id="clientBTN">
							<a id="client" href="./checkProjectClientList">클라이언트 관리</a>
						</p>
						<p id="freelancerBTN">
							<a id="freelancer" href="./checkProjectFreelancerList">프리랜서 관리</a>
						</p>
					</c:if>
				</div>

			</article>
			<article class="right">
				<div class="title">
					<c:if test="${board=='Check'}">
						<p id="t1">검수 전 프로젝트</p>
						<p id="t2">클라이언트로부터 등록된 프로젝트를 검수하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='Fail'}">
						<p id="t1">모집종료 프로젝트</p>
						<p id="t2">기간이 완료되어 모집종료된 프로젝트를 보여주는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='Wait'}">
						<p id="t1">입급대기 프로젝트</p>
						<p id="t2">미팅이 완료된 프로젝트를 보여주는 곳입니다. 프로젝트 진행여부를 결정할 수 있습니다.</p>
					</c:if>
					<c:if test="${board=='Finish'}">
						<p id="t1">프리랜서 대금관리</p>
						<p id="t2">프로젝트를 완료한 회원들에게 급여를 지급하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='Client'}">
						<p id="t1">클라이언트 신원확인</p>
						<p id="t2">클라이언트들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='Freelancer'}">
						<p id="t1">프리랜서 신원확인</p>
						<p id="t2">프리랜서들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
				</div>
			


<div class="contents">

	<div class="process-guide-box" style="margin-bottom: 15px;">
		<img
			src="${pageContext.servletContext.contextPath}/resources/img/checkMember/process-guide-success.png"
			style="margin-right: 15px;" />
		<div class="process-guide-up">
			<p class="process-guide-up-title">
				<strong>[ 인증 서류 관리 가이드 ]</strong>
			</p>
			<p class="process-guide-up-content">
				제출한 인증 서류는 <strong style="color: #2099bb"> <a
					href="/privacy/">개인정보 처리방침</a></strong>에 의해 관리됩니다.
			</p>
		</div>

		<div class="process-guide-header-border"></div>
		<div class="process-guide-body-content-box" style="margin-top: 15px;">
			<div class="process-guide-body-image-container">
				<img src="${pageContext.servletContext.contextPath}/resources/img/checkMember/identity_guide_one.png" />
			</div>
			<div class="process-guide-body-paragraph" style="margin-bottom: 0;">
				<p class="process-guide-body-paragraph-title">인증 서류 제출</p>
				<p class="process-guide-body-paragraph-content">
					프로젝트의 계약을 위해, <strong>인증 서류 제출이 꼭 필요합니다.</strong><br /> 신원인증 서류는
					계약서 작성 시에 이용됩니다.
				</p>
			</div>
		</div>
		<table class="process-guide-body-table">
			<tbody>
				<tr>
					<td class="odd">법인 사업자 , 개인 사업자</td>
					<td class="even">사업자 등록증</td>
					<td class="odd">개인 , 팀</td>
					<td class="even" style="border-right: none;">주민등록증, 운전면허증</td>
				</tr>
			</tbody>
		</table>
		<div class="process-guide-body-content-box">
			<div class="process-guide-body-image-container">
				<img src="${pageContext.servletContext.contextPath}/resources/img/checkMember/identity_guide_two.png" />
			</div>
			<div class="process-guide-body-paragraph">
				<p class="process-guide-body-paragraph-title">신원 인증 처리 중</p>
				<p class="process-guide-body-paragraph-content">
					신원 인증 처리에는 <strong>최대 24시간이 소요</strong>됩니다.<br /> 인증 서류에 문제가 있을
					경우에는 <strong>위시켓 팀에서 이메일로 연락</strong>을 드립니다.
				</p>
			</div>
		</div>
		<div class="process-guide-body-content-box">
			<div class="process-guide-body-image-container">
				<img src="${pageContext.servletContext.contextPath}/resources/img/checkMember/identity_guide_three.png" />
			</div>
			<div class="process-guide-body-paragraph">
				<p class="process-guide-body-paragraph-title">신원 인증 처리 완료</p>
				<p class="process-guide-body-paragraph-content">
					신원 인증 서류를 변경하실 경우에는 고객센터로 전화를 주시면 신속하게 도와드립니다.<br /> 고객센터: (02)
					6925-4849
				</p>
			</div>
		</div>
	</div>
</div>
</article>

<form action="./memberCheckInsert" method="post" enctype="multipart/form-data">
<input type="hidden" name="email" value="${member.email}">
<input type="hidden" name="name" value="${member.name}">
<p>파일<input type="file" name="file1"></p>
<button>버튼</button>
</form>
</section>
</section>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>