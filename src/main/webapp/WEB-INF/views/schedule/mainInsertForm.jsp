<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main Insert Form</title>
</head>
<body>

<form action="./create" method="POST">
	<input type="hidden" name="projectNum" value="${projectNum}">
	프로젝트 시작일:<input type="date" name="startDate"> <br/>
	프로젝트 마감일:<input type="date" name="finishDate"> <br/>
	<button>등록</button>
</form>


</body>
</html>