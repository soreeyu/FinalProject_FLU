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
	
	var pemail = '${project.email }';
	
	
	$('#client').click(function() {
		
		window.open("./clientInfo?email="+pemail, "check", "width=600, height=400, top=100, left=300");
		
	});
	
	
	
	$('.btn').click(function() {
		
		var remail = $(this).attr('lang');
		var count = $(this).attr('title');
		var pay = $("."+count).attr("title");

		
		
	 	$.ajax({
			
			url: "./memberInfo",
			type: "GET",
			data: {email:remail,pay:pay},
			success:function(data){
				data = data.trim();
				$('#'+count).html(data);
			}
			
		}) 
		
		var projectNum = ${project.projectNum};
		
		$('#'+count).on("click",".btn2", function() {
			var email = $(this).attr('id');
			location.href = "./appUpdate?email="+email+"&projectNum="+projectNum;
			
		}) 
	
	
		
	});
	
	
	
	
});






</script>
<style type="text/css">
	
#client:HOVER {
	
	cursor: pointer;
}
	
	
	
}

</style>
</head>
<body>

PROJECT
<p>${project.projectNum}</p>
<p>${project.name}</p>
<p>${project.category }</p>
<p>${project.detailCategory}</p>
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

<c:forEach items="${applicant }" var="a" varStatus="i">
<p>프로젝트넘: ${a.projectNum}</p>

<p class="${i.index }" title="${a.pay }">
지원자 : ${a.email} 지급액: ${a.pay}
<c:if test="${a.state=='payFinish'}">
지급완료
</c:if>
<c:if test="${a.state=='finish'}">
<input type="button" value="지급하기" lang="${a.email}" class="btn" title="${i.index}">
</c:if>
</p>

<div id="${i.index}">

</div>


</c:forEach>


</body>
</html>