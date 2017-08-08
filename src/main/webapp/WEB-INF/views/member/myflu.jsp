<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body{
	color: #404040;
}
.main_section{
	min-width: 1460px;
	width: 100%;
	min-height: 1000px;
	background-color: #f2f2f2;
	position: relative;
}

.message_wrap{
	width: 1152px;
	
	margin: 0 auto;
	
}
.message{
	width: 1152px;
	height: 75px;
	background-color: white;
	display: inline-block;
	margin-top: 30px;
}
.page_wrap{
	width: 1152px;
	margin: 0 auto;
}

.page{
	width: 1152px;
	display: inline-block;
	margin-top: 30px;
}

.contents, .side{
	float: left;
}
.contents_header{
	width: 760px;
	padding: 30px;
	background-color: white;
	margin-bottom: 10px;
	border: 1px solid #dedede;
}
.contents_inner{
	width: 760px;
	padding: 30px;
	background-color: white;
	margin-bottom: 10px;
	border: 1px solid #dedede;
}
.contents_inner:LAST-CHILD{
	margin-bottom: 50px;
}

.notice_title label{
	font-size: 18px;
	display: inline-block;
	font-weight: bold;
	padding-bottom: 11px;
	margin-bottom: 9px;
}
.notice_title span{
	float: right;
}
.notice_list li{
	padding-top: 8px;
    padding-bottom: 8px;
    line-height: 15px;
    font-size: 13px;
    border-bottom: 1px solid #eeeeee;
}

.notice_list li:first-child{
	padding-top: 0;
}
.notice_list ul{
	margin-bottom: 15px;
}
.notice_list li p{
	display: inline-block;
}
.notice_list li span{
	float: right;
	
}
.notice_list p span{
	float: right;
	color: #454545;
    line-height: 14px;
    font-size: 12px;
    font-weight: bold;
}


.myproject > span:FIRST-CHILD{
	font-size: 18px;
	display: block;
	font-weight: bold;
	padding-bottom: 11px;
	margin-bottom: 9px;
}

.project1 p:FIRST-CHILD{
	margin-bottom: 10px;
}
.project1{
	margin-bottom: 30px;
}
.project1 table{
	width: 100%;
	margin-bottom: 10px;
	
}
.project1 thead{
	font-size: 14px;
	text-align: left;
	font-weight: bold;
}
.project1 thead th{
	padding: 8px;
    line-height: 1.4;
}
.project1 tbody{
	font-size: 13px;
}
.project1 tbody td{
	border-top: 1px solid #dedede;
	font-size: 13px;
    line-height: 30px;
    padding: 8px;
}
.project1 tbody tr:LAST-CHILD{
	border-bottom: 1px solid #dedede;
}
.project1 p span{
	float: right;
    color: #454545;
    line-height: 14px;
    font-size: 12px;
    font-weight: bold;
}
	
