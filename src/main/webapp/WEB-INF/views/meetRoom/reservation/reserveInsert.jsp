<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../../temp/bootstrap.jsp"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type='text/javascript' src='../../resources/js/jquery.mousewheel.min.js'></script>
<script type="text/javascript" src="../../resources/js/scroll.js"></script>
<title>Insert title here</title>
<script>
    $.datepicker.setDefaults({
        dateFormat: 'yy/mm/dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        dayNames: ['SUN', 'MON', 'TUE', 'WED', 'THR', 'FRI', 'SAT'],
        dayNamesShort: ['SUN', 'MON', 'TUE', 'WED', 'THR', 'FRI', 'SAT'],
        dayNamesMin: ['SUN', 'MON', 'TUE', 'WED', 'THR', 'FRI', 'SAT'],
        showMonthAfterYear: true,
        
        yearSuffix: '.'
       	
    });

    $(function() {
        var check=0;
    	var index1=0;
    	var index2=0;
    	var name=$("#reserved_name").val();
    	var snum = '${map.each.snum}';
    	var reserve_date = "";
    	var num = '${map.each.num}';
        $("#datepicker").datepicker({
        	altField : "#day",
        	minDate :0,
        	maxDate :90,
        	onSelect : function(data){    							//해당 페이지의 방 이름;
        		$("#day").val(data);// 클릭한 날짜
        		accessTime(snum);
        		reserve_date = $("#day").val();
				load(reserve_date, num, snum, name);
        		/* 날짜 하나 클릭할 때 해당 날짜에 예약된 정보를 가져온다. */
        	}
        });
        		function load(reserve_date, num, snum, name) {
	        		$.post("reservedTime", {reserve_date : reserve_date, num : num, snum:snum, name:name}, function(data) {
	        			var count = data.reserve_count;
	        			var reserve_in = data.reserve_in;
	        			var reserve_out = data.reserve_out;
	        			var result = $(".time").attr("title");
	        			
	        			
						for(var i=0;i<count;i++){
	        				$(".time").each(function(index) {
	        					if(reserve_in[i]<=index && reserve_out[i]>=index){
		        					$(this).css("background-color", "gray");       					
	        					} 
						})
							
							
						}        			
	        			
	        			
	        			
					}); 
	        		//에이작스범위는 여기까지
					
				}
        
      
      
        
        /* 페이지 로딩 되면서 에이작스로 운영시간을 가져와서 뿌려준다. */
        reserve_date = $("#day").val();
        accessTime(snum);
        load(reserve_date, num, snum, name);
        function accessTime(snum) {
        	$("#reserve_time").html("");
		$.ajax({
			url : "accessTime",
			type: "POST",
			data :{
				snum:snum
				},
			success: function(data) {
				$("#reserve_time").html(data);
			}				
			
		});
			
		}
		
       
		/* 시간 뿌려주는 부분에서 가로 스크롤 스크립트  */
        $("#reserve_time").mouseenter(function() {
    		$(this).mousewheel(function(event, delta) {
    			this.scrollLeft -= (delta * 30);    
    		    event.preventDefault();
    		});    		
    	});     
        
    		$(this).each(function(index){
    			$("#reserve_time").on("click",".time", function() {
	    			if($(this).css("background-color")=='rgb(255, 255, 0)'){    				
    				if(check<2){
	    				check++;
	    				if(check==1){
	    					index1 = $(this).attr("title");			
	    					$(this).css("background-color", "red");	    					
	    				}
	    				else if(check==2) {
	    					index2 = $(this).attr("title");
	    					sel(index1,index2);
	    					$(this).css("background-color", "red");
	    				}
	    			}else {
	    				check=0;
	    				$(this).css("background-color", "yellow");
	    			}    			
	    			}
    			});	
	    	});
			
     	function sel(index1,index2){
    		$(".time").each(function(index){
    			if(index>=index1 && index<=index2){
    				alert("inex"+index);
    				$(this).css("background-color", "red");
    			}
    			if(index>=index2 && index<=index1){
    				alert("index"+index);
    				$(this).css("background-color", "red");
    			}			
    		});	  		
    		if(index1*1>index2*1){
    			alert("index1이 index2보다 큰 경우");
    			$("#in").val(index2);
    			$("#out").val(index1);
    		}else if(index1*1<index2*1) {
    			$("#in").val(index1);
    			$("#out").val(index2);
    		}else if(index1*1==index2*1){
    			$("#in").val(index1);
    			$("#out").val(index2+1);    			  			
    		}
    		
    	} 
     	
     	$("#reset_btn").click(function() {
    		accessTime(snum);
    		load(reserve_date, name, snum);
    	})
     	
    	$("#people").click(function() {
 			
    		if($("#in").val()=="" || $("#out").val()==""){
    			alert("시간과 날짜를 먼저 선택하세요.");
    			accessTime(snum);
	    		load(reserve_date, name, snum);
    		}else if($("#out").val()==""){
				alert("최소 예약 시간은 2시간 입니다.");
				accessTime(snum);
	    		load(reserve_date, name, snum);
			} 
    		
		});
     	
    	$("#people").change(function() {
    		var max = $(this).attr("max");
    		if($(this).val()>max){
    			$(this).html(max);
    			$(this).val(max);
    		}
			var price = $("#price").val();
			var time = (($("#out").val()*1)+1)-($("#in").val()*1);
			if(time!=1){
			var final_price = ($(this).val()*1)*(price*1)*(time*1);
			$("#rprice").val(final_price);
			$(".final_price").html(final_price);				
			}else {
				alert("날짜와 시간을 먼저 선택해주세요.");
				$(this).val("");
			}
		});
    	
    	$("#reserve_btn").click(function() {
    		var reserve_Info = document.getElementsByClassName("reserve_Info");
    		var totalPrice = $("#rprice").val();
    		
    		if(reserve_Info[0].value==""){
    			alert("인원을 정해주세요.");
    		}else if(reserve_Info[1].value==""){
    			alert("예약자 이름을 입력 해주세요.");
    		}else if(reserve_Info[2].value==""){
    			alert("연락처를 입력 해주세요.");
    		}else if(reserve_Info[3].value==""){
    			alert("이메일을 입력 해주세요");
    		}else if(reserve_Info[4].value==""){
    			alert("날짜를 선택하세요");
    		}else if(reserve_Info[5].value==""){
    			alert("입실 시간을 정해주세요");
    		}else if(reserve_Info[6].value==""){
    			alert("퇴실 시간을 정해주세요");
    		}else if(totalPrice==null){
    			alert("정보를 다시 입력해주세요");
    		}else { 
	    		$("#frm").submit();    			
    		}   		
		});
    });
