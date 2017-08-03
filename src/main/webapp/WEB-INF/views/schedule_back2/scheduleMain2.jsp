<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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



<title>ScheduleMain</title>




<style type="text/css">

div{
	display: block;
}

.main_section{
	min-width: 1460px;
	width: 100%;
	height: auto;
	background-color: #f2f2f2; /* white; */ /* aqua; */
}

#partsAndUsers{
	display: block;
    margin-top: 100px;
    width: 15%;
    height: auto;
    background: orange;
    float: left;
    font-size: 12px;
}

.testData{
	width: 1152px;
	height: auto;
	background: white; /* lime; */
	margin: 0 auto;
}

#tag_viewAll{
	width: 100px;
	height: 50px;
	background: red;
}


/* 이게 가운데 네모 전체임 */
#schedule_section{
	width: 1152px;
	height: inherit;
	background: white; /* orange; */
	margin: 0 auto;
}


#part1{
	width: 100%;
	height: 500px;
	background: white; /* green; */
}


#main_View{
	padding: 10px;
}


#part1 #cal_section{
	width: calc(40% - 20px);
	height: inherit;
	background: white; /* gray; */
	float: left;
}

#part1 #cklist_section{
	width: 60%;
	height: inherit;
	background: white; /* lightgray; */
	float: left;
}

#cklist_table{
	border: 1px solid black;
	text-align: center;
	width: 95%;
	height: 40%;
	margin : 10px auto;
	font-size: 15px;
}

#cklist_table th{
	height: 30px;
	line-height: 30px;
}

#schcalendar{
	width: inherit;
    height: 100%;
}


#part2{
	width: 100%;
	height: auto;
	background: white; /* red; */
}

.pg-bar{
	width: 300px;
}

/****************** modal css *******************/
#partModal{
	background: white; /* lime; */
}



</style>



