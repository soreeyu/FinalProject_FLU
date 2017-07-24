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
.profile_title > p:FIRST-CHILD > a{
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
}

.profile_title > p:FIRST-CHILD{
	margin-top: 20px;
}
.profile_title > p > span {
	font-size: 28px;
	font-weight: bold;
}

.profile_wrap{
	
}
.profile_wrap > p:FIRST-CHILD{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
}

.profile_wrap > .or{
	border-bottom: 1px dashed #dedede;
}

.no_data_wrap{
	width: 100%;
    min-height: 410px;
    padding-top: 15px;
   
    
}
.no_data{
	width: 100%;
    text-align: left;
    margin: 0 auto;
}
.no_img{
	
	padding: 40px 0 40px 0;
}
.no_img p{
	font-size: 14px;
	margin-top: 15px;
	color: #999;
}
.no_img label{
	width: 100px;
	text-align: right;
	display: inline-block;
	margin-right: 30px;
}
.no_img textarea{
	vertical-align: top;
}
.no_img input[type = text]{
	padding: 5px;
	margin-left: -5px;
}

.no_img input[type = button]{
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
.p_label{
	margin-left: 130px;
	color: red !important;
}
.p_label label{
	width: 100%;
	text-align: left;
	margin-right: 0;
	display: inline;
}

#a{
	color: white;
	background-color: #66b3ff;
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
						<p><span>포트폴리오 추가</span></p>
					</section>
					<section class="profile_wrap">
						
						
						<div class="no_data_wrap">
							<div class="no_data">
								<form id="form" action="${path}" method="post" enctype="multipart/form-data">
								<input type="hidden" name="email" value="${member.email }">
								<div class="no_img">
									<p><label>제목</label>
									<input id="title" name="title" type="text" value="${map.dto.title }"></p>
									<p class="p_label" id="p_title"></p>
									<p><label>설명</label><textarea id="discribe" name="describe" cols="70" rows="10">${map.dto.describe }</textarea></p>
									<p class="p_label" id="p_dis"></p>
									<p><label>참여시작일</label><input id="startD" name="startDate" type="date" value="${map.dto.startDate }">
									<label>참여종료일</label><input id="finishD" name="finishDate" type="date" value="${map.dto.finishDate }"></p>
									<p class="p_label" id="p_date"></p>
									<p><label>참여율</label><input id="percentage" name="percentage" type="number" max="100" min="1" value="${map.dto.percentage }"></p>
									<p class="p_label" id="p_percent"><i class='fa fa-exclamation-circle'></i>&nbsp;<label>1부터 100까지의 정수를 입력해 주세요</label></p>
									<p><label>대표이미지</label><input id="f1" name="f1" type="file" accept=".jpg, .png, .gif" value="${map.dto.pfOname }"></p>
									<c:choose>
									<c:when test="${not empty map.imglist }">
									
									
									<p><label>이미지</label><input name="f1" type="file" accept=".jpg, .png, .gif"></p>
									<p><input type="text" name="contents1" value="${map.imglist.get(0).contents }"></p>
									<p><label>이미지</label><input name="f1" type="file" accept=".jpg, .png, .gif"></p>
									<p><input type="text" name="contents2" value="<c:catch>${map.imglist.get(1).contents }</c:catch>"></p>
									
									
									</c:when>
									<c:otherwise>
									<p><label>이미지</label><input name="f1" type="file" accept=".jpg, .png, .gif"></p>
									<p><input type="text" name="contents1"></p>
									<p><label>이미지</label><input name="f1" type="file" accept=".jpg, .png, .gif"></p>
									<p><input type="text" name="contents2"></p>
									</c:otherwise>
									</c:choose>
									<p><input id="ok" type="button" value="등록"><input id="cencel" type="button" value="취소"></p>
									<c:if test="${not empty map.dto }">
									<input type="hidden" name="pfNum" value="${map.dto.pfNum }">
									</c:if>
								</div>
								</form>
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


	$("#cencel").click(function() {
		location.href="portfolioView";
	});
	$("#ok").click(function() {
		var d1 = $("#title").val();
		var d2 = $("#discribe").val();
		var d3 = $("#startD").val();
		var d4 = $("#finishD").val();
		var d5 = $("#percentage").val();
		
		var ck1=0;
		var ck2=0;
		var ck3=0;
		var ck4=0;
		
		if(d1 == ""){
			$("#p_title").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>항목을 채워주세요</label>");
			ck1=0;
		}else{
			$("#p_title").html("");
			ck1=1;
		}
		if(d2 ==""){
			$("#p_dis").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>항목을 채워주세요</label>");
			ck2=0;
		}else{
			$("#p_dis").html("");
			ck2=1;
		}
		if(d3 == "" || d4 ==""){
			$("#p_date").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>항목을 채워주세요</label>");
			ck3=0;
		}else if(d3 > d4){
			$("#p_date").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>참여 시작일 또는 참여 종료일이 잘못 입력되었습니다.</label>");
			ck3=0;
		}else{
			$("#p_date").html("");
			ck3=1;
		}
		if(d5 > 100 || d5 < 1){
			$("#p_percent").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>1부터 100까지의 정수를 입력해 주세요</label>");
			ck4=0;
		}else if(d5 == ""){
			$("#p_percent").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>항목을 채워주세요</label>");
			ck4=0;
		}else{
			$("#p_percent").html("");
			ck4=1;
		}
		
		
		
		if(ck1 == 0 || ck2 == 0 || ck3 ==0 || ck4 ==0){
			alert("항목을 전부 채워주세요");
		}else{

			alert("등록성공");
			$("#form").submit();
			
		}
		
	});
</script>

</html>