<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<body>


	<div id= "#firstView_main_wrap">
		
		<div class="tw-project-analytics-overview__bars">
			<div id="totalBarChart"></div>
		</div>
		
		<!--Div that will hold tshe pie chart-->
		<c:forEach items="${summary.userNames}" varStatus="i">
    		<div id="donutchart${i.index}" class="dounut" style="width:400; height:300"></div>
		</c:forEach>
		
		
  		<div id="chart_div"></div>
	</div>
	<div>
	
		전체개요
		<span class="totalWill">${summary.stateCount[0]}</span>
		<span class="totalIng">${summary.stateCount[1]}</span>
		<span class="totalDone">${summary.stateCount[2]}</span>
		<span class="totalTotal">${summary.stateCount[3]}</span>
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
		<span class="userNames">${userName}</span>
		
		<span class="userNamesWill">${summary.stateCountPerUser.get(i.index*1)[0]}</span>
		<span class="userNamesIng">${summary.stateCountPerUser.get(i.index*1)[1]}</span> 
		<span class="userNamesDone">${summary.stateCountPerUser.get(i.index*1)[2]}</span>
		<span class="userNamesTotal">${summary.stateCountPerUser.get(i.index*1)[3]}</span> 
		
	</c:forEach>
	<hr/>
	
</div>
		
<!-- 	</div>
</section>
 -->


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
     
     
     
     function drawStackedTotal() {
         
         var dataTotal = new google.visualization.DataTable();
         dataTotal.addColumn('string', 'total');
         dataTotal.addColumn('number', '할일');
         dataTotal.addColumn('number', '진행중');
         dataTotal.addColumn('number', '완료'); 
        
         


       	  var totalWill = $(".totalWill:eq(0)").text()*1;
       	  var totalIng = $(".totalIng:eq(0)").text()*1;
       	  var totalDone = $(".totalDone:eq(0)").text()*1;
       	  var totalTotal = $(".totalTotal:eq(0)").text()*1;
             dataTotal.addRow(['',totalWill, totalIng ,totalDone]);

           
        var options = {
          title: '전체 업무 개요',
          chartArea: {width: '100%',height: '100%'},
          isStacked: 'percent',
          hAxis: {
            title: '',
            minValue: 0,
          },  
          backgroundColor: "transparent",
          
          colors: ['rgb(233, 94, 81)', 'rgb(255, 176, 36)','rgb(39, 182, 186)','rgb(176, 180, 187)' ]
       
        };
        
       
        var chart = new google.visualization.BarChart(document.getElementById('totalBarChart'));
        chart.draw(dataTotal, options);
    }

    google.charts.setOnLoadCallback(drawStackedTotal);
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     

    
    
     
     function drawStacked() {
          var data = google.visualization.arrayToDataTable([
           ['파트', '할일', '진행중','완료']//,
           //['호이야',2,3,4]
         ]);
          
          //OR 
          
          var data2 = new google.visualization.DataTable();
          data2.addColumn('string', 'PART');
          data2.addColumn('number', '할일');
          data2.addColumn('number', '진행중');
          data2.addColumn('number', '완료'); 
         
          

          $(".partNames").each(function(index){
        	  var partNames = $(".partNames:eq("+index+")").text();
        	  var partNamesWill = $(".partNamesWill:eq("+index+")").text()*1;
        	  var partNamesIng = $(".partNamesIng:eq("+index+")").text()*1;
        	  var partNamesDone = $(".partNamesDone:eq("+index+")").text()*1;
        	  var partNamesTotal = $(".partNamesTotal:eq("+index+")").text()*1;
              alert("하아아아"+partNames);
        	  data2.addRow([partNames,partNamesWill, partNamesIng ,partNamesDone]);
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
             title: '파트별업무비율'
           },
           colors: ['rgb(233, 94, 81)', 'rgb(255, 176, 36)','rgb(39, 182, 186)','rgb(176, 180, 187)' ]
        
         };
         
        
         var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
         chart.draw(data2, options);
     }

     google.charts.setOnLoadCallback(drawStacked);

    
      // Set a callback to run when the Google Visualization API is loaded.
      for(var i=0;i<$(".userNames").length;i++){
    	 
    	  google.charts.setOnLoadCallback(drawChart1);
    	  
      }
      
      
      function drawChart1() {

	   	  willCount = $(".userNamesWill:eq("+index+")").text()*1;
	   	  ingCount = $(".userNamesIng:eq("+index+")").text()*1;
	   	  finCount = $(".userNamesDone:eq("+index+")").text()*1;
	   	  warnCount = 1;
   
    	
        var data = google.visualization.arrayToDataTable([
          ['Task'	, 'Hours per Day'],
          ['할일' 	,	willCount],
          ['진행중'	,	ingCount],
          ['완료'	,	finCount]
          //['마감일 지남', warnCount]
        ]);

        var options = {
          width: 400,
          height: 240,
          title: $(".userNames:eq("+index+")").text(),
          pieHole: 0.4,
          colors: ['rgb(233, 94, 81)','rgb(255, 176, 36)', 'rgb(39, 182, 186)', 'rgb(176, 180, 187)']
	      ,legend :{
  	    	//position: 'top',
  	    	textStyle : {
  	    		fontSize: 12
  	    	}
  	      }
        };
		var id= 'donutchart'+(index);
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

