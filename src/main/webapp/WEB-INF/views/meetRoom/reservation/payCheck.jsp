<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<div id="reserve_info">
			<div id="pop_header">
				예약신청
			</div>
			<div id="pop_container">
				<p>예약 내용을 확인해주세요</p>
				<form action="">
				<div id="reserve_price">
					<ul>
						<li>
							<span>예약공간</span>
							<span>${reserve.name}</span>
						</li>
						<li>
							<span>예약날짜</span>
							<span>${reserve.reserve_date}</span>
						</li>
						<li>
							<span>예약시간</span>
							<span>${reserve.time}</span>
						</li>
						<li>
							<span>예약인원</span>
							<span>${reserve.human}</span>
						</li>
						<li>
							<span>결제금액</span>
							<span>${reserve.price}</span>
						</li>
						<li>
							<span>예약자</span>
							<span>${reserve.reserve_name}</span>
						</li>
						<li>
							<span>이메일</span>
							<span>${reserve.email}</span>
						</li>
						<li>
							<span>연락처</span>
							<span>${reserve.phone}</span>
						</li>
					</ul>
				</div>
				
				</form>
			</div>
			<div>
			<a>예약수정</a>
			<a>예약신청</a>
			</div>
		</div>
	</section>
</body>
</html>