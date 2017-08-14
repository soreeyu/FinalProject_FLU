<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />

</head>
<body>


	<div class="contents_quick">
		<div class="real_quick">
		
		<c:forEach items="${quicklist}" var="quick" end="${quickCount}">
			<div class="quick_content">
				<div class="quick_name" id="${quick.projectNum}">${quick.name }</div>
				<div class="quick_regdate" id="${quick.reg_date}"></div>
				<div class="quick_leftDay" id="${quick.finishDate}">남은기간 : 일</div>
				<div class="quick_budget fa fa-won" style="border: none; font-size: 13px;"> 예상금액 : ${quick.budget }</div>
				<div class="quick_period fa fa-clock-o" style="border: none; font-size: 13px;"> 예상기간 : ${quick.period }</div>
				<div class="quick_cate">
				<span class="quick_category">${quick.category }</span> >
				<span class="quick_detailCategory">${quick.detailCategory }</span>
				</div>
				
				<div class="quick_skill">
				<span>요구기술</span>
				
				<br>
				<div class="skill_box">
					<c:forEach items="${quick.skills}" end="2" var="sk">
						<span class="skill-name" style="color: white; font-size: 14px;">${sk}</span>
					</c:forEach>
				</div>
				</div>
			</div>
		</c:forEach>
	</div>

	</div>




	<script type="text/javascript">

	alert("quickCount=${quickCount}");
	var maxCount = '${quickCount}';
	alert("maxCount=="+maxCount);

	var pageCount="";
	
	if(maxCount%5==0){
		pageCount=(maxCount/5).toFixed();		
	}else{
		pageCount=((maxCount/5)).toFixed();
	}
	alert("pageCount=="+pageCount);
	//cc는 기본1로 셋팅


	 $(".preview").click(function() {
		 if(cc==1){
			 alert("첫페이지");
			 alert("cc="+cc);

		 }else{ 

			alert("preview클릭");
			cc=cc-1;
			alert(did);
			did = did+1160;
			alert(did);
			$(".real_quick").css("margin-left", did);
			alert($(".real_quick").css("margin-left"));
			alert("cc="+cc);
		 }
		});


	  $(".next").click(function() {

			
		 if(cc==pageCount){
			alert("마지막 페이지");
			alert("cc="+cc);
			

		}else{
		alert("next클릭");
		cc=cc+1;
		alert(did);
		did = did-1160;
		alert(did);
		$(".real_quick").css("margin-left", did);
		$(".real_quick").css("animation-duration", "1.5s");
		alert($(".real_quick").css("margin-left"));
		alert("cc="+cc);
		}
	});

	
	
	
	
/* 급구 리스트 남을일자 뿌려주기 */
$(".quick_leftDay").each(function() {
	 var finishDate = $(this).attr("id");
	 /* finishDate는 마감일자 */
	var deadline = new Date(finishDate);
	var date = new Date();
	 
	var left = deadline.getTime()-date.getTime();
	var leftDate = Math.ceil(left/(24*60*60*1000));
	
	$(this).html(leftDate+"일");
	
});

/* 등록일자 Date타입으로 바꿔주기 */
$(".quick_regdate").each(function() {
	var rdate = $(this).attr("id");
	var finishDate = new Date(rdate);
	var finishDay = finishDate.getDate();
	var finishMonth = finishDate.getMonth()+1;
	var finishYear = finishDate.getFullYear();
	 
	$(this).text("등록일자 : "+finishYear+"년 "+finishMonth+"월 "+finishDay+"일");
});

/* 뷰로 넘어가기 */
 
 $(".quick_name").click(function() {
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

</script>
</body>
</html>