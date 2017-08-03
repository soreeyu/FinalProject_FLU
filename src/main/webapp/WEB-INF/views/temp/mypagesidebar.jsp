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
						<li><a id="${active1}" class="menu" href="mypage">전체보기</a></li>
						<li><a id="${active8}" class="menu" href="myinfoView">내 정보</a></li>
						<li><a id="${active2}" class="menu" href="introView">자기 소개</a></li>
						<li><a id="${active3}" class="menu" href="portfolioList">포트폴리오</a></li>
						<li><a id="${active4}" class="menu" href="skillList">보유 기술</a></li>
						<li><a id="${active5}" class="menu" href="carrer">경력, 학력, 자격증</a></li>
						<li><a id="${active6}" class="menu" href="evaluationView">클라이언트의 평가</a></li>
						<li><a id="${active7}" class="menu" href="myproject">내 프로젝트</a></li>
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