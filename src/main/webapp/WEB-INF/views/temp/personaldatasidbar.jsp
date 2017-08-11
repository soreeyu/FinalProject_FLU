<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <style type="text/css">
    .free_img_div img{
    	display: inline-block;
    }
    .delete_input{
    	width: 200px !important;
    	height: 34px !important;
    	margin: 0 auto;
    }
    .del_title{
    	width: 250px !important;
    	height: 25px !important;
    	margin: 0 auto;
    }
    </style>
    <div class="side">
				<div class="freelancer_name">
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
						<li><a id="${active1}" class="menu" href="${pageContext.request.contextPath}/member/personaldataView">계정 정보</a></li>
						<li><a id="${active2}" class="menu" href="${pageContext.request.contextPath}/checkMember/memberCheckInsert">신원 인증</a></li>
						<li><a id="${active3}" class="menu" href="${pageContext.request.contextPath}/member/accountView">계좌 관리</a></li>
						<li><a id="${active4}" class="menu" href="#" data-toggle="modal" data-target="#memberDelete">회원 탈퇴</a></li>
					</ul>
				</div>
			</div>
			
	<div class="modal fade" id="memberDelete" role="dialog">
		<div class="modal-dialog">
    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title del_title">비밀번호를 다시 입력해주세요</h4>
	        </div>
	        <div class="modal-body">
	        <form id="delform" action="/flu/member/memberDelete" method="post">
	        <input id="hiddenNum" type="hidden" name="email" value="${member.email }">
	        <p><input type="password" id="pw" name="pw" class="form-control delete_input"></p>
	        </form>
	        </div>
	        <div class="modal-footer">
	        	<button class="okbtn btn btn-default" type="button" class="btn btn-default">확인</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
	      </div>
      
    	</div>
	</div>
			
			<script type="text/javascript">
				
				
				$(".okbtn").click(function() {
					var pw = $("#pw").val();
					var email = '${member.email}';
					$.ajax({
						url:"pwCheck",
						type:"post",
						data:{
							pw:pw,
							email:email
						},
						success:function(data){
							alert('비번:'+data)
							if(data == pw){
								alert('비번 맞음');
								$("#delform").submit();
							}else{
								alert("비밀번호가 다릅니다.");
							}
						}
					});
					
				});
				
				
			
			</script>