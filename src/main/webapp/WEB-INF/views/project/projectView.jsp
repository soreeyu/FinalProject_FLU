<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<title>Insert title here</title>
<style type="text/css">

.main_section {
	min-width: 1160px;
	width: 1160px;
	height: auto;
	min-height: 2300px;
	margin: 0 auto;
	margin-top: 30px;
}

.project_header {
	height:122px;
	padding: 30px;
	margin-bottom: 20px;
	border: 1px solid #e6e6e6;
	margin-bottom: 30px;
	background-color: white;
}

#header_ttt {
	font-size: 24px;
	font-weight: bolder;
	margin-bottom: 20px;
}

/* 추가  */
.DateMius{
	font-size: 14px;
	background-color: #07b481;
	vertical-align: middle;
	margin-top: 5px;
	float: right;
	height: 20px;
	border-radius: 4px;
	color: white;
	line-height: 15px;
	padding: 2px 3px;
}

/* 추가 */
#header_t {
	font-size: medium;
	font-weight: lighter;
	color: #666;
}

/* 추가  */
#header_t span:last-child{
	font-size: 20px;
	vertical-align: middle;
	margin-top: 5px;
	margin-right:50px;
	float: right;
	height: 20px;
	line-height: 20px;

}
strong{
	color: #f48023;
	font-size: 22px;
	font-weight: 700;
}
.contents {
	width: 1260;
	height: 2000px;
	/* min-height: 1200px;
	max-height: 2700px; */
}
.clean{
	background-color: #f2f2f2;
	height: 15px;
	width: 100%;
}
/* 수정 */
.contents_sub {
	width: 250px;
	height: 1000px;
	display: block;
	float: right;
}
/* 수정 */
.contents_main {
	width: 900px;
	height: auto;
	max-height: 2100px;
	min-height: 250px;
	display: block;
	float: left;
}
.contents-back{
	width: 900px;
	height: auto;
	max-height: 2100px;
	min-height: 250px;
	display: block;
	float: left;
	background-color: white;
	border: 1px solid #dedede;
}
/* 추가 */
.project-detail-info{
	background-color: #f7f7f7;
	margin-top: 20px;
	border: 1px solid #dedede;
	border-radius: 2px;
	padding: 3px 0px 3px 15px;
	line-height: 30px;
	font-size: 16px;
	height: 50px;	
}
.fa{
	font-size: 16px;
	font-weight: bold;
	margin-right: 5px;
}
.budget{
	line-height:44px;
	min-width: 270px;
	float: left;
}
.term{
	line-height:44px;
	min-width: 250px;
	float: left;
}
.deadline{
	line-height:44px;
	min-width: 250px;
	float: left;
}
.project-detail-box{
	padding: 15px 0 0 0;
}
.project-detail-top{
	border-top: 1px solid #dedede;
	display: inline-block;
}
.project-detail-bottom{
	border-top: 1px solid #dedede;
	border-bottom: 1px solid #dedede;	
	display: inline-block;
}
.detail-title{
	background-color: #f7f7f7;
	float: left;
	font-weight: bold;
	height: 40px;
	width: 130px;
	padding-left: 15px;
	padding-top: 10px;
}
.detail-data{
	float: left;
	width: 135px;
	height: 40px;
	padding-top: 10px;
	padding-left: 15px;
	font-size: 14px;
}
.project-detail{
	margin-top: 20px;
	border-bottom: 1px dotted #dedede;
	line-height: 20px;
	word-spacing: 3px;
	padding: 30px;
	height: auto;
	min-height: 400px;
}
.project-detail-title{
	font-weight: bolder;
	font-size: 20px;
	margin-bottom: 20px;
}
.project-skill{
/* 	background-color: #666; */
	color: white;
	border-radius: 2px;
}
.contents-register{
	background-color: white;
	margin-top: 10px;
	padding: 25px;
	border: 1px solid #dedede;
}
.contents-register-inner span a{
	font-weight: bold;
	text-decoration: none;
	color: #2099bb;
}
.register-btn{
	width:230px;
	height:40px;
	color: white;
	background-color: #f1720c;
	border-color: #f48023;
	border-radius: 2px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	padding: 10px 12px;
	margin-top: 15px;
	text-decoration: none;
}
.owner-btn{
	width:230px;
	height:40px;
	color: white;
	background-color: #f1720c;
	border-color: #f48023;
	border-radius: 2px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	padding: 10px 12px;
	margin-top: 15px;
	text-decoration: none;
}
.schedule-btn{
	width:230px;
	height:40px;
	color: white;
	background-color: #f1720c;
	border-color: #f48023;
	border-radius: 2px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	padding: 10px 12px;
	margin-top: 15px;
	text-decoration: none;
}
.project-qna{
	margin-top: 10px;
	height: auto;
	max-height: 600px;
	background-color: white;
	padding: 30px;	
}
.project-apply-box{
	width: 100%;
	height: auto;
	border: 1px solid #dedede;
	border-radius: 3px;
	border-bottom-width: 2px;
	background-color: white;
	margin-bottom: 20px;
	padding: 5px 9px 20px;
}
.client-info-box{
	background-color: white;
	min-height: 450px;
	border: 1px solid #dedede;
}






