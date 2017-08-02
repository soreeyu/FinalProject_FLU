<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
	
.main_section {
	min-width: 1460px;
	width: 100%;
	height: auto;
	min-height: 1000px;
	position: relative;
	margin-top: 30px;
}


#main_wrap {
	width: 1152px;
	height: auto;
	margin: 0 auto;
	background: yellow;
}


	
</style>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
     var data;
     var chart;
     var willCount = 1;
     var ingCount = 12;
     var finCount = 5;
     var warnCount = 9;
     var index=0;
      // Load the Visualization API and the piechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      for(var i=0;i<2;i++){
    	 
    	  google.charts.setOnLoadCallback(drawChart1);
    	  
      }
      
      
      //google.charts.setOnLoadCallback(drawChart2);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart1() {
    	  
    	  //json 가져오기
    	  /* 
    	  var jsonData = $.ajax({
              url: "getData.php",
              dataType: "json",
              async: false
              }).responseText;
              
          // Create our data table out of JSON data loaded from server.
          var data = new google.visualization.DataTable(jsonData);  
    	   */

    	if(index==1){
        	  willCount = 14;
        	  ingCount = 12;
        	  finCount = 1;
        	  warnCount = 1;
        }
        var data = google.visualization.arrayToDataTable([
          ['Task'	, 'Hours per Day'],
          ['할일' 	,	willCount],
          ['진행중'	,	ingCount],
          ['완료'	,	finCount],
          ['마감일 지남', warnCount]
        ]);

        var options = {
          width: 400,
          height: 240,
          title: 'User'+(index+1),
          pieHole: 0.9,
          colors: ['rgb(255, 176, 36)', 'rgb(176, 180, 187)', 'rgb(39, 182, 186)', 'rgb(233, 94, 81)']
        };
		var id= 'donutchart'+(index+1);
		alert(id);
        var chart = new google.visualization.PieChart(document.getElementById(id));
        chart.draw(data, options);
        index++;
      }
      
   

      function selectHandler() {
        var selectedItem = chart.getSelection()[0];
        var value = data.getValue(selectedItem.row, 0);
        alert('The user selected ' + value);
      }

    </script>


</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<section class="main_section">
	<div id= "main_wrap">
		<!--Div that will hold the pie chart-->
    	<div id="donutchart1" style="width:400; height:300"></div>
		<div id="donutchart2" style="width:400; height:300"></div>
	</div>
</section>

<c:import url="../temp/footer.jsp"></c:import>

</body>
</html>