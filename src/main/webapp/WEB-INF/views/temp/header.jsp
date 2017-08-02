<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <header>
	<div class ="header">
		<div class="header_wrap">
			<div class="header_logo">
				<a href="${pageContext.request.contextPath}"><img alt="FLU로고" src="${pageContext.request.contextPath}/resources/img/FLU.png"></a>
			</div>
			<div class="header_menu">
				<ul>
					<c:if test="${not empty member && member.kind eq 'client' }">
					<li><a href="${pageContext.request.contextPath}/project/projectInsert">프로젝트 등록</a></li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/project/projectList">프로젝트 찾기</a></li>
					<li><a href="${pageContext.request.contextPath}/member/freelancerList">프리랜서 목록</a></li>
					<li><a href="${pageContext.request.contextPath}/meetRoom/meetList?curPage=1&perPage=10">미팅룸 목록</a></li>
				</ul>
				<span class="header_right">
					<c:choose>
					<c:when test="${empty member }">
					<span class="header_login">
						<a href="${pageContext.request.contextPath}/member/login">로그인</a>
					</span>
					<span class="header_sign_up">
						<a href="${pageContext.request.contextPath}/member/MemberJoin">회원가입</a>
					</span>
					</c:when>
					<c:otherwise>		
					<span class="alarmCount" style="font-size: 15px; margin-top: 15px;"></span>
					<span>
						<a href="${pageContext.request.contextPath}/alarm/alarmList"><img style="width:30px; height: 30px;"   id="alram_img" alt="" src="${pageContext.request.contextPath}/resources/img/alarm/alarm.png"></a>
					</span>
					<span class="header_sign_up">	
						<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
					</span>
					</c:otherwise>
					</c:choose>
					
					
				</span>
			</div>
		</div>
	</div>

</header>
	<c:if test="${not empty member }">
	<section class="profile_section">
		<div class="profile_div">
			<ul>
			<c:choose>
			<c:when test="${member.type=='admin'}">
				<li><a href="${pageContext.request.contextPath}/checkProject/checkProjectWaitList">대금 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/checkProject/checkProjectCheckList">프로젝트 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/myMeetRoom">미팅룸 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/checkMember/checkMemberClientList">회원 관리</a></li>
			</c:when>
			
			<c:when test="${member.kind eq 'freelancer' }">
				<li><a href="${pageContext.request.contextPath}/member/personaldataView">계정 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/mypage">내 프로필</a></li>
				<li><a href="${pageContext.request.contextPath}/member/freelancer/myproject">프로젝트 관리</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/member/personaldataView">계정 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/mypage">내 프로필</a></li>
				<li><a href="${pageContext.request.contextPath}/member/client/clientproject">프로젝트 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/myMeetRoom">미팅룸 관리</a></li>
			</c:otherwise>
			</c:choose>
			
			</ul>
		</div>
	</section>
	</c:if>	
	
<script type="text/javascript">

	$.ajax({
		url : "${pageContext.request.contextPath}/alarm/alarmCount",
		type : "POST",
		success : function(data) {
			$(".alarmCount").html("새로운 소식 ["+data+"]");
		} 
	})
</script>    