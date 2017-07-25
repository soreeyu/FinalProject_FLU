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
}

#main_wrap {
	width: 1152px;
	height: auto;
	margin: 0 auto;
}

.scheduleNav {
	width: 120px;
	height: auto;
	background: red;
	float: left;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	/* float: left; */
	margin: 5px 5px;
	background: orange;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: white;
	text-align: center;
	text-decoration: none;
	/* padding: 14px 16px; */
	font-size: 15px;
	transition: 0.3s;
}
/* Style the tab content */

.tabContentWrap{
	width: 1032px;
	height: auto;
	float: left;
}


.tabcontent {
	display: none;
	background-color: #f2f2f2;
	padding: 6px 12px;
	color: #fff;
}

ul.tab li.current {
	background-color: rgb(0, 154, 200);
	color: #222;
}

.tabcontent.current {
	display: block;
}


</style>

<script type="text/javascript">
	$(function() {
		
		
		$('ul.tab li').click(function() {
			//css
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current'); //클릭한 애만 current 설정
			$('#' + activeTab).addClass('current');
			
			if(activeTab == 'tab1'){
				alert("개요보기");
				$.ajax({
					url:"./firstView?scheduleNum=3000",
					type:"GET",
					success:function(data){
						alert(data);
						$("#"+activeTab).html(data);
					}
				});
			}else if(activeTab == 'tab2'){
				alert("달력보기");
				$.ajax({
					
				});
				
			}else if(activeTab == 'tab3'){
				alert("표보기");
				$.ajax({
					
				});
				
			}else if(activeTab == 'tab4'){
				alert("수정하기");
				$.ajax({
					
				});
			}
		});
		
		
		

	});
</script>

</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

<section class="main_section">

	

	<div id= "main_wrap">
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