<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>part view</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	
/* 	$("#partTable").on("click",".partDelete",function(){
		alert('삭제하고싶어');
		alert($(this).parent(".test").html());//.remove();
	}); */
	
	$(".partDelete").click(function(){
		
		if(confirm("part 삭제할거예요?") == true){
			$(this).parents(".onePartTr").remove();
			var partNum = $(this).attr("data-partNum");
			$.ajax({
				url:"./partDelete",
				type:"POST",
				data:{
					scheduleNum:${scheduleNum},
					partNum:partNum
				},
				success:function(data){
					alert(data);
				}
				
			});

			//DB 에도 다녀와야함  지우러 //ajax
		}
		
	});
	
});
</script>


</head>
<body>
<h3>SCHEDULE NUM = ${scheduleNum}</h3>
	<table id="partTable">
	<tr>
		<th>PART</th><th>시작일</th><th>마감일</th><th>첨부파일</th><th>관리자만가능</th>
	</tr>
		<c:catch>
			<c:forEach items="${partList}" var="part" varStatus="i">
			<tr class="onePartTr">
			 	<td>
				 	${i.index}
					${part.partName}
				</td>
				<td>${part.partStartDate}</td>
				<td>${part.partFinishDate}</td>
				<td>
					<a href="../file/fileDown?fname=${part.partDescFileF}">${part.partDescFileO}</a>
					
				</td>
				<td>
					<span class="partUpdate" data-partNum="${part.partNum}">수정</span>/
					<span class="partDelete" data-partNum="${part.partNum}">삭제</span>
				</td>
			</tr>
			</c:forEach>
		</c:catch>
	</table>

</body>
</html>