.project-sort-text{
	height: 40px;
	margin-bottom: 15px;
	border-bottom: 1px solid #eeeeee;
	font-size: 14px;
	font-weight: bold;
	color: black;
	text-align: center;
	line-height: 40px;
}
.left-sort-box{
	height: 60px;
	width: 45%;
	float: left;
	margin-left: 10px;
	padding-right: 10px;
	border-right: 1px #dedede solid;
}
.right-sort-box{
	height: 60px;
	width: 40%;
	float: right;
	margin-right: 10px;
}
.sort-button{
	color: #666;
	font-size: 13px;
	cursor: pointer;
	margin-top: 5px;
	text-align: center;
}
.category-filter-box{
	height: 600px;
	border: 1px solid #dedede;
	border-radius: 3px;
	border-bottom-width: 2px;
	background-color: white;
}
.category-select-both{
	margin-left: 20px;
	height: 560px;
	background-image: url("${pageContext.request.contextPath}/resources/img/select.png");
	background-repeat: no-repeat;
}
.category-select-list{
	height: 230px;
	display: block;
	/* background-color: yellow;  */
}
.cate-skipper{
	height: 17px;
	width: 100%;
	float: left;
	cursor: pointer;
	display: block;
	margin-left: 20px;
}
.cate-chk{
	width: 13px;
	height: 13px;
	float: left;
	display: block;
	margin-left: 20px;
}
.cate-list input[type="checkbox"]{
	width: 13px;
	height: 13px;
	float: left;
	display: block;
	margin-left: 10px;
	margin-bottom: 5px;
}
.cate-label{
	font-weight: blod;
	display: block;
	margin-left: 20px;
	margin-bottom: 5px;
	width: 70px;
}
.cate-list li{
	display: block;
}
.cate-list li label{

	font-weight: normal;
	margin-left: 10px;
	display: block;
	width: 100%;
	/* margin-bottom: 10px; */
	margin-bottom: 7px;
}
.place-sort-box{
	height: 65px;
	width: 250px;
}
.place-selectbox{
	line-height: 65px;
	margin: 0 auto;
}
.address-select-btn{
	margin-left: 60px;
	width: 130px;
	text-align: center;
	border: 1px solid #dedede;
	border-radius: 5px;
	background-color: #ffffff;
}
.dropdown-selecter{
background-color: white;
	margin-left:60px;
	height: 200px;
	width: 130px;
	display: block;
	overflow: auto;
	visibility: hidden;
}
.project-unit{
	padding: 25px;
	background-color: aqua;
	height: 200px;
	margin-bottom: 5px;
}
.project-head{
	height: 27px;
	margin-bottom: 5px;
}
.project-title{
	color: #15647a;
	font-size: 18px;
	font-weight: bold;
}
.project-body{
	width: 100%;
	height: 120px;
	background-color: green;
}
.project-info{
	width: 100%;
	margin-bottom: 10px;
}