</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

		<section class="main_section jui">
		<input type="text" name="projectNum" id="projectNum" value="${projectNum}">
		<input type="hidden" name="scheduleNum" id="scheduleNum" value="0">
		
		
		<!-- 스케줄 글보기 모달 -->
		<div id="modal" class="msgbox" style="display: none;">
			<div class="head">
				<span id="modal-title"></span>
		    </div>
			<div class="body">
				<span id="modal-contents"></span>
				클릭한 파트에 대해서 해당 파트에 대한 할일들과 그 할일들에 대한 사용자, 마감일, 첨부파일등을 뿌려주면 좋겠다
				<div style="text-align: center; margin-top: 45px;" id="contentsBtn"></div>
			</div>
		</div>
		
		<!-- 스케줄등록모달 -->
		<div id="writeModal" class="msgbox" style="display: none; background:white;">
			<div class="head">
				<span>등록 폼</span>
		    </div>
			<div class="body  insertForm">
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
					<!-- 상세일정 등록시 파일 첨부튼 formdata를 이용하여 ajax 하면 좋겠다 -->
					<!-- <tr>
						<td style="border-spacing: 0px;border-collapse: 0px;border: 1px solid #BEBeBe;">
							<span id="schedulefileName"></span>
							<div id="scheduleFiles">
								<input type="file" name="schedulefile" id="schedulefile"><br>
								<a href="#" id="scheduleFileAddBtn" class="btn btn-gray btn-small">파일등록</a>(파일선택 후 등록해야 글 저장시 함께 등록 됩니다.)
							</div>
						</td>
					</tr> -->
					<tr>
						<td style="border-spacing: 0px;border-collapse: 0px;height:25px;border: 1px solid #BEBeBe;">
							<div id="users"></div>
						</td>
					</tr>
					<tr>
						<td style="border-spacing: 0px;border-collapse: 0px;height:25px;border: 1px solid #BEBeBe;">
							<div id="parts"></div>
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="input" id="contents" name="unitDescribe" style="width: 610px;height: 300px;" placeholder="내용"></textarea>
						</td>
					</tr>
				</table>
				<div style="text-align: center;">
					<a href="#" id="writeNextBtn" class="btn btn-gray btn-small">등록후 새로운 일정추가</a>
					<a href="#" id="writeBtn" class="btn btn-gray btn-small">저장</a>
					<a href="#" id="writeClose" class="btn btn-gray btn-small">Close</a>
				</div>
				<!-- </form> -->
			</div>
		</div>	
		<!-- 스케줄등록모달 끝 -->
		
		
		<div id="tag_viewAll">
			전체보기
		</div>
		<div id="schedule_section">
		<h1>SCHEDULE MAIN</h1>
		
		<!----------------- 달력&체크리스트 --------------->
		<div id="part1"> 
				
		
		<!-- 		
		<div id="partsAndUsers">
				myeon01(myeon01)@sss<br/>
				욥욥<br/>
				립립<br/>
				클래스구축<br/>
				DB설계를통한 어쩌고 저쩌고<br/>
		</div>
		 -->

			<div id="cal_section">
				<!-- Schedule_View -->
					<div id="main_View" style="display: block;">
						<div class="group">
							<a class="left btn btn-mini btn-gray-black" id="sview-refresh"><span>새로고침</span>&nbsp;<i
								class="icon-refresh"></i></a> (날짜의 빈공간을 클릭하면 스케줄을 등록 할 수 있습니다.)
						</div>
						<div id='schcalendar'></div>
					</div>
			</div>
			
			<div id="cklist_section">
				<div id="unitSearch">
					<select>
						<option>test1(tester1)</option>
						<option>test1(tester1)</option>
						<option>test1(tester1)</option>
					</select>
					<select>
						<option>파트파트파트1</option>
						<option>파트파트파트2</option>
						<option>파트파트파트3</option>
					</select>
				</div>
			<!-- 	<div id="unitTitle">
					<div>할일</div><div>진행중</div><div>완료</div><div>목표</div>
				</div>
				<div id="unitWill">
					<ul>
						<li>기나긴 이름들의 할일1</li>
						<li>기나긴 이름들의 할일2</li>
						<li>기나긴 이름들의 할일3</li>
						<li>기나긴 이름들의 할일4</li>
						<li>기나긴 이름들의 할일5</li>
					</ul>
				</div>
				<div id="unitIng">
					<ul>
						<li>기나긴 이름들의 진행중1</li>
						<li>기나긴 이름들의 진행중2</li>
						<li>기나긴 이름들의 진행중3</li>
						<li>기나긴 이름들의 진행중4</li>
						<li>기나긴 이름들의 진행중5</li>
					</ul>
				</div>
				<div id="unitDone">
					<ul>
						<li>기나긴 이름들의 완료1</li>
						<li>기나긴 이름들의 완료2</li>
						<li>기나긴 이름들의 완료3</li>
						<li>기나긴 이름들의 완료4</li>
						<li>기나긴 이름들의 완료5</li>
					</ul>
				</div>
				<div id="unitGoal">
					<ul>
						<li>기나긴 이름들의 파트1</li>
						<li>기나긴 이름들의 파트2</li>
						<li>기나긴 이름들의 파트3</li>
						<li>기나긴 이름들의 파트4</li>
						<li>기나긴 이름들의 파트5</li>
					</ul>
				</div> -->
				<!-- <input type="button" id="addUnitBtn" value="할일 등록하기">-->
				<table id="cklist_table">
					<tr id="unitTitle">
						<th id="task">할일</th>
						<th id="ing">진행중</th>
						<th id="comp">완료</th>
						<th id="goal">목표</th>
					</tr>
					<tr>
						<td id="unitWill">
							<ul>
								<li><input type="checkbox">기나긴 이름들의 할일1</li>
								<li><input type="checkbox">기나긴 이름들의 할일2</li>
								<li><input type="checkbox">기나긴 이름들의 할일3</li>
								<li><input type="checkbox">기나긴 이름들의 할일4</li>
								<li><input type="checkbox">기나긴 이름들의 할일5</li>
							</ul>
						</td>
						<td id="unitIng">
							<ul>
								<li><input type="checkbox">기나긴 이름들의 진행중1</li>
								<li><input type="checkbox">기나긴 이름들의 진행중2</li>
								<li><input type="checkbox">기나긴 이름들의 진행중3</li>
								<li><input type="checkbox">기나긴 이름들의 진행중4</li>
								<li><input type="checkbox">기나긴 이름들의 진행중5</li>
							</ul>
						</td>
						<td id="unitDone">
							<ul>
								<li><input type="checkbox">기나긴 이름들의 완료1</li>
								<li><input type="checkbox">기나긴 이름들의 완료2</li>
								<li><input type="checkbox">기나긴 이름들의 완료3</li>
								<li><input type="checkbox">기나긴 이름들의 완료4</li>
								<li><input type="checkbox">기나긴 이름들의 완료5</li>
							</ul>
						</td>
						<td id="unitGoal">
							<ul>
								<li>기나긴 이름들의 파트1</li>
								<li>기나긴 이름들의 파트2</li>
								<li>기나긴 이름들의 파트3</li>
								<li>기나긴 이름들의 파트4</li>
								<li>기나긴 이름들의 파트5</li>
							</ul>
						</td>
					</tr>
				</table> 
				<table id="cklist_table">
					<tr id="unitTitle">
						<th id="task">할일</th>
						<th id="ing">진행중</th>
						<th id="comp">완료</th>
					</tr>
					<tr>
						<td id="unitWill">
							<ul>
								<li><input type="checkbox">기나긴 이름들의 할일1</li>
								<li><input type="checkbox">기나긴 이름들의 할일2</li>
								<li><input type="checkbox">기나긴 이름들의 할일3</li>
								<li><input type="checkbox">기나긴 이름들의 할일4</li>
								<li><input type="checkbox">기나긴 이름들의 할일5</li>
							</ul>
						</td>
						<td id="unitIng">
							<ul>
								<li><input type="checkbox">기나긴 이름들의 진행중1</li>
								<li><input type="checkbox">기나긴 이름들의 진행중2</li>
								<li><input type="checkbox">기나긴 이름들의 진행중3</li>
								<li><input type="checkbox">기나긴 이름들의 진행중4</li>
								<li><input type="checkbox">기나긴 이름들의 진행중5</li>
							</ul>
						</td>
						<td id="unitDone">
							<ul>
								<li><input type="checkbox">기나긴 이름들의 완료1</li>
								<li><input type="checkbox">기나긴 이름들의 완료2</li>
								<li><input type="checkbox">기나긴 이름들의 완료3</li>
								<li><input type="checkbox">기나긴 이름들의 완료4</li>
								<li><input type="checkbox">기나긴 이름들의 완료5</li>
							</ul>
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
		
		
		
		<!-- 값 넘어오는거 확인용 -->
		<div class="testData">
		이곳에 스케줄넘,해당 스케줄에 대한 파트/클라이언트/사용자,  현재 로그인된 세션 이 필요함  
		
			<div id="partsDiv"></div>
			<hr>
			
			<div id="unitsDiv"></div>
			<hr>
			
			<div id="clientDiv"></div>
			<hr>
			
			<div id="usersDiv"></div>
			<hr>
			
			
			
		</div>
		
		
		
		
		
		
		
		
	</div>

	
	</section>
	
	



