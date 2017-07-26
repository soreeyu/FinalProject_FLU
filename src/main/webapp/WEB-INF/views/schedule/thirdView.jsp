<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">


#thirdView_main_wrap{
	width: 1032px;
	height: auto;
	margin: 0 auto;
	background: gray;
}

.cardView_wrap{
	width: calc(100% - 20px);
	height: 100%;
	margin: 0 10px;
	background: yellow;
}



</style>

<script type="text/javascript">
	$(function(){
		var scheduleNum = '${scheduleNum}';
		getPartList(scheduleNum);
		getUserList(scheduleNum);
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
		function getUnitList(scheduleNum,partNum,email,unitState){
			alert("unit가져오기"+scheduleNum+partNum+email);
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




		
	});
</script>

<div id="thirdView_main_wrap">
	<div class="cardView_wrap">
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
</div>

