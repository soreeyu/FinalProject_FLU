<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.main_section{
	min-width: 1460px;
	width: 100%;
	min-height: 1000px;
	background-color: #f2f2f2;
}

.page_wrap{
	min-width: 1152px;
	width: 1152px;
	height: 100%;
	margin: 0 auto;
	margin-top: 30px;
}

.left{
	width: 352px;
	height: 100%;
	float: left;
}

.right{
	width: 800px;
	height: 100%;
	float: left;
}


.user{
	width: 248px;
	padding : 15px 30px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}
.user > span{
	font-size: 18px;
	display: block;
	font-weight: bold;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 9px;
}
.user_name{
	display: inline-block;
}

.user_name > img{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	float: left;
	border: 1px solid #dedede;
}
.user_name > span{
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}
.user_name > a{
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}

.user_name > a span{
	font-size: 12px;
	color: blue;
}

.history{
	width: 248px;
	padding : 15px 30px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}
.history > span:first-child{
	display: block;
    font-size: 18px;
    font-weight: bold;
	padding-bottom: 11px;
    border-bottom: 1px solid #dedede;
    margin-bottom: 9px;
}

.history > p{
	padding: 7px;
	font-size: 17px;
	line-height: 25px;
}

.history > p:HOVER{

cursor: pointer;
background-color: #446eab;
color: white;

}


.title{
	width: 800px;
	height: 100px;
	background-color: white;
	border: 1px solid #dedede;
}

.contents{

	width: 800px;
	height: 100%;
	background-color: white;
	margin-top: 15px;
	border: 1px solid #dedede;
}




#detail{
width: 120px;

}

</style>
<script type="text/javascript">

	$(function() {
	
		$('#projectBTN').click(function() {
			
			var from = $("#frm")[0];
			
			var formData = new FormData(from);
			
		 	$.ajax({
		 		
				url: "checkProjectDoneList",
				processData:false,
				contentType:false,
				type: "GET",
				data: formData,
				success:function(data){
					data = data.trim();
					$('.right').html(data);
				}
				
			}) 

			
		});
		
		
		$('#freelancerBTN').click(function() {
			
			var from = $("#frm")[0];
			
			var formData = new FormData(from);
			
		 	$.ajax({
		 		
				url: "checkProjectFinishList",
				processData:false,
				contentType:false,
				type: "GET",
				data: formData,
				success:function(data){
					data = data.trim();
					$('.right').html(data);
				}
				
			}) 

			
		});
		
		
		
		
		
		
		
		
		
	$('select[name=category]').change(function() {
		
		var i = $(this).val();
		
		if(i=='개발'){
			$('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>');
		}else{
			$('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="제품">제품</option><option value="프레젠테이션">프레젠테이션</option><option value="인쇄물">인쇄물</option><option value="쇼핑몰">쇼핑몰</option><option value="로고">로고</option><option value="그래픽">그래픽</option><option value="영상">영상</option><option value="게임">게임</option><option value="기타">기타</option></select>');
		}
		
		
	});
	
	
	$('select[name=detailCategory]').change(function() {
		
		if(${board=='project'}){
			$('#frm').attr('action',"./checkProjectList");	
		}else{
			$('#frm').attr('action',"./checkCashList");	
		}
		$('#frm').submit();
		
	});
	
	$('#result').on('change','select[name=detailCategory]',function(){
		if(${board=='project'}){
			$('#frm').attr('action',"./checkProjectList");	
		}else{
			$('#frm').attr('action',"./checkCashList");	
		}
		$('#frm').submit();
	});
	
	
	$('#btn').click(function() {
		
		if(${board=='project'}){
			$('#frm').attr('action',"./checkProjectList");	
		}else{
			$('#frm').attr('action',"./checkCashList");	
		}
		
		$('#frm').submit();
		
	});

	
	 $("select[name=category] option").each(function(){
		    if($(this).val()=="${listInfo.category}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	
	 $("select[name=detailCategory] option").each(function(){
		    if($(this).val()=="${listInfo.detailCategory}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	 
	 $("select[name=kind] option").each(function(){
		    if($(this).val()=="${listInfo.kind}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
	 });
	 
});
	
	
	

</script>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>


<section class="main_section">
<section class="page_wrap">
	<article class="left">
				<div class="user">
					<span>프리랜서</span>
					<div class="user_name">
						<img alt="프로필 사진" src="${pageContext.request.contextPath}/resources/img/FLU.png">
						<span>닉네임</span>
						<a><span>기본 정보 수정</span></a>
					</div>
				</div>
				<div class="history">
					<c:if test="${board=='done'}">
					<p id="projectBTN">검수 전 프로젝트</p>
					<p id="freelancerBTN">완료된 프로젝트</p>
					</c:if>
					<c:if test="${board=='finish'}">
					<p id="projectBTN">진행 전 프로젝트</p>
					<p id="freelancerBTN">프리랜서 대금관리</p>
					</c:if>
				</div>
				
	</article>
	<article class="right">
	

	</article>
		

</section>







</section>
<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>