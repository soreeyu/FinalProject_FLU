<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>

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




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>ScheduleMain</title>

<script type="text/javascript">
	$(document).ready(function() {
		/* 		
	    $('#schcalendar').fullCalendar({
	    	
	    
		    dayClick: function(date) {

    	        alert('a day has been clicked!');
				scheduleParam = {seq : 0, title : '', contents : '', starttime : date.getTime(), endtime : date.getTime(), writer:''};
				$('#title').val(scheduleParam.title);
				$('#contents').val(scheduleParam.contents);
				spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
				epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
				$('#etcYn').attr('checked',false);
				writeModal.show();
				//editorInit('contents');
		    }
	    
		}); //fullCal
		 */
	    
	    $("#addUnitBtn").click(function(){
	    	alert("할일 등록하기");
	    	location.href = "./testUnit";
	    });
	    
		/* 
		$("#writeBtn").click(function(){
			alert("글좀 써져라");
			var title = $('#title').val();
		    $.ajax({
				url : '/flu/schedule/unitWrite',
				type : 'POST',
				data: {
					unitName:title
					
				},
				
				success : function(response){
					alert(response);
				},
				error: function(request,status,error){
					  alert("에러 부들 code:"+request.status+"\n"+"error:"+error);
				}
			});
		    
			
		
		});
		
		 */
		
		
		

	    
	    
	});

	
	
</script>


<style type="text/css">

div{
	display: block;
}

.main_section{
	min-width: 1460px;
	width: 100%;
	height: auto;
	background-color: aqua;
}

#schedule_section{
	width: 1152px;
	height: inherit;
	background: orange;
	margin: 0 auto;
}


#part1{
	width: 100%;
	height: 500px;
	background: green;
}


#part1 #cal_section{
	width: 50%;
	height: inherit;
	background: gray;
	float: left;
}

#part1 #cklist_section{
	width: 50%;
	height: inherit;
	background: lightgray;
	float: left;
}

#cklist_table{
	border: 1px solid black;
	text-align: center;
	width: 80%;
	height: 80%;
	margin : 10% auto;
}

#cklist_table th{
	height: 30px;
	line-height: 30px;
}

#calendar{
	width: auto;
}


#part2{
	width: 100%;
	height: auto;
	background: red;
}

.pg-bar{
	width: 300px;
}


