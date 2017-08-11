<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"/>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#search_btn").click(function() {
		var kind = $("#select_kind").val();
		var search = $("#select_search").val();
			
		location.href="myMeetRoom?curPage=1&kind="+kind+"&search="+search;
		});
		
		
		$(".btn").click(function() {
			var num = $(this).attr("title");
			location.href = "../meetRoom/reservation/reservationDel?num="+num;
		});
		
		$(".del_btn").click(function() {
			var num = $(this).attr("title");
			var email = $(this).attr("lang");
			location.href = "../meetRoom/reservation/reserveDelete?num="+num+"&email="+email;
		});
		
	});
</script>
<style type="text/css">
* {
	box-sizing: border-box;
}
*:before{
	content: " ";
    display: table;
    line-height: 0;
}
.main_section {
	min-width : 1460px;
	width : 100%;
	height: 1500px;
}

.page {
	margin-left: auto;
    margin-right: auto;
    width: 1152px;
    margin-top: 30px;
}

.contents{
	display: inline;
    float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 790px;
}
.contents-header {
    margin: 0;
    margin-bottom: 5px;
    background-color: #fff;
    border-radius: 3px;
    border-bottom-width: 2px;
    padding: 30px;
    border: 1px solid #dedede;
  
}
.contents-header:before, .contents-header:after {
    content: " ";
    display: table;
    line-height: 0;
}
.contents-header .header-text {
    margin: 0;
    font-family: inherit;
    font-weight: 700;
    line-height: 1.1;
    color: inherit;
    text-rendering: optimizelegibility;
}
.small-text {
    margin-top: 10px;
    display: block;
    font-weight: normal;
    line-height: 1;
    color: #999;
}
.contents-inner {
	padding: 30px;
	width: 790px;
	background-color: #fff;
    border-radius: 3px;
    border-bottom-width: 2px;
}
.reserve_list {
	width: 100%;
	border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
	
}
.reserve_header	{
	padding: 10px;
    font-weight: bold;
    font-size : 15px;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}

.reserve_body >td {
	width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    white-space: nowrap;
	text-overflow : ellipsis; 
}
.pagination-wrapper	{
    text-align: center;
    height: 100%;
}
.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 10px 0;
    vertical-align: top;
}
/******************************** 왼쪽 메뉴 *******************************/
.side{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 250px;
}

.freelancer_name{
	background-color:white;
	padding: 15px;
	margin-bottom: 15px;
}
.freelancer_name > span:FIRST-CHILD{
	font-size: 16px;
	display: block;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	font-weight: 700;
	margin-bottom: 9px;
	color: #454545;
}
.free_img_div{
	width: 220px;
	font-size: 17px;
    color: #333333;
    font-weight: bold;
    text-align: center;
    
}
.free_img_div img{
	width: 216px;
    height: 216px;
    border: 1px solid #dedede;
    border-radius: 10%;
    
}
.free_img_div span{
	margin-top: 20px;
}

