<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dhxGanttTest</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/schedule/codebase/dhtmlxgantt.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/codebase/dhtmlxgantt.js"></script>
<style type="text/css" media="screen">
    html, body{
        margin:0px;
        padding:0px;
        height:100%;
        overflow:hidden;
    }
</style>
</head>
<body>
 <div id="gantt_here" style='width:1000px; height:400px;'></div>
    <script type="text/javascript">
        gantt.init("gantt_here");
        
        
        var tasks = {
        	    data:[
        	        {id:1, text:"Project #1",start_date:"01-04-2013", duration:11,
        	        progress: 0.6, open: true},
        	        {id:2, text:"Task #1",   start_date:"03-04-2013", duration:5, 
        	        progress: 1,   open: true, parent:1},
        	        {id:3, text:"Task #2",   start_date:"02-04-2013", duration:7, 
        	        progress: 0.5, open: true, parent:1},
        	        {id:4, text:"Task #2.1", start_date:"03-04-2013", duration:2, 
        	        progress: 1,   open: true, parent:3},
        	        {id:5, text:"Task #2.2", start_date:"04-04-2013", duration:3, 
        	        progress: 0.8, open: true, parent:3},
        	        {id:6, text:"Task #2.3", start_date:"05-04-2013", duration:4, 
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
        
        
        var myEvent = gantt.attachEvent("onTaskClick", function(id, e) {
            alert("You've just clicked an item with id="+id);
        });
         
        gantt.detachEvent(myEvent);
    </script>
</body>
</html>