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
<script type='text/javascript' src='../../resources/js/jquery.mousewheel.min.js'></script>
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
	
	 $("#datepicker").datepicker({
     	altField : "today",
     	minDate :0,
     	maxDate :14,
     	onSelect : function(data){
     		var today = $("#today").val(data);
     		alert(today);
     	}
     });
	
})


</script>

<style type="text/css">
	
	.ui-datepicker-inline{
		width: 400px;
		height: 300px;
		
	}

</style>
</head>
<body>
<div id="datepicker">


</div>
</body>
</html>