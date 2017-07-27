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
.sidebar .sidebar-nav ul li .taba{
    border-radius: 2px;
    display: block;
    padding: 10px 15px;
    font-size: 14px;
    color: #999;
   /*  width: 100%; */
}

.tab>.current>.taba {
    background-color: #2099bb !important;
    color: #ffffff !important;
}

</style>

<script type="text/javascript">
	$(function() {
		
		var scheduleNum = '${scheduleNum}';
		
		loadTabContent("/flu/schedule/firstView?scheduleNum="+scheduleNum,'tab1');
		getPartList(scheduleNum);
		getUserList(scheduleNum);
		getUnitList(scheduleNum,-1,'','',''); //scheduleNum,partNum,email,unitState,kind
		
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
	
	
	
	
	
	/**
	 * DB에 저장된 part들의 list를 json 형태로 받고 partsJSONArray 에 저장해준다
	 */
	function getPartList(scheduleNum){
		
		var partsJSONArray = new Array();
		//var colors = ['red','yellow','orange','green','blue','lime','purple'];
		var colors = ['#ccccff','#b3b3ff','#9999ff','#8080ff','#6666ff','#4d4dff','#3333ff'];
		
		$.ajax({
			url: "/flu/schedule/partList?scheduleNum="+scheduleNum,
			type: "GET",
			async:false,
			success:function(data){ //json 넘어옴 

				partsJSONArray = data;
				for(var i=0;i<partsJSONArray.length;i++){
					partsJSONArray[i].color = colors[((i+1)%7)-1]; //7개설정해놔서그렇습니다
					partsJSONArray[i].textColor = 'white';
				}
				
				
				//아래 뿌려주는애
				var result="<table>";
				$(data).each(function(){
					
					result = result + '<tr class="onePartClick">';
					result = result + '<td class="schNum">'+ this.scheduleNum + "</td>";
					result = result + "<td> "+ this.partName + " </td>";
					result = result + "<td> "+ this.partStartDate + " </td>";
					result = result + "<td> "+ this.partFinishDate + " </td>";
					result = result + "<td class='partNum'> "+ this.partNum + " </td>";
					result = result + "<td> "+ this.partDescFileO + " </td>";
					result = result + "</tr>";
				});
				result = result + "</table>";
				$("#partsDiv").html(result); //아래화면에 뿌려주기
				
				
				
				
				
				//클라이언트가 unit 등록할때 
				var unitInsertParts = '';
				$(data).each(function(){
					unitInsertParts = unitInsertParts + '<input type="radio" class="partName" name="partName" value="'+this.partName+'" data-num="'+this.partNum+'">'+this.partName;
				});
				$("#parts").html(unitInsertParts);

				
		
				
			
				//return partsJSONArray; 
				//이렇게하면 비동기화 방식이 무의미 해지기 때문에 //데이터를 담은 후 그 데이터를 사용하기 위한것이기 때문에
				//동기화 방식 // 즉 데이터가 다 가져와져서 담길때까지 기다려야하기 때문이라는 말이다 
				//그냥 여기서 함수를 호출해버리는게 좋을수도 있겠다 
				
			}
		}); //success끝
		
		alert("ajax아래 함수안에 data "+JSON.stringify(partsJSONArray)); // 오류남
		return partsJSONArray;
		
		
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
					result = result + "<td  class='userEmail'>"+ this.email + "</td>";
					result = result + "<td> "+ this.kind + " </td>";
					result = result + "<td> "+ this.name+"("+this.nickName+")" + " </td>";
					result = result + "</tr>";				
				});
				result = result + "</table>";

				$("#usersDiv").html(result); //화면에 뿌려주기
				
				
				/* 
				var unitInsertUsers = '';
				$(data).each(function(){
					unitInsertUsers = unitInsertUsers + '<input type="radio" class="email" name="email" value="'+this.email+'">' + this.name + '(' + this.nickName + ')';			
				});
			//alert(unitInsertUsers);
				$("#users").html(unitInsertUsers);
				
				 */
				
			}
			
		});
		
	}


	//part별 보기로 클릭했을때 partnum을 주면된다
	function getUnitList(scheduleNum,partNum,email,unitState,kind){
	//alert("unit가져오기"+scheduleNum+partNum+email);
		
		$.ajax({
			url: "/flu/schedule/unitList",
			type: "POST",
			async:false,
			data: {
				scheduleNum:scheduleNum,
				partNum:partNum,
				email:email,
				unitState:unitState
			},
			success: function(data){
				
				
			//alert("unit들"+JSON.stringify(data));
	
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
						
						
						
					//secondView 를 위한것 
						var unitsResult="<table>";
						$(data).each(function(){
							unitsResult = unitsResult + "<tr>";
							unitsResult = unitsResult + "<td> "+ this.unitNum + " </td>";
							unitsResult = unitsResult + "<td> <span class='listModalUnit'>"+ this.unitName + "</span></td>";
							unitsResult = unitsResult + "<td> "+ this.unitFinishDate + " </td>";
							unitsResult = unitsResult + "<td> "+ this.email + " </td>";
							unitsResult = unitsResult + "<td> "+ this.unitState + " </td>";
							unitsResult = unitsResult + "</tr>";				
						});
						unitsResult = unitsResult + "</table>";
						$("#listModalContents").html(unitsResult); //달력 모달
					
						
					//thirdView 를 위한 것
					//뿌려논애를 사용해서 그려주는것..
					//값 들어왓을때만이니까 괜찮을거 같은데
					if(kind == "상태별"){
						makeUnitList(data,unitState); //카드뷰에 집어넣을겨
					}else if(kind == "파트별"){
						makeUnitList(data,partNum); //카드뷰에 집어넣을겨
					}else if(kind == "사용자별"){
						makeUnitList(data,email); //카드뷰에 집어넣을겨
					}else{
						
						alert("지금은 전체 내용이 아래에 있지");
						
					}
	

			
				
				}
		
			
		});
		
	} //getUnitList끝
	
	function makeUnitList(data,state){ //state에는 카드뷰의 제목이옵니다 //상태,파트,사용자 등
		
		var makeCard = "";
		makeCard = makeCard + '<div class="card">';
		makeCard = makeCard + '<div class="cardTitle_wrap">';
		makeCard = makeCard + '<span class="cardTitle">'+state+'</span></div>';
		makeCard = makeCard + '<div class="cardContent_wrap"><div class="cardContent">';
		$(data).each(function(){							
			makeCard = makeCard + '<div class="unit" data-unitNum='+this.unitNum+'>'+this.unitName+'</div>';						
		});
		makeCard = makeCard + '</div></div></div>';
		
		
		
		$(".cardContentWrap").append(makeCard);
		
		
		//카드 뷰 높이조정
		if($(".card").length <= 3){
			$(".cardContentWrap").css("height","320px");
		}else if($(".card").length > 3){
			$(".cardContentWrap").css("height","640px");
		}else if($(".card").length > 6){
			$(".cardContentWrap").css("height","960px");
		}

		
	} //makeUnitList 함수 끝
	
	
	
	
	/**
	 * 받아온 json을 사용해서 fullcal의 일정에 추가해준다 
	 */
	/* function addEvents(jsonObj){
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
	        console.log('달력이벤트 추가 ok');
	    } 
	} */


	
	
	
