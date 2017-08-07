<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


		<!-- 프로젝트 각각 -->	
			<c:forEach items="${list}"  var="dto">
			
				<div class="project-unit">
					<div class="project-head">
						<div class="project-title" id=${dto.projectNum}>${dto.name} ${dto.projectNum}</div>
					</div>
					<div class="project-body">
						<div class="project-info">
							<div class="fa fa-won" style="padding-left: 0px;">예상금액 ${dto.budget}원</div>
							<div class="fa fa-clock-o">예상기간 ${dto.period}일</div>
							<div class="fa-reg_date">등록일자 ${dto.reg_date}</div>
						</div>
						<div class="project-contents">${dto.contents }</div>
						
						<c:if test="${dto.state eq 'done' || dto.state eq 'recruit' || dto.state eq 'ing' }">
						<div class="project-contents-right">
							<c:if test="${dto.state eq 'done'}">
							<div class="right-contents-sub">
							<img src="${pageContext.request.contextPath}/resources/img/project/clock-closed.png">
							마감<span class="deadline" id="${dto.finishDate}"></span></div>
							</c:if>
							<div class="right-contents-sub">
							<img src="${pageContext.request.contextPath}/resources/img/project/proposal-user.png">
							총 <strong>${dto.appCount}명</strong></div>	
						</div>
						</c:if>
						
						
						<!-- 완료된 프로젝트에 판매버튼 추가하기 -->						
						<c:if test="${dto.state eq 'finish'}">
						<div class="project-contents-right">
							<button class="projectSellBTN" id="${dto.projectNum}" data-toggle="modal" data-target="#sell-Modal">
							판매하기</button> 
			 			</div>
						</c:if>
									
						<div style="clear: both;"></div>
						
						
		   <!----------------------- Modal ---------------------------------->
        

  <!-- Modal -->
  <div class="modal fade" id="sell-Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-edit"></span>  프로젝트 판매를 위해 작성해주세요</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="../../project/pjsellInsert" method="post">
            <div class="form-group">
            <input type="hidden" name="projectNum" class="modal_Num">
            <input type="hidden" name="email" value="${member.email}">
            <div>프로젝트 Num : <span class="modal_Num"></span></div>
              <label><span class="glyphicon glyphicon-user"></span>판매할 프로젝트 이름</label>
              <input type="text" name="name">
            </div>
            <div class="form-group">
              <label><span class="glyphicon glyphicon-eye-open"></span> 판매 가격</label>
              <input type="number" class="form-control" name="price">
            </div>
             <div class="form-group">
              <label><span class="glyphicon glyphicon-eye-open"></span> 프로젝트 설명</label>
              <input type="text" class="form-control" name="contents">
            </div>
         
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Enter</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
      
          <p>프로젝트 판매 정보는 수정이 불가하니 신중해주세요.</p>
         
        </div>
      </div>
      
    </div>
  </div> 
          
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<div class="project-bottom">
							<span class="main-cate">${dto.category }</span>
							<span class="sub-cate">${dto.detailCategory }</span>
							<div class="skill-box">
								<span class="skill-main">요구기술</span>
						
							<c:forEach items="${dto.skills}" end="4" var="sk">
								 <span class="skill-name" style="color: white; font-size: 13px;">${sk}</span>
							
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
	var state = "${list[0].state}";
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
			$.get("projectCheck?curPage="+preview+"&state="+state, function(data) {
				$(".contents").html(data);
				
			}); 
			
		});
	
	 $(".num").click(function() {
		var pageNum = $(this).attr("id");
		alert(pageNum);
		
		   $.get("projectCheck?curPage="+pageNum+"&state="+state, function(data) {
			$(".contents").html(data);
			document.body.scrollTop = 0;
		});   
	});
	 
	
	 $("#nextview").click(function() {
			alert("nextview");
			$.get("projectCheck?curPage="+next+"&state="+state, function(data) {
				   alert("다음블록")
				$(".contents").html(data);
				  
			}); 
			
		});
	 
	 
	 /* 프로젝트뷰로 넘어가기 */
	 
	$(".project-title").click(function() {
	var projectNum=$(this).attr("id");
	var memberEmail = '${member.email}';
	
	location.href="../../project/projectView?projectNum="+projectNum;
	
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
		 
		if(leftDate<7){
			$(".deadline").css("color", "red");
		}
	});

	
/* 완료된 프로젝트 판매하기 */
$(".projectSellBTN").click(function() {
	alert("모달");
	alert($(this).attr("id"));
	var sell_Id = $(this).attr("id");
	$(".modal_Num").html(sell_Id);
	$(".modal_Num").val(sell_Id);
	$("#sell-Modal").modal();
});
	 
	
	</script>
</body>
</html>