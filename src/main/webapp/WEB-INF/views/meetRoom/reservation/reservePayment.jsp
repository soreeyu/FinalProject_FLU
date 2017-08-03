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
<<<<<<< HEAD
		$("#btn").click(function() {
			var result = confirm("예약하시겠습니까?");
			if(result){
				$("#frm").submit();
			}
		});
=======
		$(".credit").hide();
		$(".digit").hide();
		
		var credit_Info = document.getElementsByClassName("credit_Info");
		var digit_Info = document.getElementsByClassName("digit_Info");
		
		
		
		$("#creditCard").click(function() {
			if($(".digit").show()){
				$(".digit").hide();
			}
			$(".credit").show();
		});
		
		
		$("#checkCard").click(function() {
			if($(".credit").show()){
				$(".credit").hide();
			}
			$(".digit").show();
		});
		
		
		$("#btn").click(function() {
			var result =$("input:radio[name='payment']").is(":checked");
			var id = $("input:radio[name='payment']:checked").val();
			
			
			if(result){
				if(id=="신용카드"){
					alert(credit_Info[0].checked);
					if(credit_Info[0].checked==false){
						alert("카드 형태를 선택하세요.");
					}else if(credit_Info[1].value==""){
						alert("카드 회사를 선택하세요.");
					}else if(credit_Info[2].value==""){
						alert("카드 번호를 입력하세요.");
					}else if(credit_Info[3].value==""){
						alert("유효기간을 확인하세요");
					}else if(credit_Info[4].value==""){
						alert("유효기간을 확인하세요");
					}else if(credit_Info[5].value==""){
						alert("카드 비밀번호를 입력하세요.");	
					}else {
						var check = confirm("예약하시겠습니까?");
						if(check){
							$("#frm").submit();
						}
					}	
				}else {
					if(digit_Info[0].value==""){
						alert("출금할 은행을 선택하세요.");
					}else if(digit_Info[1].value==""){
						alert("계좌번호를 입력하세요.");
					}else if(digit_Info[2].value==""){
						alert("계좌 비밀번호를 입력하세요.");
					}else {
						var check = confirm("예약하시겠습니까?");
						if(check){
							$("#frm").submit();
						}
					}					
				}
			
			}else {
				alert("결제 방식을 선택하세요.");
			}		
		});
		
		
>>>>>>> parent of 7bb8f5d... no message
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
    border-top: 3px solid #704de4;
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
<<<<<<< HEAD
=======
.type {
	margin-left: 15px;
}
.info {
	padding: 20px;
}
.infoTR{
	margin-top: 20px;
}
.info_left{
	border-right: 1px solid grey;
}
>>>>>>> parent of 7bb8f5d... no message
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
				<span class="data">
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
	<h1>결제방법</h1>
<<<<<<< HEAD
	<!-- 결제 방법 선택시 ajax로 각 결제 방법에 맞는 정보 입력하는 창 불러오기 -->
	<input type="radio" name="payment" value="신용카드">
	신용카드
	<input type="radio" name="payment" value="실시간 계좌이체">
=======
	<input type="radio" name="payment" value="신용카드"  id="creditCard">
	신용카드
	<input type="radio" name="payment" value="실시간 계좌이체"  id="checkCard">
>>>>>>> parent of 7bb8f5d... no message
	실시간 계좌이체
		<input type="hidden" name="name" value="${reserveInfo.name}">
		<input type="hidden" name="reserve_date" value="${reserveInfo.reserve_date}">
		<input type="hidden" name="time" value="${reserveInfo.time}">
		<input type="hidden" name="reserve_name"  value="${reserveInfo.reserve_name}">
		<input type="hidden" name="price"  value="${reserveInfo.price}">
		<input type="hidden" name="human"  value="${reserveInfo.human}">
		<input type="hidden" name="phone"  value="${reserveInfo.phone}">
		<input type="hidden" name="email"  value="${reserveInfo.email}">
		<input type="hidden" name="snum"  value="${reserveInfo.snum}">	
	<input type="button" value="결제하기" id="btn">
	</form>
	</div>
	
	<div class="container">
		<div class="credit">
			<div class="type">
				<span>
<<<<<<< HEAD
					<input type="radio" name="type"> 개인
				</span>
				<span>
					<input type="radio" name="type"> 법인
				</span>
				<select>
					<option>신한카드</option>
					<option>현대카드</option>
					<option>비씨카드</option>
					<option>삼성카드</option>
					<option>롯데카드</option>	
				</select>
			</div>
			<div class="card_contents">
				<table>
					<tr>
						<td>카드번호</td>
						<td><input type="text" placeholder="카드번호 입력"> </td>
					</tr>
					<tr>
						<td>유효기간</td>
						<td><input type="text" placeholder="월"> <input type="text" placeholder="년"> </td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" placeholder="비밀번호"> </td>
=======
					<input type="radio" name="type" class="credit_Info"> 개인
				</span>
				<span>
					<input type="radio" name="type" class="credit_Info"> 법인
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
				<table >
					<tr class="infoTR">
						<td class="info info_left">카드번호</td>
						<td class="info"><input type="text" placeholder="카드번호 입력 '-'를 제외" class="credit_Info"> </td>
					</tr>
					<tr class="infoTR">
						<td class="info info_left">유효기간</td>
						<td class="info"><input type="text" placeholder="월" class="credit_Info" style="width :20%;"> <input type="text" placeholder="년" class="credit_Info" style=" width :20%;"> </td>
					</tr>
					<tr class="infoTR">
						<td class="info info_left">비밀번호</td>
						<td class="info"><input type="text" placeholder="비밀번호" class="credit_Info"> </td>
>>>>>>> parent of 7bb8f5d... no message
					</tr>
				</table>
			</div>
			
		</div>
		
		<div class="digit">
			<table>
				<tr>
					<td>
						출금은행
					</td>
					<td>
<<<<<<< HEAD
						<select>
							<option>신한은행</option>
							<option>우리은행</option>
							<option>국민은행</option>
							<option>하나은행</option>
							<option>농협</option>
=======
						<select class="digit_Info">
							<option value="신한은행">신한은행</option>
							<option value="우리은행">우리은행</option>
							<option value="국민은행">국민은행</option>
							<option value="하나은행">하나은행</option>
							<option value="농협">농협</option>
>>>>>>> parent of 7bb8f5d... no message
						</select>
					</td>	
				</tr>
				<tr>
					<td>
						계좌번호
					</td>
					<td>
<<<<<<< HEAD
						<input type="text" placeholder="계좌번호 입력">
=======
						<input type="text" placeholder="계좌번호 입력" class="digit_Info">
>>>>>>> parent of 7bb8f5d... no message
					</td>
				</tr>
				<tr>
					<td>
						계좌비밀번호
					</td>
					<td>
<<<<<<< HEAD
						<input type="text" placeholder="계좌비밀번호 입력">
=======
						<input type="text" placeholder="계좌비밀번호 입력" class="digit_Info">
>>>>>>> parent of 7bb8f5d... no message
					</td>
				</tr>	
			</table>
		</div>
	</div>
	




</section>
<c:import url="../../temp/footer.jsp"/>


</body>
</html>