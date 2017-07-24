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
	font-size: x-large;
	font-weight: bolder;
	margin-bottom: 10px;
}

#header_tt {
	font-size: small;
	font-weight: lighter;
}

.contents {
	width: 1260;
	height: auto;
	min-height: 1200px;
	max-height: 2700px;
	
}

.clean{
	background-color: #f2f2f2;
	height: 15px;
	width: 100%;
}
.contents_sub {
	width: 250px;
	height: 1000px;
	display: block;
	float: left;
}

.search-part{
	float: right;
}

.contents_main {
	width: 900px;
	height: auto;
	max-height: 2100px;
	min-height: 250px;
	display: block;
	float: right;
	background-color: white;
}
.project-sort-box{
	width: 100%;
	height: 120px;
	border: 1px solid #dedede;
	border-radius: 3px;
	border-bottom-width: 2px;
	background-color: white;
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
	background-image: url("${pageContext.request.contextPath}/resources/img/project/select.png");
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
	font-size:12px;
	font-weight: normal;
	margin-left: 10px;
	display: block;
	width: 100%;
	margin-bottom: 10px;
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
	background-color: yellow;
	margin-bottom: 5px;
}
.project-title{
	color: blue;
	font-size: 15px;
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
.fa{
	padding-right: 10px;
	padding-left: 10px;
	border-right: 1px solid #dedede;
	font-size: 14px;
	font-weight: bold;
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
}
.project-contents-right{
	font-size: 13px;
	width: 150px;
	float: right;
	height: 54px;
	line-height: 13px;
	background-color: gray;
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
	color: white;
	
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
</style>
<script type="text/javascript">


	$(function() {

		$("#preview").click(function() { 
			alert("preview");
			
		});
		$(".num").click(function() {

				var num = $(this).prop("id");
				alert(num);
				location.href = "projectList?curPage="+ num	+ "&search=${listInfo.search}&kind=${listInfo.kind}&arrange=${listInfo.arrange}";
						
						});
		$("#nextview").click(function() {
			alert("nextview")
			
		});

		
		/* $("#test").click(function() {
			
			var count = "${pjcount}";
			alert(count);
			
			  for(var j=0;j<count;j++){ 
				  var list = '${list}'.split(",");
				  alert(list);
				  
		
				  var skill = list.skill;
					alert(skill);
			  }  
		}); */
				
		
		
		
				//C#, CSS, JAVA
			  
				/* var sk = skill.split(",");
				alert(sk.length); //3
				for(i=0;i<sk.length;i++){
					$(".skill-name-"+i).text(sk[i]);	
				}  */
				
			
			
	});
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	<section class="main_section">
				<form action="" id="frm">

		<div class="project_header">
			<div class="header_text">
				<p id="header_ttt">프로젝트 찾기</p>
				<p id="header_tt">${pjcount}개의 프로젝트가 있습니다.</p>
				
				<div class="search-part">
				


					<input type="hidden" name="curPage"> 
					
					<input type="hidden" name="kind" value="total">
					 <input type="hidden" name="arrange" id="arrange">
					<input type="text" name="search"> <input type="submit" value="SEARCH">


				</div>
			</div>
		</div>


		<div class="contents">
		
		<!-- 프로젝트 찾기처리  -->
		<section class="contents_sub">
			<div class="project-sort-box">
			
				<div class="project-sort-text">프로젝트 정렬</div>
				<div class="left-sort-box">
					<div class="sort-button" id="by-price-desc">금액 높은 순</div>
					<div class="sort-button" id="by-price-asc">금액 낮은 순</div>
				</div>
				<div class="right-sort-box">
					<div class="sort-button" id="by-date-curr">최신 등록 순</div>
					<div class="sort-button" id="by-date-finish">마감 임박 순</div>
				</div>
			</div>
			<div class="clean"></div>
			
			<div class="category-filter-box">
				<div class="project-sort-text">프로젝트 카테고리</div>
				<div class="category-select-both">
					<div class="category-select-list">
					
					<!-- 클릭시 trigger 적용하자 -->
						<div class="cate-skipper">
							<input id="dev" class="cate-chk" name="category" type="checkbox" onclick="devClick()">
							<label for="dev" class="cate-label">개발</label>
							<ul class="cate-list">
								<li>
									<input id="dev-1" name="detailCategory" class="dev-chk" type="checkbox" value="웹">
									<label class="cate-label" for="dev-1">웹</label>
								</li>
								<li>
									<input id="dev-2" name="detailCategory" class="dev-chk" type="checkbox" value="애플리케이션">
									<label class="cate-label">애플리케이션</label>
								</li>
								<li>
									<input id="dev-3" name="detailCategory" class="dev-chk" type="checkbox" value="워드프레스">
									<label class="cate-label">워드프레스</label>
								</li>
								<li>
									<input id="dev-4" name="detailCategory" class="dev-chk" type="checkbox" value="퍼블리싱">
									<label class="cate-label">퍼블리싱</label>
								</li>
								<li>
									<input id="dev-5" name="detailCategory" class="dev-chk" type="checkbox" value="일반소프트웨어">
									<label class="cate-label">일반 소프트웨어</label>
								</li>
								<li>
									<input id="dev-6" name="detailCategory" class="dev-chk" type="checkbox" value="쇼핑몰">
									<label class="cate-label">쇼핑몰</label>
								</li>
								<li>
									<input id="dev-7" name="detailCategory" class="dev-chk" type="checkbox" value="게임">
									<label class="cate-label">게임</label>
								</li>
								<li>
									<input id="dev-8" name="detailCategory" class="dev-chk" type="checkbox" value="임베디드">
									<label class="cate-label">임베디드</label>
								</li>
								<li>
									<input id="dev-9" name="detailCategory" class="dev-chk" type="checkbox" value="기타">
									<label class="cate-label">기타</label>
								</li>
							</ul>
						</div>
						
					</div>
					<div class="category-select-list">
						<div class="cate-skipper">
							<input id="design" class="cate-chk" name="category" type="checkbox" onclick="designClick()">
							<label for="design" class="cate-label">디자인</label>
							<ul class="cate-list">
								<li>
									<input id="design-1" name="detailCategory" class="design-chk" type="checkbox" value="웹">
									<label class="cate-label">웹</label>
								</li>
								<li>
									<input id="design-2" name="detailCategory" class="design-chk" type="checkbox" value="애플리케이션">
									<label class="cate-label">애플리케이션</label>
								</li>
								<li>
									<input id="design-3" name="detailCategory" class="design-chk" type="checkbox" value="제품">
									<label class="cate-label">제품</label>
								</li>
								<li>
									<input id="design-4" name="detailCategory" class="design-chk" type="checkbox" value="프레젠테이션">
									<label class="cate-label">프레젠테이션</label>
								</li>
								<li>
									<input id="design-5" name="detailCategory" class="design-chk" type="checkbox" value="인쇄물">
									<label class="cate-label">인쇄물</label>
								</li>
								<li>
									<input id="design-6" name="detailCategory" class="design-chk" type="checkbox" value="쇼핑몰">
									<label class="cate-label">쇼핑몰</label>
								</li>
								<li>
									<input id="design-7" name="detailCategory" class="design-chk" type="checkbox" value="로고">
									<label class="cate-label">로고</label>
								</li>
								<li>
									<input id="design-8" name="detailCategory" class="design-chk" type="checkbox" value="그래픽">
									<label class="cate-label">그래픽</label>
								</li>
								<li>
									<input id="design-9" name="detailCategory" class="design-chk" type="checkbox" value="영상">
									<label class="cate-label">영상</label>
								</li>
								<li>
									<input id="design-10" name="detailCategory" class="design-chk" type="checkbox" value="게임">
									<label class="cate-label">게임</label>
								</li>
								<li>
									<input id="design-11" name="detailCategory" class="design-chk" type="checkbox" value="기타">
									<label class="cate-label">기타</label>
								</li>
							</ul>
						</div>
					
					</div>
				</div>
			</div>
				
			<div class="clean"></div>
			
			<div class="project-sort-box">
				<div class="project-sort-text">미팅진행 지역</div>
				<div class="place-sort-box">
				
				<button class="btn btn-default address-select-btn" data-on="off">
					<span>전체 선택</span>
					<span class="fa fa-sort"></span>
				</button>
				
				<ul class="dropdown-selecter" id="addr_list">
					<li class="dropdown-scroll">
						<input name="address" type="checkbox">
						<!-- 전체 선택해주는 전체선택  -->
						<label class="address-select-label" for="address">전체 선택</label>
						<ul class="address-list">
							<li>
								<input type="checkbox" name="addr_main" id="address-1">
								<label class="address-select-label" for="address-1">서울시</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-2">
								<label class="address-select-label" for="address-2">경기도</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-3">
								<label class="address-select-label" for="address-3">인천</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-4">
								<label class="address-select-label" for="address-4">부산</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-5">
								<label class="address-select-label" for="address-5">대구</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-6">
								<label class="address-select-label" for="address-6">광주</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-7">
								<label class="address-select-label" for="address-7">대전</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-8">
								<label class="address-select-label" for="address-8">울산</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-9">
								<label class="address-select-label" for="address-9">세종</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-10">
								<label class="address-select-label" for="address-10">강원도</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-11">
								<label class="address-select-label" for="address-11">충북</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-12">
								<label class="address-select-label" for="address-12">충남</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-13">
								<label class="address-select-label" for="address-13">전북</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-14">
								<label class="address-select-label" for="address-14">전남</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-15">
								<label class="address-select-label" for="address-15">경북</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-16">
								<label class="address-select-label" for="address-16">경남</label>
							</li>
							<li>
								<input type="checkbox" name="addr_main" id="address-17">
								<label class="address-select-label" for="address-17">제주도</label>
							</li>
						
						</ul>
				</ul>
			
				</div>
			</div>
				
		</section>

		
		
		<!-- 프로젝트 리스트 뿌려주는부분  -->
			<section class="contents_main">
			
			
			
		<!-- 프로젝트 각각 -->	
			<c:forEach items="${list}"  var="dto">
			
				<div class="project-unit">
					<div class="project-head">
						<div class="project-title"><a href="projectView?projectNum=${dto.projectNum}">${dto.name}</a></div>
					</div>
					<div class="project-body">
						<div class="project-info">
							<div class="fa fa-won" style="padding-left: 0px;">예상금액 ${dto.budget}원</div>
							<div class="fa fa-clock-o">예상기간 ${dto.period}일</div>
							<div class="fa-reg_date">등록일자 ${dto.reg_date}</div>
						</div>
						<div class="project-contents">${dto.contents }</div>
						<div class="project-contents-right">
							<div class="right-contents-sub">
							<img src="${pageContext.request.contextPath}/resources/img/project/clock-closed.png">
							마감<strong>${dto.finishDate}</strong></div>
							<div class="right-contents-sub">
							<img src="${pageContext.request.contextPath}/resources/img/project/proposal-user.png">
							총지원 <strong>몇명</strong></div>
						</div>
						
						<div style="clear: both;"></div>
						
						<div class="project-bottom">
							<span class="main-cate">개발</span>
							<span class="sub-cate">애플리케이션</span>
							<div class="skill-box">
								<span class="skill-main">요구기술</span>
						
							<c:forEach items="${dto.skills}" var="sk">
								 <span class="skill-name">sk = ${sk}</span>
							
							</c:forEach>
							
							</div>
						</div>
					</div>
				</div>	
			</c:forEach>

			
			<div class="contents_bottom">
				<div class="contents_paging">
				<c:if test="${listInfo.curBlock>1 }"> -
				<span id="preview">[이전]</span>		
				</c:if>
		
				<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
					<span class="num" id="${i}">${i}</span>			
				</c:forEach>
		
				<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
				<span id="nextview">[다음]</span>			
				</c:if>
				</div>
	 
				<div>
					<p>curPage : ${listInfo.curPage }         search : ${listInfo.search}     kind : ${listInfo.kind }</p>
					<p>startNum : ${listInfo.startNum}   lastNum : ${listInfo.lastNum}</p>
					<p>startRow : ${listInfo.startRow}   lastRow : ${listInfo.lastRow}</p>
					<p>curBlock : ${listInfo.curBlock }      perPage : ${listInfo.perPage}</p>
				</div>

			</div>
			</section>
		</div>
		</form>
	</section>
<script type="text/javascript">


$("#by-price-desc").click(function() {
	alert("click");
	/*  $.ajax({
	    url: "projectMap",
	    type: "GET",
 
	    success: function(data){
	       alert(JSON.stringify(data));
	       		
	    alert("skill="+data.sk);
	       alert(JSON.stringify(data.sk)); 
	       
	          alert("pjlist="+data.pjlist);
	          alert(JSON.stringify(data.pjlist));
	          alert("pjlist[4].name="+data.pjlist[5].name);
	          alert("pjlist[0].budget="+data.pjlist[0].budget);
	          alert("pjlist[0].period="+data.pjlist[0].period);
	          alert("pjlist[0].reg_date="+data.pjlist[0].reg_date);
	          alert("pjlist[0].contents="+data.pjlist[0].contents);
	          alert("pjlist[4].skill="+data.pjlist[5].skill);
	          alert("skills[4]="+data.pjlist[5].skills[0]);
	          alert("skills.length="+data.pjlist[5].skills.length);
				
			$(".project-unit").html(
				
			);
	    }
		
	});  */
});  
	/* alert("click");
	$("#arrange").val("money");
	alert($("#arrange").val());
	$.get("arrangeMoney?search=${listInfo.search}&kind=${listinfo.kind}&arrange=money",function(data){
		alert("${listInfo.search}");
		$(".contnets-main").html();
		
	}); */
	/*  alert("cc");
	  $.ajax({
		url:"arrangeMoney",
		dataType:JSON,
		//"projectList?curPage="+ num	+ "&search=${listInfo.search}&kind=${listInfo.kind}&arrange=${listInfo.arrange}";
		data:{
			list:list
		},
		type:"GET",
		success:function(data){
			alert("success");
		}
	}); 
*/

$("#by-price-asc").click(function() {
	alert("금액낮은순");
	$("#arrange").val("mm");
	alert($("#arrange").val());
	$("#frm").submit();
});
$("#by-date-curr").click(function() {
	alert("최신등록순");
	$("#arrange").val("current");
	alert($("#arrange").val());
	$("#frm").submit();
});
$("#by-date-finish").click(function() {
	alert("마감임박순");
	$("#arrange").val("last");
	alert($("#arrange").val());
	$("#frm").submit();
});




/* 프로젝트 카테고리 체크박스 설정 */
function devClick() {
	var devCheck = $("input[class='dev-chk']:checked").length;
		alert(devCheck);
		if(($(".dev-chk").length)==devCheck){
			$(".dev-chk").prop("checked", false);
		}else{
			$(".dev-chk").prop("checked", true);
		}
	
}
 $(".dev-chk").click(function() { 
	 var de_id = $(this).val();
	 alert(de_id);
	 var devCheck = $("input[class='dev-chk']:checked").length;
	 alert(devCheck);
	if(($(".dev-chk").length)==devCheck){
		$("#dev").prop("checked", true);
	}else{
		$("#dev").prop("checked", false);
	}
});

  function designClick() {
		
	var designCheck = $("input[class='design-chk']:checked").length;
		alert(designCheck); 
		if(($(".design-chk").length)==designCheck){
			$(".design-chk").prop("checked", false);
		}else{
			$(".design-chk").prop("checked", true);
		}
	}


$(".design-chk").click(function() { 
	 var de_id = $(this).val();
	 alert(de_id);
	 var designCheck = $("input[class='design-chk']:checked").length;
	 alert(designCheck);
	if(($(".design-chk").length)==designCheck){
		$("#design").prop("checked", true);
	}else{
		$("#design").prop("checked", false);
	}
}); 








/* 왼쪽 주소체크박스 */
$(".address-select-btn").click(function() {
	alert("btn");
	if($(".address-select-btn").attr("data-on")=="off"){
		$("#addr_list").css("visibility", "visible");			
		$(".address-select-btn").attr("data-on", "on");
	}else if($(".address-select-btn").attr("data-on")=="on"){
		$("#addr_list").css("visibility", "hidden");
		$(".address-select-btn").attr("data-on", "off");
	}
});

</script>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>