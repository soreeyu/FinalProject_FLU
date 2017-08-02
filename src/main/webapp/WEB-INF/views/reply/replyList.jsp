<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h2>List</h2>
	<div>
		<span>writer</span>
		<span>contents</span>
		<span>reg_date</span>
		<span>X</span>

		<span>${replyList}</span>
		<span>${project}</span>
		<span>${listInfo}</span>
		<p></p>
		<span>${map}</span>
		<span>${map.project }</span>
		<span>${map.project.projectNum }</span>
		<span>${map.project.contents }</span>
		<p></p>
		<span>${map.listInfo.curPage}</span>
		<span>${map.listInfo.perPage}</span>
		<span>${map.listInfo.lastNum}</span>
		
		<%-- <c:forEach items="${map.project}" var="project">
		
			<span>${reply.projectNum}</span>
			<span>${reply.contents}</span>
			<span>${reply.reg_date}</span>
			<span>X</span>
		
		</c:forEach>  --%>
		
		<%-- <c:forEach items="${replyList}" var="reply">
		<p>
			<span>${reply.writer}</span>
			<span>${reply.contents}</span>
			<span>${reply.reg_date}</span>
			<span>X</span>
			</p>
		</c:forEach> --%>

	</div>
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
					<p>curPage : ${listInfo.curPage}</p>
					<p>startNum : ${listInfo.startNum}   lastNum : ${listInfo.lastNum}</p>
					<p>startRow : ${listInfo.startRow}   lastRow : ${listInfo.lastRow}</p>
					<p>curBlock : ${listInfo.curBlock }      perPage : ${listInfo.perPage}</p>
				</div>

			</div>

	<div class="project-reply-box-bottom">
		<form action="../reply/replyInsert" id="frm" method="post">
			<input type="hidden" name="projectNum" value="${dto.projectNum}">

			<!-- member의 img를 넣자 -->

			<input type="text" name="contents"> <input type="checkbox"
				id="reply_check">비공개 설정 <input type="hidden" name="replyChk"
				id="replyChk" value="true"> <input type="button" id="btn"
				value="작성">
		</form>
		</div>
		<script type="text/javascript">
		 alert("List");
		 
		 alert("${replylist}");
		</script>
</body>
</html>