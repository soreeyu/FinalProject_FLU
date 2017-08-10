<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    background-color: #339bff;
    color: white;
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
.alert {
	padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 2px;
}
.alert-success{
	background-color: #e0f4fa;
    border-color: #caecf6;
    color: #2099bb;
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

	<div class="page_wrap">
	<div class="page">
		
		<div class="contents">
			<div class="contents_header">			
				<p><span style="font-weight: bold; font-size: 26px;">MY FLU</span></p>
			</div>
			<div class="contents_inner">
				<div class="notice">
					<div class="notice_title"><label>공지사항</label></div>
					<div class="notice_list">
						<ul>
							<li><span>날짜</span><p><a href="#">공지사항 제목1</a></p></li>
							<li>공지사항2</li>
							<li>공지사항3</li>
						</ul>
						<p>
							<span><a href="">더 자세히 보기 ></a></span>
						</p>
					</div>
				</div>
			</div>
			<div class="contents_inner">
				<div class="myproject">
					
					<span>내 프로젝트</span>
					<div class="interest_project project1">
						<c:if test="${member.kind eq 'client' }"><p>검수중</p></c:if>
						<c:if test="${member.kind eq 'freelancer' }"><p>완료한 프로젝트</p></c:if>
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
								</tr>
							</thead>
							<tbody>
								<c:if test="${member.kind eq 'freelancer' && not empty finList}">
								<c:forEach begin="0" end="2" var="i">
								<tr>
									<td><a href="${pageContext.request.contextPath}/project/projectView?projectNum=${finList[i].projectNum}">${finList[i].name}</a></td>
									<td>${finList[i].budget}</td>
									<td>${finList[i].period}</td>
									<td>${finList[i].finishDate}</td>
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${member.kind eq 'client' && not empty chkList}">
								<c:forEach begin="0" end="2" var="i">
								<tr>
									<td><a href="${pageContext.request.contextPath}/project/projectView?projectNum=${chkList[i].projectNum}">${chkList[i].name}</a></td>
									<td>${chkList[i].budget}</td>
									<td>${chkList[i].period}</td>
									<td>${chkList[i].finishDate}</td>
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty finList && member.kind eq 'freelancer'}">
								<tr>
									<td colspan="4">완료한 프로젝트가 없습니다.</td>
								</tr>
								</c:if>
								<c:if test="${empty chkList && member.kind eq 'client'}">
								<tr>
									<td colspan="4">검수중인 프로젝트가 없습니다.</td>
								</tr>
								</c:if>
							</tbody>
						</table>
						<p>
							<c:if test="${member.kind eq 'client' }">
							<span><a href="${pageContext.request.contextPath}/member/client/clientproject">더 자세히 보기> </a></span>
							</c:if>
							<c:if test="${member.kind eq 'freelancer' }">
							<span><a href="${pageContext.request.contextPath}/member/freelancer/myproject">더 자세히 보기> </a></span>
							</c:if>
						</p>
					</div>
					<div class="proposal_project project1">
						<c:if test="${member.kind eq 'freelancer'}"><p>지원한 프로젝트</p></c:if>
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
								</tr>
							</thead>
							<tbody>
							<c:if test="${member.kind eq 'freelancer' && not empty appList}">
								<c:forEach begin="0" end="2" var="i">
								<tr>
									<td><a href="${pageContext.request.contextPath}/project/projectView?projectNum=${appList[i].projectNum}">${appList[i].name}</a></td>
									<td>${appList[i].budget}</td>
									<td>${appList[i].period}</td>
									<td>${appList[i].finishDate}</td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${member.kind eq 'client'&& not empty recList}">
								<c:forEach begin="0" end="2" var="i">
								<tr>
									<td><a href="${pageContext.request.contextPath}/project/projectView?projectNum=${recList[i].projectNum}">${recList[i].name}</a></td>
									<td>${recList[i].budget}</td>
									<td>${recList[i].period}</td>
									<td>${recList[i].finishDate}</td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty appList && member.kind eq 'freelancer'}">
								<tr>
									<td colspan="4">지원한 프로젝트가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${empty recList && member.kind eq 'client'}">
								<tr>
									<td colspan="4">모집중인 프로젝트가 없습니다.</td>
								</tr>
							</c:if>								
							</tbody>
						</table>
						<p>
							<c:if test="${member.kind eq 'client' }">
							<span><a href="${pageContext.request.contextPath}/member/client/clientproject">더 자세히 보기> </a></span>
							</c:if>
							<c:if test="${member.kind eq 'freelancer' }">
							<span><a href="${pageContext.request.contextPath}/member/freelancer/myproject">더 자세히 보기> </a></span>
							</c:if>
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
								</tr>
							</thead>
							<tbody>
							<c:if test="${not empty ingList && member.kind eq 'freelancer'}">
								<c:forEach begin="0" end="2" var="i">
								<tr>
									<td><a href="${pageContext.request.contextPath}/project/projectView?projectNum=${ingList[i].projectNum}">${ingList[i].name}</a></td>
									<td>${ingList[i].budget}</td>
									<td>${ingList[i].period}</td>
									<td>${ingList[i].finishDate}</td>	
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${not empty ingcList && member.kind eq 'client'}">
								<c:forEach begin="0" end="2" var="i">
								<tr>
									<td><a href="${pageContext.request.contextPath}/project/projectView?projectNum=${ingcList[i].projectNum}">${ingcList[i].name}</a></td>
									<td>${ingcList[i].budget}</td>
									<td>${ingcList[i].period}</td>
									<td>${ingcList[i].finishDate}</td>	
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty ingList && empty ingcList}">
								<tr>
									<td colspan="4">
										진행중인 프로젝트가 없습니다.
									</td>
								</tr>
							</c:if>
							</tbody>
						</table>
						<p>
							<c:if test="${member.kind eq 'client' }">
							<span><a href="${pageContext.request.contextPath}/member/client/clientproject">더 자세히 보기> </a></span>
							</c:if>
							<c:if test="${member.kind eq 'freelancer' }">
							<span><a href="${pageContext.request.contextPath}/member/freelancer/myproject">더 자세히 보기> </a></span>
							</c:if>						
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
						<c:choose>
						<c:when test="${empty member.fProfileImage}">
							<img class="user-img" alt="" src="${pageContext.request.contextPath}/resources/img/mypage/avatar.jpg">							
						</c:when>
						<c:when test="${not empty member.fProfileImage}">
						<img alt="프로필 사진" src="${pageContext.request.contextPath}/resources/profile/${member.fProfileImage}">
						</c:when>
						</c:choose>
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
					<c:if test="${member.kind eq 'freelancer'}">
					<p>지원한 프로젝트<span>${appCount} 건</span></p>
					<p>진행중 프로젝트<span>${ingCount} 건</span></p>
					<p>완료한 프로젝트<span>${finCount} 건</span></p>
					<p class="price">누적 완료 금액</p>
					<span>
					<fmt:formatNumber value="${pay}" type="currency" currencySymbol="￦"/>
					</span>						
					</c:if>
					<c:if test="${member.kind eq 'client'}">
					<p>등록한 프로젝트<span>${insCount} 건</span></p>
					<p>진행중 프로젝트<span>${ingCount} 건</span></p>
					<p>완료한 프로젝트<span>${finCount} 건</span></p>
					<p class="price">누적 완료 금액</p>
					<span><fmt:formatNumber value="${budget}" type="currency" currencySymbol="￦"/></span>
					</c:if>
				</div>
				<div class="alarm">
					<span class="alarm_header">새로운 소식</span>
					<div class="alarm_body">
						<ul>
							<c:if test="${not empty alrList}">
								<c:forEach begin="0" end="5" var="a">
									<li style="white-space: nowrap; text-overflow : ellipsis; overflow: hidden;"><a href="${pageContext.request.contextPath}/alarm/alarmList">${alrList[a].contents}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${empty alrList}">
							<li>새로운 소식이 없습니다.</li>							
							</c:if>
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