<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">

.schedule_main_container {
    padding: 50px 25px;
    width: calc(100% - 50px);
    height: 100%;
    border-radius: 2px;
    border: 1px solid #e6e6e6;
    background: #fff;
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




/* ************ unitlist 보기 mordal************* */
#unitListModal {
    margin-top: 100px;
    width: 600px;
    max-height: 550px;
    background: white;
    border-radius: 3px;
}

#unitListModal .headWrap {
    width: 100%;
    height: 50px;
    background: #2099bb;
    
}

#unitListModal .head {
    /* margin: 0 auto; */
    padding: 10px 10px;
    line-height: 30px;
    margin-left: 20px;
    font-weight: bold;
    font-size: 20px;
    color: white;
}
.listModalContents{

}

.detail {
    width: calc(100% - 60px);
    margin: 0 30px;
    padding: 15px 0;
    font-weight: bold;
}


.closeBtn:HOVER{
	color: gray;
}




</style>


<!--  -->
<script type="text/javascript">
var unitListModal;


	$(function(){
		
		var scheduleNum = '${scheduleNum}';
		

		jui.ready([ "ui.modal" ], function(modal) {
			alert("모달 생성하기");
			unitListModal = modal("#unitListModal", {
		        color: "black",
		        target: "body",
		        opacity: 0.5
		    });
		});
		
		
		$(document).on("click",".closeBtn",function(data){
			unitListModal.hide(); 
		});
		
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
			editable: true,

		   eventClick: function(calEvent, jsEvent, view) {

		        alert('Event: ' + calEvent.title);
		        alert('desc: ' + calEvent.description);
		        //partClick(calEvent.description);
		        // alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY); // 화면 좌표인듯
		        alert('View: ' + view.name);

		        // change the border color just for fun
		        //$(this).css('background', 'orange');
		        
		        getUnitList(scheduleNum,calEvent.description,'','','');//눌린 파트에 대한 unit 들을 table로 뿌린다
		        unitListModal.show(); 
		        
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
				//writeModal.show(); 
				
		    }
		});
		
		var resultJson = getPartList(scheduleNum);
		addEvents(resultJson);
		
		
		
		$(document).on("click",".listModalUnit",function(){
			alert("unit 상세보기 modal로 바꿔주면 좋겟지요");
		});

		
		
		
		
		
		
		
		
		
	}); //function 끝
	
	
	/**
	 * 받아온 json을 사용해서 fullcal의 일정에 추가해준다 //파트만..
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
	        console.log('달력이벤트 추가 ok');
	    } 
	}

	
	
</script>

<div class="schedule_main_container jui">
		<div id='schcalendar'></div>
</div>

<!-- 파트 클릭했을때 unitList 뿌려주기 -->
<div id="unitListModal" class="msgbox" style="display: none;">
    <div class="headWrap">
    	<div class="head">
    		<div id="partName">DB구축이라던가</div>
    	</div>      
    </div>
    <div class="bodyWrap">
		<div id="listModalContents">
			
			
			<!-- 여기에 table 그리기 -->
			<table>
				<tr>
					<td><span class="listModalUnit">상세할일 제목쓰</span></td>
					<td>2017-08-14</td>
					<td>담당자</td>
					<td>상태</td>
				</tr>
			</table>
			
			
			
			
			
		</div>
        <div style="text-align: center; margin: 30px;">
            <!-- <a class="btn focus small">Save</a> -->
            <a class="closeBtn">Close</a>
        </div>
    </div>
</div>
	

