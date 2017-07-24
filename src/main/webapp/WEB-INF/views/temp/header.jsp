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
					<li><a href="#">프로젝트 등록</a></li>
					<li><a href="#">프로젝트 찾기</a></li>
					<li><a href="#">프리랜서 목록</a></li>
					<li><a href="#">미팅룸 목록</a></li>
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
			<c:when test='${member.kind=="admin"}'>
				<li><a href="${pageContext.request.contextPath}/checkProject/checkProjectWaitList">대금 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/checkProject/checkProjectCheckList">프로젝트 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/checkMember/checkMemberList">회원 관리</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="#">내프로필</a></li>
				<li><a href="#">내커리어</a></li>
				<li><a href="#">프로젝트 관리</a></li>
			</c:otherwise>
			</c:choose>
			
			</ul>
		</div>
	</section>
	</c:if>