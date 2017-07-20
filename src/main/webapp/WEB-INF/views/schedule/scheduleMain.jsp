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


<title>ScheduleMain</title>




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

.testData{
	width: 1152px;
	height: auto;
	background: lime;
	margin: 0 auto;
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

#schcalendar{
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


<script type="text/javascript">

function getContextPath(){
	alert('${pageContext.request.contextPath}');
	var context = '${pageContext.request.contextPath}';
	return context;
}



$(function(){
	//alert("다시 시작하기");
	//var scheduleNum = 0; 
	//var partJsonArray = new Array(); //다시 새롭게 값을 넣어주고싶을땐 반드시 초기화를 다시해줘야한다 
	
	
	
	//scheduleNum = getScheduleNum(3000);
	//****************************************************주의..
	//alert("ajax 아래에서 찍어보는 scheduleNum="+scheduleNum); 
	//********* 이게 ajax 아래있다고 해서 ajax에서 받아온 값을 사용하는 것이 아니다 
	
	
	getScheduleNum(8000);
});




function getScheduleNum(projectNum){
	//ajax로 스케줄있는지 확인필요 
	$.ajax({
		url: getContextPath()+"/schedule/check?projectNum="+projectNum,
		type: "GET",
		success: function(data){
			alert(JSON.stringify(data));
			if(data.schedule=='n'){
				//스케줄 생성하도록 창띄워주기
				//alert(data.projectNum);
				if(confirm('스케줄을 생성하시겠소?')){
					scheduleNum = createSchedule(data.projectNum);
				}else{
					//이전 화면으로 가기 
					window.history.back();
				}
				
			}else{
				//있으니까 가져온 scheduleNum으로 화면에 뿌려주기
				alert("있다고"+data.scheduleMainDTO);
				scheduleNum = data.scheduleMainDTO.scheduleNum;
				alert("ajax 성공시 scheduleNum(있을경우) = "+scheduleNum);
				
				var test = getPartList(scheduleNum);
				//alert("test data"+JSON.stringify(test)); //이것도 값이 들어오기전에 먼저 찍히는 무의미함..
			} 
		}
	});
}


function createSchedule(projectNum){
	var scheduleNum = 0;
	$.ajax({
		url: getContextPath()+"/schedule/create?projectNum="+projectNum,
		type: "GET",
		success:function(data){
			alert("여기엔 파트 입력 폼이 와야겠지요, 거기엔 물론 scheduleNum이 포함되어있고요 ");
			alert(data);
			$("#partsDiv").html(data);
			scheduleNum = $("#scheduleNum").val();// 뭐이런식으로 하고
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
				result = result + "<tr>";
				result = result + '<td class="schNum">'+ this.scheduleNum + "</td>";
				result = result + '<td class="partNum">'+ this.partNum + "</td>";
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
			partsJSONArray = data;
			//여기서 이 json을 사용하는 함수를 불러 주는게 좋겠다
			//return partsJSONArray; 
			//이렇게하면 비동기화 방식이 무의미 해지기 때문에 //데이터를 담은 후 그 데이터를 사용하기 위한것이기 때문에
			//동기화 방식 // 즉 데이터가 다 가져와져서 담길때까지 기다려야하기 때문이라는 말이다 
			//그냥 여기서 함수를 호출해버리는게 좋을수도 있겠다 
			alert("success안에 data "+JSON.stringify(partsJSONArray));
			//addEvents(partsJSONArray); // 달력 뿌려주고 이거 실행되면 되는것이지요 
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
		}
		
	});
	
}


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
			//alert(JSON.stringify(data));
			
			var result="<table>";
			$(data).each(function(){
				result = result + "<tr>";
				result = result + "<td> "+  " </td>";
				result = result + "<td> "+  " </td>";
				result = result + "<td> "+  " </td>";
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
            //description: partsJsonArray[i].description, 
            color:       'red',
            textColor:   'white',
            //url: 'https://www.github.com'
        }]);
        console.log('ok');
    } 
}




</script>



</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

		<section class="main_section jui">
		
		
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
		
		
		
		
		<!-- 스케줄 글보기 모달 -->
		<div id="modal" class="msgbox" style="display: none;">
			<div class="head">
				<span id="modal-title"></span>
		    </div>
			<div class="body">
				<span id="modal-contents"></span>
				클릭한 파트에 대해서 해당 파트에 대한 할일들과 그 할일들에 대한 사용자, 마감일, 첨부파일등을 뿌려주면 좋겠다
				<div style="text-align: center; margin-top: 45px;" id="contentsBtn">
				</div>
			</div>
		</div>
		
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
							여기는 DB에서 불러와야함 해당 스케줄에 참여하는 유저들
							<input type="radio" class="email" name="email" value="test1@test.com">사용자1
							<input type="radio" class="email" name="email" value="test2@test.com">사용자2
							<input type="radio" class="email" name="email" value="test3@test.com">사용자3
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
					<a href="#" id="writeNextBtn" class="btn btn-gray btn-small">등록후 새로운 일정추가</a>
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
				<!-- Schedule_View -->
					<div id="main_View" style="display: block;">
						<div class="group">
							<a class="left btn btn-mini btn-gray-black" id="sview-refresh"><span>새로고침</span>&nbsp;<i
								class="icon-refresh"></i></a> (날짜의 빈공간을 클릭하면 스케줄을 등록 할 수 있습니다.)
						</div>
						<div id='schcalendar'></div>
					</div>
					<!-- <div id='calendar'></div> -->
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
		
		
		
		
		
		
		
	</div>

	
	</section>
	
	



<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

</body>
</html>