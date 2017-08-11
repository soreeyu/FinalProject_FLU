<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style type="text/css">
.main_section {
	min-width: 1160px;
	width: 1152px;
	height: auto;
	min-height: 2300px;
	max-height: 2600px;
	margin: 0 auto;
	margin-top: 30px;
}


.left {
	width: 250px;
	height: 100%;
	float: left;
	margin-right: 10px;
}

.right {
	width: 880px;
	height: 100%;
	float: right;
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
	width: 216px;
    height: 216px;
    border: 1px solid #dedede;
    border-radius: 10%
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
	width: 100%;
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
	width: 100%;
	height: 100%;
	margin-top: 15px;
}
.project-unit{
	padding: 25px;
	border: 1px solid #eeeeee;
	height: 180px;
	margin-bottom: 10px;
	background-color: white;
}
.project-head{
	height: 27px;
	margin-bottom: 5px;
}
.project-title{
	color: #3385ff;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
}
.project-body{
	width: 100%;
	height: 120px;
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
	height: 53px;
	vertical-align: middle;
	
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
.deadline{
	font-weight: bold;
	margin-left: 5px;
}
.project-bottom{
	margin-top: 10px;
	line-height: 2px;
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
	padding: 2px 3px;
}
.skill-box span{
	color: #999;
}
.contents_bottom{
	margin-top: 30px;
	width: 100%;
}
.non-project{
	margin: 0 auto;
	vertical-align: middle;
	width: 100%;
	margin: 15px;
}
.non-project-text{
	color: #3385ff;
	font-size: 15px;
	margin: 0 auto;
	text-align: center;
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
.num{
	cursor: pointer;
}
#preview{
	cursor: pointer;
}
#nextview{
	cursor: pointer;
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
</style>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp" />

<section class="main_section">

			<div class="side">
				<div class="freelancer_name">
					<c:if test="${member.kind eq 'client' }"><span>클라이언트</span></c:if>
					<c:if test="${member.kind eq 'freelancer' }"><span>프리랜서</span></c:if>
					<div class="free_img_div">
						<c:if test="${empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/mypage/avatar.jpg">
						</c:if>
						<c:if test="${not empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/profile/${member.fProfileImage}">
						</c:if>
						<label style="display: block;"><span>${member.nickName}</span></label>
					</div>
				</div>
				<div class="sidebar_menu">
					<ul>
						<li id="checkBTN"><a id="check">검수중인 프로젝트</a></li>
						<li id="doneBTN"><a id="done">모집중인 프로젝트</a></li>
						<li id="recruitBTN"><a id="recruit">모집 완료된 프로젝트</a></li>
						<li id="ingBTN"><a id="ing">진행중인 프로젝트</a></li>
						<li id="finishBTN"><a id="finish">완료된 프로젝트</a></li>
						<li id="sellBTN"><a id="sell">판매중인 프로젝트</a></li>
						<li id="failBTN"><a id="fail">실패된 프로젝트</a></li>
						
					</ul>
				</div>
			</div>
			
	<%-- 		<div class="left">
				<div class="user">
					<span>클라이언트</span>
					<div class="user_name">
						<c:if test="${empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/mypage/avatar.jpg">
						</c:if>
						<c:if test="${not empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/profile/${member.fProfileImage}">
						</c:if>
						<label style="display: block;"><span>${member.nickName}</span></label>
					</div>
				</div>
				<div class="history">
						<p id="checkBTN">
							<a id="check">검수중인 프로젝트</a>
						</p>
						<p id="doneBTN">
							<a id="done">모집중인 프로젝트</a>
						</p>
						<p id="recruitBTN">
							<a id="recruit">모집 완료된 프로젝트</a>
						</p>
						<p id="ingBTN">
							<a id="ing">진행중인 프로젝트</a>
						</p>
						<p id="finishBTN">
							<a id="finish">완료된 프로젝트</a>
						</p>
						<p id="sellBTN">
							<a id="sell">판매중인 프로젝트</a>
						</p>
						<p id="failBTN">
							<a id="fail">실패된 프로젝트</a>
						</p>			
				</div>

			</div>
			 --%>
			
			<div class="right">
				<div class="title">
					
						<p id="t1">검수중인 프로젝트</p>
						<p id="t2">관리자의 승인을 기다리는 곳입니다.</p>
					
				</div>		
				

				<div class="contents">
				<!-- AJAX로 불러올 부분 -->
		
				
		
				</div>

			</div>

	</section>


<script type="text/javascript">

alert("sellCheck==${sellCheck}");
alert("state==${conState}");
var conState='${conState}';

if(conState=='finish'){
	alert("dd");
	$("#t1").text("완료된 프로젝트");
	$("#t2").text("완료된 프로젝트입니다.");
}else if(conState=='check'){
	$("#t1").text("검수중인 프로젝트");
	$("#t2").text("관리자의 승인을 기다리는 곳입니다.");
}
/* project 첫화면 프로젝트 리스트 띄우기  */
$.get("projectCheck?state=${conState}&curPage=1", function(data){
	$("#check").css("background-color", "#446eab");
	$("#check").css("color", "white");
	$(".contents").html(data);
}); 


/* 검수중인 프로젝트 리스트 */
$("#check").click(function() {
	$.get("projectCheck?state=check&curPage=1", function(data){
		
		alert("검수중");
		$("#t1").text("검수중인 프로젝트");
		$("#t2").text("관리자의 승인을 기다리는 곳입니다.");
		$(this).css("background-color", "#446eab");
		$(this).css("color", "white");
		$(".contents").html(data);
	});

});

/* 모집중인 프로젝트 리스트 */
$("#done").click(function() {

	$.get("projectCheck?state=done&curPage=1", function(data){
		alert("모집중");
		$("#check").css("background-color", "white");
		$("#check").css("color", "#999");
		$("#t1").text("모집중인 프로젝트");
		$("#t2").text("프리랜서를 모집중인 프로젝트입니다.");
		$(".contents").html(data); 
		$("#done").css("background-color", "#446eab");
		$("#done").css("color", "white");
	});

});

/* 모집완료된 프로젝트 리스트 */
$("#recruit").click(function() {

	$.get("projectCheck?state=recruit&curPage=1", function(data){	
		alert("모집완료");
		$("#t1").text("모집완료된 프로젝트");
		$("#t2").text("프리랜서와 미팅을 준비중인 프로젝트입니다.");
		$(".contents").html(data); 
	});

});

/* 진행중인 프로젝트 리스트 */
$("#ing").click(function() {

	$.get("projectCheck?state=ing&curPage=1", function(data){
		alert("진행중");
		$("#t1").text("진행중인 프로젝트");
		$("#t2").text("진행중인 프로젝트입니다.");
		$(".contents").html(data); 
	});

});
/* 완료된 프로젝트 리스트 */
$("#finish").click(function() {

	$.get("projectCheck?state=finish&curPage=1", function(data){
		alert("완료");
		$("#t1").text("완료된 프로젝트");
		$("#t2").text("완료된 프로젝트입니다.");
		$(".contents").html(data); 
	});

});
/* 판매중인 프로젝트 리스트 */
$("#sell").click(function() {

	$.get("projectCheck?state=sell&curPage=1", function(data){
		alert("판매중");
		$("#t1").text("판매중인 프로젝트");
		$("#t2").text("다른 클라이언트에게 제공되는 프로젝트입니다.");
		$(".contents").html(data); 
	});

});
/* 실패한 프로젝트 리스트 */
$("#fail").click(function() {

	$.get("projectCheck?state=fail&curPage=1", function(data){
		alert("실패함");
		$("#t1").text("실패한 프로젝트");
		$("#t2").text("클라이언트 모집에 실패한 프로젝트입니다.");
		$(".contents").html(data); 
	});

});



</script>
<c:import url="/WEB-INF/views/temp/footer.jsp" />
</body>
</html>