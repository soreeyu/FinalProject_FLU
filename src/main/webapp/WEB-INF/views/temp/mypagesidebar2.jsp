<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <style type="text/css">
    .free_img_div img{
    	display: inline-block;
    }
    </style>
    <div class="side">
				<div class="freelancer_name">

					<span>클라이언트</span>

					<c:if test="${member.kind eq 'client' }"><span>클라이언트</span></c:if>
					<c:if test="${member.kind eq 'freelancer' }"><span>프리랜서</span></c:if>

					<div class="free_img_div">
						<c:if test="${empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/mypage/avatar.jpg">
						</c:if>
						<c:if test="${not empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/profile/${member.fProfileImage}">
						</c:if>
						<label style="display: block;"><span>${member.nickName}</span></label>
					</div>
				</div>
				<div class="sidebar_menu">
					<ul>
						<li><a id="${active1}" class="menu" href="mypage">클라이언트 정보</a></li>
					</ul>
				</div>
			</div>
			
