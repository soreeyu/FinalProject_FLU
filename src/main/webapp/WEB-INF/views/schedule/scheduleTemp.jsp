<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootstrap.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/jui/jui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/lib/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/lib/main.css"/>
<link href='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src="${pageContext.request.contextPath}/resources/SE2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src='${pageContext.request.contextPath}/resources/schedule/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/schedule/lib/jquery-ui.custom.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/schedule/lib/niee-canvas-chart003.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/lib/ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/base.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/core.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/button.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/combo.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/dropdown.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/uix/table.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/uix/tree.js"></script>



<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<title>달력뷰</title>


<style type="text/css">

.clear{
	clear: both;
}

.main_section {
	min-width: 1460px;
	width: 100%;
	height: auto;
	min-height: 1000px;
	position: relative;
	margin-top: 30px;
}




.schedule_header {
    height: 102px;
    padding: 20px;
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
#header_t {
    font-size: medium;
    font-weight: lighter;
    color: #666;
}
#header_ttt span:last-child {
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
#header_t span:last-child {
    font-size: 20px;
    vertical-align: middle;
    margin-top: 5px;
    margin-right: 50px;
    float: right;
    height: 20px;
    line-height: 20px;
}







#main_wrap {
	width: 1152px;
	height: auto;
	margin: 0 auto;
}




/* Style the tab content */

.tabContentWrap{
	width: 992px;
	height: auto;
	float: left;
	background: white;
}


.tabcontent {
	display: none;
	background-color: #f2f2f2;
	/* padding:0px 12px; */
	/* color: #fff; */
	color: black;
}

.tabcontent.current {
	display: block;
}














.sidebar {
    display: inline;
    float: left;
    margin-right: 10px;
    width: 150px;
}
.sidebar .sidebar-nav ul {
    list-style: none;
    border: 1px solid #dedede;
    border-radius: 3px;
    border-bottom-width: 2px;
    padding: 4px 8px;
    background-color: #fff;
}
.sidebar .sidebar-nav ul li {
    height: 48px;
    padding: 4px 0;
}
.sidebar .sidebar-nav ul li a {
    border-radius: 2px;
    display: block;
    padding: 10px 15px;
    font-size: 14px;
    color: #999;
   /*  width: 100%; */
}

.tab>.current>a {
    background-color: #2099bb !important;
    color: #ffffff !important;
}

</style>

<script type="text/javascript">
	$(function() {
		
		var scheduleNum = '${scheduleNum}';
		
		loadTabContent("/flu/schedule/firstView?scheduleNum="+scheduleNum,'tab1');
		
		
		
		$('ul.tab li').click(function() {
			//css
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current'); //클릭한 애만 current 설정
			$('#' + activeTab).addClass('current');
			
			
			var url = "/flu/schedule/firstView?scheduleNum="+scheduleNum;
			if(activeTab == 'tab1'){
				alert("개요보기");
				url = "/flu/schedule/firstView?scheduleNum="+scheduleNum;
			}else if(activeTab == 'tab2'){
				alert("달력보기");
				url = "/flu/schedule/secondView?scheduleNum="+scheduleNum;
			}else if(activeTab == 'tab3'){
				alert("표보기");
				url = "/flu/schedule/thirdView?scheduleNum="+scheduleNum;
			}else if(activeTab == 'tab4'){
				alert("수정하기");
				url = "";
			}
			
			loadTabContent(url,activeTab);
	
			
		});//클릭햇을때


	}); //function
	
	
	function loadTabContent(url,activeTab){
		if(url != ""){
			
			$.ajax({
				url:url,
				type:"GET",
				success:function(data){
					alert(data);
					$("#"+activeTab).html(data);
				}
			});
			
		}
	}
</script>

</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

<section class="main_section">


	<div id= "main_wrap">
	
	
	<div class="schedule_header">
		<div class="header_text">
			<p id="header_ttt" style="margin-bottom: 20px;">
				<span>테스트</span>
				<span>2017-08-01-2017-07-31</span>
			</p>
			<p id="header_t">
				<span>개발 &gt; 웹</span>
				<span>
			<img src="/flu/resources/img/project/proposal.png">
			총<strong>1명</strong>지원</span>
			</p>
		</div>
	</div>
	
	
			<div class="sidebar">
				<div class="sidebar-nav">
					<ul class="tab">
						<li class="current"  data-tab="tab1"><a href="#">개요</a></li>
						<li class="" data-tab="tab2"><a href="#">달력보기</a></li>
						<li class=""  data-tab="tab3"><a href="#">카드보기</a></li>
						<li class=""  data-tab="tab4"><a href="#">일정/업무수정</a></li>
						<li class=""  data-tab="tab5"><a href="#">###</a></li>
					</ul>
				</div>
			</div>
			
			
			<!-- 
		<div class="scheduleNav">
			<div>
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">개요</a></li>
					<li data-tab="tab2"><a href="#">달력보기</a></li>
					<li data-tab="tab3"><a href="#">표보기</a></li>
					<li data-tab="tab4"><a href="#">일정수정</a></li>
				</ul>
					
			</div>
		</div>
		 -->
		<div class="tabContentWrap">
			<div id="tab1" class="tabcontent current">
				tab1내용 은 개요야 
			</div>
			
			<div id="tab2" class="tabcontent">
				tab2내용 은 달력이야
			</div>
			
			<div id="tab3" class="tabcontent">
				tab3내용 은 표야 
			</div>
			
			<div id="tab4" class="tabcontent">
				tab4내용 은 수정이야 //클라이언트만 가능 
			</div>
		</div>
		
	</div>

</section>

<div class="clear"></div>
<c:import url="../temp/footer.jsp"></c:import>


</body>
</html>