<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

.p_label{
	color: red;
	font-size: 14px;
}

</style>
<title>Insert title here</title>
</head>
<body>

	<h1>MemberJoinForm</h1>
	<div>
	<form action="MemberJoin" method="post">
		<p> 클라이언트 : <input type="radio" class="kind" name="kind" value="client"> 프리랜서 : <input type="radio" class="kind" name="kind" value="freelancer"></p>
		<p class="p_label" id="p_kind"></p>
		<p>E-mail : <input type="text" id="email" name="email" required="required"></p>
		<p class="p_label" id="p_email"></p>
		<p>NickName : <input type="text" id="nickName" name="nickName" required="required"></p>
		<p class="p_label" id="p_nickname"></p>
		<p>PW : <input type="password" id="pw" name="pw" required="required"></p>
		<p class="p_label" id="p_pw"></p>
		<p>PWCK : <input type="password" id="pwck" name="pwck" required="required"></p>
		<p class="p_label" id="p_pwck"></p>
		<p><input type="button" id="btn_member" value="회원 가입"></p>
	</form>
	</div>
</body>
<script type="text/javascript">
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
	 /* $.ajax({
		url:"jungbokCK",
		type:"post",
		data:{
			email:email
		},
		success:function(data){
			alert(data);
		}
	})  */
	
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
		$("#p_email").html("");
		check2 = 1;
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
		alert("회원가입 성공!");
	}
	
});

</script>
</html>