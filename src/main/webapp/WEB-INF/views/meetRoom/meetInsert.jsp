<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>INSERT</h1>
	
	<form action="meetInsert"  method="post" enctype="multipart/form-data" id="frm">
	<input type="text" name="name" placeholder="업체이름">
	<input type="text" name="contents">
	<input type="text" name="time">
	<input type="file" name="f1">
	<input type="text" name="holiday">
	<input type="text" name="addr_num">
	<input type="text" name="addr_main">
	<input type="text" name="addr_detail">
	<input type="text" name="homePage">
	<button>전송</button>
	</form>
	
</body>
</html>