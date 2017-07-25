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
<div class="contents">

		<c:forEach items="${replyList}" var="reply">
		<div>
			<%-- <c:if test="${reply.replyChk=='false'}"> --%>
			<span>${reply.writer}</span>
			<span>${reply.contents}</span>
			<span>${reply.reg_date}</span>
			<span>${reply.replyChk}</span>
			<%-- </c:if> --%>
			<%-- <c:if test="${reply.replyChk=='true'}">
			<span>비공개 댓글입니다.</span>
			<span>${reply.replyChk}</span>
			</c:if> --%>
			
			<span class="listDelete" id="${reply.num}">X</span>
			<c:if test="${reply.replyChk=='false'}">
			
			<span class="listReply" data-id="${reply.num}" data-on="off">답글</span>
			</c:if>
			<p>
			
			<div class="rereply" style="display: block;" data-id="${reply.num}">
			
			</div>
			</p>
			
		</div>
		</c:forEach> 


<c:if test="${replyList.size()>0}">
	<div class="contents_bottom">
				<div class="contents_paging">
				<c:if test="${listInfo.curBlock>1 }">
				<span id="preview">[이전]</span>		
				</c:if>
		
				<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
					<span class="num" id="${i}">${i}</span>			
				</c:forEach>
		
				<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
				<span id="nextview">[다음]</span>			
				</c:if>
				</div>
	</div>
</c:if>

<c:if test="${replyList.size()==0}">
	<div class="contents_bottom">
		<div class="contents_paging">
		<span class="num" id="${i}">0</span>
		</div>
	</div>		
</c:if>
</div>
	




<script type="text/javascript">
$(".rereply").css("display", "none");
		
		/* reply 삭제 */
		 $(".listDelete").click(function() {
		 var data_id = $(this).attr("id");
		 alert(data_id);

		   var r = confirm("삭제하시겠습니까?");
			if(r == true) {
				$.get("../reply/replyDelete?num="+data_id,function(data){
					window.location.reload(true);
				});
			} else {
				alert("취소되었습니다.");
			}  
		});
		
		
		
		/* 페이징처리 */
		 $(".num").click(function() {
			var pageNum = $(this).attr("id");
			alert(pageNum);
			alert(projectNum);
			   $.get("../reply/replyList?projectNum="+projectNum+"&curPage="+pageNum, function(data) {
				$(".project-reply-box-top").html(data);
			});   
		});
		


		
		</script>
</body>
</html>