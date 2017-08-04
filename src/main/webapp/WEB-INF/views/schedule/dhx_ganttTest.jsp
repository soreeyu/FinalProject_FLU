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
  var member = '${member.email}';
  var memberKind = '${member.kind}';
  alert("memberKind = " + memberKind);
  
  var scheduleNum = ${scheduleNum};
  alert("scheduleNum = "+scheduleNum);
  
  var curTaskId = 0;
  var lastPartNum = 0;
  var lastUnitNum = 0;
  
	$(function() {
		
		
		
//////////////////////////////////lightbox//////////////////////////////////
		
		 var opts = [
			    { key:"할일", label: "할일" },                                            
			    { key:"진행중", label: "진행중" },                                         
			    { key:"완료", label: "완료" }                                            
		];
		
		 var optsUser = [
			   //user 필요            
			   {key:"담당자",label:"담당자"},
			   {key:"담당자2",label:"담당자2"}
		];
		

		//duration,parent,select,template,textarea,time,typeselect
		var full_lightbox =[
		    {name:"title", height:38, map_to:"text", type:"textarea", focus:true , button:"help"},
		    {name:"describe", height:72, map_to:"describe", type:"textarea"},       
		    {name:"time", height:72, map_to:"auto", type:"duration",time_format:["%Y","%m","%d"]}
		];
		
		gantt.locale.labels.section_title = "파트명";
		gantt.locale.labels.section_describe = "part 설명";
		//'help' is the value of the 'button' property
		gantt.locale.labels.button_help="Help label";
		
		
		gantt.form_blocks.textarea.button_click=function(index,button,shead,sbody){
		    //뭘까
		    gantt.alert("버튼 눌렷을 때인건가"+index+button+shead+sbody);
		}

		//이거를 unit생성할때 사용해야겠군요 
		var restricted_lightbox = [
			{name:"title", height:38, map_to:"text", type:"textarea", focus:true},
		    {name:"unitDescribe", height:72, map_to:"unitDescribe", type:"textarea"}, 
		    {name:"type", type:"typeselect", map_to:"type"},  
		    {name:"parent", type:"parent",  filter:function(id, task){ 
		        if(task.$level > 0){         
		            return false;     
		        }else{  
		            return true; 
		        } 
		    }}, 
		    {name:"unitState",    height:22, type:"select",   map_to:"unitState", options:opts, default_value:"할일"}, //여기서설정해주느 value는 option의 key임
		    {name:"email",    height:22, type:"select",   map_to:"email", options:optsUser, default_value:"담당자"},
		    {name:"time", height:72, map_to:"auto", type:"duration",time_format:["%Y","%m","%d"]}
		];
		
		gantt.locale.labels.section_title = "업무명";
		gantt.locale.labels.section_parent = "Part 선택";
		gantt.locale.labels.section_email = "담당자";
		gantt.locale.labels.section_unitDescribe = "업무 설명";
		gantt.locale.labels.section_unitState = "상태";
		
		 
		gantt.attachEvent("onBeforeLightbox", function(task_id) {
			gantt.alert("라잇박스 열리기직전에 발생하는 이벤트");
		    gantt.resetLightbox(); //lightbox를 리셋해줌
			
		    var task = gantt.getTask(task_id);  
		    if (task.type == 1){ //unit
		        gantt.config.lightbox.sections = restricted_lightbox;
		    	gantt.alert("unit을 원한다");
		    } else if(task.type == 0){ //part
		        gantt.config.lightbox.sections = full_lightbox;
		        gantt.alert("part를 원한다");
		    }else{
		    	 gantt.alert("도대체 뭐요"+task.type);
		    }
		    return true;
		});
			
		
		
		
		
		
	
	//member의 kind에 따른 간트차트 옵션 설정
	if(memberKind == 'freelancer'){
		alert("프리랜서입장");
		gantt.config.readonly = true; //true 면 전체가 수정은 불가 

		/* 
		//프리랜서는 수정이 불가하게 해줘야한다
		//반복문 
		gantt.eachTask(function(task){
			alert(task.text);
			gantt.getTask(task.id).restricted = true; //changes task's data
			gantt.updateTask(task.id); //renders the updated task
		});
 		*/
					
	}else if(memberKind == 'client'){
		alert("클라이언트입장");
		gantt.config.readonly = false;
	}else if(memberKind == 'admin'){
		alert("관리자입장");
	}else{//아무것도 아닐때
		alert("접근불가합니다");
		location.href="/flu";
	}

				
	//grid 파트 설정
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
		
				
	//공통의 옵션

	gantt.config.xml_date = "%Y-%m-%d";
	gantt.config.task_height = 30; //차트의 칸높이
	gantt.config.fit_tasks = true; //알아서 칸에 맞춰짐 

	gantt.config.drag_progress = false; //진행률 표시하는것 사용안하기
	gantt.config.drag_links = false; //선 연결하는것 사용안하기
	gantt.config.drag_resize = true; //사이즈조절 사용하기 
	gantt.config.drag_move = true; //드래그해서 위치 움직이기 사용하기
	
	gantt.config.work_time = false; //주중에만 일해야하나봐요..//false면 주말에도 일해요
	gantt.config.correct_work_time = false; //이건 뭘까
				
	///////////////////////////////////////tooltip///////////////////////////
	//tooltip설정 // task 마다 할당되는
	
	// offset은 위치가 떨어지는것
	gantt.config.tooltip_offset_x = 10; 
	gantt.config.tooltip_offset_y = 10; 
	
	gantt.templates.tooltip_date_format=function (date){
	    var formatFunc = gantt.date.date_to_str("%Y-%m-%d");
	    return formatFunc(date);
	};
	
	gantt.templates.tooltip_text = function(start,end,task){
	    var tooltipText = "";
		tooltipText = tooltipText + "<b>Task:</b> " + task.text;
		tooltipText = tooltipText + "<br/><b>Start date:</b> " + gantt.templates.tooltip_date_format(start);  
		tooltipText = tooltipText + "<br/><b>End date:</b> "+gantt.templates.tooltip_date_format(end);
		tooltipText = tooltipText + "<br/><b>Duration:</b> " + task.duration;
		tooltipText = tooltipText + "<br/><b>ID :</b> " + task.id;
		tooltipText = tooltipText + "<br/><b>TYPE :</b> " + task.type;
		//tooltipText = tooltipText + "<hr> <b>holder는 뭐징</b>" + task.holder;
		//tooltipText = tooltipText + " <a href='/flu'>홈갈래</a>";
		//tooltipText = tooltipText + "<br/><select><option>할일</option>";
		//tooltipText = tooltipText + "<option>진행중</option><option>완료</option></select>";
		
		//alert("task= "+task);
		return tooltipText;
	};
	//gantt.config.tooltip_timeout = 100;
	//gantt.config.tooltip_hide_timeout = 5000; //다른 곳으로 이동해도 5초는 띄워두겠다는 설정
				
	


	//////////////////////////레벨 0만 /////////////////
	//addTask 안되게하기
	gantt.templates.grid_row_class = function(start, end, task) {
		if (task.$level > 0) { //레벨에 따라서
			return "nested_task" //이걸 통해서 add 버튼을 숨긴다 
		}
		return "";
	};

	
	
	




	
	
	
	
	
	
	gantt.init("gantt_here");
	
	gantt.attachEvent("onAfterTaskAdd", function(id, item) {
		alert("item"+item);
		// task반복문
		//gantt.eachTask(function(task){
			if (item.unitState == '할일') {
				item.color = "rgb(255, 176, 36)";
			} else if (item.unitState == '진행중') {
				item.color = "rgb(176, 180, 187)";
			} else if (item.unitState == '완료') {
				item.color = "rgb(39, 182, 186)";
			} else if (item.unitState == '마감일 지남') {
				item.color = "rgb(233, 94, 81)";
			} else {
				alert("니상태는 뭐니");
			}
		//});
	});
	
	
	
	
	
	
	//////////////////////////////존재하는 애들 가져오기 ////////////////////////////      				
	//파트가져와서 업무에 추가해주기
	var resultJson = getPartList(scheduleNum);
	changeJsonDataForGanttTask(resultJson);

	//unit가져와서 업무에 추가해주기 
	var resultJsonUnit = getUnitList(scheduleNum, -1, '', '', '');//구분 없이 해당 스케줄의 unit을 다가져온다
	changeJsonDataForGanttTaskUnit(resultJsonUnit);
	
	
	
	$("#test").click(function() {
		alert("저장할란다");
		var json = gantt.serialize();		
		setUnits(json);
	});

	
			
});//function끝


