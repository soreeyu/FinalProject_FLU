<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
thead{
	background-color: #ccddff;
	font-weight: bold;
	font-size: 15px;
}
tbody{
	font-size: 15px;
	text-align: left;
}
th, td{
	padding: 8px;
	border-left: 1px solid #ccccff;
	border-bottom: 1px solid #ccccff;
}
th{
	border-top: 2px solid #339bff;
}
th:FIRST-CHILD,td:FIRST-CHILD{
	border-left: 0;
}
#appformMeet tr:FIRST-CHILD{
	border-top: 2px solid #339bff;
}
#appformMeet th{
	border-top: inherit;
	background-color: #e6f5ff;
	font-weight: bold;
}
.btn-success{
	background-color: rgb(68, 110, 171);
	border-color: rgb(68, 110, 171);

}
</style>
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
						<div class="project-title" id=${dto.projectNum}>${dto.name}</div>
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
							총 
							<c:choose>
							<c:when test="${dto.state eq 'done' }">
								<span style="cursor: pointer;" data-toggle="modal" data-target="#rList-Modal${dto.projectNum}">${dto.appCount}명</span>
							</c:when>
							<c:when test="${dto.state eq 'recruit' }">
								<span style="cursor: pointer;" data-toggle="modal" data-target="#rList-Modal2${dto.projectNum }">${dto.appCount}명</span>
							</c:when>
							<c:otherwise>
								<strong>${dto.appCount}명</strong>
							</c:otherwise>
							</c:choose>
							</div>	
						</div>
						</c:if>
						
						
						<!-- 완료된 프로젝트에 판매버튼 추가하기 -->						
						<c:if test="${dto.state eq 'finish'}">	
						<div class="project-contents-right">
							<button class="projectSellBTN" id="${dto.projectNum}" data-toggle="modal">
							판매하기</button> 
			 			</div>
						</c:if>
						<c:if test="${dto.state eq 'sell' }">
						<div class="project-contents-right">
							<button class="CancleSellBTN" data-id="${dto.projectNum}">
							판매취소</button> 
			 			</div>
						</c:if>
									
						<div style="clear: both;"></div>
						
						
		   <!----------------------- Modal ---------------------------------->
	   
  <!-- 지원자 목록 모달 -->      
	<div class="modal fade" id="rList-Modal${dto.projectNum }" role="dialog">
		<div class="modal-dialog">
    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">계약을 진행 할 사람을 선택 하세요.</h4>
	        </div>
	        <div class="modal-body">
	        <form id="appform" action="/flu/project/applicantCheck" method="post">
	        <input id="hiddenNum" type="hidden" name="projectNum">
	        <table style="display:block; margin:0 auto; width: 70%; text-align: center;">
	        <colgroup>
	        	<col width="317px">
	        	<col width="100px">
	        </colgroup>
	        <thead>
	        <tr>
	        	<th style="text-align: center;">지원자 목록</th>
	        	<th style="text-align: center;">선택 여부</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${applicantList }" var="i" varStatus="o">
	        <c:if test="${i.projectNum eq dto.projectNum }">
	        <tr>
	          <td><label for="${o.index }">${i.email }</label></td>
	          <td style="text-align: center;"><input title="${i.projectNum }" style="vertical-align:bottom;height: 20px;width: 30px;" class="paybox" id="${o.index }" type="checkbox" name="paycheck" value="${i.email }"></td>
	        </tr>
	          <p style="vertical-align:top; font-size: 20px;font-weight: bold;">
	          <span style="margin-left: 30px;"></span></p>
	          </c:if>
	        </c:forEach>
	        </tbody>
	        </table>
	        </form>
	        </div>
	        <div class="modal-footer">
	        	<button class="okbtn btn btn-default" type="button" class="btn btn-default">확인</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
	      </div>
      
    	</div>
	</div>
	
	<!-- 모집완료 모달 -->
	<div class="modal fade" id="rList-Modal2${dto.projectNum }" role="dialog">
		<div class="modal-dialog">
    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">계약금과 프로젝트 시작일을 설정해 주세요</h4>
	        </div>
	        <div class="modal-body">
	        <form id="appformMeet" action="/flu/project/applicantMeet" method="post">
	        <input id="hiddenNum" type="hidden" name="projectNum" value="${dto.projectNum }">
	        <table style="display:block; margin:0 auto; width: 100%; text-align: center;">
	        <colgroup>
	        	<col width="100px">
	        	<col width="180px">
	        	<col width="100px">
	        	<col width="180px">
	        </colgroup>
	        <thead>
	        </thead>
	        <tbody>
	        <c:forEach items="${applicantList }" var="i" varStatus="o">
	        <c:if test="${i.state eq 'meet' && i.projectNum eq dto.projectNum }">
	        <tr>
	        	<th style="text-align: center;">지원자 </th>
	        	<td style="text-align: center;">${i.email }</td>
	        	<th style="text-align: center;">계약금 </th>
	        	<td style="text-align: center;"><input type="text" name="pay"class="form-control"></td>
	        </tr>
	        </c:if>
	        </c:forEach>
	        <tr style="border-bottom: 2px solid #3377ff;">
	        	<th style="text-align: center;border-top: 1px solid #ccccff">시작일</th>
	        	<td><input type="date"class="form-control" name="startDate"></td>
	        	<th style="text-align: center;border-top: 1px solid #ccccff">종료일</th>
	        	<td><input type="date"class="form-control" name="finishDate"></td>
	        </tr>
	        </tbody>
	        </table>
	        </form>
	        </div>
	        <div class="modal-footer">
	        	<button class="okbtn2 btn btn-default" type="button" class="btn btn-default">확인</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
	      </div>
      
    	</div>
	</div>

	


  <!-- Modal -->
  <div class="modal fade" id="sell-Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px; text-align: center;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div><span class="glyphicon glyphicon-edit"></span><span style="font-size: 18px;">프로젝트 판매를 위해 작성해주세요</span></div>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="../../project/pjsellInsert" method="post">
            <div class="form-group">
            <input type="hidden" name="projectNum" class="modal_Num">
            <input type="hidden" name="email" value="${member.email}">
            <input type="hidden" name="state" value="finish">
              <label style="margin-bottom: 10px;"><span class="glyphicon glyphicon-user"></span>판매할 프로젝트 이름</label>
              <input type="text" class="form-control" name="name" value="">
            </div>
            <div class="form-group">
              <i class="fa fa-krw" style="padding-left: 0px; border-right: none;"></i><label style="margin-bottom: 10px;"> 판매 가격</label>
              <input type="number" class="form-control" name="price">
            </div>
             <div class="form-group">
              <label style="margin-bottom: 10px;"><span class="glyphicon glyphicon-eye-open"></span> 프로젝트 설명</label>
              <input type="text" class="form-control" name="contents">
            </div>
         
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Enter</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
      
          <p style="line-height: 30px;">프로젝트 판매 정보는 수정이 불가하니 신중해주세요.</p> 
         
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
	alert('${conState}');
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


