<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootstrap.jsp"/>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#search_btn").click(function() {
		var kind = $("#select_kind").val();
		var search = $("#select_search").val();
			
		location.href="meetList?curPage=1&kind="+kind+"&search="+search;
		});
		
		
		
		
		
	});
	

</script>
<style type="text/css">
.main_section {
    width: 1160px;
    min-height: 1000px;
    height: 1300px;
    margin: 0 auto;
    margin-top: 30px;
}

.meetRoom_header {
    height: 60px;
    padding: 30px;
    margin-bottom: 20px;
    border: 1px solid #e6e6e6;
    margin-bottom: 30px;
    background-color: white;
}
#header_tit1 {
	font-size: x-large;
    font-weight: bolder;
    margin-bottom: 10px;
}
#heaer_tit2{
	font-size: small;
    font-weight: lighter;
}

.Room{
	width : 30%;
	float: left;
	position: relative;
	padding: 13px;		
}
.search {
	float: right;
}
.Room_Img {
	display: block;
    position: relative;
    overflow: hidden;
	width: 345px;
	height: 261px;
	box-shadow: 2px 2px 8px grey;
	border-radius: 10px;
}
.Room_Img  img {
	width : 100%;
	height: 100%;
}
.InfoArea{
	position: relative;
    padding: 18px 20px 14px;
    background-color: #fff;
    overflow : hidden;
    white-space: nowrap;
	text-overflow : ellipsis;  
	box-shadow: 2px 2px 8px grey;
	border-radius: 10px;
	margin-top: 10px;
}
.info {
	padding-bottom: 10px;
}

.contents_bottom {
    margin-top: 30px;
    width: 100%;
    height: 16px;
    float: left;
}
.contents_paging{
	width: 380px;
	margin: 0 auto;
	text-align: center;
	font-weight: bold;
}
.contents_paging span{
	cursor: pointer;
}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section class="main_section">
	
	<div class="meetRoom_header">
		<div class="header_txt">
			<p id="header_tit1">미팅룸 찾기</p>
			<p id="header_tit2"><!-- 개의 미팅룸이 있습니다. --></p>
			
			<div class="search">
				<select name="kind" id="select_kind" style="height: 25px; vertical-align: top;">
					<option value="name">업체명</option>
					<option value="addr_main">지역</option>
				</select>
				<input type="text" placeholder="검색어를 입력해주세요" name="search" id="select_search" style="height: 20px; vertical-align: top;">
				<input type="button" value="검색" id="search_btn" style="height: 25px; vertical-align: top;">
			</div>	
		</div>
		
		
	</div>
	
	
	<c:forEach items="${list}" var="i">
	<div class="Room">
		<div class="Room_Img" >
		<a href="meetView?num=${i.num}">
		<img alt="" src="${pageContext.request.contextPath}/resources/upload/${i.fname}">
		</a>
		</div>
		<div class="InfoArea">
		<a href="meetView?num=${i.num}" class="info">${i.name}</a><br>
		<img alt="" src="${pageContext.request.contextPath}/resources/img/meetroom/location.png">
		<span class="info">${i.addr_main}</span>
		</div>
	</div>
	</c:forEach>
	



		<div class="contents_bottom">
		<div class="contents_paging">
				<c:if test="${listInfo.curBlock>1 }">
				<span id="preview">[이전]</span>		
				</c:if>
		
				<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
					<span class="num" ><a href="meetList?curPage=${i}">${i}</a></span>			
				</c:forEach>
		
				<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
				<span id="nextview">[다음]</span>			
				</c:if>
		</div>

		</div>
		<c:if test="${member.kind eq 'admin'}">
			<a href="meetInsert" style="float: left;">업체등록</a>	
		</c:if>
	
	
	</section>
	<c:import url="../temp/footer.jsp"/>
</body>
</html>