function setUnits(json){
	alert(JSON.stringify(json));
	json  = JSON.stringify(json);
	$.ajax({
		url: "./setUnits",
		data:{
			jsonData : json
		},
		type: "POST",
		success: function(data){ //void로 하면 안넘어오고 int로 하면 숫자만 넘어오고
			alert("데이터 넘기기 성공"+data);
		}
	});
}


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
			open : true,
			restricted : false
		});

		if (Object.keys(jsonObj).length != 0) {
			lastPartNum = jsonObj[Object.keys(jsonObj).length - 1].partNum;
		}
	} //for문 끝 

} //changeJsonDataForGanttTask끝

//unit 이벤트 추가
function changeJsonDataForGanttTaskUnit(jsonObj) {

	for (var i = 0; i < Object.keys(jsonObj).length; i++) {
		gantt.addTask({
			id : jsonObj[i].scheduleNum + "_" + jsonObj[i].partNum + "_"
					+ jsonObj[i].unitNum,
			text : jsonObj[i].unitName,
			start_date : jsonObj[i].unitStartDate,
			end_date : jsonObj[i].unitFinishDate,
			type : "1",
			color : jsonObj[i].color,
			parent : jsonObj[i].scheduleNum + "_" + jsonObj[i].partNum,
			open : true,
			//editable : false,
			restricted : true
		//unit은 수정안되요
		});

	} //for끝
	if (Object.keys(jsonObj).length != 0) {
		lastUnitNum = jsonObj[Object.keys(jsonObj).length - 1].unitNum;
	}
} //changeJsonDataForGanttTaskUnit끝

