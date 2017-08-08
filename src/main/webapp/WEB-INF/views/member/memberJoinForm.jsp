<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<style type="text/css">
.main_section{
	min-width: 1460px;
	width: 100%;
	height: 800px;
}
.main_wrap{
	width: 1152px;
	margin: 0 auto;
}
.header_section{
	margin-top: 20px;
	padding: 30px;
	margin-bottom: 10px;
	background-color: white;
	border: 1px solid #dedede;
	box-shadow: 1px 2px 0px 0px lightgray;
}
.contents_section{
	padding: 30px;
	background-color: white;
	border: 1px solid #dedede;
	box-shadow: 1px 2px 0px 0px lightgray;
}
form{
	display: inline-block;
	width: 600px;
	border-right: 1px solid #dedede;
}
form p{
	width: 600px;
	display: inline-block;
}


form p label:FIRST-CHILD{
	display: inline-block;
	width: 100px;
	text-align: right;
	margin-right: 30px;
}

.p_label{
	color: red;
	font-size: 14px;
	width: 570px;
	padding-left: 130px;
	margin-top: 10px;
	margin-bottom: 10px;
}
.kind_r{
	min-width: 190px;
	min-height: 137px;
	display: inline-block;
	cursor: pointer;
}
.r_wrap{
	width:100%;
	margin-top: 80px;
	display: inline-block;
	vertical-align: bottom;
	text-align: center;
}


.client_l{
	background: url(/flu/resources/img/member/client.png) no-repeat;
}
.freelancer_l{
	background: url(/flu/resources/img/member/freelancer.png) no-repeat;
}
.r_s{
	display: inline-block;
	margin-top: 5px;
	width: 100%;
	font-size: 14px;
	text-align: center;
	font-weight: bold;
}
.r_s span:LAST-CHILD {
	font-size: 12px;
	display: inline-block;
	margin-top: 3px;
	font-weight: bold;
	opacity: 0.6;
}

input[type=text],input[type=password]{
	padding: 5px;
	width: 370px;
}

.login_plus{
	margin-top: 25px;
	margin-left: 40px;
    padding-top: 25px;
    border-top: 1px dashed #dedede;
    font-size: 16px;
    font-weight: bold;
    padding-bottom: 25px;
    border-bottom: 1px dashed #dedede;
    margin-bottom: 30px;
    padding-left: 0;
}

.flu_intro p{
	text-align: center;
    font-size: 14px;
    color: #666;
    line-height: 30px;
    margin-top: 25px;
}
.flu_intro p span{
	font-size: 21px;
	font-weight: bold;
}
strong{
	font-weight: bold;
	font-size: 17px;
}
#btn_member{

	width: 470px;
	height: 45px;
	display: block;
	margin: 0 auto;
	cursor: pointer;
	background-color: #dedede;
}
.login_11{
	color: #b3b3ff;
}