/********************** side ***********************/
.user{
	width: 248px;
	padding : 15px 30px;
	margin-left: 20px;
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

.project_insert{
	width: 248px;
	padding : 15px 30px;
	margin-left: 20px;
	background-color: white;
	margin-bottom: 20px;
	border: 1px solid #dedede;
}

.project_insert label{
	display: block;
	margin-bottom: 10px;
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	color: #555555;
}

.project_insert a{
	display: block;
    padding-left: 30px;
    padding-right: 30px;
    text-align: center;
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.33;
    border-radius: 3px;
    background-color: #d9d9d9;
}

.history{
	width: 248px;
	padding : 15px 30px;
	margin-left: 20px;
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
.history > span:last-child{
	display: block;
    font-size: 18px;
    font-weight: bold;
	padding-bottom: 11px;
    text-align: right;
}
.history > p{
	padding: 7px;
	font-size: 15px;
	line-height: 26px;
}
.price{
	padding-top: 14px;
	border-top: 1px solid #e6e6e6;		
}

.history > p span{
	float: right;
	font-size: 18px;
}

.alarm{
	width: 248px;
	padding : 15px 30px;
	margin-left: 20px;
	background-color: white;
}
.alarm_header{
	display: block;
    font-size: 18px;
    font-weight: bold;
	padding-bottom: 11px;
    border-bottom: 1px solid #dedede;
    margin-bottom: 9px;
}
.alarm_body{
	height: 250px;
}

.alarm_body li{
	padding: 13px 28px 10px 18px;
}
</style>
</head>
<body>
<!-- Channel Plugin Scripts -->
<script>
  window.channelPluginSettings = {
    "plugin_id": "ef582c73-3a40-4525-bb41-a68efc7f806b"
  };
  (function() {
    var node = document.createElement('div');
    node.id = 'ch-plugin';
    document.body.appendChild(node);
    var async_load = function() {
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = '//cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    };
    if (window.attachEvent) {
      window.attachEvent('onload', async_load);
    } else {
      window.addEventListener('load', async_load, false);
    }
  })();
</script>
<!-- End Channel Plugin -->
<c:import url="../temp/header.jsp"></c:import>

<section class="main_section">
	<div class="message_wrap">
		<div class="message">
			로그인 하였습니다.
		</div>
	</div>
	<div class="page_wrap">
	<div class="page">
		
		<div class="contents">
			<div class="contents_header">
				
				
				<p><span style="font-weight: bold; font-size: 26px;">MY FLU</span></p>
			</div>
			<div class="contents_inner">
				<div class="notice">
					<div class="notice_title"><label>공지사항</label><span>페이징</span></div>
					<div class="notice_list">
						<ul>
							<li><span>날짜</span><p><a href="#">공지사항 제목1</a></p></li>
							<li>공지사항2</li>
							<li>공지사항3</li>
						</ul>
						<p>
							<span>더 자세히 보기 ></span>
						</p>
					</div>
				</div>
			</div>
			<div class="contents_inner">
				<div class="myproject">
					
					<span>내 프로젝트</span>
					<div class="interest_project project1">
						<c:if test="${member.kind eq 'client' }"><p>검수중</p></c:if>
						<c:if test="${member.kind eq 'freelancer' }"><p>관심 프로젝트</p></c:if>
						<table>
							<colgroup>
								<col width="45%">
								<col width="15%">
								<col width="13%">
								<col width="20%">
								<col width="*%">
							</colgroup>
							<thead>
								<tr>
									<th>프로젝트 제목</th>
									<th>예상 금액</th>
									<th>예상 기간</th>
									<th>마감일자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
							</tbody>
						</table>
						<p>
							<span>더 자세히 보기 ></span>
						</p>
					</div>
					<div class="proposal_project project1">
						<c:if test="${member.kind eq 'freelancer' }"><p>지원한 프로젝트</p></c:if>
						<c:if test="${member.kind eq 'client' }"><p>지원자 모집중</p></c:if>
						<table>
							<colgroup>
								<col width="45%">
								<col width="15%">
								<col width="13%">
								<col width="20%">
								<col width="*%">
							</colgroup>
							<thead>
								<tr>
									<th>프로젝트 제목</th>
									<th>예상 금액</th>
									<th>예상 기간</th>
									<th>마감일자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
							</tbody>
						</table>
						<p>
							<span>더 자세히 보기 ></span>
						</p>
					</div>
					<div class="contract_project project1">
						<p>진행 중인 프로젝트</p>
						<table>
							<colgroup>
								<col width="45%">
								<col width="15%">
								<col width="13%">
								<col width="20%">
								<col width="*%">
							</colgroup>
							<thead>
								<tr>
									<th>프로젝트 제목</th>
									<th>예상 금액</th>
									<th>예상 기간</th>
									<th>마감일자</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
							
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
								<tr>
									<td>Project Name</td>
									<td>1,000,000원</td>
									<td>180일</td>
									<td>2017년 7월 21일</td>
									<td>관심</td>
								</tr>
							</tbody>
						</table>
						<p>
							<span>더 자세히 보기 ></span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="side">
			<div class="inner">
				<div class="user">
					<c:if test="${member.kind eq 'client' }"><span>클라이언트</span></c:if>
					<c:if test="${member.kind eq 'freelancer' }"><span>프리랜서</span></c:if>
					<div class="user_name">
						<img alt="프로필 사진" src="${pageContext.request.contextPath}/resources/profile/${member.fProfileImage}">
						<span>${member.nickName }</span>
						<a href="/flu/member/personaldataView"><span>기본 정보 수정</span></a>
						
					</div>
				</div>
				<c:if test="${member.kind eq 'client' }">
				<div class="project_insert">
					<label>
						<span>무료로 프로젝트를<br>등록해 보세요</span>
					</label>
					<a href="${pageContext.request.contextPath}/project/projectInsert">프로젝트 등록하기</a>
				</div>
				</c:if>
				<div class="history">
					<span>FLU 히스토리</span>
					<p>지원한 프로젝트<span>0 건</span></p>
					<p>계약한 프로젝트<span>0 건</span></p>
					<p>완료한 프로젝트<span>0 건</span></p>
					<p class="price">누적 완료 금액</p>
					<span>1,000,000 원</span>
				</div>
				<div class="alarm">
					<span class="alarm_header">새로운 소식</span>
					<div class="alarm_body">
						<ul>
							<li>새로운 소식이 없습니다.</li>
						</ul>
					</div>					
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

<c:import url="../temp/footer.jsp"></c:import>


</body>
</html>