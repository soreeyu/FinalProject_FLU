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
    	var snum = '${each.snum}';
    	
        $("#datepicker").datepicker({
        	altField : "#day",
        	
        	onSelect : function(data){    							//해당 페이지의 방 이름;
        		$("#day").val(data);// 클릭한 날짜
        		var reserve_date = $("#day").val();

        		$.post("reservedTime", {reserve_date : reserve_date, name : name, snum:snum}, function(data) {
        			$("#reserve_time").html(data);
				}); 
        		//에이작스범위는 여기까지
        	}
        });
        var reserve_date = $("#day").val();
		$.ajax({
			url : "reservedTime",
			type: "POST",
			data :{
				reserve_date : reserve_date,
				name : name,
				snum:snum
				},
			success: function(data) {
				
				$("#reserve_time").html(data);
			}				
			
		});
       
		/* 시간 뿌려주는 부분에서 가로 스크롤 스크립트  */
        $("#reserve_time").mouseenter(function() {
    		$(this).mousewheel(function(event, delta) {
    			this.scrollLeft -= (delta * 30);    
    		    event.preventDefault();
    		});    		
    	});     
        
    		$(this).each(function(index){
    			$("#reserve_time").on("click",".time", function() {
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
    			});	
	    	});
			
     	function sel(index1,index2){
     		alert("index1="+index1+","+"index2="+index2);
    		$(".time").each(function(index){
    			alert(index);
    			if(index>=index1 && index<=index2){
    				alert("아이디"+$(this).attr("id"));
    				$(this).css("background-color", "red");
    			}else if(index>=index2 && index<=index1){
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
    			alert("오픈시간과 마감시간을 확인하세요");
    			$(this).css("background-color", "yellow");  			
    		}
    	} 
     	
     	$("#reset_btn").click(function(index) {
    		var tin = $("#in").val()*1;
    		var tout = $("#out").val()*1;
    		
    		if(tin!="" && tout!=""){
    			alert("시간을 다시 설정합니다.");
    			$(".time").css("background-color", "yellow");
    			check=0;
    			$("#in").val("");
    			$("#out").val("");
    		}else if(topen=="" || tclose ==""){
    			alert("오픈 시간과 마감시간을 입력해주세요");
    		}
    	})
     	
    	$("#people").blur(function() {
			var price = $("#price").val();
			var final_price = ($(this).val()*1)*(price*1);
			$("#rprice").val(final_price);
			$(".final_price").append(final_price);
		});
    	
    	$("#reserve_btn").click(function() {
    		var reserve_Info = document.getElementsByClassName("reserve_Info");
    		if(reserve_Info[0].value==""){
    			alert("날짜를 선택하세요");
    		}else if(reserve_Info[1].value==""){
    			alert("입실 시간을 정해주세요");
    		}else if(reserve_Info[2].value==""){
    			alert("퇴실 시간을 정해주세요");
    		}else if(reserve_Info[3].value==""){
    			alert("인원을 정해주세요.");
    		}else if(reserve_Info[4].value==""){
    			alert("예약자 이름을 입력 해주세요.");
    		}else if(reserve_Info[5].value==""){
    			alert("연락처를 입력 해주세요.");
    		}else if(reserve_Info[6].value==""){
    			alert("이메일을 입력 해주세요");
    		}else { 
	    		$("#frm").submit();    			
    		}   		
		});
    });
</script>
<style type="text/css">
section {
	min-width : 1152px;
	width : 70%;
	margin : 0 auto;
}
.ui-datepicker{
font-size: 2em;
width:270px;
background-color : white;
border:0px solid #555;
color:#333;
}

div.ui-datepicker-header{
font-size: 2em;
margin-top:5px;
text-align:center;
background:#ddebf7;
border:0px;
color:#708af8;
font-size:14px;
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
}
</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"/>
	<section>
	<h1>예약</h1>
	<form action="reserveInsert" method="post" id="frm" name="frm_check">
	<c:forEach items="${reserved}" var="r">
	<input type="hidden" id="reserved_name" value="${r.name}">
	</c:forEach>
	<input type="hidden" name="name" value="${each.name}" id="name">
	<input type="hidden" name="reserve_date" id="day" class="reserve_Info"> 
	<input type="hidden" name="price" id="rprice">
	<input type="hidden" name="snum" value="${each.snum}">
		<div>
	<h2>세부공간</h2>
	<div>${each.price}/시간(인)</div>
	<input type="hidden" id="price" value="${each.price}">
		유형 : ${each.type}
		예약시간 : ${each.time}
		인원 : ${each.human}
		편의 시설
		<div>
			${each.convenience}
		</div>
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
		<input type="button" id="reset_btn" value="RESET">
		</div>
	<div class="color_desc">
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/예약불가.png">
		<span class="color_disable">예약불가</span>
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/예약가능.png">
		<span class="color_today">예약가능</span>
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/선택.png">
		<span class="color_select">선택</span>
	</div>
	
	<p>인원 선택 <input type="number" name="human" id="people"class="reserve_Info" min="0"> </p>
	
	<!--세션에서 예약자 정보 가져오기  -->
	<p>예약자 : <input type="text" name="reserve_name" class="reserve_Info"> </p>
	<p>연락처 : <input type="text" name="phone" class="reserve_Info"> </p>
	<p>이메일 : <input type="text" name="email" class="reserve_Info"> </p>

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
		<div class="heading">
			<h3>환불규정 안내</h3>
		</div>
		<div class="list_wrap">
			<dl class="flex_box refund">
				<dt class="flex tit">이용 8일 전</dt>
				<dd class="flex">총 금액의 100% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 7일 전</dt>
				<dd class="flex">총 금액의 100% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 6일 전</dt>
				<dd class="flex">총 금액의 100% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 5일 전</dt>
				<dd class="flex">총 금액의 100% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 4일 전</dt>
				<dd class="flex">총 금액의 100% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 3일 전</dt>
				<dd class="flex">총 금액의 100% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 2일 전</dt>
				<dd class="flex">총 금액의 70% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 전날</dt>
				<dd class="flex">총 금액의 50% 환불</dd>
			</dl>
			<dl class="flex_box refund">
				<dt class="flex tit">이용 당일</dt>
				<dd class="flex">총 금액의 20% 환불</dd>
			</dl>
		</div>
		
		<div>금액 : <span class="final_price"></span></div>
		<input type="button" value="예약하기" id="reserve_btn">			
	</form>
	</section>
	<c:import url="../../temp/footer.jsp"/> 
</body>
</html>