<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">

.main_section{
	min-width: 1460px;
	width: 100%;
	height: 700px;
}
.main_wrap{
	width: 1152px;
	margin: 0 auto;
	
}
.massage_wrap{
	padding: 30px;
	background-color: white;
	margin-top: 30px;
	border: 1px solid #dedede;
	box-shadow: 1px 2px 0px 0px lightgray;
}
.massage_wrap p{
	margin-bottom: 10px;
}
.massage_wrap p:FIRST-CHILD label{
	font-size: 24px;
	font-weight: bold;
}
.massage_wrap p:LAST-CHILD label{
	font-size: 16px;
	opacity: 0.6;
}
.email_page_wrap{
	padding: 30px;
	background-color: white;
	margin-top: 30px;
	border: 1px solid #dedede;
	box-shadow: 1px 2px 0px 0px lightgray;
}
.email_page{
	padding: 20px;
}
.ckck{
	float: left;
}
.email_page > img{
	margin-left: 180px;
}

.re_email_wrap{
	margin-top: 30px;
	margin-bottom: 20px;
}
.re_email{
	font-weight: bold;
	font-size: 15px;
	margin-bottom: 15px;
}





.email_guide{
	padding-top: 30px;
	border-top: 1px solid #dedede;
}
.email_guide:AFTER{
	content: " ";
    display: table;
    line-height: 0;
	clear: both;
}
.email_guide img{
	float: left;
    margin-right: 20px;
}
.email_guide >div{
	float: left;
}
.email_guide > div p{
	font-size: 15px;
	margin-bottom:5px;
	opacity: 0.7;
}

</style>

</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
	
		<div class="main_wrap">
			<div class="massage_wrap">
				<p>
					<label >${title }</label>
				</p>
				<p>
					<label>${message }</label>
				</p>
			</div>
			<div class="email_page_wrap">
				<div class="email_page">
					<div class="ckck">
						<p style="margin-bottom: 10px;">${member.nickName }님,</p>
						<p>가입하신 이메일 주소(${member.email })로 인증메일을 보내드렸습니다.</p>
						<p>이메일 인증을 한 후에 정상적인 서비스 이용이 가능합니다.</p>
						
						<div class="re_email_wrap">
							<p class="re_email">
								혹시 인증 메일을 못 받으셨나요?
							</p>
							<form id="form" action="re_email" method="post">
								<input type="hidden" name="email" value="${member.email }">
								<input type="button" id="btn" value="인증메일 다시받기">
							</form>
						</div>
						<div class="email_guide">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/guide.png">
							<div>
								<p>1.이메일의 인증 링크를 클릭해 주시면 가입이 승인됩니다.</p>
								<p>2.인증 메일이 스팸함으로 가는 경우도 있으니 확인해 주세요.</p>
							</div>
						</div>
					</div>
					<img alt="" src="${pageContext.request.contextPath }/resources/img/E-mail.jpg">
				</div>
			</div>
		</div>
	
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$("#btn").click(function() {
		$("#btn").attr("disabled", "disabled");
		$("#btn").attr("value", "이메일 전송중");
		$("#form").submit();
	});
</script>
</html>
