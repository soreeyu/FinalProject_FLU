<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var currentTab = '${currentTab}';
	var scheduleNum = '${scheduleNum}';
	var message ='${message}';
	
	$(function(){
		alert('${message}');
		alert('${scheduleNum}');
		alert('${currentTab}');
		$("#frm").submit();
	})
	
</script>
	<form id="frm" action="${pageContext.request.contextPath}/schedule/test" method="POST">
		<input type="hidden"  name="currentTab" id="currentTab" value="${currentTab}">
		<input type="hidden"  name="scheduleNum" id="scheduleNum" value="${scheduleNum}">		
	</form>

</body>
</html>