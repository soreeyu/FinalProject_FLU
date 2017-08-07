<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
     google.charts.load('current', {packages: ['corechart']});    
     google.charts.load('current', {packages: ['corechart', 'bar']});
   </script>
 
    <script type="text/javascript">
    var scheduleNum = '${scheduleNum}';
    
     var data;
     var chart;
     var willCount = 1;
     var ingCount = 12;
     var finCount = 5;
     var warnCount = 9;
     var index=0;
    // var jsonData = getJSONData();
     /* 
     function getJSONData(){
    	 var json = null;
    	 $.ajax({
 			url:"/flu/schedule/test8Json",
 			type:"POST",
 			data:{
 				scheduleNum:scheduleNum
 			},
 			async:false,
 			success:function(data){
 				alert("성공?");
 				alert(JSON.stringify(data));
 				json = data;
 			},
 			error:function(e){
 				alert("에러부들");
 			}
 		});
    	 return json;    	 
     }
     
     alert("jsonData = "+jsonData);
     */
     
     
    
    
     
     function drawStacked() {
          var data = google.visualization.arrayToDataTable([
           ['파트', '할일', '진행중','완료']
         ]);
          
          //OR 
          
          var data2 = new google.visualization.DataTable();
          data2.addColumn('string', 'PART');
          data2.addColumn('number', '할일');
          data2.addColumn('number', '진행중');
          data2.addColumn('number', '완료');
         
          

          $(".partNames").each(function(index){
        	  var name = $(this).text();
        	  var partNamesWill = $(".partNamesWill:eq("+index+")").text()*1;
        	  var partNamesIng = $(".partNamesIng:eq("+index+")").text()*1;
        	  var partNamesDone = $(".partNamesDone:eq("+index+")").text()*1;
        	  var partNamesTotal = $(".partNamesTotal:eq("+index+")").text()*1;
              alert("하아아아"+name);
        	  data.addRow([name,partNamesWill, partNamesIng ,partNamesDone]);
          });
            
         var options = {
           title: '파트별 업무리스트',
           chartArea: {width: '50%',height: '90%'},
           isStacked: 'percent',
           hAxis: {
             title: '',
             minValue: 0,
           },
           vAxis: {
             title: '파트별 업무비율'
           }
           ,colors: ['rgb(255, 176, 36)', 'rgb(176, 180, 187)', 'rgb(39, 182, 186)', 'rgb(233, 94, 81)'],
           
         };
         var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
         chart.draw(data, options);
     }

/* 
재식
     if(chart1 == 0 && chart2 ==0){
   		google.charts.setOnLoadCallback(drawChart2);
     }else{
     	google.charts.setOnLoadCallback(drawChart);
     } 
     
*/
     
     google.charts.setOnLoadCallback(drawStacked);
      
      // Set a callback to run when the Google Visualization API is loaded.
      for(var i=0;i<2;i++){
    	 
    	  google.charts.setOnLoadCallback(drawChart1);
    	  
      }
      
      
      //google.charts.setOnLoadCallback(drawChart2);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart1() {
    	  


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
		
		
  		<div id="chart_div"></div>
	</div>
	<div>
		전체개요
		${summary.stateCount[0]}
		${summary.stateCount[1]}
		${summary.stateCount[2]}
		${summary.stateCount[3]}
		<hr/>
		
	
	
	
	<c:forEach items="${summary.partNames}" var="partName" varStatus="i">
		<span class="partNames">${partName}</span>
		
		<span class="partNamesWill">${summary.stateCountPerPart.get(i.index*1)[0]}</span>
		<span class="partNamesIng">${summary.stateCountPerPart.get(i.index*1)[1]}</span>
		<span class="partNamesDone">${summary.stateCountPerPart.get(i.index*1)[2]}</span>
		<span class="partNamesTotal">${summary.stateCountPerPart.get(i.index*1)[3]}</span>

	</c:forEach>
	<hr/>
	
	<c:forEach items="${summary.userNames}" var="userName" varStatus="i">
		${userName}
		
		${summary.stateCountPerUser.get(i.index*1)[0]} 
		${summary.stateCountPerUser.get(i.index*1)[1]} 
		${summary.stateCountPerUser.get(i.index*1)[2]} 
		${summary.stateCountPerUser.get(i.index*1)[3]} 
		
	</c:forEach>
	<hr/>
	

		
	</div>
</section>

<c:import url="../temp/footer.jsp"></c:import>


</body>
</html>