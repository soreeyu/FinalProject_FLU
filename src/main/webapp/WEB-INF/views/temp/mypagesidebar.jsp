<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <div class="side">
				<div class="freelancer_name">
					<span>프리랜서</span>
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
						<li><a id="${active1}" class="menu" href="mypage?email=${email }">전체보기</a></li>
						<c:if test="${member.email eq email }">
						<li><a id="${active8}" class="menu" href="myinfoView?email=${email }">내 정보</a></li>
						</c:if>
						<li><a id="${active2}" class="menu" href="introView?email=${email}">자기 소개</a></li>
						<li><a id="${active3}" class="menu" href="portfolioList?email=${email}">포트폴리오</a></li>
						<li><a id="${active4}" class="menu" href="skillList?email=${email}">보유 기술</a></li>
						<li><a id="${active5}" class="menu" href="carrer?email=${email}">경력, 학력, 자격증</a></li>
						<li><a id="${active6}" class="menu" href="evaluationView?email=${email}">클라이언트의 평가</a></li>
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