<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
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
		
		
		var unitModal;
		
		jui.ready([ "ui.modal" ], function(modal) {
		    unitModal = modal("#unitViewModal", {
		        color: "black",
		        target: "body",
		        opacity: 0.5
		    });
		});
		
		

		
		var scheduleNum = '${scheduleNum}';
		
		$(".cardContentWrap").html(""); //일단 비우기
		//상태별로 초기화
		getUnitList(scheduleNum,-1,'','할일',"상태별");// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','진행중',"상태별");// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','완료',"상태별");// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','마감일지남',"상태별");// -1 이면 전체가 나온다 
		getUnitList(scheduleNum,-1,'','',''); //전체뷰 볼거

		
		
		$(document).on("click",".unit",function(index){
			alert("unit클릭"+$(this).attr("data-unitnum"));
			alert("unit 클릭 스케줄 넘"+$("#scheduleNum").val());
			
			var unitNum = $(this).attr("data-unitnum");
			
			if(unitNum == -1){
				alert("추가해야징");
			}else{
				var scheduleNum = $("#scheduleNum").val();
				 $.ajax({
					url: "/flu/schedule/unitOne",
					type: "POST",
					data: {
						unitNum : unitNum,
						scheduleNum : scheduleNum	
					},
					success: function(data){
						//모달 내용 채워주기
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
			}
			
		}); //unit 클릭이벤트
		
		
		
		$(document).on("click",".closeBtn",function(data){
			unitModal.hide(); 
		});
		
		
		
		
		//nav 클릭
		$("#cardKind ul li").click(function(){
			//alert($(this).text());
			
			$(".cardContentWrap").html("");
			
			if($(this).text() == "상태별"){
				
				getUnitList(scheduleNum,-1,'','할일',"상태별");// -1 이면 전체가 나온다 
				getUnitList(scheduleNum,-1,'','진행중',"상태별");// -1 이면 전체가 나온다 
				getUnitList(scheduleNum,-1,'','완료',"상태별");// -1 이면 전체가 나온다 
				getUnitList(scheduleNum,-1,'','마감일지남',"상태별");// -1 이면 전체가 나온다
			
			}else if($(this).text() == "파트별"){
					
				//뿌려논만큼 반복해야지요
				$(".partNum").each(function(){
					var partNum = $(this).text();
					getUnitList(scheduleNum,partNum,'','',"파트별"); //파트갯수만큼 반복문
				});
				
					
			}else if($(this).text() == "사용자별"){
				//alert("안나오노1");
				
				//뿌려진만큼 반복
				$(".userEmail").each(function(){
					var userEmail = $(this).text();
					//alert("안나오노2"+userEmail);
					userEmail = userEmail.trim();
					getUnitList(scheduleNum,-1,userEmail,'',"사용자별"); //파트갯수만큼 반복문
				});
				
			}
			
			
			//데이터 없을 경우
			if($(".card").length == 0){
				var makeCard = "";
				makeCard = makeCard + '<div class="card">';
				makeCard = makeCard + '<div class="cardTitle_wrap">';
				makeCard = makeCard + '<span class="cardTitle">'+$(this).text()+'</span></div>';
				makeCard = makeCard + '<div class="cardContent_wrap"><div class="cardContent">';				
				makeCard = makeCard + '<div class="unit" data-unitNum=-1>'+'추가하기'+'</div>';						
				makeCard = makeCard + '</div></div></div>';
				
				$(".cardContentWrap").append(makeCard);
			}
			
			
			getUnitList(scheduleNum,-1,'','',''); //전체뷰 볼거
			
		}); //card view nav 클릭이벤트 끝

		

	}); //function끝
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