<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>


<script type="text/javascript">

function getContextPath(){
	alert('${pageContext.request.contextPath}');
	var context = '${pageContext.request.contextPath}';
	return context;
}
</script>


<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_FUNCTION.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_JUI.js" type="text/javascript" charset="utf-8"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_JQUERY.js" type="text/javascript" charset="utf-8"></script> --%>
<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test_DATE.js" type="text/javascript" charset="utf-8"></script>



<script type="text/javascript">

//********* ajax 함수 아래있다고 해서 ajax에서 받아온 값을 사용하는 것이 아니다 undefined****************//

$(function(){
	var projectNum = '${projectNum}'; //들어올때 DB확인해서 받아옴 
	
	//unit 등록용
	$('#starttime').val(spicker.getFormat());
	$('#endtime').val(epicker.getFormat());

	getScheduleNum(projectNum);
	
	
	$(document).on("click",".onePartClick",function(){
		partClick($(this).children(".partNum").text());
	});
	
	
	function partClick(partNum){
		alert("partNum"+partNum);
		//scheduleNum 과 partNum 을 가지고 
	}
	
	
	
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
			spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate()); 
			epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate()); 
			writeModal.show(); 
			
	    }
	});
	
	
	$('#writeBtn').click(function(){
		alert('글쓰기클릭');
		//oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		var title = $('#title').val();
		var contents = $('#contents').val();
		var starttime = $('#starttime').val();
		var endtime = $('#endtime').val();
		var email = $(':input:radio[name=email]:checked').val();   
		var partName = $(':input:radio[name=partName]:checked').val();  
		var partNum = $(':input:radio[name=partName]:checked').attr("data-num");
		
		
		var scheduleNum = $("#scheduleNum").val()*1;
		alert('스케줄넘 '+scheduleNum);
		//var formData = new FormData();
		 //첫번째 파일태그
		//formData.append("schedulefile",$("input[name=schedulefile]")[0].files[0]);

		
		var starttimeStr=starttime.toString();
		var endtimeStr=endtime.toString();
		alert(title+contents+starttime+starttimeStr+endtime+endtimeStr+email+partName);
			$.ajax({
			url : '/flu/schedule/unitWrite',
			type : 'POST',
				//dataType: 'JSON',
			    //data:  scheduleParam,
			    //contentType:"application/json; charset=UTF-8",
				//processData: false,
				//contentType: false,
				data: {
					scheduleNum:scheduleNum,
					unitName:title,
					unitDescribe:contents,
					unitStartDate:starttimeStr,
					unitFinishDate:endtimeStr,
					email:email,
					partNum:partNum,
				},
				
				success : function(response){ //json으로 result 만옴
					//alert(response.result);
					if(response.result > 0){
						alert("등록성공");
						writeModal.hide();
					}else{
						alert("등록실패");
					}
					//등록후 내용 비워주는 부분
					writeModal.hide();
					$('iframe[id!=scheduleFrame]').remove();
					$('#title').val('');
					$('#contents').val('');
					$('#schcalendar').fullCalendar('refetchEvents');
					$('#schedulefileName').html('');
					var date = new Date();
		    		spicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
		    		epicker.select(date.getFullYear(),date.getMonth()+1,date.getDate());
				
		    		getUnitList(scheduleNum,-1,''); // 추가되었으니 또 뿌려줘야겠죠
				},
				error: function(request,status,error){
					  alert("에러 부들 code:"+request.status+"\n"+"error:"+error);
				}
			});
		
		
		//$("#unitFrm").attr("action",getContextPath()+'/schedule/unitWrite');
		//$("#unitFrm").submit();
	});
	
	
	$('#writeClose').click(function(){
		//$('#schedulefileName').html('');
		writeModal.hide();
		//$('iframe[id!=scheduleFrame]').remove();
	});
	
	
	
	




