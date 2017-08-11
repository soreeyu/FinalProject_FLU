<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
.main_section {
	min-width: 1460px;
	width: 100%;
	min-height: 1000px;
	background-color: #f2f2f2;
}

.page_wrap {
	min-width: 1152px;
	width: 1152px;
	height: 100%;
	margin: 0 auto;
	margin-top: 30px;
}

.left {
	width: 352px;
	height: 100%;
	float: left;
}

.right {
	width: 800px;
	height: 100%;
	float: left;
}

.user {
	width: 248px;
	padding: 15px 30px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}

.user>span {
	font-size: 18px;
	display: block;
	font-weight: bold;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 9px;
}

.user_name {
	display: inline-block;
}

.user_name>img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	float: left;
	border: 1px solid #dedede;
}

.user_name>span {
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}

.user_name>a {
	width: 150px;
	display: inline-block;
	padding-left: 10px;
	float: left;
	line-height: 25px;
}

.user_name>a span {
	font-size: 12px;
	color: blue;
}

.history {
	width: 248px;
	padding: 15px 30px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}

.history>span:first-child {
	display: block;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	margin-bottom: 9px;
}

.history>p {
	padding: 7px;
	font-size: 17px;
	line-height: 25px;
	margin-top: 5px;
}

.history>p:HOVER {
	cursor: pointer;
}

.title {
	width: 800px;
	height: 100px;
	background-color: white;
	border: 1px solid #dedede;
}

#t1{

	font-size: x-large;
	margin-top: 20px;
	margin-left: 30px;
	font-weight: bolder;
	color: rgb(85, 85, 85);
	
}

#t2{

	font-size: medium;
	margin-top: 15px;
	margin-left: 30px;
	font-weight: normal;
	color: #999;

}


.contents {
	width: 800px;
	height: 100%;
	background-color: white;
	margin-top: 15px;
	border: 1px solid #dedede;
}

#detail {
	width: 120px;
}


.tavle{

	width: 750px;
	height: 100%;
	margin: 0 auto;
	margin-top: 20px;
}

table{

width: 100%;

}

thead tr td{
	
	height: 30px;
	font-size: 1.0em;
	font-weight: bold;
	color: gb(85, 85, 85);
	text-align:  center;
	line-height: 25px;
	border-bottom: 2px solid #005580;
	
}


.yui .tbody_td1{
	
	width: 15%;
	font-size: 0.8em;
	height: 30px;
	line-height: 25px;
	text-align:  center;
	border-bottom: 0.5px solid #d0e2e2;

	
}

.yui .tbody_td2{
	
	width: 35%;
	font-size: 0.8em;
	height: 30px;
	line-height: 25px;
	text-align:  center;
	border-bottom: 0.5px solid #d0e2e2;

}
.yui .tbody_td3{
	
	width: 25%;
	font-size: 0.8em;
	height: 30px;
	line-height: 25px;
	text-align:  center;
	border-bottom: 0.5px solid #d0e2e2;

}
.yui .tbody_td4{
	
	width: 25%;
	font-size: 0.8em;
	height: 30px;
	line-height: 25px;
	text-align:  center;
	border-bottom: 0.5px solid #d0e2e2;

}


.label{
    display: inline;
    padding: .2em .6em .2em;
    font-size: 75%;
    font-weight: bold;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .2em;
    background-color: #00b8e6;
}

.select_kind{

    width: 70px;
    height: 30px;
    border: 1px solid rgb(203, 203, 180);
    background-color: rgb(245, 245, 240);
    border-radius: 0.1px;

}

#search{

    width: 200px;
    height: 27px;
    border: 1px solid rgb(203, 203, 180);
    background-color: rgb(245, 245, 240);
    border-radius: 0.1px;

}

#btn{

width: 80px;
height: 30px;
border: 1px solid #2099bb;
background-color: #339bff;
color: white;
border-radius: 3px;

}

.search_form{

	float: right;
	margin-right: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
	border: 1px solid #dedede;
	
}