</style>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

		<section class="main_section jui">
		
		<!-- 스케줄등록모달 -->
		<div id="writeModal" class="msgbox" style="display: none; background:white;">
			<div class="head">
				<span>등록 폼</span>
		    </div>
			<div class="body">
			<!-- <form id="unitFrm" action="" method="POST"> -->
				<table>
					<tr>
						<td>
							<input class="input input-rect" id="title" name="unitName" style="width: 612px" maxlength="100" placeholder="제목"/>
						</td>
					</tr>
					<tr>
						<td>
							<div id="schedulePicker">
							<div style="float: left;">
								<input class="input input-rect" id="starttime" name="unitStartDate" style="width: 192px" placeholder="시작일" readonly="readonly"/>
								<div id="spicker" class="datepicker">
								    <div class="head">
								        <div class="prev"></div>
								        <div class="title"></div>
								        <div class="next"></div>
								    </div>
								    <table class="body">
								        <tr>
								            <th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th>
								        </tr>
								    </table>
								</div>
							</div>
							<div style="float: left;margin-top: 100px;margin-left: 100px;">
								<a class="btn btn-gray btn-small"><i class="icon-chevron-right"></i></a>
							</div>
							<div style="float: right;">
							<input class="input input-rect" id="endtime" name="unitFinishDate" style="width: 192px" placeholder="종료일" readonly="readonly"/>
							<script data-jui="#spicker" data-tpl="dates" type="text/template">
    						<tr>
        						<! for(var i = 0; i < dates.length; i++) { !>
        						<td><!= dates[i] !></td>
        						<! } !>
    						</tr>
							</script>
							<div id="epicker" class="datepicker">
							    <div class="head">
							        <div class="prev"></div>
							        <div class="title"></div>
							        <div class="next"></div>
							    </div>
							    <table class="body">
							        <tr>
							            <th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th>
							        </tr>
							    </table>
							</div>
							<script data-jui="#epicker" data-tpl="dates" type="text/template">
    						<tr>
        						<! for(var i = 0; i < dates.length; i++) { !>
        						<td><!= dates[i] !></td>
        						<! } !>
    						</tr>
							</script>
							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="border-spacing: 0px;border-collapse: 0px;border: 1px solid #BEBeBe;">
							<span id="schedulefileName"></span>
							<div id="scheduleFiles">
								<input type="file" name="schedulefile" id="schedulefile"><br>
								<a href="#" id="scheduleFileAddBtn" class="btn btn-gray btn-small">파일등록</a>(파일선택 후 등록해야 글 저장시 함께 등록 됩니다.)
							</div>
						</td>
					</tr>
					<tr>
						<td style="border-spacing: 0px;border-collapse: 0px;height:25px;border: 1px solid #BEBeBe;">
							<input type="radio" class="email" name="email" value="test@test.com">사용자1
							<input type="radio" class="email" name="email" value="test@test.com">사용자2
							<input type="radio" class="email" name="email" value="test@test.com">사용자3
						</td>
					</tr>
					<tr>
						<td style="border-spacing: 0px;border-collapse: 0px;height:25px;border: 1px solid #BEBeBe;">
							<input type="radio" class="partName" name="partName" value="part1">part1
							<input type="radio" class="partName" name="partName" value="part2">part2
							<input type="radio" class="partName" name="partName" value="part3">part3
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="input" id="contents" name="unitDescribe" style="width: 610px;height: 300px;" placeholder="내용"></textarea>
						</td>
					</tr>
				</table>
				<div style="text-align: center;">
					<a href="#" id="writeBtn" class="btn btn-gray btn-small">저장</a>
					<a href="#" id="writeClose" class="btn btn-gray btn-small">Close</a>
				</div>
				<!-- </form> -->
			</div>
		</div>
		
		
		
		<!-- 스케줄등록모달 끝 -->
		
		
		
		
		
		
		<div id="schedule_section">
		<h1>SCHEDULE MAIN</h1>
		<h3>${scheduleNum}</h3>
		
		<!----------------- 달력&체크리스트 --------------->
		<div id="part1"> 
			<div id="cal_section">
				<div id='calendar'></div>
			</div>
			
			<div id="cklist_section">
				<input type="button" id="addUnitBtn" value="할일 등록하기">
				<table id="cklist_table">
					<tr>
						<th id="task">할일</th>
						<th id="ing">진행중</th>
						<th id="comp">완료</th>
						<th id="goal">목표</th>
					</tr>
					<tr>
						<td>
							<input type="checkbox">할일1<br/>
							<input type="checkbox">할일2<br/>
							<input type="checkbox">할일3<br/>
							<input type="checkbox">할일4<br/>
						</td>
						<td>
							<input type="checkbox">할일1<br/>
							<input type="checkbox">할일2<br/>
							<input type="checkbox">할일3<br/>
							<input type="checkbox">할일4<br/>
						</td>
						<td>
							<input type="checkbox">할일1<br/>
							<input type="checkbox">할일2<br/>
							<input type="checkbox">할일3<br/>
							<input type="checkbox">할일4<br/>
						</td>
						<td>
							part1<br/>
							part2<br/>
							part3<br/>
							part4<br/>
						</td>
					</tr>
				</table>
			</div>
		</div> 
		<!----------------- 달력&체크리스트 끝--------------->
		
		
		<!----------------- 전체 part 진행률--------------->
		<div id="part2"> 
			
			part 별 진행률 프로그레스 바로 표시하기

			
		</div>
		
		
		<!-- Schedule_View -->
		<div id="main_View" style="display: block;">
			<div class="group" >
				<a class="left btn btn-mini btn-gray-black" id="sview-refresh"><span>새로고침</span>&nbsp;<i class="icon-refresh"></i></a>
				(날짜의 빈공간을 클릭하면 스케줄을 등록 할 수 있습니다.)
			</div>
			<div id='schcalendar'></div>
		</div>
		
		
		
		
	</div>

	
	</section>
	
	



<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
<script type="text/javascript">
function getContextPath(){
//alert('${pageContext.request.contextPath}');
   var context = '${pageContext.request.contextPath}';
   return context;
}



</script>

<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_FUNCTION.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_JUI.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_JQUERY.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_DATE.js" type="text/javascript" charset="utf-8"></script>


</body>
</html>