/* 
	DB 에 해당 프로젝트의 스케줄이 있는지 확인 후 
	있으면 users, parts , units 정보를 가져오는 함수호출
	없으면 스케줄 생성여부를 물어본 뒤 
		생성한다고하면 생성함수호출 
		안한다고 하면 이전 화면
*/
function getScheduleNum(projectNum){
	
	$.ajax({
		url: getContextPath()+"/schedule/check?projectNum="+projectNum,
		type: "GET",
		success: function(data){
			//alert(JSON.stringify(data));
			
			if(data.schedule=='n'){
				//스케줄 생성하도록 창띄워주기
				//alert(data.projectNum);
				if(confirm('스케줄을 생성하시겠소?')){
					scheduleNum = createSchedule(data.projectNum);
				}else{
					//이전 화면으로 가기 
					window.history.back();
				}
				
			}else if(data.schedule=='y'){
				
				scheduleNum = data.scheduleMainDTO.scheduleNum;
				alert("ajax 성공시 scheduleNum(있을경우) = "+scheduleNum);
				$("#scheduleNum").val(scheduleNum);
				getPartList(scheduleNum);
				getUserList(scheduleNum);
				getUnitList(scheduleNum,-1,'');// -1 이면 전체가 나온다 
			}else{
				alert("스케줄 생성 오류");
				//location.href=getContextPath();
			}
		}
	});
}


/* 
	스케줄 생성함수 
*/
function createSchedule(projectNum){
	var scheduleNum = 0;
	$.ajax({
		url: getContextPath()+"/schedule/create?projectNum="+projectNum,
		type: "GET",
		success:function(data){
			//mainInsertForm 이 넘어옴  // schedule 시작일, 마감일 , part추가 폼 
			//alert(data);
			$(".insertForm").html(data); // writeModal 의 contents 부분에 세팅해둔다
			writeModal.show(); 
			
			scheduleNum = $("#scheduleNum").val(); //생성된 scheduleNum을 저장한다 
			alert("ajax로 생성된 scheduleNum = "+scheduleNum);
			return scheduleNum;
		}
	});
}


	
/**
 * DB에 저장된 part들의 list를 json 형태로 받고 partsJSONArray 에 저장해준다
 */
