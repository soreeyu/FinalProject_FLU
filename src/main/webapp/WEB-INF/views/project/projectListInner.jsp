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

<c:if test="${list.size()==0}">

	<div class="project-unit" style="height: 100px;">
	<div class="non-project">
	<span class="non-project-text">해당하는 프로젝트가 없습니다.</span>
	</div>
	</div>

</c:if> 

<c:if test="${list ne null}">
<c:forEach items="${list}"  var="dto">
			
				<div class="project-unit">
					<div class="project-head">
						<div class="project-title" id="${dto.projectNum}">${dto.name}</div>
					</div>
					<div class="project-body">
						<div class="project-info">
							<div class="fa fa-won" style="padding-left: 0px;">예상금액 ${dto.budget}원</div>
							<div class="fa fa-clock-o">예상기간 ${dto.period}</div>
							<div class="fa-reg_date">등록일자 ${dto.reg_date}</div>
						</div>
						<div class="project-contents">${dto.contents }</div>
						<div class="project-contents-right">
							<div class="right-contents-sub">
							<img src="${pageContext.request.contextPath}/resources/img/project/clock-closed.png">
							마감<span class="deadline" id="${dto.finishDate}"></span></div>
							<div class="right-contents-sub">
							<img src="${pageContext.request.contextPath}/resources/img/project/proposal-user.png">
							총지원 <strong>몇명</strong></div>
						</div>
						
						<div style="clear: both;"></div>
						
						<div class="project-bottom">
							<span class="main-cate">개발</span>
							<span class="sub-cate">${dto.detailCategory }</span>
							<div class="skill-box">
								<span class="skill-main">요구기술</span>
						
							<c:forEach items="${dto.skills}" end="4" var="sk">
								 <span class="skill-name" style="color: white; font-size: 14px;">${sk}</span>
							
							</c:forEach>
							
							</div>
						</div>
					</div>
				</div>	
			</c:forEach>

</c:if>
	<c:if test="${list.size()>0}">
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





<script type="text/javascript">


var curBlock="${listInfo.curBlock}";
var perBlock="${listInfo.perBlock}";
var curPage="${listInfo.curPage}";

var preview = ((curBlock-2)*perBlock)+1;
var next = curBlock*perBlock+1;


/* 페이징 색상 */
$(".num").each(function() {
	if(curPage==$(this).attr("id")){
		$(this).css("color", "#3385ff");
	}
});


/* 페이징처리 */
$("#preview").click(function() { 
	$.get("projectListInner?curPage="+preview+"&search=${listInfo.search}&kind=${listInfo.kind}&arrange=${listInfo.arrange}",function(data){
		$(".contents_main").html(data);
		document.body.scrollTop = 0;
		});
	});

 $(".num").click(function() {
	var pageNum = $(this).attr("id");
	
	$.get("projectListInner?curPage="+pageNum+"&search=${listInfo.search}&kind=${listInfo.kind}&arrange=${listInfo.arrange}",function(data){
		$(".contents_main").html(data);
	
		document.body.scrollTop = 0;
	});   
});
 

 $("#nextview").click(function() {
		$.get("projectListInner?curPage="+next+"&search=${listInfo.search}&kind=${listInfo.kind}&arrange=${listInfo.arrange}",function(data){
			$(".contents_main").html(data);
			document.body.scrollTop = 0;
		});
		
	});
 
 /* 프로젝트뷰로 넘어가기 */
 
	$(".project-title").click(function() {
	var projectNum=$(this).attr("id");
	var memberEmail = '${member.email}';
	
	location.href="${pageContext.request.contextPath}/project/projectView?projectNum="+projectNum;
	
});
 
 
	/* 남은기한 표시하기 */
	 
	 $(".deadline").each(function() {
		 var finishDate = $(this).attr("id");
		 /* finishDate는 마감일자 */
		var deadline = new Date(finishDate);
		var date = new Date();
		 
		var left = deadline.getTime()-date.getTime();
		var leftDate = Math.ceil(left/(24*60*60*1000));
		
		$(this).html(leftDate+"일");
		 
	});

 
 

</script>
</body>
</html>