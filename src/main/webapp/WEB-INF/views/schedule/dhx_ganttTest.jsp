<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dhxGanttTest</title>

<%-- <c:import url="../temp/bootstrap.jsp"></c:import> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/schedule/codebase/dhtmlxgantt.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/codebase/dhtmlxgantt.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/codebase/locale/locale_kr.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/codebase/ext/tooltip.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/codebase/ext/dhtmlxgantt_marker.js"></script>  


<style type="text/css" media="screen">
html, body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	overflow: hidden;
}

.nested_task .gantt_add {
	display: none !important;
}
</style>


  <script type="text/javascript">
			$(function() {

				gantt.config.readonly = false; //굉장히 중요하오

				gantt.config.columns = [ {
					name : "text",
					label : "업무 내용",
					tree : true,
					width : '250'
				}, {
					name : "start_date",
					label : "시작일",
					align : "center",
					width : '80'
				}, {
					name : "end_date",
					label : "마감일",
					align : "center",
					width : '80'
				}, {
					name : "duration",
					label : "기간",
					align : "center",
					width : '50'
				}, {
					name : "add",
					label : "",
					width : '50'
				} ];

				gantt.config.xml_date = "%Y-%m-%d";
				gantt.config.task_height = 20;
				gantt.config.fit_tasks = true;

				gantt.config.fit_tasks = true;

				gantt.config.drag_progress = false;
				gantt.config.drag_resize = true;
				gantt.config.drag_move = true;
				gantt.config.drag_links = false;

				//gantt.config.readonly_property = "property_name";

				//gantt.init("gantt_here",new Date(01,01,2017)); 
				gantt.config.scale_unit = "day";
				gantt.init("gantt_here");
				//gantt.calculateEndDate(new Date(2017,01,01),30,"month")

				/* 
				
				var tasks = {
					    data:[
					        {id:1, text:"Project #1",start_date:"2017-07-01", duration:11,
					        progress: 0.6, open: true},
					        {id:2, text:"Task #1",   start_date:"2017-07-01", end_date:"2017-07-01", 
					        progress: 1,   open: true, parent:1},
					        {id:3, text:"Task #2",   start_date:"2017-07-01", duration:7, 
					        progress: 0.5, open: true, parent:1},
					        {id:4, text:"Task #2.1", start_date:"2017-07-01", duration:2, 
					        progress: 1,   open: true, parent:3 , type:"project"},
					        {id:5, text:"Task #2.2", start_date:"2017-07-01", duration:3, 
					        progress: 0.8, open: true, parent:3},
					        {id:6, text:"Task #2.3", start_date:"2017-07-01", duration:4, 
					        progress: 0.2, open: true, parent:3}
					    ],
					    links:[
					        {id:1, source:1, target:2, type:"1"},
					        {id:2, source:1, target:3, type:"1"},
					        {id:3, source:3, target:4, type:"1"},
					        {id:4, source:4, target:5, type:"0"},
					        {id:5, source:5, target:6, type:"0"}
					    ]
					};
				
				
				gantt.parse (tasks);
				//gantt.deleteTask(id);//업무지우기 //여기서해봣자 안됨  */

				/* 
				gantt.config.lightbox.sections = [
				    {name:"description", height:38, map_to:"text", type:"textarea", focus:true},
				    {name:"time",type:"duration",map_to:"auto",time_format:["%Y","%m", "%d"]}
				];
				 
				gantt.templates.time_picker = function(date){
				    return gantt.date.date_to_str(gantt.config.time_picker)(date);
				}; 
				 */

				//gantt.config.scale_unit = "day"; //hour 도 가능  
				//gantt.render();//설정 바꾼후 다시 render 해줘야한다 //설정바꾼다음에 task같은거 입력하면 그때도 다시 뿌려주니깐..알아두기

				/*   
				  var myEvent = gantt.attachEvent("onTaskClick", function(id, e) {
				      alert("You've just clicked an item with id="+id);
				      alert("내용="+e);
				      //gantt.deleteTask(2);
				      //gantt.refreshData();
				      
				  });
				   
				  gantt.attachEvent(myEvent);
				 */

				//part들시간도 알아서 변하도록 하는것
				gantt.attachEvent("onTaskDrag", function(id, mode, task,
						original) {
					var modes = gantt.config.drag_mode;
					if (mode == modes.move) {
						var diff = task.start_date - original.start_date;
						gantt.eachTask(function(child) {
							child.start_date = new Date(+child.start_date
									+ diff);
							child.end_date = new Date(+child.end_date + diff);
							gantt.refreshTask(child.id, true);
						}, id);
					}
					return true;
				});
				//rounds positions of the child items to scale
				gantt.attachEvent("onAfterTaskDrag", function(id, mode, e) {
					var modes = gantt.config.drag_mode;
					if (mode == modes.move) {
						var state = gantt.getState();
						gantt.eachTask(function(child) {
							child.start_date = gantt.roundDate({
								date : child.start_date,
								unit : state.scale_unit,
								step : state.scale_step
							});
							child.end_date = gantt.calculateEndDate(
									child.start_date, child.duration,
									gantt.config.duration_unit);
							gantt.updateTask(child.id);
						}, id);
					}
				});
				//part들시간도 알아서 변하도록 하는것 끝

				//업무에 올렷을때
				gantt.templates.tooltip_text = function(start, end, task) {
					var tooltipText = "<b>Task:</b> " + task.text
					+ "<br/><b>Duration:</b> " + task.duration
					+ "<br/><b>ID :</b> " + task.id
					+ "<br/><b>TYPE :</b> " + task.type;
					tooltipText = tooltipText
							+ "<hr> <div>내용을 추가해야되</div> <a href='/flu'>홈갈래</a>";
							
					return tooltipText;
				};
				gantt.config.tooltip_hide_timeout = 1000; //다른 곳으로 이동해도 5초는 띄워두겠다는 설정

				gantt.attachEvent("onAfterTaskAdd", function(id, item) {
					//이게 반복적으로 돌면서 이벤트를 붙여주는거 같아요 
					//여기서 unit 부분은 + 가 안되도록 설정해주면 좋겠네요 
					//alert("추가했음="+id);
					//alert("내용="+item.id);
					if (item.type == 1) {
						//gantt.getTask(id).readonly = true;//unit들은 수정이 안되도록 해보겟어요 //걍 설정에서 editable: false 하면됨
						//gantt.config.readonly = true;  //이거로하면 전체에 적용이되버림
					}

				});

				//addTask 안되게하기
				gantt.templates.grid_row_class = function(start, end, task) {
					if (task.$level > 0) {
						return "nested_task" //이걸 통해서 add 버튼을 숨긴다 
						/* 
						css
						.nested_task .gantt_add{
							 display: none !important;
						 }
						
						 */
					}
					return "";
				};

				gantt.scrollTo(30, 80);

				/*  
				gantt.confirm({
				     text: "Continue?",
				     ok:"Yes", 
				     cancel:"No",
				     callback: function(result){
				         if(result){
				             gantt.message("Yes!");
				         }else{
				             gantt.message("No...");
				         }
				     }
				 });
				 */
				// gantt.eachTask(function(task){alert(task.text);}) //각업무에 대한 반복문

				var testEvent = gantt.attachEvent("#test", "click",
						function(e) {
							//e - a native event object
							alert("클릭함");
						});
				// gantt.attachEvent(testEvent);

				$("#test").click(function() {
					alert("저장할란다");
					var json = gantt.serialize();
					alert(JSON.stringify(json));
				});

				
				
				
				
				
				
				var date_to_str = gantt.date.date_to_str(gantt.config.task_date);
				 
				var id = gantt.addMarker({ start_date: new Date(), css: "today", title:date_to_str( new Date())});
				setInterval(function(){
				    var today = gantt.getMarker(id);
				    today.start_date = new Date();
				    today.title = date_to_str(today.start_date);
				    gantt.updateMarker(id);
				}, 1000*60);
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				//파트가져와서 업무에 추가해주기
				var resultJson = getPartList(141);
				changeJsonDataForGanttTask(resultJson);

				//unit가져와서 업무에 추가해주기 
				var resultJsonUnit = getUnitList(141, -1, '', '', '');//구분 없이 해당 스케줄의 unit을 다가져온다
				changeJsonDataForGanttTaskUnit(resultJsonUnit);

				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			});//function끝

			function changeJsonDataForGanttTask(jsonObj) {

				for (var i = 0; i < Object.keys(jsonObj).length; i++) {

					gantt.addTask({
						id : jsonObj[i].scheduleNum + "_" + jsonObj[i].partNum,
						text : jsonObj[i].partName,
						start_date : jsonObj[i].partStartDate,
						end_date : jsonObj[i].partFinishDate,
						type : 0,
						color : "black",
						//parent: "141_1", // unit 넣을때 이런식으로 체크하면 좋겟다
						open : true
					});

				} //for문 끝 

			} //changeJsonDataForGanttTask끝

			//unit 이벤트 추가
			function changeJsonDataForGanttTaskUnit(jsonObj) {

				for (var i = 0; i < Object.keys(jsonObj).length; i++) {
					gantt.addTask({
						id : jsonObj[i].scheduleNum + "_" + jsonObj[i].partNum
								+ "_" + jsonObj[i].unitNum,
						text : jsonObj[i].unitName,
						start_date : jsonObj[i].unitStartDate,
						end_date : jsonObj[i].unitFinishDate,
						type : "1",
						color : jsonObj[i].color,
						parent : jsonObj[i].scheduleNum + "_"
								+ jsonObj[i].partNum,
						open : true,
						editable : false
					//unit은 수정안되요
					});

				} //for끝
			} //changeJsonDataForGanttTaskUnit끝

			/**
			 * DB에 저장된 part들의 list를 json 형태로 받고 partsJSONArray 에 저장해준다
			 */
			function getPartList(scheduleNum) {

				var partsJSONArray = new Array();

				$
						.ajax({
							url : "/flu/schedule/partList?scheduleNum="
									+ scheduleNum,
							type : "GET",
							async : false,
							success : function(data) { //json 넘어옴 

								partsJSONArray = data;

								//클라이언트가 unit 등록할때 
								var unitInsertParts = '';
								$(data)
										.each(
												function() {
													unitInsertParts = unitInsertParts
															+ '<input type="radio" class="partName" name="partName" value="'+this.partName+'" data-num="'+this.partNum+'">'
															+ this.partName;
												});
								$("#parts").html(unitInsertParts);

							}
						}); //success끝

				alert("ajax아래 함수안에 data part //동기로 했음        "
						+ JSON.stringify(partsJSONArray));
				return partsJSONArray;

			} // getPartList() 끝

			//part별 보기로 클릭했을때 partnum을 주면된다
			function getUnitList(scheduleNum, partNum, email, unitState, kind) {

				var partsJSONArray = new Array();

				$
						.ajax({
							url : "/flu/schedule/unitList",
							type : "POST",
							async : false,
							data : {
								scheduleNum : scheduleNum,
								partNum : partNum,
								email : email,
								unitState : unitState
							},
							success : function(data) {
								partsJSONArray = data;
								//여기서 상태 분석 후 색 정해주기 //할일 진행중 완료 마감등
								for (var i = 0; i < partsJSONArray.length; i++) {

									if (partsJSONArray[i].unitState == '할일') {
										partsJSONArray[i].color = "rgb(255, 176, 36)";
									} else if (partsJSONArray[i].unitState == '진행중') {
										partsJSONArray[i].color = "rgb(176, 180, 187)";
									} else if (partsJSONArray[i].unitState == '완료') {
										partsJSONArray[i].color = "rgb(39, 182, 186)";
									} else if (partsJSONArray[i].unitState == '마감일 지남') {
										partsJSONArray[i].color = "rgb(233, 94, 81)";
									} else {
										alert("니상태는 뭐니");
									}

									//partsJSONArray[i].textColor = 'white';
								}
							}

						});
				alert("ajax아래 함수안에 data unit //동기로 했음        "
						+ JSON.stringify(partsJSONArray));
				return partsJSONArray;

			} //getUnitList끝
		</script>
    




</head>
<body>

<%-- <c:import url="../temp/header.jsp"></c:import> --%>

<section class="main_section">
 <div id="gantt_here" style='width:1500px; height:500px; margin:0 auto;'>
 

 </div>
 
  <div id="test" style='width:200px; height:200px; background:orange;'></div>
 
 </section>
 
<%--  <c:import url="../temp/footer.jsp"></c:import>  --%>
    
</body>
</html>