<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />

</head>
<body>
<c:if test="${pjcount==0}">

	<div class="project-unit" style="height: 100px;">
	<div class="non-project">
	<span class="non-project-text">해당하는 프로젝트가 없습니다.</span>
	</div>
	</div>

</c:if> 

<c:if test="${list ne null}">
<c:forEach items="${list}"  var="dto">
			
				<div class="project-unit ${dto.projectNum}">
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
							총지원 <strong>${dto.appCount}명</strong></div>
							
							
							
							<div class="right-contents-sub">
							
							<input type="hidden" class="quick" id="${dto.quick}" data-id="${dto.projectNum}"></div>
							 
							 
						</div>
						
						<div style="clear: both;"></div>
						
						<div class="project-bottom">
							<span class="main-cate">${dto.category }</span>
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

/* 기본셋팅 */
var curBlock="${listInfo.curBlock}";
var perBlock="${listInfo.perBlock}";
var curPage="${listInfo.curPage}";

var preview = ((curBlock-2)*perBlock)+1;
var next = curBlock*perBlock+1;

var searchCon = $("#search").val();
alert("search=="+searchCon);
var array = new Array();

var checkList = $("input[class='dev-chk']:checked");
var array = new Array();
var i=0;
var arrangeVal = $("#arrange").val();
alert(arrangeVal);
alert("checkList="+checkList);

 checkList.each(function(index) {
	array[index] = checkList.val(); 
});
alert(array); 


$(".quick").each(function() {
	var q = $(this).attr("id");
	var qdata = $(this).attr("data-id");	//projectNum이 들어가있음
	if(q==1){
		$(this).html("급구");
		$("."+qdata).css("background", "#ffcccc");
	}else{
		$(this).html("급구x");
	}
});



/* 페이징 색상 */
$(".num").each(function() {
	if(curPage==$(this).attr("id")){
		$(this).css("color", "#2099bb");
	}
});


/* 페이징처리 */
$("#preview").click(function() { 
	 

	$.get("projectListInner?curPage="+preview+"&search="+searchCon+"&kind=total&arrange=$"+arrangeVal+"&array="+array,function(data){
		$(".contents_main").html(data);
		document.body.scrollTop = 0;
		});
	});

 $(".num").click(function() {
	var pageNum = $(this).attr("id");

	alert("pageNum="+pageNum);
	$.get("projectListInner?curPage="+pageNum+"&search="+searchCon+"&kind=total&arrange="+arrangeVal+"&array="+array,function(data){
		$(".contents_main").html(data);
	
		document.body.scrollTop = 0;
	});   
});
 

 $("#nextview").click(function() {
	
		$.get("projectListInner?curPage="+next+"&search="+searchCon+"&kind=total&arrange="+arrangeVal+"&array="+array,function(data){
			$(".contents_main").html(data);
			document.body.scrollTop = 0;
		});
		
	});
 
 
 
 /* 프로젝트뷰로 넘어가기 */
 /* session이랑 참고해서 기본정보, 자기소개, 포트폴리오, 보유기술 등록여부 확인 */
 
	$(".project-title").click(function() {
	var projectNum=$(this).attr("id");
	var member = '${member}';
	var memberEmail = '${member.email}';
	alert("member="+member);
	alert(memberEmail);
	if(member==""){
		alert("업져");
		location.href="${pageContext.request.contextPath}/member/login";
	}else{
		alert("member="+member);
		alert(memberEmail);
		location.href="${pageContext.request.contextPath}/project/projectView?projectNum="+projectNum;
		
	}
	
	
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