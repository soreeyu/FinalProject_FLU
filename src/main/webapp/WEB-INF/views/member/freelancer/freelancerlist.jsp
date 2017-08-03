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
	width: 100%;
	min-width: 1460px;
	margin-top: 30px;
}
.wrap{
	min-width: 1160px;
	width: 1160px;
	height: auto;
	min-height: 1000px;
	margin: 0 auto;
}
.project_header {
	height:60px;
	padding: 30px;
	margin-bottom: 20px;
	border: 1px solid #e6e6e6;
	margin-bottom: 30px;
	background-color: white;
}

#header_ttt {
	font-size: x-large;
	font-weight: bolder;
	margin-bottom: 10px;
}

#header_tt {
	font-size: small;
	font-weight: lighter;
}
.search-part{
	float: right;
}

/********프리랜서 목록 *********/
.freelancerListform{
	height:200px;
	margin-bottom: 20px;
	border: 1px solid #e6e6e6;
	margin-bottom: 30px;
	background-color: white;
}
.freelancerdiv{
	width: 730px;
	display: inline;
    float: left;
    padding: 30px;
}

.freelancerimg{
	margin-right: 30px;
    float: left;
}

.freelancerimg a img{
	width: 90px;
    height: 90px;
    border-radius: 50%;
    border: 1px solid #dedede;
}

.freelancerdata{
	overflow: hidden;
}
.freelancerdata > p{
	margin-bottom: 10px;
}

.freelancerdata > p .username{
	float: left;
	color: #30409f;
	font-size: 18px;
}

.freelancerdata > p .avail{
	position: relative;
	font-size: 12px;
	background-color: green;
	left: 10px;
	border-radius: 5px;
	padding: 2px;
	top: 3px;
}

.skills{
	margin-right: 5px;
	color: #fff;
    border-radius: 2px;
    background-color: #595959;
    font-size: 12px;
    padding: 2px;
    
    
}

.kind{
	font-size: 14px;
	
}

.intro{
	height:23px;
	display: inline-block;
	font-size: 13px;
	text-overflow: ellipsis; 
	overflow: hidden; 
	white-space: nowrap;
	width: 100%;
}




.freelancerstar{
	width: 300px;
	display: inline-block;
	padding: 30px;
}


