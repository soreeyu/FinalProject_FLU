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
					<div class="free_img_div">
						<c:if test="${empty memberDTO.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/mypage/avatar.jpg">
						</c:if>
						<c:if test="${not empty memberDTO.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/profile/${memberDTO.fProfileImage}">
						</c:if>
						<p><span>${memberDTO.nickName }</span></p>
					</div>
				</div>
				<div class="sidebar_menu">
					<ul>
						<li><a id="${active1}" class="menu" href="mypage">클라이언트 정보</a></li>
					</ul>
				</div>
			</div>
			
