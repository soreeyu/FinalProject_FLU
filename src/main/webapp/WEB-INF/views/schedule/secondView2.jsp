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
.main_section{
	min-width: 1460px;
	width: 100%;
	min-height: 1000px;
	background-color: #f2f2f2;
	position: relative;
}


#main_wrap{
	width: 1152px;
	height: auto;
	margin: 0 auto;
	background: black;	
}

.main_container {
    margin: auto;
    padding: 20px 0 50px;
    width: 90%;
    height: 100%;
}

.main_container > div {
    margin: 10px auto;
    padding: 30px 35px;
    border-radius: 2px;
    background: #fff;
}

#schcalendar{
	width: inherit;
    height: 100%;
}




</style>


<!--  -->
<script type="text/javascript">

	$(function(){
		$('#schcalendar').fullCalendar({
			 customButtons: {
				 myCustomButton: {
			            text: 'custom!',
			            click: function() {
			                alert('clicked the custom button!');
			            }
			        }
			 },
			    
			header: {
				left: '',
				center: 'prev title next myCustomButton',
				right: 'today,month'//'today,month,basicWeek,basicDay'
			},
			titleFormat: {
				month: 'yyyy년 MMMM',
				week: "yyyy년 MMMM d[yyyy]{'일 ~ '[mmm] dd일'}",
				day: "yyyy년 MMM d dddd"
			},
			monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesShort : ['일','월','화','수','목','금','토'],
			allDayText : '금일일정',
			minTime : 9,
			maxTime : 19,
			axisFormat : "HH:mm",
			editable: false,
			events: [{
		        id: 'All Day Event',
		        title: 'All Day Event',
		        start: new Date()
		    }, {
		        id: 'popo',
		        title: 'popo',
		        start: new Date('2017-07-20'),
		        //end:   '2014-11-05T12:30:00',
		        description: 'This is a cool event 테슷흐',
		        color: 'rgb(142, 67, 163)',
		        textColor: 'black'
		    }, {
		        id: 'test2',
		        title: 'test2',
		        url: 'http://google.com/',
		        start: new Date('2017-07-30'),
		    }],
		    //등록된 일정을 클릭했을 때 실행하는 함수 
		   eventClick: function(calEvent, jsEvent, view) {

		        alert('Event: ' + calEvent.title);
		        alert('desc: ' + calEvent.description);
		        partClick(calEvent.description);
		       // alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY); // 화면 좌표인듯
		       // alert('View: ' + view.name);

		        // change the border color just for fun
		        $(this).css('background', 'orange');
		        
		        modal.show(); 
		        
		        //일정에 가지고있는 링크를 사용해서 열어준다
		        /*
		        if(event.url) {
	               alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
	               window.open(event.url,"_blank");
	               return false;
	           }
		        */

		    },
		    // 달력의 빈칸을 클릭했을때 실행되는 함수
		    dayClick: function(date) {
				//scheduleParam = {seq : 0, title : '', contents : '', starttime : date.getTime(), endtime : date.getTime(), writer:''};
				//$('#title').val(scheduleParam.title);
				//$('#contents').val(scheduleParam.contents);
				//spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate()); 
				//epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate()); 
				writeModal.show(); 
				
		    }
		});
		
	});
	
</script>
</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

<section class="main_section">
	<div id= "main_wrap">
		<div class="main_container">
			<div id='schcalendar'></div>
		</div>
	</div>

</section>

<c:import url="../temp/footer.jsp"></c:import>


</body>
</html>