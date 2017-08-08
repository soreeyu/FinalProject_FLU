<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
    
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
   min-width: 1460px;
   width: 100%;
   min-height: 2050px;
   background-color: #f2f2f2;
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

/********** 현재 사이드 메뉴 블럭 *************/

#a{
	background-color: #66b3ff;
	color: white;
}

/******************************** 왼쪽 메뉴  끝*******************************/
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
	padding-bottom: 20px;
	margin-bottom: 20px;
}
.profile_wrap > p:FIRST-CHILD{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
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
.profile_wrap > p:FIRST-CHILD{
   margin-top: 20px;
   font-size: 18px;
   font-weight: 700;
}


.no_data_wrap{
	width: 100%;
    padding-top: 15px;
    padding-bottom: 15px;
}
.no_data{
	width: 100%;
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
   font-size: 14px;
   margin-top: 15px;
   color: #999;
}
.no_img p span{
   font-weight: bold;
}



/******************* 프로젝트 평점 ************************/
.canvas_head{
	margin-top: 30px;
	display: table;
}

.project_count{
   float: left;
    width: 365px;
    border-top: 1px solid #dedede;
    border-bottom: 1px solid #dedede;
    line-height: 1;
}

.count1{
   background-color: #fafafa;
    float: left;
    color: #555;
    font-size: 14px;
    font-weight: bold;
    padding: 13px 30px;

}
.count2{
	float: left;
    color: #666;
    font-size: 12px;
    padding: 12px 20px;
	margin-left: 21%;
}
.count2 span{
	font-size: 16px;
    float: left;
    color: #666;
    font-weight: bold;
}


.project_eval{
    width: 363px;
    border-top: 1px solid #dedede;
    border-bottom: 1px solid #dedede;
    float: left;
    line-height: 1;
}
.eval1{
    background-color: #fafafa;
    float: left;
    color: #555;
    font-size: 14px;
    font-weight: bold;
    padding: 13px 30px;
}
.eval2{
	float: left;
    color: #666;
    font-size: 12px;
    padding: 12px 20px;
    line-height: 1;
    letter-spacing: -4px;
}
.starpoint{
	float: left;
    width: 78px;
    height: 14px;
    margin-right: 11px;
}
.value{
	display: inline-block;
    color: #333;
    font-size: 16px;
    font-weight: bold;
    letter-spacing: normal;
}
.chart{
	margin-top: 20px;
}
.chart-penta{
	display: inline-block;
}

.chart-penta{
   display: inline-block;
}
.chart-penta p{
    padding-left: 30px;
    line-height: 1;
    color: #666;
    font-weight: bold;
    margin-bottom: 15px;
    font-size: 16px;
}
.chart_list{
	display: inline-block;
	vertical-align: top;
}
.chart_list ul{
	font-size: 15px;
    display: inline-block;
    vertical-align: top;
}
.chart_list ul{
    font-size: 15px;
    margin-top: 1px;
    margin-left: 40px;
    margin-bottom: 0;
}
.chart_list ul li label{
	font-weight: bold;
}
.chart_list ul li span {
	padding-left: 29px;
}
.chart_list ul li {
	line-height: 14px;
}
.chart_list ul li+li{
	padding-top: 26px;
}

.canvas_div{
	margin-left: 20px;
	display: inline-block;
}

.chart-star{
	display: inline-block;	
	vertical-align: top;
}
.chart-star ul{
	float: left;
    font-weight: bold;
}
.chart_list ul li span {
   padding-left: 29px;
}
.chart_list ul li {
   line-height: 14px;
}
.chart_list ul li+li{
   padding-top: 26px;
}

.canvas_div{
   margin-left: 20px;
   display: inline-block;
}

.chart-star{
   display: inline-block;   
   vertical-align: top;
}
.chart-star ul{
    float: left;
    margin: 0 20px 0 12px;
    list-style: none;
    font-size: 12px;
}

.chart-star ul li img{
	width: 25px;
	height: 25px;
}


.star5{
    width: 150px;
    height: 25px;
    margin-bottom: 18px;
}
.star4{
    width: 150px;
    height: 25px;
    margin-bottom: 18px;
}
.star3{
	width: 150px;
    height: 25px;
    margin-bottom: 18px;
}
.star2{
	width: 150px;
    height: 25px;
    margin-bottom: 18px;
}
.star1{
	width: 150px;
    height: 25px;
}
.star_value{
	width: 50px;
	padding-left: 70px;
	height: 25px;
	margin-bottom: 18px;
	font-size: 14px;
	font-weight: bold;
	line-height: 25px;
	
}

.star_value span{
	float: right;
}

.star_value:LAST-CHILD {
	margin-bottom: 0;
}

.evaluation_div > p:FIRST-CHILD{
	margin-top: 20px;
}
.evaluation_div > p > span {
	font-size: 18px;
	font-weight: bold;

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

/******************* 프로젝트 평점 ************************/
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
    
    
    ctx.strokeStyle = "yellow";
    ctx.beginPath();
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
    
    
    
    
    function drawChart() {
    	
    	var star5 = ${evaluation.star5};
    	var star4 = ${evaluation.star4};
    	var star3 = ${evaluation.star3};
    	var star2 = ${evaluation.star2};
    	var star1 = ${evaluation.star1};
    	   // Define the chart to be drawn.
    	   var data = google.visualization.arrayToDataTable([
    	      ['star', '인원'],
    		  ['★★★★★',  star5],
    	      ['☆★★★★',  star4],
    	      ['☆☆★★★',  star3],
    	      ['☆☆☆★★',  star2],
    	      ['☆☆☆☆★',  star1]
    	      ]);

    	   var options = {
    	      title: '평점 분포도',
    	      bar:{
    	    	  groupWidth:'60%'
    	      },
    	      hAxis:{
    	    	  format:'short'
    	      },
    	      legend: { position: 'top', maxLines: 3 },
    	   }; 

    	   // Instantiate and draw the chart.
    	   var chart = new google.visualization.BarChart(document.getElementById('star_bar'));
    	   chart.draw(data, options);
    	}
    	google.charts.setOnLoadCallback(drawChart);
    
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
						<p><span>${memberDTO.nickName }의 평가</span></p>
					</section>
					<section class="profile_wrap">
						<div>
							<div class="canvas_head">
								<div class="project_count">
									<div class="count1">계약한 프로젝트</div>
									<div class="count2"><span>${myproject.projectList }</span>개</div>
								</div>
								<div class="project_eval">
									<div class="eval1">프로젝트 평균평점</div>
									<div class="eval2">
										<div class="starpoint">별점</div>
										<div class="value">${evaluation.totalavr }</div>
									</div>
								</div>
							</div>
							<div class="chart">
							<div class="chart-penta">
							<p>세부 항목 평가</p>
							<div class="chart_list">
								<ul>
									<li><label>전문성</label><span>${evaluation.professional }점</span></li>
									<li><label>만족도</label><span>${evaluation.satisfy }점</span></li>
									<li><label>일정준수</label><span style="padding-left: 15px;">${evaluation.schedule }점</span></li>
									<li><label>의사소통</label><span style="padding-left: 15px;">${evaluation.communication }점</span></li>
									<li><label>적극성</label><span>${evaluation.passion }점</span></li>
								</ul>
							</div>
							<div class="canvas_div">
								<canvas  id="mycanvas" width="200" height="200">
									
								</canvas>
							</div>
							</div>
							<div class="chart-star">
								<p>평점 분포</p>
								<%-- <ul>
									<li class="star5">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
									</li>
									<li class="star4">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
									</li>
									<li class="star3">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
									</li>
									<li class="star2">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
									</li>
									<li class="star1">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
										<img alt="1점" src="${pageContext.request.contextPath}/resources/img/mypage/star2.png">
									</li>
								</ul> --%>
								<div id="star_bar" style="width: 350px; height: 250px; float: left;">
								</div>
								 <!-- <ul>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
								</ul> --> 
							</div>
							</div>
							<div class="evaluation_div">
								<p><span>클라이언트의 평가</span></p>
						
								<div class="no_data_wrap">
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




</html>