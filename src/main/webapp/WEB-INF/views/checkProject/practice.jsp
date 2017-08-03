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
	
	var date = new Date();
	$('#datepicker').multiDatesPicker({
     	minDate :0,
     	mode: 'daysRange',
    	autoselectRange: [0,14]

	});
	
	
	
	
	

	
})


</script>
</head>
<body>
<div id="datepicker">

</div>


<input type="hidden" id="today">


</body>
</html>