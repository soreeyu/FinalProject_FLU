<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Insert title here</title>
<style type="text/css">
.main_section{
	min-width: 1460px;
	width: 100%;
	min-height: 2050px;
	background-color: #f2f2f2;
}
.page_wrap{
	width: 1152px;
	margin: 0 auto;
}
.page{
	width: 1152px;
	display: inline-block;
	margin-top: 30px;
}


/******************************** 왼쪽 메뉴 *******************************/
.side{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 250px;
}

.freelancer_name{
	background-color:white;
	padding: 15px;
	margin-bottom: 15px;
}
.freelancer_name > span:FIRST-CHILD{
	font-size: 16px;
	display: block;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	font-weight: 700;
	margin-bottom: 9px;
	color: #454545;
}
.free_img_div{
	width: 220px;
	font-size: 17px;
    color: #333333;
    font-weight: bold;
    text-align: center;
    
}
.free_img_div img{
	width: 216px;
    height: 216px;
    border: 1px solid #dedede;
    border-radius: 10%;
    
}
.free_img_div span{
	margin-top: 20px;
}

.sidebar_menu ul{
	border: 1px solid #dedede;
    border-radius: 3px;
    padding: 4px 8px;
    background-color: white;
    margin-bottom: 10px;
}
.sidebar_menu ul li{
	height: 40px;
    padding: 4px 0;
}
.sidebar_menu ul li a{
	border-radius: 2px;
    display: block;
    padding: 10px 15px;
    font-size: 14px;
    color: #999;
    line-height: 1.4;
    
}
/******************************** 왼쪽 메뉴 *******************************/
.contents{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 790px;
}

.contents_inner{
	padding: 15px 30px 30px 30px;
	background-color: #fff;
    border-radius: 3px;
}
.profile_title{
	border-bottom: 1px dashed #dedede;
	padding-bottom: 25px;
}
.profile_title > p:FIRST-CHILD > a{
	float: right;
	margin-top: 7px;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: #339bff;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
}

.profile_title > p:FIRST-CHILD{
	margin-top: 20px;
}
.profile_title > p > span {
	font-size: 28px;
	font-weight: bold;
}

.profile_wrap{
	margin-bottom: 20px;
}
.profile_wrap > p:FIRST-CHILD{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
}


.no_data_wrap{
	width: 100%;
    padding-top: 15px;
    padding-bottom: 15px;
}


#a{
	background-color: #446eab;
	color: white;
}
.no_data_wrap > p{
	margin-bottom: 10px;
    margin-top: 10px;
	vertical-align: top;
    line-height: 32px;
    font-size: 18px;
    font-weight: bold;
}


.email_guide{
	padding: 15px 10px;
	border: 1px solid #dedede;
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
    margin-left: 20px;
}
.email_guide >div{
	float: left;
}
.email_guide > div p{
	font-size: 15px;
	margin-bottom:5px;
	opacity: 0.7;
}

.no_data_wrap > p > span:LAST-CHILD, .btn span{
	float: right;
	margin-top: 7px;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: #446eab;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
    cursor: pointer;
    margin-right: 10px;
}

.account_form{
	
}
.form{
	margin-bottom: 23px;
	margin-top: 25px;
	line-height: 1;    
	
}
.form > div > span{
	width: 250px;
    margin-right: 17px;
    display: inline-block;
    text-align: right;
    vertical-align: top;
    font-weight: bold;
}
#form label{
	text-align: right;
	padding-top: 7px;
	padding-left: 70px;
    display: inline;
    float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 160px;
    font-weight: bold;
}
#form .form div{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 340px;
}
#form{
	display: inline-block;
}
#form .form{
	margin-bottom: 15px;
	margin-top: 0;
	display: inline-block;
}
.form_control{
	display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.428571429;
    color: #666;
    background-color: #fff;
    background-image: none;
    border: 1px solid #dedede;
    border-radius: 2px;
}
input[type=text]{
	height: 34px;
	width: 100%;
}



