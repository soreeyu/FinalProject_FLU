<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
<form action="./memberCheckInsert" method="post" enctype="multipart/form-data">
<input type="hidden" name="email" value="${member.email}">
<p>파일<input type="file" name="file1"></p>
<p>회사형태: ${member.type}</p>
<p>성명: <input type="text" name="name" value="${member.name}"></p>
<p>주소: ${member.addr_num} ${member.addr_main} ${member.addr_detail}</p>
<button>버튼</button>

</form>

<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>