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
	margin-bottom: 20px
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

#searchForm{

	width: 800px;
	height: 150px;
	margin-top: 20px;
	background-color: white;
	border: 1px solid #dedede;

}

#searchBTN{
	
	width : 100px;
	height: 30px;
	background-color: rgb(68, 110, 171);
	color: white;
	border: 2px solid black;
	font-size: 1.5em;
	font-weight: bolder;
	margin: 0 auto;
	margin-top: 20px;
}

#searchBTN:HOVER{

cursor: pointer;

}

#tb{

margin: 0 auto;


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

.bbttnn:HOVER{

cursor: pointer;
	
}


.contents_paging{
	width: 380px;
	margin: 0 auto;
	text-align: center;
	font-weight: bold;
}
.contents_paging span{
	cursor: pointer;
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
		} else {

		}

		
		// category 갱신
		$('select[name=category]').change(function() {

			var i = $(this).val();

			if (i == '개발') {
				$('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>');
			} else {
				$('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="제품">제품</option><option value="프레젠테이션">프레젠테이션</option><option value="인쇄물">인쇄물</option><option value="쇼핑몰">쇼핑몰</option><option value="로고">로고</option><option value="그래픽">그래픽</option><option value="영상">영상</option><option value="게임">게임</option><option value="기타">기타</option></select>');
			}

		});

		
		
		//검색
		
 		$('#searchBTN').click(function() {

			var board = '${board}';

			if (board == 'check') {
				$('#frm').prop('action', "./checkProjectCheckList");
			} else if (board == 'fail') {
				$('#frm').prop('action', "./checkProjectFailList");
			} else if(board=='wait'){
				$('#frm').prop('action', "./checkProjectWaitList");
			} else if(board=='finish'){
				$('#frm').prop('action', "./checkProjectFinishList");
			}
			else {

			}

			$('#frm').submit();

		});
		
		
 		$("select[name=category] option").each(function() {
			if ($(this).val() == "${projectDTO.category}") {
				$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
			}
		});

		$("select[name=detailCategory] option").each(function() {
			if ($(this).val() == "${projectDTO.detailCategory}") {
				$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
			}
		});

		$("select[name=planState] option").each(function() {
			if ($(this).val() == "${projectDTO.planState}") {
				$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
			}
		}); 
		
		$("#name").val("${projectDTO.name}");
		$("#email").val("${projectDTO.email}");
		
		var startDate = '${projectDTO.startDate}';
		
		var y = startDate.substr(0, 2);
	    var m = startDate.substr(3, 2);
	    var d = startDate.substr(6, 2);
	    
	    
	    startDate = y+"-"+m+"-"+d;
	    
		var finishDate = '${projectDTO.finishDate}';
		
		$("#startDate").val('20'+y+"-"+m+"-"+d);
		
		y = finishDate.substr(0, 2);
	    m = finishDate.substr(3, 2);
	    d = finishDate.substr(6, 2);
	    
	    $("#finishDate").val('20'+y+"-"+m+"-"+d);
	    
		var reg_date = '${projectDTO.reg_date}';
		
		y = reg_date.substr(0, 2);
	    m = reg_date.substr(3, 2);
	    d = reg_date.substr(6, 2);

	    $("#reg_date").val('20'+y+"-"+m+"-"+d);
	    
	    $("select[name=searchDate] option").each(function() {
			if($(this).val()=='${searchDate}'){
				$(this).attr("selected", "selected");
			}
	    	
		$("select[name=type] option").each(function() {
			
			if($(this).val()=='${listInfo.type}'){
				$(this).attr('selected','selected')
			}
		})	
			
			
		})
		
		//Ajax---------------------------------------------------
		
		
		$('.bbttnn').click(function() {
			
			var email = $(this).attr('title');
			var num = $(this).attr('lang');
			var state = $(this).attr('role');

			if('${board}'=='finish'){
				
				
			 	$.ajax({
					
					url: "../applicant/applicantListCheck",
					type: "GET",
					data: {projectNum:num},
					success:function(data){
						data = data.trim();
						$('#'+num).html(data);
					}
					
				}) 
				

				
				$('#'+num).on("click",".btn2", function() {
					var email = $(this).attr('title');
					var name = $(this).attr('lang');
					
					if(confirm(name+"님의 대금처리를 완료하시겠습니까?")){
						location.href = "../applicant/applicantPayFinish?email="+email;
					}else{
						alert("잘생각하셨습니다.");
					}
				}) 
			
				
				
			}else{
			
				$.ajax({
					
					url: "./checkWait",
					type: "GET",
					data: {email:email,projectNum:num,state:state},
					success:function(data){
						$('#'+num).html(data);
					}
					
				})
				
				$('#'+num).on("click",".btn2", function() {

					var projectNum = $(this).attr('title');
					
					if(confirm("입급여부를 확정하고 프로젝트를 시작하시겠습니까?")){
						
						
						alert(email);
						alert(projectNum);
						alert(state);
						
							
						location.href="./checkProjectUpdate?email="+email+"&projectNum="+projectNum+"&state="+state;
						
					}else{
						alert("NO");
					}
					

				}) 
				
				$('#'+num).on("click",".x", function() {

					$("#"+num).remove();
					

				}) 
				

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
							<a id="freelancer" href="./checkProjectFreelancerList">프리랜서 관리</a>
						</p>
					</c:if>
				</div>

			</article>
			<article class="right">
				<div class="title">
					<c:if test="${board=='check'}">
						<p id="t1">검수 전 프로젝트</p>
						<p id="t2">클라이언트로부터 등록된 프로젝트를 검수하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='fail'}">
						<p id="t1">모집종료 프로젝트</p>
						<p id="t2">기간이 완료되어 모집종료된 프로젝트를 보여주는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='wait'}">
						<p id="t1">입급대기 프로젝트</p>
						<p id="t2">미팅이 완료된 프로젝트를 보여주는 곳입니다. 프로젝트 진행여부를 결정할 수 있습니다.</p>
					</c:if>
					<c:if test="${board=='finish'}">
						<p id="t1">프리랜서 대금관리</p>
						<p id="t2">프로젝트를 완료한 회원들에게 급여를 지급하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='client'}">
						<p id="t1">클라이언트 신원확인</p>
						<p id="t2">클라이언트들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='freelancer'}">
						<p id="t1">프리랜서 신원확인</p>
						<p id="t2">프리랜서들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
				</div>
				
				<div id="searchForm">
					<form id="frm" action="">
						<table id="tb">
						<tr>
							<td>1차 분류</td>
							<td>
								<select name="category">
									<option value="">전체</option>
									<option value="개발">개발</option>
									<option value="디자인">디자인</option>
								</select>
							</td>
						<c:if test="${board=='check' or board=='fail' or board=='wait'}">
							<td>기획 상태</td>
							<td>
								<select name="planState">
									<option value="">전체</option>
									<option value="idea">아이디어까지만 존재</option>
									<option value="simple">필요한 내용만 간단히 정리</option>
									<option value="detail">상세한 기획문서 존재</option>
								</select>
							</td>
						</c:if>
						<c:if test="${board=='finish'}">
							<td>사업자 종류</td>
							<td>
							<select name="type">
								<option value="">전체</option>	
								<option value="개인">개인</option>
								<option value="팀">팀</option>
								<option value="사업자">사업자</option>
							</select>
							</td>
						</c:if>	
						</tr>
						<tr>
							<td>2차 분류</td>
							<td>
								<div id="result">
									<select name="detailCategory">
										<option value="">전체</option>
										<option value="웹">웹</option>
										<option value="어플리케이션">어플리케이션</option>
										<option value="워드프레스">워드프레스</option>
										<option value="퍼블리싱">퍼블리싱</option>
										<option value="일반소프트웨어">일반소프트웨어</option>
										<option value="쇼핑몰">쇼핑몰</option>
										<option value="게임">게임</option>
										<option value="임베디드">임베디드</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</td>
							<td>프로젝트 명</td>
							<td><input type="text" name="name" id="name" value="${projectDTO.name}"></td>
						</tr>
						<tr>
							<td>
							<c:if test="${board=='check'}">
							예상 시작일
							</c:if>
							<c:if test="${board=='fail' or board=='wait' or board=='finish'}">
							프로젝트 시작일
							</c:if>
							</td>
							<td><input type="date" name="startDate" id="startDate"></td>		
						<c:if test="${board=='check' or board=='fail' or board=='wait'}">
							<td>담당자 이메일</td>
							<td><input type="text" name="email" id="email" value="${projectDTO.email}"></td>
						</c:if>
						<c:if test="${board=='finish'}">
							<td>이름</td>
							<td><input type="text" name="memberName" id="memberName" value="${listInfo.memberName}"></td>
						</c:if>
						
						</tr>
						<tr>
							<td>
							<c:if test="${board=='check'}">
							모집마감일
							</c:if>
							<c:if test="${board=='fail' or board=='wait' or board=='finish'}">
							프로젝트 종료일
							</c:if>
							</td>
							<td><input type="date" name="finishDate" id="finishDate"></td>
							
							
							<td>기간</td>
							<td>
							<select name="searchDate">
								<option value="">전체</option>
								<option value="week">최근 1주</option>
								<option value="month">최근 1개월</option>
								<option value="month3">최근 3개월</option>
								<option value="month3">최근 6개월</option>
								<option value="year">최근 1년</option>
							</select>
							</td>
						</tr>
						
					</table>
						<div id="searchBTN">검색하기</div>
					</form>
				</div>
				
				

				<div class="contents">
					

					<table>
						<tr>
							<td>분야</td>
							<td>세부분야</td>
							<td>프로젝트명</td>
							<td>담당자</td>
							<td>등록날짜</td>
							<td>상태</td>
							<td></td>

						</tr>


						<c:forEach items="${list}" var="i" varStatus="e">
							<tr>
								<td>${i.category}</td>
								<td>${i.detailCategory}</td>
								<td>
								<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
								
						  <%-- <c:if test="${i.state=='wait' or i.state=='ing'}"> <!-- 임금대기 -->
									<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
								</c:if>
								<c:if test="${i.state=='finish' or i.state=='payFinish'}">
									<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
								</c:if>
								<c:if test="${i.state=='fail'}"> <!-- 실패 -->
									<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
								</c:if>
								<c:if test="${i.state=='check' or i.state=='done'}"> <!-- 검수 -->
									<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
								</c:if> --%>

								</td>
								<td>${i.email }</td>
								<td>${i.reg_date}</td>
								<td>
									 <c:if test="${i.state=='check'}">검수 단계</c:if>
									 <c:if test="${i.state=='done'}">검수 완료</c:if>
									 <c:if test="${i.state=='wait'}">입금대기중</c:if>
									 <c:if test="${i.state=='ing'}">진행중</c:if>
									 <c:if test="${i.state=='finish'}">미지급</c:if>
									 <c:if test="${i.state=='fail'}">모집 실패</c:if>
									 <c:if test="${i.state=='payFinish'}">지급완료</c:if>
								 </td>
								 <td>
								 <c:if test="${board=='finish' or board=='wait'}">
								 	<span class="bbttnn" title="${i.email}" lang="${i.projectNum}" role="${i.state }">열기</span>
								 </c:if>
								 </td>
							</tr>
							<tr>
								<td colspan="6">
									<div id="${i.projectNum}">
									
									</div>
								</td>
							</tr>
						</c:forEach>

					</table>
					
				<!-- 페이징 -->
				<div class="contents_paging">
					<c:if test="${listInfo.curBlock>1 }">
					<span id="preview">[이전]</span>		
					</c:if>
			
					<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
						<span class="num" ><a href="meetList?curPage=${i}">${i}</a></span>			
					</c:forEach>
			
					<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
					<span id="nextview">[다음]</span>			
					</c:if>
				</div>
					
					
					
					
					
					
				</div>

			</article>


		</section>







	</section>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>