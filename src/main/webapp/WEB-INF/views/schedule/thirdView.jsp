<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/modal/modalWindow.css">
<script src="${pageContext.request.contextPath}/resources/schedule/modal/modalWindow.js"></script> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/jui/jui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/jui/jui.min.js"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/jui/jui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/jui/jui.js"/> --%>


  
<style type="text/css">
.clear{
	clear:both;
}

div{
	display: block;
}

#thirdView_main_wrap {
    /* width: 1002px;
    height: auto;
    margin: 0 auto; */
    background: white;
    border: 1px solid #dedede;

}


#cardKind {
    width: calc(100% - 20px);
    height: 40px;
    margin: 0 10px;
    border-bottom: 1px dashed #dedede;
    /* background: yellow; */
}

#cardKind ul li {
    float: left;
    line-height: 40px;
    margin-left: 20px;
    font-size: 13px;
}

.cardContents{
	
	width: 100%;
	height: auto;
	padding: 20px 0;
	/* background: red; */
}

.partContent {
    width: 816px;
    height: 320px;
    margin: 0 auto;
    /* background: green; */
}

.card {
    width: 250px;
    height: 300px;
    float: left;
    margin-top: 20px;
    margin-right: 20px;
    /* background: orange; */
    border: 1px solid #dedede;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
}

/* .card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
} */

.cardTitle_wrap {
    height: 30px;
    background: blue;
    line-height: 30px;
    margin-bottom: 5px;
    border-radius: 2px;
   
}

.cardTitle {
    margin-left: 20px;
    color: white;
}

.cardContent{
	height: calc(100% - 35px);
	background: orange;
	overflow: auto;
}

.cardContent_inner{
	padding: 10px 10px;
}

.unit{
	background: cyan;
	width: inherit;
	height: 30px;
	line-height: 30px;
	margin-bottom: 10px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 5px;
    border-radius: 2px;
}

.unit:hover {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}


#modal{
	background: white;
}


</style>

<script type="text/javascript">
	$(function(){

		
		var scheduleNum = '${scheduleNum}';
		getPartList(scheduleNum);
		getUserList(scheduleNum);
		
		getUnitList(scheduleNum,-1,'','할일');// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','진행중');// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','완료');// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','');// -1 이면 전체가 나온다 

		
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
				//alert("success안에 data "+JSON.stringify(partsJSONArray));
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
					
					
					
					var unitInsertUsers = '';
					$(data).each(function(){
						unitInsertUsers = unitInsertUsers + '<input type="radio" class="email" name="email" value="'+this.email+'">' + this.name + '(' + this.nickName + ')';			
					});
				//alert(unitInsertUsers);
					$("#users").html(unitInsertUsers);
					
					
					
				}
				
			});
			
		}


		//part별 보기로 클릭했을때 partnum을 주면된다
		function getUnitList(scheduleNum,partNum,email,unitState){
		//alert("unit가져오기"+scheduleNum+partNum+email);
			$.ajax({
				url: "/flu/schedule/unitList",
				type: "POST",
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
				
				
					
				makeUnitList(data,unitState); //카드뷰에 집어넣을겨

				}
				
			});
			
		} //getUnitList끝
		
		function makeUnitList(data,state){
			
			var result="";
			$(data).each(function(){
				result = result + "<div class='unit' data-unitnum='"+this.unitNum+"'>"+this.unitName+"</div>";
			});

			
			if(state == '할일'){
				$("#willUnits").html(result);		
			}else if(state == '진행중'){
				$("#ingUnits").html(result);
			}else if(state == '완료'){
				$("#finUnits").html(result);
			}else{
				alert("그 어떤 상태도 아니요");
			}
			
		}
		
		
		
		$(document).on("click",".unit",function(index){
			alert("unit클릭"+$(this).attr("data-unitnum"));
			
			//var modal = new ModalWindow("",true).show();

			jui.ready([ "ui.modal" ], function(modal) {
			    $("#modal").appendTo("body");

			    modal_1 = modal("#modal_1", {
			        color: "orange"
			    });
			});
			
			modal_1.show(); 
			
			//#("#modal").modal();
			// $("#myModal").modal();
		});

		

	});
</script>

<div id="thirdView_main_wrap">
	<div class="cardView_wrap">
		<div id="cardKind">
			<ul>
				<li>파트별</li>
				<li>상태별</li>
				<li>사용자별</li>
			</ul>
		</div>
		
		<div class="cardContents">
			
			
			
			<div class="partContent">
				<div class="card" id="card1">
					<div class="cardTitle_wrap">
						<span class="cardTitle">할일</span>
					</div>
					<div class="cardContent">
						<div id="willUnits" class="cardContent_inner">
							
							<div class="unit">어쩌고저쩌고랄라라</div>
							<div class="unit">어쩌고저쩌고랄라라</div>
							<div class="unit">어쩌고저쩌고랄라라</div>

						</div>
					</div>
				</div>
				<div class="card" id="card2">
					<div class="cardTitle_wrap">
						<span class="cardTitle">진행중</span>
					</div>
					<div class="cardContent">
						<div id="ingUnits" class="cardContent_inner">
							
							<div class="unit">어쩌고저쩌고랄라라</div>
							<div class="unit">어쩌고저쩌고랄라라</div>
							<div class="unit">어쩌고저쩌고랄라라</div>

						</div>
					</div>
				</div>
				<div class="card" id="card3">
					<div class="cardTitle_wrap">
						<span class="cardTitle">완료</span>
					</div>
					<div class="cardContent">
						<div id="finUnits" class="cardContent_inner">

							<div class="unit">어쩌고저쩌고랄라라</div>
							<div class="unit">어쩌고저쩌고랄라라</div>
							<div class="unit">어쩌고저쩌고랄라라</div>

						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
		</div>
		
</div>
<!-- cardView_wrap 끝 -->


</div>


<div class="clear"></div>


<!-- 값 넘어오는거 확인용 -->
<div class="testData" style="display:none">
	이곳에 스케줄넘,해당 스케줄에 대한 파트/클라이언트/사용자, 현재 로그인된 세션 이 필요함

	<div id="partsDiv"></div>
	<hr>

	<div id="unitsDiv"></div>
	<hr>

	<div id="clientDiv"></div>
	<hr>

	<div id="usersDiv"></div>
	<hr>



</div>


<div id="modal" class="msgbox" style="display: none;">
    <div class="head">
        Title
    </div>
    <div class="body">
        Contents...<br/>

        <div style="text-align: center; margin-top: 45px;">
            <a class="btn focus small">Save</a>
            <a class="btn small">Close</a>
        </div>
    </div>
</div>

 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
