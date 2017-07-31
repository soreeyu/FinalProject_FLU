<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dhxGanttTest</title>

<%-- <c:import url="../temp/bootstrap.jsp"></c:import> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/schedule/codebase/dhtmlxgantt.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/codebase/dhtmlxgantt.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/codebase/locale/locale_kr.js" charset="utf-8"></script>

<style type="text/css" media="screen">
    html, body{
        margin:0px;
        padding:0px;
        height:100%;
        overflow:hidden;
    }
</style>


  <script type="text/javascript">
    
  $(function(){
	  
 	
    
   /*  gantt.config.columns=[
        {name:"text",       label:"업무 내용",  tree:true, width:'*' },
        {name:"start_date", label:"시작일", align: "center" },
        {name:"end_date", 	label:"마감일", align: "center" },
        {name:"duration",   label:"기간",   align: "center" },
        {name:"add",        label:"" }
    ];
 */
		gantt.config.xml_date="%Y-%m-%d";
 
 		gantt.config.fit_tasks = true; 
    	gantt.config.task_height = 10;
    	gantt.config.fit_tasks = true; 
    	gantt.config.drag_progress = false;
    	gantt.config.drag_resize = true;
    	gantt.config.drag_move = false;
    	gantt.config.drag_links = false;
        //gantt.init("gantt_here",new Date(01,01,2017)); 
        gantt.config.scale_unit = "month"; 
        gantt.init("gantt_here"); 
      	//gantt.calculateEndDate(new Date(2017,01,01),30,"month")
      	
      	
        
        
        var tasks = {
        	    data:[
        	        {id:1, text:"Project #1",start_date:"2017-07-01", duration:11,
        	        progress: 0.6, open: true},
        	        {id:2, text:"Task #1",   start_date:"2017-07-01", end_date:"2017-07-01", 
        	        progress: 1,   open: true, parent:1},
        	        {id:3, text:"Task #2",   start_date:"2017-07-01", duration:7, 
        	        progress: 0.5, open: true, parent:1},
        	        {id:4, text:"Task #2.1", start_date:"2017-07-01", duration:2, 
        	        progress: 1,   open: true, parent:3 , type:"project"},
        	        {id:5, text:"Task #2.2", start_date:"2017-07-01", duration:3, 
        	        progress: 0.8, open: true, parent:3},
        	        {id:6, text:"Task #2.3", start_date:"2017-07-01", duration:4, 
        	        progress: 0.2, open: true, parent:3}
        	    ],
        	    links:[
        	        {id:1, source:1, target:2, type:"1"},
        	        {id:2, source:1, target:3, type:"1"},
        	        {id:3, source:3, target:4, type:"1"},
        	        {id:4, source:4, target:5, type:"0"},
        	        {id:5, source:5, target:6, type:"0"}
        	    ]
        	};
        
        
        gantt.parse (tasks);
        //gantt.deleteTask(id);//업무지우기 //여기서해봣자 안됨 
        
        
        gantt.config.scale_unit = "day"; //hour 도 가능  
		gantt.render();//설정 바꾼후 다시 render 해줘야한다 //설정바꾼다음에 task같은거 입력하면 그때도 다시 뿌려주니깐..알아두기
        
        
        
        
 
        
        
        
        var myEvent = gantt.attachEvent("onTaskClick", function(id, e) {
            alert("You've just clicked an item with id="+id);
            alert("내용="+e);
            //gantt.deleteTask(2);
            //gantt.refreshData();
            
        });
         
        //gantt.attachEvent(myEvent);
        
       /*  
        gantt.attachEvent("onAfterTaskAdd", function(id,item){
        	 alert("추가했음="+id);
             alert("내용="+item.id);
             
             
            
        }); */
        
      
        
        gantt.scrollTo(30, 80);
   
        
       /*  
       gantt.confirm({
            text: "Continue?",
            ok:"Yes", 
            cancel:"No",
            callback: function(result){
                if(result){
                    gantt.message("Yes!");
                }else{
                    gantt.message("No...");
                }
            }
        });
         */
       // gantt.eachTask(function(task){alert(task.text);}) //각업무에 대한 반복문
        
        
        
       var testEvent =  gantt.attachEvent("#test", "click", function(e){
            //e - a native event object
    	   alert("클릭함");
        });
      // gantt.attachEvent(testEvent);
      
      $("#test").click(function(){
    	  alert("저장할란다");
    	  var json = gantt.serialize();
          alert(JSON.stringify(json));
      });
      
      
      
       
       
       
       var resultJson = getPartList(141);
       changeJsonDataForGanttTask(resultJson);
       
         
  });//function끝
  
  
  
  function changeJsonDataForGanttTask(jsonObj){
	  
	  for(var i=0; i<Object.keys(jsonObj).length; i++){
			//alert('일정추가되고있는가'+i);
	       /*  $('#schcalendar').fullCalendar('addEventSource', [{
	            id:          jsonObj[i].scheduleNum+jsonObj[i].partName+jsonObj[i].partNum,
	            title:       jsonObj[i].partName,
	            start:       jsonObj[i].partStartDate,
	            end:         jsonObj[i].partFinishDate,
	            description: jsonObj[i].partNum, 
	            color:       jsonObj[i].color,
	            textColor:   jsonObj[i].textColor,
	            //url: 'https://www.github.com'
	        }]);
	        console.log('달력이벤트 추가 ok'); */
	        
	        //.createTask 는 들어가는것이 아니라 만드는 화면으로 들어가진다
	        //
	        gantt.addTask({
			    id:jsonObj[i].scheduleNum+"_"+jsonObj[i].partNum,
			    text:jsonObj[i].partName,
			    start_date:jsonObj[i].partStartDate,
			    end_date:jsonObj[i].partFinishDate,
			    types: "project",
			    color: "orange",
			    parent: "141_1", // unit 넣을때 이런식으로 체크하면 좋겟다
			    open: true
			}); 
	        
	       
	        
	        
	    } 
	} //changeJsonDataForGanttTask끝
	
	
	/**
	 * DB에 저장된 part들의 list를 json 형태로 받고 partsJSONArray 에 저장해준다
	 */
	function getPartList(scheduleNum){
		
		var partsJSONArray = new Array();
		//var colors = ['red','yellow','orange','green','blue','lime','purple'];
		var colors = ['#ccccff','#b3b3ff','#9999ff','#8080ff','#6666ff','#4d4dff','#3333ff'];
		
		$.ajax({
			url: "/flu/schedule/partList?scheduleNum="+scheduleNum,
			type: "GET",
			async:false,
			success:function(data){ //json 넘어옴 

				partsJSONArray = data;
				for(var i=0;i<partsJSONArray.length;i++){
					partsJSONArray[i].color = colors[((i+1)%7)-1]; //7개설정해놔서그렇습니다
					partsJSONArray[i].textColor = 'white';
				}
				
				
				//아래 뿌려주는애
				var result="<table>";
				$(data).each(function(){
					
					result = result + '<tr class="onePartClick">';
					result = result + '<td class="schNum">'+ this.scheduleNum + "</td>";
					result = result + "<td> "+ this.partName + " </td>";
					result = result + "<td> "+ this.partStartDate + " </td>";
					result = result + "<td> "+ this.partFinishDate + " </td>";
					result = result + "<td class='partNum'> "+ this.partNum + " </td>";
					result = result + "<td> "+ this.partDescFileO + " </td>";
					result = result + "</tr>";
					
				});
				result = result + "</table>";
				$("#partsDiv").html(result); //아래화면에 뿌려주기
				
				
				
				
				
				//클라이언트가 unit 등록할때 
				var unitInsertParts = '';
				$(data).each(function(){
					unitInsertParts = unitInsertParts + '<input type="radio" class="partName" name="partName" value="'+this.partName+'" data-num="'+this.partNum+'">'+this.partName;
				});
				$("#parts").html(unitInsertParts);

				
		
				
			
				//return partsJSONArray; 
				//이렇게하면 비동기화 방식이 무의미 해지기 때문에 //데이터를 담은 후 그 데이터를 사용하기 위한것이기 때문에
				//동기화 방식 // 즉 데이터가 다 가져와져서 담길때까지 기다려야하기 때문이라는 말이다 
				//그냥 여기서 함수를 호출해버리는게 좋을수도 있겠다 
				
			}
		}); //success끝
		
		alert("ajax아래 함수안에 data "+JSON.stringify(partsJSONArray)); // 오류남
		return partsJSONArray;
		
		
	} // getPartList() 끝
	
	
        
    </script>
    




</head>
<body>

<%-- <c:import url="../temp/header.jsp"></c:import> --%>

<section class="main_section">
 <div id="gantt_here" style='width:1500px; height:500px; margin:0 auto;'>
 

 </div>
 
  <div id="test" style='width:200px; height:200px; background:orange;'></div>
 
 </section>
 
<%--  <c:import url="../temp/footer.jsp"></c:import>  --%>
    
</body>
</html>