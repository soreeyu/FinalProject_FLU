<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
	<title>Editable TreeGrid - jQuery EasyUI Demo</title>
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/schedule/six/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/schedule/six/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/schedule/six/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/six/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/six/jquery.easyui.min.js"></script> --%>
	
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/six/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/six/jquery.easyui.min.js"></script>
	
	 --%>
	 
	 
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/webpack.config.js"></script>
	 --%>
	
	
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/dist/snap.svg.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/dist/snap.svg-min.js"></script> 

	

	<%-- 
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/align.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/animation.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/attr.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/attradd.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/class.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/colors.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/copy.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/element.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/equal.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/filter.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/matrix.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/mina.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/mouse.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/paper.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/path.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/set.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/snap/src/svg.js"></script>
 --%>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/moment.js"></script>
	
	
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/schedule/ganttTest2/src/gantt.scss"> --%>
	
	

	
	
	<%-- <script src='${pageContext.request.contextPath}/resources/schedule/ganttTest2/src/Arrow.js'></script> --%>
	<%-- <script src='${pageContext.request.contextPath}/resources/schedule/ganttTest2/src/Gantt.js'></script> --%>
	
	
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/ganttTest2/dist/frappe-gantt.min.js"></script>

	 <script src='${pageContext.request.contextPath}/resources/schedule/ganttTest2/src/Bar.js'></script>
<script type="text/javascript">
	$(function() {

		
		/* test2 */
		var tasks = [
			  {
			    id: 'Task 1',
			    name: 'Redesign website',
			    start: '2016-12-28',
			    end: '2016-12-31',
			    progress: 20,
			    dependencies: 'Task 2'
			  },
			  {
				    id: 'Task 2',
				    name: 'Redesign website',
				    start: '2016-12-28',
				    end: '2016-12-31',
				    progress: 20,
				    dependencies: ' Task 3'
				}
		];

		var gantt = new Gantt('#gantt', tasks, {
		    // can be a function that returns html
		    // or a simple html string
		    custom_popup_html: function(task) {
		      // the task object will contain the updated
		      // dates and progress value
		      const end_date = task._end.format('MMM D');
		     /*  return '
		        <div class="details-container">
		          <h5>${task.name}</h5>
		          <p>Expected to finish by ${end_date}</p>
		          <p>${task.progress}% completed!</p>
		        </div>
		      '; */
		    }
		});
	});
	

</script>

</head>
<body>
	<svg id="gantt"></svg>


   
</body>
</html>