</script>

</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

<section class="main_section">


	<div id= "main_wrap">
	
	
	<div class="schedule_header">
		<div class="header_text">
			<p id="header_ttt" style="margin-bottom: 20px;">
				<span>[테스트 프로젝트] 스케줄 </span>
				<span>2017-08-01-2017-07-31</span>
				<input type="hidden" id="scheduleNum" value="${scheduleNum}">
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
						<li class="current"  data-tab="tab1"><span class="taba">개요</span></li>
						<li class="" data-tab="tab2"><span class="taba">달력보기</span></li>
						<li class=""  data-tab="tab3"><span class="taba">카드보기</span></li>
						<li class=""  data-tab="tab4"><span class="taba">일정/업무수정</span></li>
						<li class=""  data-tab="tab5"><span class="taba">###</span></li>
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
		
		
		
		<div class="clear"></div>


		<!-- ------------------- 값 넘어오는거 확인용----------------- -->
		<div class="testData" style="display:block">
		
			<div id="partsDiv"></div>
			<hr>
		
			<div id="unitsDiv"></div>
			<hr>
		
			<div id="clientDiv"></div>
			<hr>
		
			<div id="usersDiv"></div>
			<hr>

		

		</div>

	
		
		
		
</div> <!-- main_section 안에 가로정한칸 -->
	


</section>

<div class="clear"></div>
<c:import url="../temp/footer.jsp"></c:import>


</body>
</html>