<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp" />
<h2>클라이언트 project페이지</h2>

<div class="check">검수중</div>
<div class="ing">진행중</div>
<div class="finish">완료</div>
<br>


<c:forEach items="${list}" var="dto">
<div class="projectList-box">
	<div>Num : ${dto.projectNum}</div>
	<div>Email : ${dto.email}</div>
	<div>Name : ${dto.name }</div>
	<div>Reg_date : ${dto.reg_date}</div>
	<div>Skills : ${dto.skill}</div>
	<div>프로젝트 진행상태 : ${dto.state}</div>
</div>
<br>

</c:forEach>

<div class="contents_bottom">
				<div class="contents_paging">
				<c:if test="${listInfo.curBlock>1 }"> -
				<span id="preview">[이전]</span>		
				</c:if>
		
				<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
					<span class="num" id="${i}">${i}</span>			
				</c:forEach>
		
				<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
				<span id="nextview">[다음]</span>			
				</c:if>
				</div>
	 
				<div>
					<p>curPage : ${listInfo.curPage }       totalCount : ${count} </p>
					<p>startNum : ${listInfo.startNum}   lastNum : ${listInfo.lastNum}</p>
					<p>startRow : ${listInfo.startRow}   lastRow : ${listInfo.lastRow}</p>
					<p>curBlock : ${listInfo.curBlock }      perPage : ${listInfo.perPage}</p>
				</div>

			</div>

<script type="text/javascript">
$(".check").click(function() {
	alert("검수중");
});
$(".ing").click(function() {
	alert("진행중");
});
$(".finish").click(function() {
	alert("완료");
});

</script>
<c:import url="/WEB-INF/views/temp/footer.jsp" />
</body>
</html>