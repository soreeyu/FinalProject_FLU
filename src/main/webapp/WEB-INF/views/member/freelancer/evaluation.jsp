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
   width: 100%;
    height: 170px;
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
.chart-penta p{
	padding-left: 30px;
    margin-top: 20px;
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
    ctx.moveTo(100,60);
    ctx.lineTo(47,84);
    ctx.lineTo(58,157);
    ctx.lineTo(151,169);
    ctx.lineTo(181,75);
    ctx.fillStyle = "yellow";
    ctx.globalAlpha = "0.7";
    ctx.fill();
    ctx.closePath();
    ctx.stroke();
    
    
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
						<p><span>ㅁㅁㅁ의 평가</span><a href="#" style="margin-top: -5px;">업데이트 하기</a></p>
					</section>
					<section class="profile_wrap">
						<div>
							<div class="canvas_head">
								<div class="project_count">
									<div class="count1">계약한 프로젝트</div>
									<div class="count2"><span>0</span>개</div>
								</div>
								<div class="project_eval">
									<div class="eval1">프로젝트 평균평점</div>
									<div class="eval2">
										<div class="starpoint">별점</div>
										<div class="value">0.0</div>
									</div>
								</div>
							</div>
							<div class="chart">
							<div class="chart-penta">
							<p>세부 항목 평가</p>
							<div class="chart_list">
								<ul>
									<li><label>전문성</label><span>0점</span></li>
									<li><label>만족도</label><span>0점</span></li>
									<li><label>일정준수</label><span style="padding-left: 15px;">0점</span></li>
									<li><label>의사소통</label><span style="padding-left: 15px;">0점</span></li>
									<li><label>만족도</label><span>0점</span></li>
								</ul>
							</div>
							<div class="canvas_div">
								<canvas  id="mycanvas" width="200" height="200">
									
								</canvas>
							</div>
							</div>
							<div class="chart-star">
								<p>평점 분포</p>
								<ul>
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
								</ul>
								<ul>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
									<li class="star_value"><span>0명</span></li>
								</ul>
							</div>
							</div>
							<div class="evaluation_div">
								<p><span>클라이언트의 평가</span></p>
						
								<div class="no_data_wrap">
									<div class="no_data">
										<div class="no_img">
											<img alt="평가" src="${pageContext.request.contextPath }/resources/img/mypage/evaluation.png">
											<p>등록된 <span>'평가'</span>가 없습니다.</p>
										</div>
									</div>
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