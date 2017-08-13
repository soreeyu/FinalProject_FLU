<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../../temp/bootstrap.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$(".credit").hide();
		
		
		
		var credit_Info = document.getElementsByClassName("credit_Info");
		var digit_Info = document.getElementsByClassName("digit_Info");
		
		$("#creditCard").click(function() {
			$(".credit").show();
		});
		
		$("#btn").click(function() {
			var card = $("input:radio[name='payment']").is(":checked");
			var type = $("input:radio[name='type']").is(":checked");
			if(card){
				if(type){
					if(credit_Info[0].value==""){
						alert("카드를 선택하세요.");
					}else if(credit_Info[1].value==""){
						alert("카드번호를 입력하세요.");
					}else if(credit_Info[2].value==""){
						alert("유효기간을 입력하세요.(월)");
					}else if(credit_Info[3].value==""){
						alert("유효기간을 입력하세요.(년)");
					}else if(credit_Info[4].value==""){
						alert("비밀번호를 입력하세요.");
					}else{
						var result = confirm("예약하시겠습니까?");
						if(result){
							$("#frm").submit();
						}				
					}				
				}else {
					alert("카드 유형을 선택하세요.(개인/법인)");
				}
			}else {
				alert("결제 방법을 선택하세요.");
			}
			
			
			
			
			
		});
		
		$("#discount").click(function() {
			var kind = '${member.kind}';
			var email = '${member.email}';
			
				$.ajax({
					url : "reserveDiscount",
					type : "POST",
					data : {email:email},
					success: function(data) {
						var result = data;
						alert(result.trim());
						$(".list").html(result.trim());
						if(result!='조건에 충족하지 못하여 10% 할인 받을 수 없습니다.'){
							$("#price").val(($("#price").val()*1)*0.9);
							$(".disCount_Price").html($("#price").val());
							
						}
					}
				})
			
			
		});
		
		
		
		
	})
</script>
<style type="text/css">
.main_section{
	min-width : 1152px;
	width : 60%;
	height: 2000px;
	margin : 0 auto;
}
.container {
	margin-top:50px;
	border-radius: 12px;
	background: #fff;
	padding: 24px 26px 26px;
}
.pop_tit{
	margin-top: 20px;
    font-size: 30px;
    font-weight : bold;
    line-height: 44px;
    color: #000;
    text-align: center;
}
.reserve_price{
	margin-top: 40px;
    background: #fff;
    border-top: 3px solid #339bff;
}
.reserve_pirce_wrap {
	padding: 0 20px;
    background: #fff;
    border-bottom: 1px solid #ccc;
}
.reserve_price_wrap li {
    padding: 20px 0 18px 100px;
    font-size: 16px;
}
.reserve_price_wrap li {
    position: relative;
    padding: 14px 0 12px 72px;
    font-size: 12px;
    text-align: right;
    border-top: 1px solid #ebebeb;
}
.reserve_price_wrap li:first-child {
    border-top: 0;
}
.reserve_price_wrap .tit {
    position: absolute;
    left: 0;
    color: black;
    font-size: 1.6em;
    font-weight: bold;
}
.reserve_price_wrap .data {
    color: #656565;
    font-size: 1.5em;
}
.info_right{
	padding: 30px;
}

</style>
</head>
<body>
<c:import url="../../temp/header.jsp"/>
<section class="main_section">
	<div class="container">
	<p class="pop_tit">예약 내용을 확인해주세요</p>
	<form action="reservePay" id="frm" method="post">
	<div class="reserve_price">
		<ul class="reserve_price_wrap">
			<li>
				<span class="tit">
					예약공간				
				</span>
				<span class="data">
					${reserveInfo.name}
				</span>
			</li>
			<li>
				<span class="tit">
					예약시간
				</span>
				<span class="data">
					${time[0]}시 ~ ${time[1]+1}시, ${time[1]+1-time[0]}시간
				</span>
			</li>
			<li>
				<span class="tit">
					예약인원
				</span>
				<span class="data">
					${reserveInfo.human}
				</span>	 
			</li>
			<li>
				<span class="tit">
					결제예정금액
				</span>
				<span class="data disCount_Price">
					${reserveInfo.price}
				</span>
			 
			</li>
			<li>
				<span class="tit">
					예약자 이름
				</span>
				<span class="data">
			 		${reserveInfo.reserve_name}
				</span>
			</li>
			<li>
				<span class="tit">
					연락처
				</span>
				<span class="data">
					${reserveInfo.phone}
				</span>
			</li>	
		</ul>
	</div>
	<hr>
	<br>
	<div class="discount_btn_box">
		<label class="btn">
			<span><h1 id="discount">할인받기</h1></span>
		</label>
		<div class="list">
			
		</div>
	</div>
	<br>
	<h1>결제방법</h1>
	<!-- 결제 방법 선택시 ajax로 각 결제 방법에 맞는 정보 입력하는 창 불러오기 -->
	<input type="radio" name="payment" value="신용카드" id="creditCard">
	신용카드
		<input type="hidden" name="name" value="${reserveInfo.name}">
		<input type="hidden" name="reserve_date" value="${reserveInfo.reserve_date}">
		<input type="hidden" name="time" value="${reserveInfo.time}">
		<input type="hidden" name="reserve_name"  value="${reserveInfo.reserve_name}">
		<input type="hidden" name="price"  value="${reserveInfo.price}" id="price">
		<input type="hidden" name="human"  value="${reserveInfo.human}">
		<input type="hidden" name="phone"  value="${reserveInfo.phone}">
		<input type="hidden" name="email"  value="${reserveInfo.email}">
		<input type="hidden" name="snum"  value="${reserveInfo.snum}">	
	</form>
	</div>
	
	<div class="container">
		<div class="credit">
			<div class="type" style="height: 50px;">
				<span>
					<input type="radio" name="type"> 개인
				</span>
				<span>
					<input type="radio" name="type"> 법인
				</span>
				<select class="credit_Info" style="height: 25px;">
					<option value="신한카드">신한카드</option>
					<option value="현대카드">현대카드</option>
					<option value="비씨카드">비씨카드</option>
					<option value="삼성카드">삼성카드</option>
					<option value="롯데카드">롯데카드</option>	
				</select>
			</div>
			<div class="card_contents">
				<table>
					<tr>
						<td class="info_left">카드번호</td>
						<td class="info_right"><input type="text" placeholder="카드번호 입력 '-'제외" class="credit_Info" style="height: 30px;"> </td>
					</tr>
					<tr>
						<td class="info_left">유효기간</td>
						<td class="info_right"><input type="text" placeholder="월" class="credit_Info month" style="width: 50px; height: 30px;"> <input type="text" placeholder="년" class="credit_Info year" style="width: 50px; height: 30px;"> </td>
					</tr>
					<tr>
						<td class="info_left">비밀번호</td>
						<td class="info_right"><input type="text" placeholder="비밀번호" class="credit_Info" style="height: 30px;"> </td>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
	

	<input type="button" value="결제하기" id="btn" style="margin-top: 50px;  margin-bottom:50px; width: 100%; background-color:#339bff; height: 50px; border: none; color: #fff; font-size: 1.5em; ">



</section>
<c:import url="../../temp/footer.jsp"/>


</body>
</html>