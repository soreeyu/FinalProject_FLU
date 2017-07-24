<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	padding: 7px; font-size : 17px;
	line-height: 25px;
	margin-top: 5px;
	font-size: 17px;
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

		if (board == 'check') {
			$('#checkBTN').css('background-color', '#446eab');
			$('#checkBTN').children("#check").css('color', 'white');
			$('#failBTN').css('background-color', 'white');
			$('#failBTN').children("#fail").css('color', 'black');
		} else if (board == 'fail') {
			$('#failBTN').css('background-color', '#446eab');
			$('#failBTN').children("#fail").css('color', 'white');
			$('#checkBTN').css('background-color', 'white');
			$('#checkBTN').children("#check").css('color', 'black');
		} else if (board == 'wait') {
			$('#waitBTN').css('background-color', '#446eab');
			$('#waitBTN').children("#wait").css('color', 'white');
			$('#finishBTN').css('background-color', 'white');
			$('#finishBTN').children("#finish").css('color', 'black');
		} else if (board == 'finish') {
			$('#finishBTN').css('background-color', '#446eab');
			$('#finishBTN').children("#finish").css('color', 'white');
			$('#waitBTN').css('background-color', 'white');
			$('#waitBTN').children("#wait").css('color', 'black');
		} else if (board == 'client') {
			$('#clientBTN').css('background-color', '#446eab');
			$('#clientBTN').children("#client").css('color', 'white');
			$('#freelancerBTN').css('background-color', 'white');
			$('#freelancerBTN').children("#freelancer").css('color', 'black');
		} else {

		}

		$('select[name=category]')
				.change(
						function() {

							var i = $(this).val();

							if (i == '개발') {
								$('#result')
										.html(
												'<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>');
							} else {
								$('#result')
										.html(
												'<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="제품">제품</option><option value="프레젠테이션">프레젠테이션</option><option value="인쇄물">인쇄물</option><option value="쇼핑몰">쇼핑몰</option><option value="로고">로고</option><option value="그래픽">그래픽</option><option value="영상">영상</option><option value="게임">게임</option><option value="기타">기타</option></select>');
							}

						});

		$('#result').change('select[name=detailCategory]', function() {

			var board = '${board}';

			if (board == 'check') {
				$('#frm').prop('action', "./checkProjectCheckList");
			} else if (board == 'fail') {
				$('#frm').prop('action', "./checkProjectFailList");
			} else {

			}

			$('#frm').submit();

		});

		$('#result').on('change', 'select[name=detailCategory]', function() {

			var board = '${board}';

			if (board == 'check') {
				$('#frm').prop('action', "./checkProjectCheckList");
			} else if (board == 'fail') {
				$('#frm').prop('action', "./checkProjectFailList");
			} else {

			}

			$('#frm').submit();

		});

		$('#btn').click(function() {

			var board = '${board}';

			if (board == 'check') {
				$('#frm').prop('action', "./checkProjectCheckList");
			} else if (board == 'fail') {
				$('#frm').prop('action', "./checkProjectFailList");
			} else {

			}

			$('#frm').submit();

		});

		$("select[name=category] option").each(function() {
			if ($(this).val() == "${listInfo.category}") {
				$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
			}
		});

		$("select[name=detailCategory] option").each(function() {
			if ($(this).val() == "${listInfo.detailCategory}") {
				$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
			}
		});

		$("select[name=kind] option").each(function() {
			if ($(this).val() == "${listInfo.kind}") {
				$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
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
					<c:if test="${board=='check' or board=='fail'}">
						<p id="checkBTN">
							<a id="check" href="./checkProjectCheckList">검수 전 프로젝트</a>
						</p>
						<p id="failBTN">
							<a id="fail" href="./checkProjectFailList">모집실패 프로젝트</a>
						</p>
					</c:if>
					<c:if test="${board=='wait' or board=='finish'}">
						<p id="waitBTN">
							<a id="wait" href="./checkProjectWaitList">입금대기 프로젝트</a>
						</p>
						<p id="finishBTN">
							<a id="finish" href="./checkProjectFinishList">프리랜서 대금관리</a>
						</p>
					</c:if>
					<c:if test="${board=='client' or board=='freelancer'}">
						<p id="clientBTN">
							<a id="client" href="./checkProjectClientList">클라이언트 관리</a>
						</p>
						<p id="freelancerBTN">
							<a id="freelancer" href="./checkProjectFreelancerList">프리랜서
								관리</a>
						</p>
					</c:if>
				</div>

			</article>
			<article class="right">
				<div class="title">
					<c:if test="${board=='check'}">
						<p>검수 전 프로젝트</p>
						<p>클라이언트로부터 등록된 프로젝트를 검수하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='fail'}">
						<p>모집종료 프로젝트</p>
						<p>기간이 완료되어 모집종료된 프로젝트를 보여주는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='wait'}">
						<p>입급대기 프로젝트</p>
						<p>미팅이 완료된 프로젝트를 보여주는 곳입니다. 프로젝트 진행여부를 결정할 수 있습니다.</p>
					</c:if>
					<c:if test="${board=='finish'}">
						<p>프리랜서 대금관리</p>
						<p>프로젝트를 완료한 회원들에게 급여를 지급하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='client'}">
						<p>클라이언트 신원확인</p>
						<p>클라이언트들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='freelancer'}">
						<p>프리랜서 신원확인</p>
						<p>프리랜서들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
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
							<td>분야</td>
							<td>세부분야</td>
							<td>프로젝트명</td>
							<td>담당자</td>
							<td>상태</td>
							<td>날짜</td>
						</tr>


						<c:forEach items="${list}" var="i">
							<tr>
								<td>${i.category}</td>
								<td>${i.detailCategory}</td>
								<td>
								<c:if test="${i.state=='check' or i.state=='done' or i.state=='fail'}">
										<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
								</c:if>
								<c:if test="${i.state=='fail'}">
									<a href="#">${i.name }</a>
								</c:if>
								<c:if test="${i.state=='wait' or i.state=='ing'}">
									<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
								</c:if>
								<c:if test="${i.state=='finish' or i.state=='payFinish'}">
									<a href="../checkProject/checkCashView?projectNum=${i.projectNum}">${i.name }</a>
								</c:if>

								
								</td>
								<td>${i.email }</td>
								<td>
								 <c:if test="${i.state=='check'}">검수 단계</c:if>
								 <c:if test="${i.state=='done'}">검수 완료</c:if>
								 <c:if test="${i.state=='wait'}">입금대기중</c:if>
								 <c:if test="${i.state=='ing'}">진행중</c:if>
								 <c:if test="${i.state=='finish'}">미지급</c:if>
								 <c:if test="${i.state=='payFinish'}">지급완료</c:if>
								 </td>
								<td>${i.reg_date}</td>
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