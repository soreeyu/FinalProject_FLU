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
.profile_wrap p > b{
	float: right;
	margin-top: 7px;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: #66b3ff;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
    cursor: pointer;
}

.profile_title > p{
	margin-top: 20px;
}
.profile_title > p > span {
	font-size: 28px;
	font-weight: bold;
}

.profile_wrap{
	padding-bottom: 20px;
	margin-bottom: 20px;
}
.profile_wrap p{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
}


.no_data_wrap{
	width: 100%;
    height: 170px;
    padding-top: 15px;
    padding-bottom: 15px;
}
.no_data{
	width: 100%;
    height: 100%;
    text-align: center;
    margin: 0 auto;
}
.no_img p{
	font-size: 14px;
	margin-top: 15px;
	color: #999;
}
.no_img p span{
	font-weight: bold;
}

#a{
	background-color: #66b3ff;
	color: white;
}


/********************** 경력 폼 ****************************/
.carrerform_div, .academicform_div, .licenseform_div{
	display: inline-block;
	width: 100%;
}

.carrer_div input[type = button], .academic_div input[type = button], .license_div input[type = button]{
	float: right;
	margin-top: 7px;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: black;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
    border: 0;
    margin-left: 10px;
    cursor: pointer;
}

.carrerform_div p,.academicform_div p , .licenseform_div p{
	font-size: 15px;
	font-weight: normal;
	margin-top: 10px;	
}
.carrerform_div1, .academicform_div1, .licenseform_div {
	display: inline-block;
	width: 100%;
}

