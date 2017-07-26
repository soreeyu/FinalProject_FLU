<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <div class="side">
				<div class="freelancer_name">
					<span>프리랜서</span>
					<div class="free_img_div">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/FLU.png">
						<p><span>닉네임</span></p>
					</div>
				</div>
				<div class="sidebar_menu">
					<ul>
						<li><a id="${active1}" class="menu" href="${pageContext.request.contextPath}/member/personaldataView">계정 정보</a></li>
						<li><a id="${active2}" class="menu" href="${pageContext.request.contextPath}/checkMember/memberCheckInsert">신원 인증</a></li>
						<li><a id="${active3}" class="menu" href="#">계좌 관리</a></li>
						<li><a id="${active4}" class="menu" href="#">회원 탈퇴</a></li>
					</ul>
				</div>
			</div>
			
			<script type="text/javascript">
				
			
				$(".menu").mouseover(function() {
					var id = $(this).attr("id");
				
					if(id != 'a'){
					$(this).css("background-color", "#dedede");
					}
				});
				$(".menu").mouseleave(function() {
					var id = $(this).attr("id");
					
					if(id != 'a'){
					$(this).css("background-color", "white");
					}
				});
				
				
			
			</script>