.fa-reg_date{
	padding-left: 10px;
	font-size: small;
	color: #ccc;
	font-size: 12px;
	display: inline-block;
}
.project-contents{
	width: 630px;
	color: #999;
	font-size: 13px;
	text-overflow: ellipsis;
	overflow: hidden;
	max-height: 60px;
	float: left;
	height: 60px;
	background-color: red;
	padding-top: 5px;
}
.project-contents-right{
	font-size: 13px;
	width: 150px;
	float: right;
	height: 54px;
	line-height: 13px;
}
.right-contents-sub{
	border-bottom: 1px solid #dedede;
	margin-bottom: 5px;
	height: 20px;
}
.project-bottom{
	margin-top: 10px;
	line-height: 18px;
	background-color: white;
}
.main-cate{
	color: #999;
}
.sub-cate{
	border-right: 1px solid #dedede;
	color: #666;
	margin-right: 10px;
	padding-right: 10px;	
}
.skill-box{
	display: inline-block;
}
.skill-title{
	margin-left: 10px;
	color: #666;
}
.skill-name{
	background-color: #a1a7ad;
}
.skill-box span{
	color: #999;
}
.contents_bottom{
	margin-top: 30px;
	width: 100%;
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
.project-title a{
	text-decoration: none;
	color: #2099bb;
}
.project-reply-box{
	background-color: aqua;
	width: 100%;
	height: 300px;
}
.project-reply-box-inner{
	background-color: yellow;
	min-height: 200px;
	max-height: 300px;
	height: auto;
}
.owner_option{
	width: 100%;
}
.owner_option_btn{

}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<section class="main_section">

		<!--  header -->
		<div class="project_header">
			<div class="header_text">
				<p id="header_ttt" style="margin-bottom: 20px;">
				<span>${dto.name}</span>
				<span class="DateMius"><span class="startDate"></span> - <span class="finishDate"></span></span>
				</p>
				<p id="header_t">
				<span>${dto.category} > ${dto.detailCategory }</span>
				<span>
				<img src="${pageContext.request.contextPath}/resources/img/project/proposal.png">
				총<strong>1명</strong>지원</span>
				</p>
			</div>
		</div>
		
		<!-- contents -->
		<div class="contents">
		
		
		<!-- left contents  -->
			<section class="contents_main" >
			<div class="contents-back" style="padding: 30px;">
			
			
				<div class="project-detail-info">
					<div class="budget">
						<i class="fa fa-krw"></i>
						<span class="fa">예상금액</span>
						${dto.budget}원
					</div>
					<div class="term">
						<i class="fa fa-clock-o"></i>
						<span class="fa">예상기간</span>${dto.period}일
					</div>
					<div class="deadline">
						<i class="fa fa-pencil"></i>
						<span class="fa">모집마감</span><span class="finishDate"></span>
					</div>
				</div>
				
				
				<div class="project-detail-box">
					<div class="project-detail-top">
						<div class="detail-title">기획상태</div>
						<div class="detail-data" id="planState"></div>
						<div class="detail-title">매니징 경험</div>
						<div class="detail-data" id="exp"></div>
						<div class="detail-title">등록 일자</div>
						<div class="detail-data" id="reg_date"></div>
					</div>
					<div class="project-detail-bottom">
						<div class="detail-title">예상 시작일</div>
						<div class="detail-data startDate"></div>
						<div class="detail-title">미팅 방식</div>
						<div class="detail-data" id="meetKind"></div>
						<div class="detail-title">위치</div>
						<div class="detail-data" style="overflow: hidden;">${dto.addr_main}</div>
					</div>
				</div>
				
				<!-- 프로젝트 내용 -->
				<div class="project-detail">
					<div class="project-detail-title">프로젝트 내용</div>	
					<div>${dto.contents }</div>
					
				</div>
				
				<div>
					<div class="project-detail-title" style="margin-top: 20px;">관련 기술</div>
					<span class="project-skill">${dto.skills}</span>
		
					
					
				</div>
			</div>
			<div style="clear: both;"></div>


			<div class="contents-register">
				<div class="contents-register-inner" style="text-align: center;">
				
				<c:if test="${member.kind=='admin' }">
					<p><a href="../file/fileDown?fname=${dto.fName }">${dto.oName }</a></p>
				</c:if>
				<c:if test="${member.kind=='freelancer'}">
					<p>프로젝트 지원을 위해
					<span><a href="#">기본정보</a></span>
					<span><a href="#">자기소개</a></span>
					<span><a href="#">보유기술</a></span>
					<span><a href="#">포트폴리오</a></span>
					을(를) 입력해주세요
					</p>
					<a href="#" class="register-btn"><img src="${pageContext.request.contextPath}/resources/img/project/register-popol.png">프로젝트 지원불가 </a>
				</c:if>
				
				<c:if test="${member.email==dto.email}">
				<p> 프로젝트를 수정/삭제 할 땐, 신중해주세요 </p>
					<div class="owner_option_btn">
						<a href="#" class="owner-btn" id="pj-update">Update</a>
						<a href="#" class="owner-btn" id="pj-delete">Delete</a>
					</div>
					</c:if>
				
				</div>
			</div>
			
			
			
			
			
			
			<div class="project-qna">
				<div class="project-detail-title">프로젝트 문의 ${dto.projectNum }</div>
				<div style="border-bottom: 1px dotted #dedede;"></div>
				
				<div style="margin-top: 30px;" class="project-reply-box">

				<div class="project-reply-box-inner">
					<div class="project-reply-box-top">
					 
					<!-- Reply 가 들어가는 부분-->
					
					</div>
				</div>
				
				
				<form action="../reply/replyInsert" id="frm" method="post">
				<div class="project-reply-box-bottom" style="margin-top: 50px; background-color: blue;">
					<input type="hidden" name="projectNum" value="${dto.projectNum}">
					
					<!-- member의 img를 넣자 -->
				
					
					<input type="text" name="contents">
					<input type="checkbox" id="reply_check">비공개 설정
					<input type="hidden" name="replyChk" id="replyChk" value="true">
					<input type="button" id="btn" value="작성">
				</div>
				</form>
				
				</div>
			</div>
			
			
					

			
			
			</section>
			
			
			
			
			<!-- right contents  -->
		<section class="contents_sub">
			<div class="project-apply-box">
				
			<c:if test="${member.kind eq 'freelancer'}">
				<a href="#" class="register-btn"><img src="${pageContext.request.contextPath}/resources/img/project/register-popol.png">프로젝트 지원하기 </a>
				<a href="#" class="register-btn" style="background-color: navy;"><i class="fa fa-heart"></i>관심프로젝트 추가하기 </a>
	 		</c:if> 
	 		
	 		<c:if test="${dto.state eq 'ing' && member.kind ne 'admin'}">
				<a href="#" class="schedule-btn">프로젝트 스케줄 </a>
	 		</c:if>
	 		
	 		<c:if test="${(dto.state eq 'recruit'|| dto.state eq 'ing') && member.kind eq 'client'}">
				<a href="#" class="schedule-btn">미팅룸 예약하기 </a>
	 		</c:if>	
	 		
	 		<c:if test="${member.kind eq 'admin'}">
	 		
				<input type="hidden" name="state" value="${dto.state}">
				<input type="hidden" name="projectNum" value="${dto.projectNum}">

		 		<c:if test="${dto.state=='done'}">
				프로젝트 상태 : <strong>검수완료</strong> 
				</c:if>
				<c:if test="${dto.state=='wait'}">
				프로젝트 상태 : <strong>입금 대기중</strong>
				</c:if>
				<c:if test="${dto.state=='ing'}">
				프로젝트 상태 : <strong>진행중</strong>
				</c:if>
				<c:if test="${dto.state=='fail'}">
				프로젝트 상태 : <strong>모집 실패</strong>
				</c:if>
				
	 			
	 			<form action="" id="frmm" method="get">

				<c:if test="${dto.state eq 'check'}">
				<input type="button" class="register-btn" value="프로젝트 검수 완료" id="doneBTN">
				</c:if>
				
				<c:if test="${dto.state eq 'fail'}">
				<input type="button" class="register-btn" value="프로젝트 연장" id="dateBTN">
				</c:if>
				
				<input type="button" class="register-btn" value="프로젝트 삭제" id="deleteBTN">
				
				</form>
	 		</c:if>
			</div>
				
				
			
				
				
				<div class="client-info-box">
					<div>
					<%-- ${member.oProfileImage }
					${member.fProfileImage } --%>
					<div>프로젝트 등록자 : ${dto.email}</div>
					
					<div><span>프로젝트 등록</span><span id="total_pjcount">${totalCount}건 </span></div>
					<div><span>계약한 프로젝트</span><span id="recurit_pjcount">${conCount } 건</span></div>
					<div><span>진행중인 프로젝트</span><span id="ing_pjcount">${ingCount } 건</span></div>
					<div><span>완료한 프로젝트</span><span id="finish_pjcount">${finishCount } 건</span></div>
					</div>
				</div>

				
		
			</section>
		</div>


</section>
<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

<script type="text/javascript">

/* 기본셋팅 */
var projectNum = "${dto.projectNum}";
var email = "${member.email}";
var state = '${dto.state}';
alert(state);
alert("${member.oProfileImage }");

/* reply ajax */
$.get("../reply/replyList?projectNum="+projectNum+"&curPage=1",function(data){
	$(".project-reply-box-top").html(data);
});


/* 기획상태 뿌려주기 */
var planState = "${dto.planState}";
if(planState=='idea'){
	$("#planState").text("아이디어만 존재");	
}else if(planState=='simple'){
	$("#planState").text("필요한 내용 정리");
}else{
	$("#planState").text("상세한 기획문서 존재");
}


/* 매니징경험 뿌려주기 */
 var exp = "${dto.exp}";
 if(exp=='y'){
	 $("#exp").text("있음");
 }else{
	 $("#exp").text("없음");
 }

/* 등록일자 뿌려주기 */
 var rdate = "${dto.reg_date}";
 var reg_date = new Date(rdate);
 var reg_Day = reg_date.getDate();
 var reg_Month = reg_date.getMonth()+1;
 var reg_Year = reg_date.getFullYear();
 $("#reg_date").text(reg_Year+"년 "+reg_Month+"월 "+reg_Day+"일");

 
 
 /* 예상시작일 뿌려주기 */
 var sdate = "${dto.startDate}";
 var startDate = new Date(sdate);
 var startDay = startDate.getDate();
 var startMonth = startDate.getMonth()+1;
 var startYear = startDate.getFullYear();
 $(".startDate").text(startYear+"년 "+startMonth+"월 "+startDay+"일");
 
 
 /* 미팅방식 뿌려주기 */
var meetKind = "${dto.meetKind}";
if(meetKind=='offline'){
	$("#meetKind").text("오프라인");
}else{
	$("#meetKind").text("온라인");
}

/* 모집마감일 뿌려주기 */
 var fdate = "${dto.finishDate}";
 var finishDate = new Date(fdate);
 var finishDay = finishDate.getDate();
 var finishMonth = finishDate.getMonth()+1;
 var finishYear = finishDate.getFullYear();
 $(".finishDate").text(finishYear+"년 "+finishMonth+"월 "+finishDay+"일");
 
 


/* reply 작성 */
 $("#btn").click(function() {
	 alert("yes");
	var chk = $("#reply_check").prop("checked");
	alert(chk);
	
	/* 비밀글이면 true, 공개댓글이면 false값 */
	if(chk==true){
		alert("true");
		alert($("#replyChk").val());
		$("#replyChk").prop("value", "true");
	}else{
		alert("false");
		$("#replyChk").prop("value", "false");
	}
	$("#frm").submit();
});


/* 답글버튼 */
 $(".project-reply-box-top").on("click",".listReply",function() {

		alert($(this).attr("id"));
		var testId = $(this).attr("id");

			$(".rere").html("");
			$("."+testId).html('<input type="text" id="recontents" name="contents"><input type="button" class="replybtn" value="댓글달기"><input type="button"class="cancle" id="'+testId+'" value="취소">');
			$(".listReply").attr("data-on", "off");
			$(this).attr("data-on", "on");
			
	});
	
 /* 댓글 취소 */
 $(".project-reply-box-top").on("click",".cancle",function() {
	var testId = $(this).attr("id");
	alert("testid=="+testId);
	alert("취소합시다");
	$("."+testId).html("");
	$(".listReply").show();
	
 });
 
 
 /* 댓글달기 버튼클릭 */
  $(".project-reply-box-top").on("click", ".replybtn", function() {
		
	 alert("ddd");
	 alert($("#recontents").val());
	 /* $("#frm").submit(); */
  });
	


$("#pj-delete").click(function() {

	var ch = confirm("삭제하시겠습니까?\n삭제한 프로젝트는 복구할 수 없습니다.");
	
	if(ch == true) {
		$.get("projectDelete?projectNum="+projectNum,function(data){
			location.href = "projectList";
		});
	} else {
		alert("취소되었습니다.");
		location.href = "projectView?projectNum="+projectNum;
	}
});
 
 $("#pj-update").click(function() {
	location.href = "projectUpdate?projectNum="+projectNum+"&email="+email;
});
 
 
 
 
$('#'+state).click(function() {
	

	var projectNum = '${dto.projectNum}';
		
	$('#deleteBTN').click(function() {
		
		if(confirm("정말로 프로젝트를 삭제하시겠습니까?")){
			$('#frmm').attr('action','./projectDelete');
			$('#frmm').submit();
		}else{
			
		}	
		
	});
});	
	
	$('#doneBTN').click(function() {
		if(confirm("프로젝트 검수를 완료하시겠습니까?")){
			$('#frmm').attr('action','../checkProject/checkProjectUpdate');
			$('#frmm').submit();
		}
		else{

		}
		
	});


</script>
</body>
</html>