</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
		<div class="page_wrap">
		<div class="page">
			<c:import url="/WEB-INF/views/temp/personaldatasidbar.jsp"></c:import>
			
			<div class="contents">
				<div class="contents_inner">
					<section class="profile_title">
						<p><span>계좌 관리</span></p>
					</section>
					<section class="profile_wrap">
						
						<div class="no_data_wrap">
							<div class="email_guide">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/mypage/guide.png">
							<div>
								<p style="font-weight: bold;">[계좌 관리 가이드]</p>
								<p>프로젝트 대금의 안전한 송금을 위해 정확한 계좌번호가 필요합니다.</p>
							</div>
							</div>
							<p><span>등록 계좌</span>
							<c:choose>
							<c:when test="${not empty member.bank }">
								<span class="update">수정</span>
							</c:when>
							<c:otherwise>
							<span class="update" style="display: none;"></span>
							</c:otherwise>
							</c:choose>
							</p>
							
							<c:choose>
							<c:when test="${not empty member.bank }">
								<div class="myaccount_form">
							</c:when>
							<c:otherwise>
								<div class="myaccount_form" style="display: none">
							</c:otherwise>
							</c:choose>
								<div class="bank_name_form form">
									<div class="bank_name">
										<span>은행명</span>
										<label>국민은행</label>
									</div>
								</div>
								<div class="account_name_form form">
									<div class="account_name">
										<span>예금주</span>
										<label>${member.account }</label>
									</div>
								</div>
								<div class="account_number_form form">
									<div class="account_number">
										<span>계좌번호</span>
										<label>${member.accountNumber }</label>
									</div>
								</div>
							</div>
							
							<c:choose>
							<c:when test="${not empty member.bank }">
							<form id="form" action="accountInsert" method="post" style="display: none;">
							</c:when>
							<c:otherwise>
							<form id="form" action="accountInsert" method="post" style="display: inherit;">
							</c:otherwise>
							</c:choose>
								<input type="hidden" name="email" value="${member.email }">
								<div class="form">
									<label>은행명</label>
									<div>
										<select id="bank" class="form_control" name="bank">
											<option value="기업은행">기업은행</option>
											<option value="국민은행">국민은행</option>
											<option value="우리은행">우리은행</option>
											<option value="신한은행">신한은행</option>
											<option value="하나은행">하나은행</option>
											<option value="농협">농협</option>
											<option value="외환은행">외환은행</option>
											<option value="한국씨티은행">한국씨티은행</option>
										</select>
									</div>
								</div>
								<div class="form">
									<label>예금주</label>
									<div>
										<input type="text" id="account" class="form_control" name="account" value="${member.account }">
									</div>
								</div>
								<div class="form">
									<label>계좌번호</label>
									<div>
										<input type="text" id="accountNumber" class="form_control" name="accountNumber" value="${member.accountNumber }">
									</div>
								</div>
								<div class="btn">
									<p>
									<span class="ok">완료</span>
									<c:if test="${not empty member.bank }">
									<span class="cencel">취소</span>
									</c:if>
									</p>
									
								</div>
							</form>
							
						</div>
						
					</section>
					
				</div>
			</div>
		</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
<script type="text/javascript">

	$(".update").click(function() {
		
		$(".myaccount_form").css("display", "none");
		$("#form").css("display", "inline-block");
		$(this).css("display", "none");
	});
	$(".cencel").click(function() {
		$(".myaccount_form").css("display", "block");
		$("#form").css("display", "none");
		$(".update").css("display", "inherit");
	});
	$(".ok").click(function() {
		var number = $("#accountNumber").val();
		var name = $("#account").val();
		
		if(number != "" || name != ""){
			$("#form").submit();
		}else{
			alert('항목을 모두 채워주세요');
		}
	});
	
	var bank = '${member.bank}';
	
	if(bank != ""){
		$("#bank").val(bank);
	}
	
	
</script>

</html>