</style>
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	<section class="main_section">
	<div class="main_wrap">
	<div class="header_section">
		<p>회원가입</p>
		<p>FLU에 오신것을 환영합니다.</p>
	</div>
	<div class="contents_section">
	<form id ="form" action="MemberJoin" method="post">
		<p>
			<label style="vertical-align: top;">
				이용목적 
			</label>
			<label class="kind_r client_l">
				<span class="r_wrap"><input type="radio" class="kind" name="kind" value="client"></span>
				<span class="r_s"><span>클라이언트</span>
				<br><span>프로젝트를 의뢰하고싶습니다.</span>
				</span>
			</label>
			<label class="kind_r freelancer_l">
				<span class="r_wrap"><input type="radio" class="kind" name="kind" value="freelancer"></span>
				<span class="r_s"><span>프리랜서</span>
				<br><span>일거리를 찾고싶습니다.</span>
				</span>
			</label>
		</p>
		<p class="p_label" id="p_kind"></p>
		<p class="p_con">
		<label>E-mail</label> <label><input type="text" id="email" name="email" required="required">
		
		</label></p>
		<p class="p_label" id="p_email"></p>
		<p class="p_con"><label>NickName</label> <label><input type="text" id="nickName" name="nickName" required="required"></label></p>
		<p class="p_label" id="p_nickname"></p>
		<p class="p_con"><label>PW</label><label> <input type="password" id="pw" name="pw" required="required"></label></p>
		<p class="p_label" id="p_pw"></p>
		<p class="p_con"><label>PWCK</label><label> <input type="password" id="pwck" name="pwck" required="required"></label></p>
		<p class="p_label" id="p_pwck"></p>
		<p><input type="button" id="btn_member" value="회원 가입"></p>
	</form>
	<div style="display: inline-block; vertical-align: top; width: 450px; text-align: center;">
	<div>
		<p class="login_plus">이미 회원 이신가요? <a class="login_11" href="${pageContext.request.contextPath }/member/login">로그인</a></p>
	</div>
	<div class="flu_intro">
		<p><span>${memberList.client.size() }</span>개의 <strong>클라이언트 기업</strong>과</p>
		<p><span>${memberList.freelancer.size() }</span>개의 <strong>개발회사 & 프리랜서</strong>가</p>
		<p>함께하는 온라인 아웃소싱 플랫폼 <strong>FLU</strong></p>
	</div>
	</div>
	</div>
	</div>
	</section>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	
	
	$(".kind").click(function() {
		var kind = $(this).val();
	if(kind == 'freelancer'){
		$(".freelancer_l").css("background", "url(/flu/resources/img/member/freelancer2.png) no-repeat");
		$(".client_l").css("background", "url(/flu/resources/img/member/client.png) no-repeat");
	}else{
		$(".freelancer_l").css("background", "url(/flu/resources/img/member/freelancer.png) no-repeat");
		$(".client_l").css("background", "url(/flu/resources/img/member/client2.png) no-repeat");
	}
	});
	
$("#btn_member").click(function() {
	var kind = $("input:radio[name='kind']:checked").val();
	var email = $("#email").val();
	var emailTest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var nickName = $("#nickName").val();
	var pw = $("#pw").val();
	var pwck = $("#pwck").val();
	
	var check1 = 0;
	var check2 = 0;
	var check3 = 0;
	var check4 = 0;
	var check5 = 0;
	
	var jungbokEmail = "";
	
	
	
	if(kind == undefined){
		$("#p_kind").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>둘 중에 한 항목을 선택해 주세요.</label>");
		check1 = 0;
	}else{
		$("#p_kind").html("");
		check1 = 1;
	}
	 
	if(!emailTest.test(email)){
		$("#p_email").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>유효한 E-mail을 입력해 주세요</label>");
		check2 = 0;
	}else{
		if(jungbokEmail == email){
			
		}else{
			$("#p_email").html("");
			check2 = 1;
		}
			
	}
	
	if(nickName.length < 6){
		$("#p_nickname").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>6글자 이상 입력해 주세요. (입력하신 내용은 "+nickName.length+"글자입니다.)</label>");
		check3 = 0;
	}else{
		$("#p_nickname").html("");
		check3 = 1;
	}
	
	if(pw == pwck && pw.length > 7 && pwck.length > 7){
		
		$("#p_pw").html("");
		$("#p_pwck").html("");
		check4 = 1;
		
	}else{	
		
		if(pw.length < 8){
			$("#p_pw").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>8글자 이상 입력해 주세요 (입력하신 내용은 "+pw.length+"글자입니다.)</label>");
		}else if(pwck.length < 8){
			$("#p_pwck").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>8글자 이상 입력해 주세요 (입력하신 내용은 "+pwck.length+"글자입니다.)</label>");
		}else{
			$("#p_pw").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>비밀번호가 일치하지 않습니다.</label>");
			$("#p_pwck").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>비밀번호가 일치하지 않습니다.</label>");
		}
		check4 = 0;
		
	}
	if(check1 == 1 && check2 == 1 && check3 ==1 && check4 ==1){
		$.ajax({
			url:"jungbokCK",
			type:"post",
			data:{
				email:email
			},
			success:function(data){
				if(data == email){
					$("#p_email").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>입력하신 E-mail은 이미 사용중 입니다.</label>");
					
				}else{
					$("#form").submit();
				}
			}
		});
	}else{
	}
	
});

</script>
</html>