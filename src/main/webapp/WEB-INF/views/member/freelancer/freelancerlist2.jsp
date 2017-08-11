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
.no{
	background-color: #dedede;
	border-radius: 5px;
	color: white;
	padding: 2px;
}
.notno{
	background-color: #339bff;
	border-radius: 5px;
	color: white;
	padding: 2px;
}
.nono{
	background-color: green;
	border-radius: 5px;
	color: white;
	padding: 2px;
}


#search{
	padding: 5px;
    margin-left: 10px;
    border-radius: 5px;
    border: 1px solid #dedede;
    box-shadow: 1px 1px #e6e6e6;
}
#ok{
	padding: 5px;
	border-radius: 5px;
	border: 0;
	background-color: #339bff;
	color: white;
	
}
.mypp{
	font-size: 15px;
	font-weight: bold;
}

.access span{
	font-size: 14px;
}
.access .act{
	font-weight: bold;
	color: red;
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


var project = $("")

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
					
					<c:forEach items="${map.freelancer}" var="o" varStatus="i">
					<c:if test="${o.emailcheck eq 1}">
			<div class="freelancerListform">
				<div class="freelancerdiv">
					<div class="freelancerimg">
						<c:if test="${not empty o.fProfileImage }">
						<a href="/flu/member/freelancermypage?email=${o.email }"><img src="${pageContext.request.contextPath}/resources/profile/${o.fProfileImage}"></a>
						</c:if>
						<c:if test="${empty o.fProfileImage }">
						<a href="/flu/member/freelancermypage?email=${o.email }"><img src="${pageContext.request.contextPath}/resources/img/mypage/avatar.jpg"></a>
						</c:if>
					</div>
					<div class="freelancerdata">
						<p><a href="/flu/member/freelancermypage?email=${o.email }">
						<span class="username">${o.nickName }</span>
						</a>
						<label>
						<span class="avail">
						<c:choose>
						<c:when test="${not empty o.possibility }">
						<c:if test="${o.possibility eq '활동불가' }">
						<a class="no" href="/flu/member/freelancermypage?email=${o.email }">${o.possibility }</a>
						</c:if>
						<c:if test="${o.possibility eq '활동가능' }">
						<a class="notno" href="/flu/member/freelancermypage?email=${o.email }">${o.possibility }</a>
						</c:if>
						</c:when>
						<c:otherwise>
						<a class="nono" href="/flu/member/freelancermypage?email=${o.email }">활동가능</a>
						</c:otherwise>
						</c:choose></span>
						</label></p>
						<p><span class="kind">
						<a href="/flu/member/freelancermypage?email=${o.email }">
						<c:if test="${not empty o.jobKind }">
						${o.jobKind }</c:if>
						<c:if test="${empty o.jobKind }">
						직종 미입력
						</c:if>
						 | 
						<c:if test="${not empty o.type }">
						${o.type }
						</c:if>
						<c:if test="${empty o.type }">
						개인
						</c:if>
						</a></span></p>
						<p>
						<a href="/flu/member/freelancermypage?email=${o.email }">
						<c:choose>
						<c:when test="${not empty o.intro }">
						<span class="intro">${o.intro }</span>
						</c:when>
						<c:otherwise>
						<span class="intro">자기소개가 없습니다.</span>
						</c:otherwise>
						</c:choose>
						</a>
						</p>
						<p>
						<a href="/flu/member/freelancermypage?email=${o.email }">
						<c:forEach items="${map.skills }" var="j">
						<c:if test="${j.email eq o.email }">
						<span class="skills">${j.kind }</span>
						</c:if>
						</c:forEach>
						
						</a>
						</p>
					</div>
				</div>
				<div class="freelancerstar">
					<div class="starpoint">
						<p>
						<c:forEach items="${map.evaluation2 }" var="eval">
						<c:if test="${eval.toEmail eq o.email }">
						<span>
						<c:if test="${eval.satisfy eq 0 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/0.png">
						</c:if>
						<c:if test="${eval.satisfy eq 1 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/1.png">
						</c:if>
						<c:if test="${eval.satisfy eq 2 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/2.png">
						</c:if>
						<c:if test="${eval.satisfy eq 3 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/3.png">
						</c:if>
						<c:if test="${eval.satisfy eq 4 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/4.png">
						</c:if>
						<c:if test="${eval.satisfy eq 5 }">
						<img alt="1점" src="${pageContext.request.contextPath}/resources/img/starpoint/5.png">
						</c:if>
						</span>
						<span style="line-height: 30px; vertical-align: top; float: right; margin-right: 10px;">
							<span style=" font-weight: bold;">${eval.satisfy }</span>점/평가 <span style=" font-weight: bold;">${eval.passion }</span>개
						</span>
							</c:if>
							</c:forEach>
						</p>
						<hr>
						<p><span class="mypp">계약한 프로젝트</span><span style="float: right; margin-right: 10px;">
						<c:forEach items="${map.myproject}" var="t">
						<c:if test="${t.email eq o.email }">
						
						${t.appCount}
						</c:if>
						
						</c:forEach>
						건
						</span></p>
						<hr>
						<p><span class="mypp">포트폴리오</span><span style="float: right; margin-right: 10px;">
						<c:forEach items="${map.portfolio }" var="p">
						<c:if test="${p.email eq o.email }">
						${p.pfNum }
						</c:if>
						</c:forEach>
						개
						</span></p>
						<hr>
					</div>
					<div class="access">
						<p>
						<c:if test="${o.authenticState eq 2 }">
						<span>신원 <span class="">인증</span></span>
						</c:if>
						<c:if test="${o.authenticState ne 2 }">
						<span>신원 <span class="act">미인증</span></span>
						</c:if>
						<c:if test="${not empty o.phone }">
						<span>연락처 <span class="act">등록</span></span>
						</c:if>
						<c:if test="${empty o.phone }">
						<span>연락처 <span class="act">미등록</span></span>
						</c:if>
						</p>
					</div>
				</div>
			</div>
				</c:if>
					</c:forEach>
					<c:if test="${map.member.size() < 1 }">
						<div class="freelancerListform">
							<div style="width: 210px; margin: 0 auto; text-align: center; margin-top: 110px;">
								<p style="margin-bottom:10px; display:inline-block; ">검색 결과가 없습니다.
								</p>
								<p>
								다른 검색어로 검색해주세요
								</p>
							</div>
						</div>
					</c:if>
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
		</div>
	</section>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>