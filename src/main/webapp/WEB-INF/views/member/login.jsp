<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.header_wrap{
	margin-bottom: 30px;
}
.main_section{
	min-width: 1460px;
	width: 100%;
	height: 900px;
	background-color: #f2f2f2;
}
.login_wrap{
	width: 1152px;
	height: 600px;
	margin: 0 auto;
}
input[type=text], input[type=password]{
	height: 34px;
	width: 50%;
}
.margin{
	width: 100%;
	height: 30px;
}

.login_div{
	background-color: white;
}

.login_title{
	padding: 30px;
	margin-bottom: 15px;
	border: 1px solid #dedede;
	border-bottom: 2px solid #dedede;
	border-radius: 3px;
}
.login_title label{
	font-size: 25px;
	font-weight: bold;
}
.login_title p{
	margin-top: 10px;
}

.login_form_wrap{
	background-color: white;
}
.login_form{
	padding: 30px;
	margin-bottom: 15px;
	border: 1px solid #dedede;
	border-bottom: 2px solid #dedede;
	border-radius: 3px;
}
.login_form2{
	width: 540px;
	display: inline-block;
	margin-right: 50px;
	padding-right: 50px;
	border-right: 1px solid #e1e1e1;
}
.login_form label{
	width: 150px;
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    text-align: right;
    padding-top: 7px;
}
.login_form p{
	margin-bottom: 10px;
}

.p_label{
	color: red;
	font-size: 14px;
	padding-left: 141px;
	
}
.p_label label{
	float: inherit;
	display: inline;
}

.login_btn_div{
	padding-left: 160px;
    margin-left: 10px;
    margin-right: 10px;
    width: 440px;
    
}
#btn{
	width: 240px;
	padding: 10px 0 10px 0;
	background-color: gray;
	font-size: 18px;
	color: white;
	line-height: 1.33;
}
.find_pw{
	margin-top: 20px;
	font-size: 14px;
	color: #555;
}
.find_pw a{
	font-weight: bold;
	color: red;
}

.sign_up{
	float: right;
	width: 490px;
}
.sign_up img{
	width: 100%;
	margin-top: 30px;
}
.sign_up p{
	margin-top: 30px;
	font-weight: bold;
	font-size: 18px;
}
.sign_up p span{
	padding-left: 90px;
}
.sign_up p a{
	padding-left: 20px;
	color: rgb(68, 110, 171);
}
.pwguidebtn{
	background-color: #339bff;
	color: white;
	border: 0;
	border-radius: 10px;
	box-shadow: 2px 1px 0 0 #dedede;
}
.pwcencelbtn{
	background-color: #94a2af;
	color: white;
	border: 0;
	border-radius: 10px;
	box-shadow: 2px 1px 0 0 #dedede;
}
#ppp{
	cursor: pointer;
	color: red;
	margin-left: 7px;
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
	<div class="margin"></div>
	<div class="login_wrap">
	<div class="login_div">
		<div class="login_title">
			<label>로그인</label>
			<p><span>저희 홈페이지에 오신것을 환영합니다.</span></p>
		</div>
	</div>
	
	<c:if test="${message eq 0 }">
		<div class="login_div">
			<div class="login_title">
				<p><span>올바른 이메일과 비밀번호를 입력하십시오.</span></p>
			</div>
		</div>
		
	</c:if>
	
	<div class="login_form_wrap">
	<div class="login_form">
	<form id="form" action="login" method="post">
		<div class="login_form2">
		<p><label><span style="color: red; font-weight: bold;">*</span>이메일</label> <input class="text_css" type="text" name="email" id="email"></p>
		<p><label><span style="color: red; font-weight: bold;">*</span>비밀번호</label> <input class="text_css" type="password" name="pw" id="pw"></p>
		<p class="p_label" id="p_pw"></p>
		<div class="login_btn_div">
		<p><input id="btn" type="button" value="로그인"></p>
		<p class="find_pw"><span>비밀번호를 잊으셨나요?</span><span id="ppp" data-toggle="modal"data-target="#pwguide">비밀번호 찾기</span></p>
		</div>
		</div>
		<div class="sign_up">
			<div>
				<div>
					<img src="${pageContext.request.contextPath}/resources/img/logo3.png">
				</div>
				<p><span>아직 회원이 아니신가요?</span><a href="MemberJoin">회원 가입</a></p>
			</div>
		</div>
	</form>
	</div>
	</div>
	</div>
	</section>
	
	<!-- 모달 -->
	<div class="modal fade" id="pwguide" role="dialog">
		<div class="modal-dialog">
    
	      <!-- Modal content-->
	      <div class="modal-content" style="border-radius: 10px;">
	        <div class="modal-header" style="color: white; background-color: rgb(68, 110, 171); border-top-left-radius: 10px; border-top-right-radius: 10px;">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title" style="font-weight:bold;">비밀번호를 찾으실 아이디를 입력해주세요</h4>
	        </div>
	        <div class="modal-body">
	        <p><input type="text" id="email2" class="form-control delete_input"></p>
	        </div>
	        <div class="modal-footer">
	        	<label id="wait" style="float: left; font-weight: bold; font-size: 20px;display: none;">잠시만 기다려주세요.</label>
	        	<button class="pwguidebtn btn btn-default" type="button" class="btn btn-default">확인</button>
	          <button type="button" class="pwcencelbtn btn btn-default" data-dismiss="modal">취소</button>
	        </div>
	      </div>
      
    	</div>
	</div>
	
<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

</body>
<script type="text/javascript">
$("#pw").keydown(function() {
	if(event.keyCode == 13){
		var pw = $("#pw").val();
		
		if(pw == ""){
			$("#p_pw").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>항목을 채워주세요</label>");
		}else if(pw.length < 8){
			$("#p_pw").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>8글자 이상 입력해 주세요 (입력하신 내용은 "+pw.length+"글자입니다.)</label>");
		}else{
			$("#form").submit();
		}
	}
});
	$("#btn").click(function() {
		var pw = $("#pw").val();
		
		if(pw == ""){
			$("#p_pw").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>항목을 채워주세요</label>");
		}else if(pw.length < 8){
			$("#p_pw").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>8글자 이상 입력해 주세요 (입력하신 내용은 "+pw.length+"글자입니다.)</label>");
		}else{
			$("#form").submit();
		}
	});
	//이메일 인풋텍스트 초기화
	$("#ppp").click(function() {
		$("#email2").val("");
	});
	
	$(".pwguidebtn").click(function() {
		var email = $("#email2").val();
		
		$("#wait").css("display", "inline-block");
		if(email != ""){
			$.ajax({
				url:"/flu/member/pwguide",
				type:"post",
				data:{
					email:email
				},
				success:function(data){
					if(data == email){
						$("#wait").css("display", "none");
						alert("입력하신 이메일로 임시 비밀번호를 보내드렸습니다.");
						location.href="/flu/member/login";
					}else{
						$("#wait").css("display", "none");
						alert("입력하신 이메일이 없습니다.");
					}
				}
			});
		}else{
			$("#wait").css("display", "none");
			alert("이메일을 입력해 주세요");
		}
	});

</script>
</html>