</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
		<div class="page_wrap">
		<div class="page">
			<c:import url="/WEB-INF/views/temp/mypagesidebar.jsp"></c:import>
			
			<div class="contents">
				<div class="contents_inner">
					<section class="profile_title">
					
						<p><span>경력, 학력, 자격증</span></p>
					</section>
					<section class="profile_wrap">
						<p><b id="carrer" style="margin-top: -5px;">경력 추가하기</b></p>
						<div class="carrer_div">
						<p><span>경력</span></p>
						<input id="member_email" type="hidden" name="email" value="${member.email }">
						
						<div class="no_data_wrap">
							<c:choose>
							<c:when test="${empty carrer }">
							<div class="no_data">
								<div class="no_img">
									<img alt="경력" src="${pageContext.request.contextPath }/resources/img/mypage/carrer.png">
									<p>등록된 <span>'경력'</span>이 없습니다.</p>
								</div>
							</div>
							</c:when>
							<c:otherwise>
								<table>
									<colgroup>
										<col width="30%">
										<col width="20%">
										<col width="10%">
										<col width="20%">
										<col width="*%">
									</colgroup>
									<tr style="text-align: left;">
										<th>회사명</th>
										<th>부서명</th>
										<th>직위</th>
										<th>입사일</th>
										<th>퇴사일</th>
										<th>도구</th>
									</tr>
								<c:forEach items="${carrer }" var="i">
									<tr>
										<td>${i.companyName }</td>
										<td>${i.dept }</td>
										<td>${i.position }</td>
										<td>${i.hireDate }</td>
										<td>${i.retireDate }</td>
										<td><span class="cUpdate" id="${i.companyName }">수정</span><span class="cDelete" title="${i.num }">삭제</span></td>
									</tr>
								</c:forEach>
								</table>
							</c:otherwise>
							</c:choose>
						</div>
						</div>
						<p><b id="academic" style="margin-top: -5px;">학력 추가하기</b></p>
						<div class="academic_div">
						<p><span>학력</span></p>
						
						<div class="no_data_wrap">
						<c:choose>
							<c:when test="${empty academic }">
							<div class="no_data">
								<div class="no_img">
									<img alt="학력" src="${pageContext.request.contextPath }/resources/img/mypage/academic.png">
									<p>등록된 <span>'학력'</span>이 없습니다.</p>
								</div>
							</div>
							</c:when>
							<c:otherwise>
								<table>
									<colgroup>
										<col width="30%">
										<col width="20%">
										<col width="10%">
										<col width="20%">
										<col width="*%">
									</colgroup>
									<tr style="text-align: left;">
										<th>분류</th>
										<th>상태</th>
										<th>학교명</th>
										<th>전공</th>
										<th>입학일</th>
										<th>졸업일</th>
										<th>도구</th>
									</tr>
								<c:forEach items="${academic }" var="i">
									<tr>
										<td>${i.school }</td>
										<td>${i.state }</td>
										<td>${i.sName }</td>
										<td>${i.major }</td>
										<td>${i.entrance }</td>
										<td>${i.graduate }</td>
										<td><span class="aUpdate" id="${i.sName }">수정</span><span class="aDelete" title="${i.num }">삭제</span></td>
									</tr>
								</c:forEach>
								</table>
							</c:otherwise>
							</c:choose>
							
						</div>
						</div>
						<p><b id="license" style="margin-top: -5px;">자격증 추가하기</b></p>
						<div class="license_div">
						<p><span>자격증</span></p>
						
						<div class="no_data_wrap">	
						<c:choose>
							<c:when test="${empty license }">
							<div class="no_data">
								<div class="no_img">
									<img alt="자격증" src="${pageContext.request.contextPath }/resources/img/mypage/license.png">
									<p>등록된 <span>'자격증'</span>이 없습니다.</p>
								</div>
							</div>
							</c:when>
							<c:otherwise>
								<table>
									<colgroup>
										<col width="30%">
										<col width="20%">
										<col width="10%">
										<col width="20%">
										<col width="*%">
									</colgroup>
									<tr style="text-align: left;">
										<th>자격증명</th>
										<th>발급기관</th>
										<th>발급일</th>
										<th>일련번호</th>
										<th>도구</th>
									</tr>
								<c:forEach items="${license }" var="i">
									<tr>
										<td>${i.lName }</td>
										<td>${i.agency }</td>
										<td>${i.publishDate }</td>
										<td>${i.seiralNum }</td>
										<td><span class="lUpdate" id="${i.lName }">수정</span><span class="lDelete" title="${i.num }">삭제</span></td>
									</tr>
								</c:forEach>
								</table>
							</c:otherwise>
							</c:choose>
						</div>
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
$(function() {
	
	 var carrer = $(".carrer_div").html();
	
	var academic =$(".academic_div").html();
	var license = $(".license_div").html(); 
	
	var email = $("#member_email").val();
	
	//경력 폼 불러오기
	$("#carrer").click(function() {
		
		 $.ajax({
			url:"carrerInsert",
			type: "get",
			data:{},
			success:function(data){
				$(".carrer_div").html(data);
				$("#carrer").hide();
			}
		});
	 	
	});
	
	//경력 수정 폼 불러오기
	$(".cUpdate").click(function() {
		var companyName = $(this).attr("id");
	
		$.ajax({
			url:"carrerUpdate",
			type: "get",
			data:{
				companyName: companyName,
				email : email
		
			},
			success:function(data){
				$(".carrer_div").html(data);
				$("#carrer").hide();
			}
		});
	});
	
	//경력 수정 폼 불러오기
	$(".carrer_div").on("click",".cUpdate",function() {
		var companyName = $(this).attr("id");
	
		$.ajax({
			url:"carrerUpdate",
			type: "get",
			data:{
				companyName: companyName,
				email : email
		
			},
			success:function(data){
				$(".carrer_div").html(data);
				$("#carrer").hide();
			}
		});
	});
	
	
	//학력 폼 불러오기
	$("#academic").click(function() {
		$.ajax({
			url:"academicInsert",
			type: "get",
			data:{},
			success:function(data){
				$(".academic_div").html(data);
				$("#academic").hide();
			}
		});
		
		});
	
	//학력 수정 폼 불러오기
	$(".academic_div").on("click",".aUpdate",function() {
		var sName = $(this).attr("id");
	
		$.ajax({
			url:"academicUpdate",
			type: "get",
			data:{
				sName: sName,
				email : email
		
			},
			success:function(data){
				$(".academic_div").html(data);
				$("#academic").hide();
			}
		});
	});
	
	//자격증 폼 불러오기
	$("#license").click(function() {
		$.ajax({
			url:"licenseInsert",
			type: "get",
			data:{},
			success:function(data){
				$(".license_div").html(data);
				$("#license").hide();
			}
		});
		
		});
	
	//자격증 수정 폼 불러오기
	$(".license_div").on("click",".lUpdate",function() {
		var lName = $(this).attr("id");
	
		$.ajax({
			url:"licenseUpdate",
			type: "get",
			data:{
				lName: lName,
				email : email
		
			},
			success:function(data){
				$(".license_div").html(data);
				$("#license").hide();
			}
		});
	});
	
	//취소버튼
	$(".carrer_div").on("click", "#carrer_cencel", function() {
		$(".carrer_div").html(carrer);
		$("#carrer").show();
	});
	$(".academic_div").on("click", "#academic_cencel", function() {
		$(".academic_div").html(academic);
		$("#academic").show();
	});
	$(".license_div").on("click", "#license_cencel", function() {
		$(".license_div").html(license);
		$("#license").show();
	});
	
	//삭제버튼
	$(".cDelete").click(function() {
		var num = $(this).attr("title");
		location.href = "carrerDelete?num="+num+"&email="+email;
	});
	
	$(".aDelete").click(function() {
		var num = $(this).attr("title");
		location.href = "academicDelete?num="+num+"&email="+email;
	});

	$(".lDelete").click(function() {
		var num = $(this).attr("title");
		location.href = "licenseDelete?num="+num+"&email="+email;
	});
	
	
	
	
	//경력 등록
	$(".carrer_div").on("click", "#carrer_ok",function() {
		
		var companyName = $("#companyName").val();
		var dept = $("#dept").val();
		var position = $("#position").val();
		var hireDate = $("#hireDate").val();
		var retireDate = $("#retireDate").val();
		
		
		if(companyName == "" || dept == "" || position == "" || hireDate =="" ||retireDate ==""){
			
			alert("실패");
		}else{
			alert("성공");
			
			$("#carrerform").submit();
		}
	});
	//경력 수정
	
	
	//학력 등록
	$(".academic_div").on("click", "#academic_ok",function() {
		
		var school = $("#school").val();
		var state = $("#state").val();
		var sName = $("#sName").val();
		var major = $("#major").val();
		var entrance = $("#entrance").val();
		var graduate = $("#graduate").val();
		
		if(school == "" || state == "" || sName == "" || major =="" ||entrance =="" || graduate ==""){
			
			alert("실패");
		}else{
			alert("성공");
			
			$("#academicform").submit();
		}
	});
	
	//자격증 등록
	$(".license_div").on("click", "#license_ok",function() {
		
		var lName = $("#lName").val();
		var agency = $("#agency").val();
		var publishDate = $("#publishDate").val();
		var seiralNum = $("#seiralNum").val();
		
		
		if(lName == "" || agency == "" || publishDate == "" || seiralNum ==""){
			
			alert("실패");
		}else{
			alert("성공");
			
			$("#licenseform").submit();
		}
	});
	
	
	
});
</script>
</html>