/* 판매중인 리스트에서 판매취소하기 */
$(".CancleSellBTN").click(function() {
	
	var ch = confirm("판매를 취소하시겠습니까?");
	if(ch == true){
		
		alert($(this).attr("data-id"));
		var cancle_Id = $(this).attr("data-id");
		/* 판매취소할시, pjsell에서 삭제 + projectstate를 finish로 바꿔줌  */
		$.get("../../project/cancleProjectState?projectNum="+cancle_Id,function(data){
			alert("ddd");
			$.get("projectCheck?state=sell&curPage=1", function(data){
				alert("판매중");
				$("#t1").text("판매중인 프로젝트");
				$("#t2").text("다른 클라이언트에게 제공되는 프로젝트입니다.");
				$(".contents").html(data); 
			});
		});
		
	}else{
		alert("판매 취소가 취소되었습니다.");
	}
});

// 지원자 선택버튼

$(".okbtn").click(function() {
	var pronum =$(".paybox").attr("title");
	$("#hiddenNum").val(pronum);
	
	var checkbox = $("input[name='paycheck']:checked");
	var count =0;
	$(checkbox).each(function() {
		count++;
	});
	if(count == 0){
		alert("지원자를 선택해 주세요")
	}else{
		$("#appform").submit();
	}
	
});


//계약 버튼
$(".okbtn2").click(function() {
	
	var pay = $("input[name='pay']:text");
	var paycheck = 0;
	var length = 0;
	$(pay).each(function() {
		if($(this).val() != ""){
			$(this).css("border", "1px solid #ccc");
			paycheck++;
		}else{
			$(this).css("border", "1px solid red");
		}
		length++;
	});
	var startDate = $("input[name='startDate']").val();
	var finishDate = $("input[name='finishDate']").val();
	if(startDate == ""){
		$("input[name='startDate']").css("border", "1px solid red");
	}else{
		$("input[name='startDate']").css("border", "1px solid #ccc");
	}
	if(finishDate == ""){
		$("input[name='finishDate']").css("border", "1px solid red");
	}else{
		$("input[name='finishDate']").css("border", "1px solid #ccc");
	}
	var datecheck = 0;
	if(startDate != "" && finishDate != ""){
	if(startDate > finishDate){
		$("input[name='startDate']").css("border", "1px solid red");
		$("input[name='finishDate']").css("border", "1px solid red");
		datecheck = 1;
	}else{
		$("input[name='startDate']").css("border", "1px solid #ccc");
		$("input[name='finishDate']").css("border", "1px solid #ccc");
		datecheck =0;
	}
	}
	
	if(paycheck == length && startDate !="" && finishDate != "" && datecheck ==0){
		$("#appformMeet").submit();
	}else{
		alert("실패");
	}
	
});

	
	</script>
</body>
</html>