</script>
<style type="text/css">
section {
	min-width : 1152px;
	width : 60%;
	height: 2000px;
	margin : 0 auto;
}

#datepicker{
margin-top: 45px;

}
.ui-datepicker{
font-size: 2em;
width:90%;
height : 380px;
background-color : white;
border:0px solid #555;
color:#333;
margin: 0 auto;
}

div.ui-datepicker-header{
font-size: 2em;
text-align:center;
background:#ddebf7;
border:0px;
color:#708af8;
font-size:14px;
}
.ui-datepicker .ui-datepicker-title {
    margin: 0 2.3em;
    line-height: 1.8em;
    text-align: center;
    font-size : 2.0em;
    height: 50px;;
}
.ui-datepicker-calendar > thead th {
	color: #949494;
	font-size: 16px;
}
.ui-datepicker-calendar > tbody td a{
	text-align: center;
}
.ui-datepicker-calendar > tbody td:first-child a { 
    COLOR: red; 
}

.ui-datepicker-calendar > tbody td:last-child a { 
    COLOR: green; 
}
#reserve_time {
	width : 100%;
	overflow: hidden;
	background-color: #fff;
    border-bottom: 1px solid #ebebeb;
}
/* 달력이랑 시간 부분 css  */

/* 바디부분 */
.heading {
	display: table;
    position: relative;
    width: 100%;
    padding-bottom: 15px;
    padding-top: 2px;
    border-bottom: 3px solid #704de4;
}
.reserve_space{
	display: table-cell;
    font-size: 18px;
    line-height: 18px;
}
.option{
	position: absolute;
	font-size: 18px;
    line-height: 20px;
   	right: 0;
   	color: #704de4;
   	display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap
}
.price_tit {
	font-size: 18px;
	color: #6d3afb;
}
.tit_unit {
	font-size:12px;
	color: #949494;
	vertical-align: top;
	top : 3px;
}
.contents_box{
	padding: 100px 0 0 0;
	width: 1152px;
	margin: 0 auto;
	display: inline-block;
}
.detail_form{
	position: relative;
    padding-right: 395px;
}
.eachRoom_info {
	padding: 30px 30px 39px;
    background-color: #fff;
    border-bottom: 1px solid #ebebeb;
}
.info_photo{
    position: relative;
    padding: 0 0 30px 170px;
    min-height: 170px;
    font-size: 16px;
    line-height: 22px;
    vertical-align: top;
}
.me_name{
	padding-bottom: 20px;
    margin-bottom: 20px;
    border-bottom: 1px solid #ebebeb;
    font-size: 24px;
    display: block;
}
.img {
    width: 140px;
    height: 140px;
    position: absolute;
    left :0;
    top: 0;
    
}
.img img {
	width: 100%;
    height: 100%;
}
.list_detail{
	border-bottom: 1px solid #ebebeb;
	list-style: none;
}
.list_detail li {
    position: relative;
    padding: 17px 0 15px 104px;
    font-size: 16px;
    border-top: 1px solid #ebebeb;
}
.list_detail li:before {
    content: '';
    position: absolute;
    left: 0;
    background-color: #656565;
    top: 50%;
    width: 4px;
    height: 4px;
    margin-top: -2px;
}
.list_detail li .tit {
    color: #656565;
    left: 15px;
    margin-right: 18px;
    position: absolute;
}
.list_detail li .data {
	vertical-align: top;
}
#Layer1 {
	position : relative;
	width : 380px;
	height : 430px;
	float: right;
	z-index: 1;
	left: 0;
	top: 170;
	background-color: "white";
}
.scroll_box{
	background-color: #fff;
	position: relative;
}
.reservation_Info{
	padding: 0 20px 0;
	margin-top: 20px;
}
.reservation_Info input{
	line-height : 50px;
	width: 100%;
	margin-left: 40px;
    margin-bottom: 20px;
}
.reserve_detail_info{
	margin-bottom: 20px;
}
.total_price{
	padding: 0 20px 0;
	margin-top: 30px;
	font-weight: bold;
}
.timeCss{
	width: 86px;
    padding: 20px 0 30px;
}
.timeNum {
	top: -34px;
    left: -10px;
    width: 20px;
}
</style>
</head>
<body onload="flevInitPersistentLayer('Layer1',0,'0','','','0','','',10)">
	<c:import url="../../temp/header.jsp"/>
	<section>
	<div class="contents_box">
	<form action="reserveInsert" method="post" id="frm" name="frm_check">
		<div id="Layer1" class="scroll_box">
		<div class="heading">
		<h3 class="reserve_space">예약정보 입력</h3>		
		</div>
		<div class="reservation_Info">
		<table>
			<tr>
				<td class="reserve_detail_info">인원</td>
				<td class="reserve_detail_info"><input type="number" name="human" id="people" class="reserve_Info" min="0" max="${map.each.human}" placeholder="*최대 수용 인원 : ${map.each.human}">   </td>
			</tr>
			<tr>
				<td class="reserve_detail_info">예약자</td>
				<td class="reserve_detail_info"><input type="text" name="reserve_name" class="reserve_Info"></td>
			</tr>
			<tr>
				<td class="reserve_detail_info">연락처</td>
				<td class="reserve_detail_info"> <input type="text" name="phone" class="reserve_Info" value="${member.phone}"> </td>
			</tr>
			<tr>
				<td class="reserve_detail_info">이메일</td>
				<td class="reserve_detail_info"> <input type="text" name="email" class="reserve_Info" value="${member.email}"> </td>
			</tr>
		</table>
		  		
		</div>
		<div class="total_price">금액 : <span class="final_price"></span></div>
		<input type="button" value="예약하기" id="reserve_btn" style="margin-top: 45px; width: 100%;">	
		</div>
	<div class="detail_form">
	<c:forEach items="${map.reserved}" var="r">
	<input type="hidden" id="reserved_name" value="${r.name}">
	</c:forEach>
	<input type="hidden" id="num" value="${map.each.num}">
	<input type="hidden" name="name" value="${map.each.name}" id="name">
	<input type="hidden" name="reserve_date" id="day" class="reserve_Info"> 
	<input type="hidden" name="price" id="rprice">
	<input type="hidden" name="snum" value="${map.each.snum}">
	
	<div class="heading">
	<h3 class="reserve_space">예약공간</h3>
	<span class="option">
	<strong class="price_tit">
	\ ${map.each.price}
	</strong>
	<em class="tit_unit">
	/시간(인)
	</em>
	</span>
	</div>
	<div class="eachRoom_info">
	<input type="hidden" id="price" value="${map.each.price}">
	<div class="info_photo">
	<h4 class="me_name">${map.meetroom.name}, ${map.each.name} (${map.each.human}인실)</h4>
	<span class="img">
		<img alt="" src="${pageContext.request.contextPath}/resources/upload/${map.each.fname}">
	</span>	
	<p>
		${map.each.contents}
	</p>
	</div>
	<ul class="list_detail">
		<li>
			<span class="tit">공간유형</span>
			<span class="data">${map.each.type}</span>
		</li>
		<li>
			<span class="tit">운영시간</span>
			<span class="data">${map.each.time}</span>
		</li>
		<li>
			<span class="tit">편의시설</span>
			<span class="data">${map.each.convenience}</span>			
		</li>
		
	</ul>
	</div>
	
	<div id="datepicker" >
	
	</div>
	<div class="heading">
		<h3>시간 선택(예약가능시간)</h3>
	</div>
	<div id="reserve_time">
	
	
	</div>

	<div id="timeresult">
		<input type="hidden" name="time" id="in" class="reserve_Info">
		<input type="hidden" name="time" id="out" class="reserve_Info">
		<input type="button" id="reset_btn" value="RESET" style="margin-top: 20px;">
		</div>
	<div class="color_desc" style="margin-top: 45px;">
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/예약불가.png">
		<span class="color_disable">예약불가</span>
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/예약가능.png">
		<span class="color_today">예약가능</span>
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/선택.png">
		<span class="color_select">선택</span>
	</div>
	
	

	<!-- DB에 들어갈 내용은 아니고 업체의 간단한 정보확인용 뷰  -->
	
	<!-- 예약 주의사항 및 환불 규정 뷰-->
	 <div class="heading">
		<h3>예약시 주의사항</h3>
	</div>
	<div class="list_wrap">
		<ol class="notice_list">
			<li><span class="num">1</span> 예약은 정각 단위로만 가능합니다.</li>
			<li><span class="num">2</span> 이용 최대 시간은 3시간입니다.</li>
			<li><span class="num">3</span> 조기퇴실 할 경우에도 예약시간 기준으로 요금이 부과됩니다. (연장 시 추가 요금 부과)</li>
			<li><span class="num">4</span> 당일 예약을 원하시는 분은 카톡 및 전화주시면 이용가능하신 룸이 있는지 확인 가능하십니다.</li>
			<li><span class="num">5</span> 중복 예약으로 인해 부득이하게 취소되어야 할 경우 바로연락드리며&#44; 100% 환불해 드립니다. (저녁 9시 이후 결제 시 중복 예약이 확인 될 경우 다음날 아침에연락드립니다.)</li>
		</ol>
	</div>
		
		
		
	</div>		
	</form>
	</div>
	</section>
	<c:import url="../../temp/footer.jsp"/> 
</body>
</html>