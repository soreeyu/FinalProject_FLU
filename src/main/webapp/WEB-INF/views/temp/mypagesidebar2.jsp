<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <div class="side">
				<div class="freelancer_name">
					<span>프리랜서</span>
					<div class="free_img_div">
						<c:if test="${empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/FLU.png">
						</c:if>
						<c:if test="${not empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/profile/${member.fProfileImage}">
						</c:if>
						<p><span>${member.nickName }</span></p>
					</div>
				</div>
				<div class="sidebar_menu">
					<ul>
						<li><a id="${active1}" class="menu" href="mypage">클라이언트 정보</a></li>
						<li><a id="${active2}" class="menu" href="history">프로젝트 히스토리</a></li>
					</ul>
				</div>
			</div>
			
			<script type="text/javascript">
				
			
				$(".menu").mouseover(function() {
					var id = $(this).attr("id");
				
					if(id != 'a'){
					$(this).css("background-color", "#ccddff");
					}
				});
				$(".menu").mouseleave(function() {
					var id = $(this).attr("id");
					
					if(id != 'a'){
					$(this).css("background-color", "white");
					}
				});
				
				
			
			</script>