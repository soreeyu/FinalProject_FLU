<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./checkMemberInsert" method="post" enctype="multipart/form-data">
<input type="hidden" name="email" value="${member.email}">
<p>파일<input type="file" name="file1"></p>
<p>회사형태: ${member.type}</p>
<p>성명: <input type="text" name="name"></p>
<p>주소: ${member.addr_num} ${member.addr_main} ${member.addr_detail}</p>
<button>버튼</button>

</form>
</body>
</html>