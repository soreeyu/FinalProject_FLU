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
		$("#btn").click(function() {
			var result = confirm("예약하시겠습니까?");
			if(result){
				$("#frm").submit();
			}
		});
	})
</script>
</head>
<body>
<c:import url="../../temp/header.jsp"/>
<section>
	<h1>결제</h1>
	<form action="reservePay" id="frm" method="post">
		<h2>방 이름 ${reserveInfo.name}</h2>
		<h2>날짜${reserveInfo.reserve_date}</h2>
		<h2>시간 ${time[0]}</h2>
		<h2>시간 ${time[1]}</h2>
		<h2>예약자 이름 ${reserveInfo.reserve_name}</h2>
		<h2>가격 ${reserveInfo.price}</h2>
		<h2>인원 ${reserveInfo.human}</h2>
		<h2>연락처 ${reserveInfo.phone}</h2>
	<hr>
	<h1>결제방법</h1>
	<!-- 결제 방법 선택시 ajax로 각 결제 방법에 맞는 정보 입력하는 창 불러오기 -->
	<input type="radio" name="payment" value="신용카드">
	신용카드
	<input type="radio" name="payment" value="실시간 계좌이체">
	실시간 계좌이체
	<input type="radio" name="payment" value="무통장 입금">
	무통장 입금
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
	




</section>
<c:import url="../../temp/footer.jsp"/>


</body>
</html>