.sidebar_menu ul{
	border: 1px solid #dedede;
    border-radius: 3px;
    padding: 4px 8px;
    background-color: white;
    margin-bottom: 10px;
    padding-bottom: 10px;
}
.sidebar_menu ul li{
	height: 40px;
    padding: 4px 0;
}
.sidebar_menu ul li a{
	border-radius: 2px;
    display: block;
    padding: 10px 15px;
    font-size: 14px;
    color: #999;
    line-height: 1.4;
    
}
/******************************** 왼쪽 메뉴 *******************************/
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	<section class="main_section">
	<div class="page">
		<div class="page_inner">
			<div class="side">
				<div class="freelancer_name">
					<c:if test="${member.kind eq 'client' }"><span>클라이언트</span></c:if>
					<c:if test="${member.kind eq 'freelancer' }"><span>프리랜서</span></c:if>
					<div class="free_img_div">
						<c:if test="${empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/img/mypage/avatar.jpg">
						</c:if>
						<c:if test="${not empty member.fProfileImage }">
						<img alt="프로필사진" src="${pageContext.request.contextPath }/resources/profile/${member.fProfileImage}">
						</c:if>
						<label style="display: block;"><span>${member.nickName}</span></label>
					</div>
				</div>
				<div class="sidebar_menu">
					<ul>
						<li><a class="menu" href="${pageContext.request.contextPath}/member/myMeetRoom" style="background-color: #446eab; color: white;">예약현황</a></li>
					</ul>
				</div>
			</div>
			<div class="contents">
				<div class="contents-header">
					<h3 class="header-text">
						예약현황
						<c:if test="${member.kind eq 'admin' }">
						<small class="small-text">회원들의 미팅룸 예약 현황을 확인할 수 있습니다.</small>
						</c:if>
						<c:if test="${ member.kind ne 'admin'}">
						<small class="small-text">자신이 예약한 미팅룸의 현황을 확인할 수 있습니다.</small>
						</c:if>
					</h3>
				</div>
				<div class="contents-inner">
					<table class="reserve_list" style="text-align: center;">
						<tr class="reserve_header">
							<td>예약자</td>
							<td>방이름</td>
							<td>예약날짜</td>
							<td>예약인원</td>
							<td>예약시간</td>
							<td>가격</td>
							<td>비고</td>		
						</tr>
					<c:forEach items="${list}" var="i">
						<tr class="reserve_body">
						<td>${i.reserve_name}</td>
						<td><a href="../meetRoom/meetView?num=${i.snum}">${i.name}</a></td>
						<td>${i.reserve_date}</td>
						<td>${i.human}</td>
						<td>${i.time}</td>
						<td><fmt:formatNumber value="${i.price}" type="currency"/></td>
						<c:if test="${i.state eq 'finish'}">
						<c:if test="${member.kind ne 'admin' }">
						<td><input type="button" value="예약취소" class="btn" title="${i.num}"></td>										
						</c:if>
						<c:if test="${member.kind eq 'admin' }">
						<td>결제완료</td>
						</c:if>
						</c:if>
						
						<c:if test="${i.state eq 'del'}">
						<c:if test="${member.kind eq 'admin'}">
						<td><input type="button" value="취소확인" class="del_btn" title="${i.num}" lang="${i.email}"></td>
						</c:if>
						<c:if test="${member.kind ne 'admin'}">
						<td>예약취소대기중</td>
						</c:if>
						</c:if>
						</tr>					
					</c:forEach>
					</table>
				</div>
				
				
			<c:if test="${member.kind eq 'admin'}">
			<div class="search" style="margin-top: 20px;">
				<select name="kind" id="select_kind" style="height: 25px;">
					<option value="name">세부공간명</option>
					<option value="reserve_name">예약자</option>
					<option value="reserve_date">예약날짜</option>
					<option value="human">예약인원</option>
					<option value="price">가격</option>
				</select>
				<input type="text" placeholder="검색어를 입력해주세요" name="search" id="select_search" style="height: 25px;">
				<input type="button" value="검색" id="search_btn" style="height: 25px;">
			</div> 
			</c:if>
				
				
				
			<div class="pagination-wrapper">
				<c:if test="${listInfo.curBlock > 1}">
					<span class="block">
					<a href="meetList?curPage=${listInfo.startNum-1}">&lt;
					Prior
					</a>
					</span>
				</c:if>
				<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}"
					var="y">
					<span class="pagination"><a href="myMeetRoom?curPage=${y}">${y}</a></span>
				</c:forEach>
				<c:if test="${listInfo.curBlock < listInfo.totalBlock}">
					<span class="block">
					<a href="meetList?curPage=${pageResult.lastNum+1}">Next &gt;</a>
					</span>
				</c:if>
			</div>
				
			</div>
		</div>
	</div>
	
	</section>
<c:import url="/WEB-INF/views/temp/footer.jsp"/>

	
</body>
</html>