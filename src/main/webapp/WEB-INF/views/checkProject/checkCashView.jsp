<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

$(function() {
	
	var email = '${project.email }';
	
	$('#client').click(function() {
		
		window.open("../member/clientInfo", "check", "width=450, height=300, top=200, left=200");
		
	});
	
	
	
	
});

</script>
</head>
<body>

PROJECT
<p>${project.projectNum}</p>
<p>${project.name}</p>
<p>${project.category }</p>
<p>${project.detailCategory}</p>
<p>${project.name}</p>
<p>${project.period}</p>
<p>${project.startDate}</p>
<p>${project.budget }</p>
<p>${project.planState }</p>
<p>${project.contents }</p>
<p>${project.skill }</p>
<p>${project.finishDate }</p>
<p>${project.meetKind }</p>
<p>${project.exp }</p>
<p>${project.state }</p>
<p>클라이언트아이디: <a id="client">${project.email }</a></p>
<p>${project.quick }</p>
<p><a href="../file/fileDown?fname=${project.fName }">${project.oName }</a></p>
<p>${project.addr_num } ${project.addr_main } ${project.addr_detail }
<p>${project.reg_date }</p>

<hr>

<c:forEach items="${applicant }" var="a">
<p>${a.projectNum}</p>
<p>${a.email}</p>
<p>${a.state}</p>
<p>${a.pay}</p>
</c:forEach>


</body>
</html>