.contents_bottom{
	margin-top: 30px;
	width: 100%;
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

.starpoint img{
	width: 150px;
	height: 30px;
}

</style>

<script type="text/javascript">
$(function() {

	$("#ok").click(function() {
		var search = $("#search").val();
		
		location.href = "freelancerList?search="+search;
	});
	
	
	$(".num").click(function() {
		var search = $("#search").val();
		var curPage = $(this).attr("id");
		
		location.href="freelancerList?search="+search+"&curPage="+curPage;
	})
	
	
});


</script>
</head>

<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
		<div class="wrap">
		<div class="project_header">
			<div class="header_text">
				<p id="header_ttt">프리랜서 목록</p>
				<p id="header_tt">${count }명의 프리랜서가 있습니다.</p>
				
				<div class="search-part">
				


					<input type="hidden" name="curPage"> 
					
					<input id="search" type="text" name="search" value="${listinfo.search }"> <input id="ok" type="submit" value="SEARCH">


				</div>
			</div>
		</div>
					<c:catch>
					<c:forEach begin="0" end="${map.member.size()-1 }" var="i">
					<c:if test="${map.member[i].emailcheck eq 1}">
			<div class="freelancerListform">
				<div class="freelancerdiv">
					<div class="freelancerimg">
						<c:if test="${not empty map.member[i].fProfileImage }">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/profile/${map.member[i].fProfileImage}"></a>
						</c:if>
						<c:if test="${empty map.member[i].fProfileImage }">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/img/FLU.png"></a>
						</c:if>
					</div>
					<div class="freelancerdata">
						<p><span class="username">${map.member[i].nickName }</span>
						<label>
						<span class="avail">
						<c:choose>
						<c:when test="${not empty map.freelancer[i].possibility }">
						${map.freelancer[i].possibility }
						</c:when>
						<c:otherwise>
						활동가능
						</c:otherwise>
						</c:choose></span>
						</label></p>
						<p><span class="kind">
						<c:if test="${not empty map.freelancer[i].jobKind }">
						${map.freelancer[i].jobKind }</c:if>
						<c:if test="${empty map.freelancer[i].jobKind }">
						직종 미입력
						</c:if>
						 | 
						<c:if test="${not empty map.member[i].type }">
						${map.member[i].type }
						</c:if>
						<c:if test="${empty map.meber[i].type }">
						개인
						</c:if>
						</span></p>
						<p>
						<c:choose>
						<c:when test="${not empty map.freelancer[i].intro }">
						<span class="intro">${map.freelancer[i].intro }</span>
						</c:when>
						<c:otherwise>
						<span class="intro">자기소개가 없습니다.</span>
						</c:otherwise>
						</c:choose>
						</p>
						<p>
						<c:choose>
						<c:when test="${not empty map.skills[i] }">
						<c:forEach items="${map.skills[i] }" var="j">
						<span class="skills">${j.kind }</span>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<span class="skills">스킬미등록</span>
						</c:otherwise>
						</c:choose>
						</p>
					</div>
				</div>
				<div class="freelancerstar">
					<div class="starpoint">
						<p>
						<span>
						<c:if test="${starpoint eq 0 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/0.png">
						</c:if>
						<c:if test="${starpoint eq 1 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/1.png">
						</c:if>
						<c:if test="${starpoint eq 2 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/2.png">
						</c:if>
						<c:if test="${starpoint eq 3 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/3.png">
						</c:if>
						<c:if test="${starpoint eq 4 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/4.png">
						</c:if>
						<c:if test="${starpoint eq 5 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/5.png">
						</c:if>
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/5.png">
						</span>
						<span style="line-height: 30px; vertical-align: top; float: right; margin-right: 10px;">
							4점/평가 2개
						</span>
						</p>
						<hr>
						<p><span>계약한 프로젝트</span><span style="float: right; margin-right: 10px;">4건</span></p>
						<hr>
						<p><span>포트폴리오</span><span style="float: right; margin-right: 10px;">22개</span></p>
						<hr>
					</div>
					<div class="access">
						<p>
						<c:if test="${map.member[i].authenticState eq 2 }">
						<span>신원 인증</span>
						</c:if>
						<c:if test="${map.member[i].authenticState ne 2 }">
						<span>신원 미인증</span>
						</c:if>
						<c:if test="${not empty map.member[i].phone }">
						<span>연락처 등록</span>
						</c:if>
						<c:if test="${empty map.member[i].phone }">
						<span>연락처 미등록</span>
						</c:if>
						</p>
					</div>
				</div>
			</div>
				</c:if>
					</c:forEach>
					</c:catch>
		</div>
		<div>
			<div class="contents_paging">
				<c:if test="${listInfo.curBlock>1 }"> -
				<span id="preview">[이전]</span>		
				</c:if>
		
				<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
					<span class="num" id="${i}">${i}</span>			
				</c:forEach>
		
				<c:if test="${listInfo.curBlock<listInfo.totalBlock }">
				<span id="nextview">[다음]</span>			
				</c:if>
				</div>
				<div>
					<p>curPage : ${listInfo.curPage }         search : ${listInfo.search}     kind : ${listInfo.kind }</p>
					<p>startNum : ${listInfo.startNum}   lastNum : ${listInfo.lastNum}</p>
					<p>startRow : ${listInfo.startRow}   lastRow : ${listInfo.lastRow}</p>
					<p>curBlock : ${listInfo.curBlock }      perPage : ${listInfo.perPage}</p>
				</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>