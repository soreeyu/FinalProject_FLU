<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
     google.charts.load('current', {packages: ['corechart']});     
   </script>

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



/******************************** 프로필 정보  *******************************/
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
	margin-bottom: 20px;
	border-bottom: 1px dashed #dedede;45
	
}

.profile_title p{
	margin-top: 15px;
    margin-bottom: 15px;
    line-height: 1;
}

.profile_title > p:FIRST-CHILD  span:FIRST-CHILD {
	font-size: 28px;
	vertical-align: middle;  
}
.availability{
	background-color: #94a2af;
	font-size: 14px;
    line-height: 34px;
    color: #fff;
    text-align: center;
    border-radius: .2em;
    margin-left: 10px;
    padding: .2em .6em .2em;
    vertical-align: top	;
}
.profile_title > p:FIRST-CHILD > a:LAST-CHILD , .profile_wrap > p:FIRST-CHILD > a{
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
.profile_title > p:LAST-CHILD {
	margin-bottom: 20px;
	margin-top: 10px;
}

.profile_title > p:LAST-CHILD > span span{
	margin-left: 10px;
	font-size: 14px;
	font-weight: 700;
    line-height: 1.1;
    color: #555555;
}


.bar{
	margin-left: 10px;
	margin-right: 6px;
}


.profile_wrap{
	padding-bottom: 20px;
	border-bottom: 1px dashed #dedede;
	margin-bottom: 20px;
}
.profile_wrap > p:FIRST-CHILD{
	margin-top: 20px;
}
.profile_wrap > p > span {
	font-size: 18px;
	font-weight: bold;
}

.no_data_wrap{
	width: 100%;
    height: 170px;
    text-align: center;
    padding-top: 15px;
    padding-bottom: 15px;
}
.no_data{
	width: 100%;
    height: 100%;
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
.wrap_1{
	display:inline-block; 
	padding-right: 20px; 
	border-right: 1px solid #dedede;
	float: left;
}
.wrap_1:LAST-CHILD{
	border: 0;
}

.ooo{
	display: inline-block;
}
.wrap_1 img{
	margin-left: 15px;
	width: 200px;
	height: 37px;
}

/** 자기소개 **/
.introform{
	width: 100%;
	height: 100%;
	margin-top: 20px;
	margin-bottom: 10px;
	overflow-y: scroll;
}


/**** 스킬 ****/
.skill thead{
	background-color: #ccddff;
	font-weight: bold;
	font-size: 15px;
}
.skill tbody{
	font-size: 15px;
	text-align: left;
}
.skill th, .skill td{
	padding: 8px;
	border-left: 1px solid #ccccff;
	border-bottom: 1px solid #ccccff;
}
.skill th{
	border-top: 2px solid #3377ff;
}
.skill th:FIRST-CHILD,td:FIRST-CHILD{
	border-left: 0;
}


#a{
	background-color: #66b3ff;
	color: white;
}



/******************평점 있을 때 **************************/
.wrap_eval{
	padding: 18px 21px 4px;
	margin-bottom: 10px;
}

.wrap_eval table tbody tr{
	border-top: 1px solid #dedede;
    border-bottom: 1px solid #dedede;
    font-size: 14px;
    line-height: 16px;
    color: #333333;
}

.wrap_eval table{
	text-align : center;
	margin-bottom: 10px;
}

.td_title{
	padding: 10px;
    background-color: #f7f7f7;
    color: #666666;
    font-weight: bold;
}
.td_contents{
	padding-top: 10px;
    padding-bottom: 10px;
    color: #535353;
}
.wrap_eval{
	border: 1px solid #dedede;
}
.wrap_projectName{
	margin-top: 0px;
    font-size: 18px;
    line-height: 18px;
    color: #00264d;
    font-weight: bold;
    margin-bottom: 10px;
}
.wrap_project_etc{
	margin-bottom: 13px;
}
.wrap_project_etc span:FIRST-CHILD{
	font-size: 13px;
    line-height: 16px;
    color: #999999;
}
.wrap_project_etc span:FIRST-CHILD span:FIRST-CHILD{
	font-weight: bold;
}



.wrap_project_etc span:LAST-CHILD{
	font-size: 13px;
    line-height: 16px;
    color: #999999;
}
.wrap_project_etc span:LAST-CHILD span:FIRST-CHILD{
	margin-right: 5px;
    font-weight: bold;
}
.wrap_project_etc span:LAST-CHILD span:LAST-CHILD{
	color: #434343;
}

.wrap_eval ul{
	width: 686px;
    margin-bottom: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
    list-style: none;
    text-align: center;
    border-top: 1px dashed #dedede;
    border-bottom: 1px dashed #dedede;
    
}
.wrap_eval ul li{
	float: left;
    padding-left: 22px;
    padding-right: 20px;
    font-size: 13px;
    color: #666666;
    line-height: 15px;
    
}
.wrap_eval ul li > p {
	margin-bottom: 6px;
}
.wrap_eval ul li span:LAST-CHILD{
	vertical-align: top;
	font-weight: bold;
	margin-left: 2px;
}

.wrap_eval ul:AFTER {
	content: " ";
    display: table;
    line-height: 0;
	clear: both;
}
.li_bar{
    float: left;
    padding: 0 !important;
    height: 39px;
    border-left: 1px solid #dedede;
}

.eval_star{
	margin-bottom: 10px;
	text-align: center;
}
.no{
	background-color: #dedede;
}
.notno{
	background-color: #339bff;
}
.nono{
	background-color: green;
}


</style>
<script type="text/javascript">

$(function(){
    //canvas요소에 대한 Context 개체 가져오기            
    var ctx = document.getElementById('mycanvas').getContext('2d');
    if(!ctx) {
        return;
    }
   
   
    ctx.strokeStyle ='gray';
    
    ctx.beginPath();
    ctx.moveTo(100,15);
    ctx.lineTo(100,100);
    ctx.fillText("전문성",85,10);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(19,75);
    ctx.fillText("적극성",0,65);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(49,169);
    ctx.fillText("일정 준수",25,179);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(151,169);
    ctx.fillText("의사소통",135,179);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(181,75);
    ctx.fillText("만족도",168,65);
    ctx.closePath();
    ctx.stroke();
  
    
    //5
    ctx.beginPath();
    ctx.moveTo(100,15);
    ctx.lineTo(19,75);
    ctx.lineTo(49,169);
    ctx.lineTo(151,169);
    ctx.lineTo(181,75);
    ctx.closePath();
    ctx.stroke();
    
    //4
    ctx.beginPath();
    ctx.moveTo(100,30);
    ctx.lineTo(33,79);
    ctx.lineTo(58,157);
    ctx.lineTo(142,157);
    ctx.lineTo(167,79);
    ctx.closePath();
    ctx.stroke();
    
    //3
    ctx.beginPath();
    ctx.moveTo(100,45);
    ctx.lineTo(47,84);
    ctx.lineTo(67,146);
    ctx.lineTo(133,146);
    ctx.lineTo(153,84);
    ctx.closePath();
    ctx.stroke();
    
    //2
    ctx.beginPath();
    ctx.moveTo(100,60);
    ctx.lineTo(61,88);
    ctx.lineTo(76,134);
    ctx.lineTo(124,134);
    ctx.lineTo(139,88);
    ctx.closePath();
    ctx.stroke();
    
    //1
    ctx.beginPath();
    ctx.moveTo(100,75);
    ctx.lineTo(75,93);
    ctx.lineTo(85,123);
    ctx.lineTo(115,123);
    ctx.lineTo(125,93);
    ctx.closePath();
    ctx.stroke();
    
 	 

    //내 평점
    //위에서부터 왼쪽으로
    //			전문성	적극성	일정준수	  의사소통		만족도
    //5점 좌표 {(100,15),(19,75),(49,169),(151,169),(181,75)}
    //4점 좌표 {(100,30),(33,79),(58,157),(142,157),(167,79)}
    //3점 좌표 {(100,45),(47,84),(67,146),(133,146),(153,84)}
    //2점 좌표 {(100,60),(61,88),(76,134),(124,134),(139,88)}
    //1점 좌표 {(100,75),(75,93),(85,123),(115,123),(125,93)}
    
    var professional = ${evaluation.professional };
    var passion = ${evaluation.passion};
    var schedule = ${evaluation.schedule };
    var communication = ${evaluation.communication };
   	var satisfy = ${evaluation.satisfy };
    
    
    
    ctx.strokeStyle = "yellow";
    ctx.beginPath();
    
    if(professional==5){
    	ctx.moveTo(100,15); 
    }else if(professional==4){
    	ctx.moveTo(100,30);
    }else if(professional==3){
    	ctx.moveTo(100,45);
    }else if(professional==2){
    	ctx.moveTo(100,60);
    }else if(professional==1){
    	ctx.moveTo(100,75);
    }else{
    	ctx.moveTo(100,100);
    }
    
    if(passion==5){
    	ctx.lineTo(19,75);
    }else if(passion==4){
    	ctx.lineTo(33,79);
    }else if(passion==3){
    	ctx.lineTo(47,84);
    }else if(passion==2){
    	ctx.lineTo(61,88);
    }else if(passion==1){
    	ctx.lineTo(75,93);
    }else{
    	ctx.lineTo(100,100);
    }
    
    if(schedule==5){
    	ctx.lineTo(49,169);
    }else if(schedule==4){
    	ctx.lineTo(58,157);
    }else if(schedule==3){
    	ctx.lineTo(67,146);
    }else if(schedule==2){
    	ctx.lineTo(76,134);
    }else if(schedule==1){
    	ctx.lineTo(85,123);
    }else{
    	ctx.lineTo(100,100);
    }
    
    if(communication==5){
    	ctx.lineTo(151,169);
    }else if(communication==4){
    	ctx.lineTo(142,157);
    }else if(communication==3){
    	ctx.lineTo(133,146);
    }else if(communication==2){
    	ctx.lineTo(124,134);
    }else if(communication==1){
    	ctx.lineTo(115,123);
    }else{
    	ctx.lineTo(100,100);
    }
    
    if(satisfy==5){
    	ctx.lineTo(181,75);
    }else if(satisfy==4){
    	ctx.lineTo(167,79);
    }else if(satisfy==3){
    	ctx.lineTo(153,84);
    }else if(satisfy==2){
    	ctx.lineTo(139,88);
    }else if(satisfy==1){
    	ctx.lineTo(125,93);
    }else{
    	ctx.lineTo(100,100);
    }
    
    ctx.fillStyle = "yellow";
    ctx.globalAlpha = "0.7";
    ctx.fill();
    ctx.closePath();
    ctx.stroke();
    
    
    
    //차트
    	var chart1 = ${myproject.category1};
    	var chart2 = ${myproject.category2};
    function drawChart() {
    		
    	   // Define the chart to be drawn.
    	   var data = new google.visualization.DataTable();
    	   data.addColumn('string', 'jobKind');
    	   data.addColumn('number', 'Percentage');
    	   data.addRows([
    	      ['개발', chart1],
    	      ['디자인', chart2]
    	      
    	   ]);
    	   
    	   
    	   // Set chart options
    	   var options = {'title':'내 프로젝트',
    	      'width':220,
    	      'height':200,
    	      legend :{
    		    	position: 'top',
    		    	textStyle : {
    		    		fontSize: 12
    		    	}
    		      },};

    	   // Instantiate and draw the chart.
    	   var chart = new google.visualization.PieChart(document.getElementById('chart'));
    	   chart.draw(data, options);
    	}
    function drawChart2() {
		
	   // Define the chart to be drawn.
	   var data = new google.visualization.DataTable();
	   data.addColumn('string', 'jobKind');
	   data.addColumn('number', 'Percentage');
	   data.addRows([
	      ['진행한 프로젝트 없음', 1]
	      
	   ]);
	   
	   
	   // Set chart options
	   var options = {
	      'width':220,
	      'height':200,
	      legend :{
	    	position: 'top',
	    	textStyle : {
	    		fontSize: 12
	    	}
	      },
	      slices: {
	            0: { color: 'gray' },
	          }};

	   // Instantiate and draw the chart.
	   var chart = new google.visualization.PieChart(document.getElementById('chart2'));
	   chart.draw(data, options);
	}
    if(chart1 == 0 && chart2 ==0){
  		google.charts.setOnLoadCallback(drawChart2);
    }else{
    	google.charts.setOnLoadCallback(drawChart);
    }
    
    
});
</script>
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
						
						<p><span>${memberDTO.nickName }</span>
						<c:if test="${not empty freelancer.possibility }">
							<c:if test="${freelancer.possibility eq '활동가능' }">
							<span  class="availability no">${freelancer.possibility }</span>
							</c:if>
							<c:if test="${freelancer.possibility eq '활동불가' }">
							<span class="availability notno">${freelancer.possibility }</span>
							</c:if>
							<c:if test="${freelancer.possibility eq '협의필요' }">
							<span class="availability nono">${freelancer.possibility }</span>
							</c:if>
						</c:if>
						<c:if test="${empty freelancer.possibility }">
						<span class="availability">활동가능</span>
						</c:if>
						
						<c:if test="${member.email eq email }">
						<a href="myinfoView" >업데이트 하기</a>
						</c:if>
						</p>
						<p><span>
						<c:choose>
						<c:when test="${empty freelancer.jobKind }">
						<span>직종 미입력<span class="bar">|</span></span>
						</c:when>
						<c:when test="${freelancer.jobKind eq '개발자' }">
						<i class="fa fa-keyboard-o"></i><span>${freelancer.jobKind }<span class="bar">|</span></span>
						</c:when>
						<c:otherwise>
						<i class="fa fa-laptop"></i><span>${freelancer.jobKind }<span class="bar">|</span></span>
						</c:otherwise>
						</c:choose>
						</span>
						<span>
						<c:choose>
						<c:when test="${empty memberDTO.type }">
						<i class="fa fa-user"></i><span>개인<span class="bar">|</span></span>
						</c:when>
						<c:when test="${memberDTO.type eq '개인' }">
						<i class="fa fa-user"></i><span>${memberDTO.type }<span class="bar">|</span></span>
						</c:when>
						<c:when test="${memberDTO.type eq '팀' }">
						<i class="fa fa-users"></i><span>${memberDTO.type}<span class="bar">|</span></span>
						</c:when>
						<c:otherwise>
						<i class="fa fa-building-o"></i><span>${memberDTO.type}<span class="bar">|</span></span>
						</c:otherwise>
						</c:choose>
						</span>
						<span>
						<c:if test="${memberDTO.authenticState ne 2 }">
						<i style="opacity: 0.5;" class="fa fa-address-card"></i><span>신원 미인증<span class="bar">|</span></span>
						</c:if>
						<c:if test="${memberDTO.authenticState eq 2 }">
						<i class="fa fa-address-card"></i><span>신원 인증<span class="bar">|</span></span>
						</c:if>
						</span>
						<span>
						<c:if test="${empty memberDTO.phone }">
						<i style="opacity: 0.5;" class="fa fa-phone"></i><span>연락처 미등록</span>
						</c:if>
						<c:if test="${not empty memberDTO.phone }">
						<i class="fa fa-phone"></i><span>연락처 등록</span>
						</c:if>
						</span>
						</p>
					</section>
					
					<section class="profile_wrap ooo">
						<div class="profile_1">
							<div class="wrap_1">
								<p style="margin-left: 10px; font-weight: bold; font-size: 17px;">항목 평가</p>
								<div class="canvas_div">
								<canvas  id="mycanvas" width="200" height="200">
									
								</canvas>
								
								</div>
							</div>
							<div class="wrap_1">
								<p style="margin-left: 20px; font-weight: bold; font-size: 17px;">활동 요약 정보</p>
								<div style="width: 220px; height: 218px; display: inline-block;">
									<p style="margin-top: 20px;">
						<span>
						<c:if test="${evaluation.totalavr eq 0 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/0.png">
						</c:if>
						<c:if test="${evaluation.totalavr eq 1 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/1.png">
						</c:if>
						<c:if test="${evaluation.totalavr eq 2 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/2.png">
						</c:if>
						<c:if test="${evaluation.totalavr eq 3 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/3.png">
						</c:if>
						<c:if test="${evaluation.totalavr eq 4 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/4.png">
						</c:if>
						<c:if test="${evaluation.totalavr eq 5 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/5.png">
						</c:if>
						</span>
						<span style="line-height: 30px; vertical-align: top; float: right; margin-right: 10px;">
							
						</span>
						</p>
						<p style="margin-top:20px; margin-left: 20px;">
							<span>평균평점 </span> &nbsp;&nbsp;&nbsp;${evaluation.totalavr}
							/<span>&nbsp;&nbsp;평가</span> <span style="float: right;">${evaluation.projectList }개</span>
						</p>
						<p style="margin-left: 20px; margin-top: 20px;">
							<span>계약한 프로젝트 </span><span style="float: right;">${myproject.projectList }건</span>
						</p>
						
						<p style="margin-left: 20px; margin-top: 20px;">
							<span>포트폴리오</span><span style="float: right;">${portfolio.size()}개</span>
						</p>
						
								</div>
							</div>
							<div  class="wrap_1">
								<p style="margin-left: 20px; font-weight: bold; font-size: 17px; margin-bottom: 10px;">진행한 프로젝트</p>
								<div id="chart">
								
								</div>
								<div id="chart2">
								
								</div>
							</div>
						</div>
					</section>
					
					<section class="profile_wrap">
						<p><span>자기소개</span>
						<c:if test="${member.email eq memberDTO.email }">
						<a href="introView" style="margin-top: -5px;">업데이트 하기</a>
						</c:if></p>
						
							<c:if test="${empty freelancer.intro }">
							<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="자기소개" src="${pageContext.request.contextPath }/resources/img/mypage/intro.png">
									<p>입력된 <span>'자기소개'</span>가 없습니다.</p>
								</div>
							</div>
							</div>
							</c:if>
							<c:if test="${not empty freelancer.intro }">
						<div class="no_data_wrap" style="text-align: left;">
								<div class="introform">
								<p>${freelancer.intro }</p>
								</div>
						</div>
							</c:if>
						
					</section>
					<section class="profile_wrap">
						<p><span>포트폴리오</span>
						<c:if test="${member.email eq memberDTO.email }">
						<a href="portfolioList" style="margin-top: -5px;">업데이트 하기</a>
						</c:if></p>
						
						<div class="no_data_wrap">
							<c:if test="${empty portfolio }">
							<div class="no_data">
								<div class="no_img">
									<img alt="포트폴리오" src="${pageContext.request.contextPath }/resources/img/mypage/portfolio.png">
									<p>입력된 <span>'포트폴리오'</span>가 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty portfolio }">
							<c:forEach items="${portfolio }" var="i">
							<div style="display: inline-block;">
								<div style="display:inline-block; height: 200px; width: 200px; margin-right: 30px;">
									${i.title }
									<a href="portfolioView?pfNum=${i.pfNum }">${i.title }</a>
									
								</div>
							</div>
							</c:forEach>
						</c:if>
						</div>
					</section>
					<section class="profile_wrap">
						<p><span>보유기술</span>
						<c:if test="${member.email eq memberDTO.email }">
						<a href="skillList" style="margin-top: -5px;">업데이트 하기</a>
						</c:if></p>
						
						<div class="no_data_wrap skill" style="height: auto;">
							<c:if test="${empty skills }">
							<div class="no_data">
								<div class="no_img">
									<img alt="기술" src="${pageContext.request.contextPath }/resources/img/mypage/skill.png">
									<p>등록된 <span>'기술'</span>이 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty skills }">
								<table style="width: 100%; text-align: left;">
								<colgroup>
									<col width="60%">
									<col width="18%">
									<col width="*%">
								</colgroup>
								<thead>
								<tr>
									<th>종류</th>
									<th>숙련도</th>
									<th>경험</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${skills }" var="i">
									<tr>
										<td>${i.kind }</td>
										<td>${i.slevel}</td>
										<td>${i.exp }</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</c:if>
						</div>
						
					</section>
					<section class="profile_wrap">
						<p><span>경력</span>
						<c:if test="${member.email eq memberDTO.email }">
						<a href="carrer" style="margin-top: -5px;">업데이트 하기</a>
						</c:if></p>
						
						<div class="no_data_wrap skill" style="height: auto;">
							<c:if test="${empty carrer }">
							<div class="no_data">
								<div class="no_img">
									<img alt="경력" src="${pageContext.request.contextPath }/resources/img/mypage/carrer.png">
									<p>등록괸 <span>'경력'</span>이 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty carrer }">
								<table style="width: 100%">
									<colgroup>
										<col width="35%">
										<col width="25%">
										<col width="20%">
										<col width="*%">
									</colgroup>
									<thead>
									<tr style="text-align: left;">
										<th>회사명</th>
										<th>부서명</th>
										<th>직위</th>
										<th>근무기간</th>
									</tr>
									</thead>
									<tbody>
								<c:forEach items="${carrer }" var="i">
									<tr>
										<td>${i.companyName }</td>
										<td>${i.dept }</td>
										<td>${i.position }</td>
										<td>${i.hireDate }<br>
										~${i.retireDate}
										</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</c:if>
						</div>
						
						<p><span>학력</span></p>
						
						<div class="no_data_wrap skill" style="height: auto;">
							<div class="no_data">
								<c:if test="${empty academic }">
								<div class="no_img">
									<img alt="학력" src="${pageContext.request.contextPath }/resources/img/mypage/academic.png">
									<p>등록된 <span>'학력'</span>이 없습니다.</p>
								</div>
								</c:if>
								<c:if test="${not empty academic }">
									<table style="width: 100%;">
									<colgroup>
										<col width="30%">
										<col width="10%">
										<col width="10%">
										<col width="20%">
										<col width="15%">
										<col width="*%">
									</colgroup>
									<thead>
									<tr style="text-align: left;">
										<th>분류</th>
										<th>상태</th>
										<th>학교명</th>
										<th>전공</th>
										<th>입학일</th>
										<th>졸업일</th>
									</tr>
									</thead>
									<tbody>
								<c:forEach items="${academic }" var="i">
									<tr>
										<td>${i.school }</td>
										<td>${i.state }</td>
										<td>${i.sName }</td>
										<td>${i.major }</td>
										<td>${i.entrance }</td>
										<td>${i.graduate }</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
								</c:if>
							</div>
						</div>
						
						<p><span>자격증</span></p>
						
						<div class="no_data_wrap skill" style="height: auto;">
							<c:if test="${empty license }">
							<div class="no_data">
								<div class="no_img">
									<img alt="자격증" src="${pageContext.request.contextPath }/resources/img/mypage/license.png">
									<p>등록된 <span>'자격증'</span>이 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty license }">
							<table style="width: 100%;">
									<colgroup>
										<col width="30%">
										<col width="20%">
										<col width="20%">
										<col width="*%">
									</colgroup>
									<thead>
									<tr style="text-align: left;">
										<th>자격증명</th>
										<th>발급기관</th>
										<th>발급일</th>
										<th>일련번호</th>
									</tr>
									</thead>
									<tbody>
								<c:forEach items="${license }" var="i">
									<tr>
										<td>${i.lName }</td>
										<td>${i.agency }</td>
										<td>${i.publishDate }</td>
										<td>${i.seiralNum }</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</c:if>
						</div>
						
					</section>
					<section class="profile_wrap">
						<p><span>평가</span>
						<c:if test="${member.email eq memberDTO.email }">
						<a href="evaluationView" style="margin-top: -5px;">업데이트 하기</a>
						</c:if></p>
						
						<div class="no_data_wrap" style="height: auto;">
							<c:if test="${evaluation.projectList eq 0}">
							<div class="no_data">
								<div class="no_img">
									<img alt="평가" src="${pageContext.request.contextPath }/resources/img/mypage/evaluation.png">
									<p>등록된 <span>'평가'</span>가 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${evaluation.projectList ne 0 }">
								<c:forEach begin="0" end="${evaluation.projectList-1 }" var="i" varStatus="o">
										
										<div class="wrap_eval">
											<div>
												<c:forEach items="${projectName.projectName[i]}" var="j">
												<c:if test="${j.projectNum eq evaluation.eval[i].projectNum }">
												<p class="wrap_projectName">
													<a href="/flu/project/projectView?projectNum=${j.projectNum }">${j.name }</a>
												</p>
												<p class="wrap_project_etc">
												<span><span>${j.category } ></span><span>${j.detailCategory }</span></span>
												<span style="color: #dedede; margin-left: 10px; margin-right: 10px;">|</span>
												<span><span>클라이언트 </span><span>${j.email }</span></span>
												</p>
												<div>
													<table>
														<colgroup>
															<col width="93px">
															<col width="140px">
															<col width="96px">
															<col width="130px">
															<col width="97px">
															<col width="153px">
														</colgroup>
														<thead></thead>
														<tbody>
														<tr>
															<td class="td_title">\계약금액
															</td>
															<td class="td_contents">
															<fmt:formatNumber pattern="\###,###" value="3000000"/>
															</td>
															<td class="td_title"><i class="fa fa-clock-o"></i> 계약기간
															</td>
															<td class="td_contents">${j.period }
															</td>
															<td class="td_title"><i class="fa fa-calendar"></i> 계약일자
															</td>
															<td class="td_contents">${j.startDate }
															</td>
														</tr>
														</tbody>
													</table>
												</div>
												</c:if>
												</c:forEach>
												<div class="eval_star">
													<span>
														<c:choose>
														<c:when test="${evaluation.avrList[i] eq 5}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/5.png">
														</c:when>
														<c:when test="${evaluation.avrList[i] eq 4}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/4.png">
														</c:when>
														<c:when test="${evaluation.avrList[i] eq 3}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/3.png">
														</c:when>
														<c:when test="${evaluation.avrList[i] eq 2}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/2.png">
														</c:when>
														<c:when test="${evaluation.avrList[i] eq 1}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/1.png">
														</c:when>
														<c:otherwise>
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/0.png">
														</c:otherwise>
														</c:choose>
													</span>
													<span>
														${evaluation.avrList[i] }
													</span>
												</div>
												<ul>
													<li>
														<p>전문성</p>
														<span>
														<c:choose>
														<c:when test="${evaluation.eval[i].professional eq 5}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/5.png">
														</c:when>
														<c:when test="${evaluation.eval[i].professional eq 4}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/4.png">
														</c:when>
														<c:when test="${evaluation.eval[i].professional eq 3}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/3.png">
														</c:when>
														<c:when test="${evaluation.eval[i].professional eq 2}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/2.png">
														</c:when>
														<c:when test="${evaluation.eval[i].professional eq 1}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/1.png">
														</c:when>
														<c:otherwise>
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/0.png">
														</c:otherwise>
														</c:choose>
														</span>
														<span>${evaluation.eval[i].professional}</span>
													</li>
													<li class="li_bar"></li>
													<li>
														<p>만족도</p>
														<span>
														<c:choose>
														<c:when test="${evaluation.eval[i].satisfy eq 5}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/5.png">
														</c:when>
														<c:when test="${evaluation.eval[i].satisfy eq 4}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/4.png">
														</c:when>
														<c:when test="${evaluation.eval[i].satisfy eq 3}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/3.png">
														</c:when>
														<c:when test="${evaluation.eval[i].satisfy eq 2}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/2.png">
														</c:when>
														<c:when test="${evaluation.eval[i].satisfy eq 1}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/1.png">
														</c:when>
														<c:otherwise>
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/0.png">
														</c:otherwise>
														</c:choose>
														</span>
														<span>${evaluation.eval[i].satisfy}</span>
													</li>
													<li class="li_bar"></li>
													<li>
														<p>의사소통</p>
														<span>
														<c:choose>
														<c:when test="${evaluation.eval[i].communication eq 5}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/5.png">
														</c:when>
														<c:when test="${evaluation.eval[i].communication eq 4}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/4.png">
														</c:when>
														<c:when test="${evaluation.eval[i].communication eq 3}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/3.png">
														</c:when>
														<c:when test="${evaluation.eval[i].communication eq 2}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/2.png">
														</c:when>
														<c:when test="${evaluation.eval[i].communication eq 1}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/1.png">
														</c:when>
														<c:otherwise>
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/0.png">
														</c:otherwise>
														</c:choose>
														</span>
														<span>${evaluation.eval[i].communication}</span>
													</li>
													<li class="li_bar"></li>
													<li>
														<p>일정 준수</p>
														<span>
														<c:choose>
														<c:when test="${evaluation.eval[i].schedule eq 5}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/5.png">
														</c:when>
														<c:when test="${evaluation.eval[i].schedule eq 4}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/4.png">
														</c:when>
														<c:when test="${evaluation.eval[i].schedule eq 3}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/3.png">
														</c:when>
														<c:when test="${evaluation.eval[i].schedule eq 2}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/2.png">
														</c:when>
														<c:when test="${evaluation.eval[i].schedule eq 1}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/1.png">
														</c:when>
														<c:otherwise>
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/0.png">
														</c:otherwise>
														</c:choose>
														</span>
														<span>${evaluation.eval[i].schedule}</span>
													</li>
													<li class="li_bar"></li>
													<li>
														<p>적극성</p>
														<span>
														<c:choose>
														<c:when test="${evaluation.eval[i].passion eq 5}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/5.png">
														</c:when>
														<c:when test="${evaluation.eval[i].passion eq 4}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/4.png">
														</c:when>
														<c:when test="${evaluation.eval[i].passion eq 3}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/3.png">
														</c:when>
														<c:when test="${evaluation.eval[i].passion eq 2}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/2.png">
														</c:when>
														<c:when test="${evaluation.eval[i].passion eq 1}">
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/1.png">
														</c:when>
														<c:otherwise>
														<img style="width: 80px;" src="${pageContext.request.contextPath }/resources/img/starpoint/0.png">
														</c:otherwise>
														</c:choose>
														</span>
														<span>${evaluation.eval[i].passion }</span>
													</li>
												</ul>
											</div>
										</div>
										</c:forEach>
							</c:if>
						</div>
						
					</section>
				</div>
			</div>
		</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>