/**
 * DB에 저장된 part들의 list를 json 형태로 받고 partsJSONArray 에 저장해준다
 */
function getPartList(scheduleNum) {

	var partsJSONArray = new Array();

	$.ajax({
		url : "/flu/schedule/partList?scheduleNum=" + scheduleNum,
		type : "GET",
		async : false,
		success : function(data) { //json 넘어옴 

			partsJSONArray = data;

		}
	}); //success끝

	alert("ajax아래 함수안에 data part //동기로 했음 "+ JSON.stringify(partsJSONArray));
	return partsJSONArray;

} // getPartList() 끝

//part별 보기로 클릭했을때 partnum을 주면된다
function getUnitList(scheduleNum, partNum, email, unitState, kind) {

	var partsJSONArray = new Array();

	$.ajax({
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
	alert("ajax아래 함수안에 data unit //동기로 했음" + JSON.stringify(partsJSONArray));
	return partsJSONArray;

} //getUnitList끝



</script>





</head>
<body>


<section class="main_section">
 <div id="gantt_header" style="width:100%; height:100px; background:orange; ">
 	<span style="display:block; width:200px; height:100px; line-height:100px; background:yellow; margin-left:100px; ">프로젝트 진행창</span>
 </div>
 <div id="gantt_here" style='width:100%; height:500px; margin:0 auto; overflow:hidden;'>
 
 </div>
 
<div id="test" style='width:200px; height:200px; background:orange;'></div>
 
 
 </section>
 

    
</body>
</html>