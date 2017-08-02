<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>part Insert Form</title>
</head>
<body>

<form action="./addPart" method="POST">
	<input type="hidden" name="projectNum" value="${projectNum}">
	<input type="hidden" name="scheduleNum" value="${scheduleNum}">
	part1 이름 : <input type="text" class="partName" name="partName">
	part1 시작일:<input type="date" class="partStartDate" name="partStartDate"> 
	part1 마감일:<input type="date" class="partFinishDate" name="partFinishDate"> <br/><br/>
	
	part2 이름 : <input type="text" class="partName" name="partName">
	part2 시작일:<input type="date" class="partStartDate" name="partStartDate"> 
	part2 마감일:<input type="date" class="partFinishDate" name="partFinishDate"> <br/>
	<button>등록</button>
</form>


</body>
</html>