.search_form1{
	
	width: 280px;
	height: 30px;
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	
}

.search_form2{

	width: 370px;
	height: 30px;
	margin-left: 10px;
	margin-bottom: 10px;
	margin-right: 10px;
}


</style>
<script type="text/javascript">


	$(function() {
		
		var board = '${board}';
		
		if(board=='Client'){
			$('#clientBTN').css('background-color', '#446eab');
		 	$('#clientBTN').children("#client").css('color', 'white');	
			$('#freelancerBTN').css('background-color', 'white');
		 	$('#freelancerBTN').children("#freelancer").css('color', 'black');
		}else if(board=='Freelancer'){
			$('#freelancerBTN').css('background-color', '#446eab');
		 	$('#freelancerBTN').children("#freelancer").css('color', 'white');	
			$('#clientBTN').css('background-color', 'white');
		 	$('#clientBTN').children("#client").css('color', 'black');
		}
		
	$('#btn').click(function() {
		
		if(board=='Client'){
			
			$('#frm').attr('action',"./checkMemberClientList");
			$('#frm').submit();
			
		}else{
			
			$('#frm').attr('action',"./checkMemberFreelancerList");
			$('#frm').submit();
			
		}
		
		
	});
	
	
	//검색 결과
	
		$("select[name=kind] option").each(function() {
			if ($(this).val() == "${listInfo.kind}") {
				$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
			}
		});

		
		$("input[name=type]").each(function() {
			if ($(this).val() == "${listInfo.type}") {
				$(this).attr("checked", "checked");
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
						<img alt="프로필 사진"
							src="${pageContext.request.contextPath}/resources/img/FLU.png">
						<span>닉네임</span> <a><span>기본 정보 수정</span></a>
					</div>
				</div>
				<div class="history">
					<c:if test="${board=='Client' or board=='Freelancer'}">
						<p id="clientBTN">
							<a id="client" href="./checkMemberClientList">클라이언트 관리</a>
						</p>
						<p id="freelancerBTN">
							<a id="freelancer" href="./checkMemberFreelancerList">프리랜서 관리</a>
						</p>
					</c:if>
				</div>

			</article>
			<article class="right">
				<div class="title">
					<c:if test="${board=='Client'}">
						<p id="t1">클라이언트 신원확인</p>
						<p id="t2">클라이언트들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
					<c:if test="${board=='Freelancer'}">
						<p id="t1">프리랜서 신원확인</p>
						<p id="t2">프리랜서들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
					</c:if>
				</div>

				<div class="contents">
					<form id="frm" action="">
						<div class="search_form">
							<div class="search_form1">
								<span class="label">전체</span><input type="radio" value="" name="type" checked="checked">
								<span class="label">개인</span><input type="radio" value="개인" name="type">
								<span class="label">팀</span><input type="radio" value="팀" name="type" >
								<span class="label">사업자</span><input type="radio" value="사업자" name="type" >
							</div>
							<div class="search_form2">
								<select name="kind" class="select_kind">
									<option value="name">이름</option>
									<option value="email">이메일</option>
								</select>
								<input type="text" name="search" id="search" value="${listInfo.search}">
								<input type="button" value="검색" id="btn">
							</div>
						</div>
					</form>

			<div class="tavle">
					<table class="yui">
					<thead>
						<tr>
							<td class="td1">형태</td>
							<td class="td3">E-mail</td>
							<td class="td2">이름</td>
							<td class="td4">상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="i">
							<tr>
								<td class="tbody_td1">${i.type }</td>
								<td class="tbody_td2"><a href="../member/personaldataView?email=${i.email}">${i.email }</a></td>
								<td class="tbody_td3"><a href="../member/personaldataView?email=${i.email}">${i.name }</a></td>
								<td class="tbody_td4">
								<c:if test="${i.authenticState=='1'}">신원미상</c:if>
								<c:if test="${i.authenticState=='2'}">신원확인완료</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
			</div>

				</div>

			</article>


		</section>

	</section>


	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>