function getPartList(scheduleNum){
	
	var partsJsonArray = new Array();
	
	$.ajax({
		url: "/flu/schedule/partList?scheduleNum="+scheduleNum,
		type: "GET",
		success:function(data){ //json 넘어옴 

			
			var result="<table>";
			$(data).each(function(){
				result = result + '<tr class="onePartClick">';
				result = result + '<td class="schNum">'+ this.scheduleNum + "</td>";
				result = result + "<td> "+ this.partName + " </td>";
				result = result + "<td> "+ this.partStartDate + " </td>";
				result = result + "<td> "+ this.partFinishDate + " </td>";
				result = result + "<td> "+ this.partNum + " </td>";
				result = result + "<td> "+ this.partDescFileO + " </td>";
				result = result + "</tr>";
				
				//fullcal의 event 속성에 맞춰서 json 만들어주기
				var partsJson = new Object();
				partsJson.id = this.scheduleNum+this.partName+this.partNum;
				partsJson.title = this.partName;
				partsJson.start =  this.partStartDate; 
				partsJson.end =  this.partFinishDate; 
				partsJson.description =  this.partDescFileO; 
				partsJson.color =  'blue'; 
				partsJson.textColor =  'white'; 
				partsJsonArray.push(partsJson);
	
				
			});
			result = result + "</table>";
			$("#partsDiv").html(result); //화면에 뿌려주기
			
			
			var unitInsertParts = '';
			$(data).each(function(){
				unitInsertParts = unitInsertParts + '<input type="radio" class="partName" name="partName" value="'+this.partName+'" data-num="'+this.partNum+'">'+this.partName;
			});
			$("#parts").html(unitInsertParts);

			
			partsJSONArray = data;
			//여기서 이 json을 사용하는 함수를 불러 주는게 좋겠다
			//return partsJSONArray; 
			//이렇게하면 비동기화 방식이 무의미 해지기 때문에 //데이터를 담은 후 그 데이터를 사용하기 위한것이기 때문에
			//동기화 방식 // 즉 데이터가 다 가져와져서 담길때까지 기다려야하기 때문이라는 말이다 
			//그냥 여기서 함수를 호출해버리는게 좋을수도 있겠다 
			alert("success안에 data "+JSON.stringify(partsJSONArray));
			addEvents(partsJSONArray); // 달력 뿌려주고 이거 실행되면 되는것이지요 
		}
	});
	
	//alert("ajax아래 함수안에 data "+JSON.stringify(partsJSONArray)); // 오류남
	
	
	
} // getPartList() 끝


function getUserList(scheduleNum){
	
	$.ajax({
		url: "/flu/schedule/userList?scheduleNum="+scheduleNum,
		type: "GET",
		success: function(data){
			//alert(JSON.stringify(data));
			
			var result="<table>";
			$(data).each(function(){
				result = result + "<tr>";
				result = result + "<td> "+ this.email + " </td>";
				result = result + "<td> "+ this.kind + " </td>";
				result = result + "<td> "+ this.name+"("+this.nickName+")" + " </td>";
				result = result + "</tr>";				
			});
			result = result + "</table>";

			$("#usersDiv").html(result); //화면에 뿌려주기
			
			
			
			var unitInsertUsers = '';
			$(data).each(function(){
				unitInsertUsers = unitInsertUsers + '<input type="radio" class="email" name="email" value="'+this.email+'">' + this.name + '(' + this.nickName + ')';			
			});
			alert(unitInsertUsers);
			$("#users").html(unitInsertUsers);
			
			
			
		}
		
	});
	
}


//part별 보기로 클릭했을때 partnum을 주면된다
function getUnitList(scheduleNum,partNum,email){
	
	$.ajax({
		url: "/flu/schedule/unitList",
		type: "POST",
		data: {
			scheduleNum:scheduleNum,
			partNum:partNum,
			email:email
		},
		success: function(data){
			alert("unit들"+JSON.stringify(data));
			
			var result="<table>";
			$(data).each(function(){
				result = result + "<tr>";
				result = result + "<td> "+ this.unitNum + " </td>";
				result = result + "<td> "+ this.unitName + " </td>";
				result = result + "<td> "+ this.unitDescribe + " </td>";
				result = result + "<td> "+ this.unitFinishDate + " </td>";
				result = result + "<td> "+ this.partNum + " </td>";
				result = result + "<td> "+ this.email + " </td>";
				result = result + "</tr>";				
			});
			result = result + "</table>";

			$("#unitsDiv").html(result); //화면에 뿌려주기
		}
		
	});
	
}






/**
 * 받아온 json을 사용해서 fullcal의 일정에 추가해준다 
 */
function addEvents(jsonObj){
	for(var i=0; i<Object.keys(jsonObj).length; i++){
		//alert('일정추가되고있는가'+i);
        $('#schcalendar').fullCalendar('addEventSource', [{
            id:          jsonObj[i].scheduleNum+jsonObj[i].partName+jsonObj[i].partNum,
            title:       jsonObj[i].partName,
            start:       jsonObj[i].partStartDate,
            end:         jsonObj[i].partFinishDate,
            description: jsonObj[i].partNum, 
            color:       jsonObj[i].color,
            textColor:   jsonObj[i].textColor,
            //url: 'https://www.github.com'
        }]);
        console.log('ok');
    } 
}

}); // $(function(){}) 끝


</script>

</body>
</html>