<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
.main_section {
	min-width: 1460px;
	width: 100%;
	min-height: 1000px;
	background-color: #f2f2f2;
}

.page_wrap {
	min-width: 1152px;
	width: 1152px;
	height: 100%;
	margin: 0 auto;
	margin-top: 30px;
}

.left {
	width: 352px;
	height: 100%;
	float: left;
}

.right {
	width: 800px;
	height: 100%;
	float: left;
}

.user {
	width: 248px;
	padding: 15px 30px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}

.user>span {
	font-size: 18px;
	display: block;
	font-weight: bold;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 9px;
}

.user_name {
	display: inline-block;
}

.user_name>img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	float: left;
	border: 1px solid #dedede;
}

.user_name>span {
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}

.user_name>a {
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}

.user_name>a span {
	font-size: 12px;
	color: blue;
}

.history {
	width: 248px;
	padding: 15px 30px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}

.history>span:first-child {
	display: block;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 9px;
}

.history>p {
	padding: 7px;
	font-size: 17px;
	line-height: 25px;
	margin-top: 5px;
}

.history>p:HOVER {
	cursor: pointer;
}

.title {
	width: 800px;
	height: 100px;
	background-color: white;
	border: 1px solid #dedede;
}

#t1{

	font-size: x-large;
	margin-top: 20px;
	margin-left: 30px;
	font-weight: bolder;
	color: rgb(85, 85, 85);
	
}

#t2{

	font-size: medium;
	margin-top: 15px;
	margin-left: 30px;
	font-weight: normal;
	color: #999;

}


.contents {
	width: 800px;
	height: 100%;
	background-color: white;
	margin-top: 15px;
	border: 1px solid #dedede;
}

#detail {
	width: 120px;
}
</style>
<script type="text/javascript">


	$(function() {
		
		var board = '${board}';
		
		if(board=='Client'){
			$('#clientBTN').css('background-color', '#446eab');
		 	$('#clientBTN').children("#client").css('color', 'white');	
			$('#freelancerBTN').css('background-color', 'white');
		 	$('#freelancerBTN').children("#freelancer").css('color', 'black');
		}else if(board=='Freelancer'){
			$('#freelancerBTN').css('background-color', '#446eab');
		 	$('#freelancerBTN').children("#freelancer").css('color', 'white');	
			$('#clientBTN').css('background-color', 'white');
		 	$('#clientBTN').children("#client").css('color', 'black');
		}
		
		
	$('select[name=category]').change(function() {
		
		var i = $(this).val();
		
		if(i=='개발'){
			$('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>');
		}else{
			$('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="제품">제품</option><option value="프레젠테이션">프레젠테이션</option><option value="인쇄물">인쇄물</option><option value="쇼핑몰">쇼핑몰</option><option value="로고">로고</option><option value="그래픽">그래픽</option><option value="영상">영상</option><option value="게임">게임</option><option value="기타">기타</option></select>');
		}
		
		
	});
	



});
	
	
	

</script>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<section class="main_section">
		<section class="page_wrap">
			<article class="left">
				<div class="user">
					<span>프리랜서</span>
					<div class="user_name">
						<img alt="프로필 사진"
							src="${pageContext.request.contextPath}/resources/img/FLU.png">
						<span>닉네임</span> <a><span>기본 정보 수정</span></a>
					</div>
				</div>
				<div class="history">
					<c:if test="${board=='Client' or board=='Freelancer'}">
						<p id="clientBTN">
							<a id="client" href="./checkMemberClientList">클라이언트 관리</a>
						</p>
						<p id="freelancerBTN">
							<a id="freelancer" href="./checkMemberFreelancerList">프리랜서 관리</a>
						</p>
					</c:if>
				</div>

			</article>
			<article class="right">
				<div class="title">
					<c:if test="${board=='Client'}">
						<p id="t1">클라이언트 신원확인</p>
						<p id="t2">클라이언트들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='Freelancer'}">
						<p id="t1">프리랜서 신원확인</p>
						<p id="t2">프리랜서들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
				</div>

				<div class="contents">
					<form id="frm" action="">
						<div>
							<select name="category" id="detail">
								<option value="">전체</option>
								<option value="개발">개발</option>
								<option value="디자인">디자인</option>
							</select>

							<div id="result">
								<select name="detailCategory" id="detail"><option
										value="">전체</option>
									<option value="웹">웹</option>
									<option value="어플리케이션">어플리케이션</option>
									<option value="워드프레스">워드프레스</option>
									<option value="퍼블리싱">퍼블리싱</option>
									<option value="일반소프트웨어">일반소프트웨어</option>
									<option value="쇼핑몰">쇼핑몰</option>
									<option value="게임">게임</option>
									<option value="임베디드">임베디드</option>
									<option value="기타">기타</option></select>
							</div>

						</div>

						<div>
							<select name="kind">
								<option value="name">제목</option>
								<option value="email">담당자</option>
								<option value="contents">내용</option>
							</select> <input type="text" name="search" id="search"
								value="${listInfo.search}"><input type="button"
								value="검색" id="btn">
						</div>

					</form>

					<table>
						<tr>
							<td>name</td>
							<td>email</td>
							<td>state</td>
						</tr>


						<c:forEach items="${list}" var="i">
							<tr>
								<td>${i.name }</td>
								<td><a href="../member/personaldataView?email=${i.email}">${i.email }</a></td>
								<td>
								<c:if test="${i.authenticState=='1'}">신원미상</c:if>
								<c:if test="${i.authenticState=='2'}">신원확인완료</c:if>
								</td>
							</tr>
						</c:forEach>

					</table>
				</div>

			</article>


		</section>

	</section>


	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>