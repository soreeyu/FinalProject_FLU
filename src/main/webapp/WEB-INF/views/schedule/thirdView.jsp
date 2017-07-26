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

.cardView_wrap{
	padding-bottom: 100px;
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
    color: gray;
}

#cardKind ul li:HOVER{
	color: black;
}

.cardContents{
	
	width: 100%;
	height: auto;
	padding: 20px 0;
	/* background: red; */
}

.cardContentWrap {
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
   /*  background: blue; */
    background : #dedede;
    line-height: 30px;
    margin-bottom: 5px;
    border-radius: 2px;
    text-align: center;
   
}

.cardTitle {
    margin-left: 20px;
    color: white;
    font-weight: bold;
}

.cardContent_wrap{
	height: calc(100% - 35px);
	/* background: orange; */
	overflow: auto;
}

.cardContent{
	padding: 10px 10px;
}

.unit{
	/* background: cyan; */
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


/* ************ unit정보 보기 mordal************* */
#unitViewModal {
    margin-top: 100px;
    width: 400px;
    max-height: 550px;
    background: white;
    border-radius: 3px;
}

#unitViewModal .headWrap {
    width: 100%;
    height: 50px;
    background: #2099bb;
    
}

#unitViewModal .head {
    /* margin: 0 auto; */
    padding: 10px 10px;
    line-height: 30px;
    margin-left: 20px;
    font-weight: bold;
    font-size: 20px;
    color: white;
}

#unitViewModal .bodyWrap{
	/* background: red; */
}

.detail {
    width: calc(100% - 60px);
    margin: 0 30px;
    padding: 15px 0;
    font-weight: bold;
}

#unitDuration{
	text-align: center;
}

#unitDescribe {
    width: calc(100% - 100px);
    max-height: 180px;
    overflow: auto;
    margin-bottom: 10px;
    margin-top: 15px;
    padding: 20px;
    line-height: 21px;
    background: ghostwhite;
}

.closeBtn:HOVER{
	color: gray;
}


</style>

