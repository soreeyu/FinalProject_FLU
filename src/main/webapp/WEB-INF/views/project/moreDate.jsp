<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.multidatespicker.js"></script>
<script type="text/javascript">

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
	
	var result = '${result}';
	
	if(result=='1'){
		window.close();
	}
	
	var check = 0;
	
	var date = new Date();
	$('#datepicker').multiDatesPicker({
     	minDate :0,
     	mode: 'daysRange',
    	autoselectRange: [0,14],
 		
		onSelect : function(data){ //풀네임으로 날짜가 옴 
			check = 1;
			var startDate = data;
			
		    var year = startDate.substr(0,4);
		    var month = startDate.substr(5,2);
		    var day = startDate.substr(8,2);
			
			startDate = startDate.substr(2,8);
			
		    alert("시작날짜"+startDate);
		    
		    $('input[name=startDate]').val(startDate);
		    
			var finishDate = new Date(year,month-1,day);
		 	
			finishDate.setDate(finishDate.getDate()+13);
		
			year = finishDate.getFullYear();
			month = finishDate.getMonth()+1;
			if(month<10){
				month='0'+month;
			}
			day = finishDate.getDate();
			if(day<10){
				day='0'+day;
			}

			var finishDate2 = year+"/"+month+"/"+day;

			$('input[name=finishDate]').val(finishDate2.substr(2,8));

			
			
	 	}
    
	
	});
	
	
	$('#btn').click(function() {
		
		var startDate = $('input[name=startDate]').val();
		var finishDate = $('input[name=finishDate]').val();
		var projectNum = opener.document.getElementById("opener").value;
		
		if(check==0){
			alert("날짜를 입력하세요");
		}else{
			$('input[name=projectNum]').val(projectNum);
			
			if(confirm(startDate+"~"+finishDate+"로 연장하시겠습니까?")){
				
				$('#frm').submit();
				alert("연장되었습니다.");
				//window.close();
			}else{
				alert('no');
			}
		}
		
		


	});
	
	
	
});


</script>

<style type="text/css">
	
	.ui-datepicker-inline{
		width: 400px;
		height: 300px;
		
	}

	#btn{
	
		width: 55px;
		height: 30px;
		background-color: yellow;
		color: black;
		font-weight: bolder;
		margin: 0 auto;
	
	}
	
	#btn:HOVER {
	
		cursor: pointer;
		
	}

</style>
</head>
<body>
<div>
프로젝트 기간 변경
</div>
<div id="datepicker">

</div>
<form action="./moreDateUpdate" id="frm">
<input type="hidden" name="startDate" value="">
<input type="hidden" name="finishDate" value="">
<input type="hidden" name="projectNum" value="">
<div id="btn">
확인
</div>
</form>

</body>
</html>