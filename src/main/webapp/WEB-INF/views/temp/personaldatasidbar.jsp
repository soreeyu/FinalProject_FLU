<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <div class="side">
				<div class="freelancer_name">
					<span>프리랜서</span>
					<div class="free_img_div">
						<c:if test="${empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/mypage/avatar.jpg">
						</c:if>
						<c:if test="${not empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/profile/${member.fProfileImage}">
						</c:if>
						<label style="display: block;"><span>${member.nickName }</span></label>
					</div>
				</div>
				<div class="sidebar_menu">
					<ul>
						<li><a id="${active1}" class="menu" href="${pageContext.request.contextPath}/member/personaldataView">계정 정보</a></li>
						<li><a id="${active2}" class="menu" href="${pageContext.request.contextPath}/checkMember/memberCheckInsert">신원 인증</a></li>
						<li><a id="${active3}" class="menu" href="${pageContext.request.contextPath}/member/accountView">계좌 관리</a></li>
						<li><a id="${active4}" class="menu" href="#">회원 탈퇴</a></li>
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