<script type="text/javascript">
	$(function(){

		
		var scheduleNum = '${scheduleNum}';
		getPartList(scheduleNum);
		getUserList(scheduleNum);
		
		
		$(".cardContentWrap").html("");
		getUnitList(scheduleNum,-1,'','할일',"상태별");// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','진행중',"상태별");// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','완료',"상태별");// -1 이면 전체가 나온다 
		

		
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
						result = result + "<td class='partNum'> "+ this.partNum + " </td>";
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
						result = result + "<td class='users'> "+ this.email + " </td>";
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
						
						
						if(kind == "상태별"){
							makeUnitList(data,unitState); //카드뷰에 집어넣을겨
						}else if(kind == "파트별"){
							makeUnitList(data,partNum); //카드뷰에 집어넣을겨
						}else if(kind == "사용자별"){
							makeUnitList(data,email); //카드뷰에 집어넣을겨
						}
		

				
					
					}
			
				
			});
			
		} //getUnitList끝
		
		function makeUnitList(data,state){ //state에는 카드뷰의 제목이옵니다
			
			/* 
			var result="";
			$(data).each(function(){
				result = result + "<div class='unit' data-unitnum='"+this.unitNum+"'>"+this.unitName+"</div>";
			});
			 */
			 
			
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
			
			if($(".card").length <= 3){
				$(".cardContentWrap").css("height","320px");
			}else if($(".card").length > 3){
				$(".cardContentWrap").css("height","640px");
			}else if($(".card").length > 6){
				$(".cardContentWrap").css("height","960px");
			}
	
		}
		
		var unitModal;
		jui.ready([ "ui.modal" ], function(modal) {
		    //$("#unitViewModal").appendTo("#thirdView_main_wrap");

		    unitModal = modal("#unitViewModal", {
		        color: "black",
		        target: "body",
		        opacity: 0.5
		    });
		});
		
		
		
		$(document).on("click",".unit",function(index){
			alert("unit클릭"+$(this).attr("data-unitnum"));
			alert("unit 클릭 스케줄 넘"+$("#scheduleNum").val());
			
			var unitNum = $(this).attr("data-unitnum");
			var scheduleNum = $("#scheduleNum").val();
			 $.ajax({
				url: "/flu/schedule/unitOne",
				type: "POST",
				data: {
					unitNum : unitNum,
					scheduleNum : scheduleNum	
				},
				success: function(data){
					alert(JSON.stringify(data));
					var finishdate = new Date( data.unitFinishDate );
					var startdate  = new Date( data.unitStartDate );

				    var year1  = startdate.getFullYear();
				    var month1 = startdate.getMonth() + 1;
				    var day1   = startdate.getDate();
				    var year2  = finishdate.getFullYear();
				    var month2 = finishdate.getMonth() + 1;
				    var day2   = finishdate.getDate();

				      
				    $("#unitName").html(data.unitName);
					$("#unitDuration").html(year1+"-"+month1+"-"+day1+" ~ "+year2+"-"+month2+"-"+day2);
					$("#unitDescribe").html(data.unitDescribe);
					$("#unitPart").html(data.partNum);
					$("#unitEmail").html(data.email);
					unitModal.show(); 
				}
			});
			
		}); //unit 클릭이벤트
		
		
		$(document).on("click",".closeBtn",function(data){
			unitModal.hide(); 
		});
		
		
		
		//nav 클릭
		$("#cardKind ul li").click(function(){
			alert($(this).text());
			
			$(".cardContentWrap").html("");
			
			if($(this).text() == "상태별"){
				getUnitList(scheduleNum,-1,'','할일',"상태별");// -1 이면 전체가 나온다 
				getUnitList(scheduleNum,-1,'','진행중',"상태별");// -1 이면 전체가 나온다 
				getUnitList(scheduleNum,-1,'','완료',"상태별");// -1 이면 전체가 나온다 
			}else if($(this).text() == "파트별"){
					
				$(".partNum").each(function(){
					var partNum = $(this).text();
					getUnitList(scheduleNum,partNum,'','',"파트별"); //파트갯수만큼 반복문
				});
				
					
			}else if($(this).text() == "사용자별"){
				$(".users").each(function(){
					var user = $(this).text();
					//getUnitList(scheduleNum,-1,user,'',"사용자별"); //사용자수만큼 반복문
					getUnitList(scheduleNum,-1,'myeon','',"사용자별");
				});
				
				
			}
			
			
		});

		

	});
</script>

<div id="thirdView_main_wrap">
	<div class="cardView_wrap">
		<div id="cardKind">
			<ul>
				<li>상태별</li>
				<li>파트별</li>
				<li>사용자별</li>
			</ul>
		</div>
		
		<div class="cardContents">
			
			<div class="cardContentWrap">
			
				<div class="card">
				
					<div class="cardTitle_wrap">
						<span class="cardTitle">상태/파트명/사용자</span>
					</div>
					<div class="cardContent_wrap">
						<div class="cardContent">						
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
<div class="testData" style="display:block">
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


<div id="unitViewModal" class="msgbox" style="display: none;">
    <div class="headWrap">
    	<div class="head">
    		<div id="unitName">이것은 내가 할일이겟죠 unitname</div>
    	</div>      
    </div>
    <div class="bodyWrap">
		<div id="modalContents">
			<div id="unitDuration" class="detail">2017-07-18 ~ 2017-09-17</div>
			<div id="unitDescribe" class="detail">
				할일은 이런일이고 그리고 저런일이예요 그런다음 그런일이 겠지요 ? 그리고 그래서요 그랬어요 크흠
				할일은 이런일이고 그리고 저런일이예요 그런다음 그런일이 겠지요 ? 그리고 그래서요 그랬어요 크흠
				할일은 이런일이고 그리고 저런일이예요 그런다음 그런일이 겠지요 ? 그리고 그래서요 그랬어요 크흠
			</div>
			<div id="whatPart" class="detail">
				<div id="">파트</div> <div id="unitPart">partnum</div>
			</div>
			<div id="whoEmail" class="detail">			
				<div id="">담당자</div> <div id="unitEmail">test@test.com</div>
			</div>
		</div>
        <div style="text-align: center; margin: 30px;">
            <!-- <a class="btn focus small">Save</a> -->
            <a class="closeBtn">Close</a>
        </div>
    </div>
</div>



