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
.main_section{
	min-width: 1460px;
	width: 100%;
	min-height: 2050px;
	background-color: #f2f2f2;
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



/******************************** 프로필 정보  *******************************/
.contents{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 790px;
}

.contents_inner{
	padding: 15px 30px 30px 30px;
	background-color: #fff;
    border-radius: 3px;
}

.profile_title{
	margin-bottom: 20px;
	border-bottom: 1px dashed #dedede;45
	
}

.profile_title p{
	margin-top: 15px;
    margin-bottom: 15px;
    line-height: 1;
}

.profile_title > p:FIRST-CHILD  span:FIRST-CHILD {
	font-size: 28px;
	vertical-align: middle;  
}
.availability{
	background-color: #94a2af;
	font-size: 14px;
    line-height: 34px;
    color: #fff;
    text-align: center;
    border-radius: .2em;
    margin-left: 10px;
    padding: .2em .6em .2em;
    vertical-align: top	;
}
.profile_title > p:FIRST-CHILD > a:LAST-CHILD , .profile_wrap > p:FIRST-CHILD > a{
	float: right;
	margin-top: 7px;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: #66b3ff;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
}
.profile_title > p:LAST-CHILD {
	margin-bottom: 20px;
	margin-top: 10px;
}

.profile_title > p:LAST-CHILD > span span{
	margin-left: 10px;
	font-size: 14px;
	font-weight: 700;
    line-height: 1.1;
    color: #555555;
}


.bar{
	margin-left: 10px;
	margin-right: 6px;
}


.profile_wrap{
	padding-bottom: 20px;
	border-bottom: 1px dashed #dedede;
	margin-bottom: 20px;
}
.profile_wrap > p:FIRST-CHILD{
	margin-top: 20px;
}
.profile_wrap > p > span {
	font-size: 18px;
	font-weight: bold;
}

.no_data_wrap{
	width: 100%;
    height: 170px;
    text-align: center;
    padding-top: 15px;
    padding-bottom: 15px;
}
.no_data{
	width: 100%;
    height: 100%;
    margin: 0 auto;
}
.no_img p{
	font-size: 14px;
	margin-top: 15px;
	color: #999;
}
.no_img p span{
	font-weight: bold;
}

/** 자기소개 **/
.introform{
	width: 100%;
	height: 100%;
	margin-top: 20px;
	margin-bottom: 10px;
	overflow-y: scroll;
}


/**** 스킬 ****/
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
	border-top: 2px solid #3377ff;
}
th:FIRST-CHILD,td:FIRST-CHILD{
	border-left: 0;
}


#a{
	background-color: #66b3ff;
	color: white;
}
</style>
<script type="text/javascript">

	
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
		<div class="page_wrap">
		<div class="page">
			<c:import url="/WEB-INF/views/temp/mypagesidebar.jsp"></c:import>
			
			<div class="contents">
				<div class="contents_inner">
					<section class="profile_title">
						
						<p><span>${member.nickName }</span><span class="availability">
						<c:if test="${not empty freelancer.possibility }">
						${freelancer.possibility }
						</c:if>
						<c:if test="${empty freelancer.possibility }">
						활동가능
						</c:if>
						</span>
						<a href="myinfoView" >업데이트 하기</a></p>
						<p><span>
						<c:choose>
						<c:when test="${empty freelancer.jobKind }">
						<span>직종 미입력<span class="bar">|</span></span>
						</c:when>
						<c:when test="${freelancer.jobKind eq '개발자' }">
						<i class="fa fa-keyboard-o"></i><span>${freelancer.jobKind }<span class="bar">|</span></span>
						</c:when>
						<c:otherwise>
						<i class="fa fa-laptop"></i><span>${freelancer.jobKind }<span class="bar">|</span></span>
						</c:otherwise>
						</c:choose>
						</span>
						<span>
						<c:choose>
						<c:when test="${empty member.type }">
						<i class="fa fa-user"></i><span>개인<span class="bar">|</span></span>
						</c:when>
						<c:when test="${member.type eq '개인' }">
						<i class="fa fa-user"></i><span>${member.type }<span class="bar">|</span></span>
						</c:when>
						<c:when test="${member.type eq '팀' }">
						<i class="fa fa-users"></i><span>${member.type}<span class="bar">|</span></span>
						</c:when>
						<c:otherwise>
						<i class="fa fa-building-o"></i><span>${member.type}<span class="bar">|</span></span>
						</c:otherwise>
						</c:choose>
						</span>
						<span>
						<c:if test="${member.authenticState ne 2 }">
						<i style="opacity: 0.5;" class="fa fa-address-card"></i><span>신원 미인증<span class="bar">|</span></span>
						</c:if>
						<c:if test="${member.authenticState eq 2 }">
						<i class="fa fa-address-card"></i><span>신원 인증<span class="bar">|</span></span>
						</c:if>
						</span>
						<span>
						<c:if test="${empty member.phone }">
						<i style="opacity: 0.5;" class="fa fa-phone"></i><span>연락처 미등록</span>
						</c:if>
						<c:if test="${not empty member.phone }">
						<i class="fa fa-phone"></i><span>연락처 등록</span>
						</c:if>
						</span>
						</p>
					</section>
					<section class="profile_wrap">
						<div class="profile_1">
						
						</div>
						활동 요약 정보,세부 항복 평가, 진행한 카테고리
					</section>
					<section class="profile_wrap">
						<p><span>자기소개</span><a href="introView" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap">
							<c:if test="${empty freelancer.intro }">
							<div class="no_data">
								<div class="no_img">
									<img alt="자기소개" src="${pageContext.request.contextPath }/resources/img/mypage/intro.png">
									<p>입력된 <span>'자기소개'</span>가 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty freelancer.intro }">
								<div class="introform">
								<p>${freelancer.intro }</p>
								</div>
							</c:if>
						</div>
						
					</section>
					<section class="profile_wrap">
						<p><span>포트폴리오</span><a href="portfolioList" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap">
							<c:if test="${empty portfolio }">
							<div class="no_data">
								<div class="no_img">
									<img alt="포트폴리오" src="${pageContext.request.contextPath }/resources/img/mypage/portfolio.png">
									<p>입력된 <span>'포트폴리오'</span>가 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty portfolio }">
							<c:forEach items="${portfolio }" var="i">
							<div style="display: inline-block;">
								<div style="display:inline-block; height: 200px; width: 200px; margin-right: 30px;">
									${i.title }
									<a href="portfolioView?pfNum=${i.pfNum }">${i.title }</a>
									
								</div>
							</div>
							</c:forEach>
						</c:if>
						</div>
					</section>
					<section class="profile_wrap">
						<p><span>보유기술</span><a href="skillList" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap" style="height: auto;">
							<c:if test="${empty skills }">
							<div class="no_data">
								<div class="no_img">
									<img alt="기술" src="${pageContext.request.contextPath }/resources/img/mypage/skill.png">
									<p>등록된 <span>'기술'</span>이 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty skills }">
								<table style="width: 100%; text-align: left;">
								<colgroup>
									<col width="60%">
									<col width="18%">
									<col width="*%">
								</colgroup>
								<thead>
								<tr>
									<th>종류</th>
									<th>숙련도</th>
									<th>경험</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${skills }" var="i">
									<tr>
										<td>${i.kind }</td>
										<td>${i.slevel}</td>
										<td>${i.exp }</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</c:if>
						</div>
						
					</section>
					<section class="profile_wrap">
						<p><span>경력</span><a href="carrer" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap" style="height: auto;">
							<c:if test="${empty carrer }">
							<div class="no_data">
								<div class="no_img">
									<img alt="경력" src="${pageContext.request.contextPath }/resources/img/mypage/carrer.png">
									<p>등록괸 <span>'경력'</span>이 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty carrer }">
								<table style="width: 100%">
									<colgroup>
										<col width="35%">
										<col width="25%">
										<col width="20%">
										<col width="*%">
									</colgroup>
									<thead>
									<tr style="text-align: left;">
										<th>회사명</th>
										<th>부서명</th>
										<th>직위</th>
										<th>근무기간</th>
									</tr>
									</thead>
									<tbody>
								<c:forEach items="${carrer }" var="i">
									<tr>
										<td>${i.companyName }</td>
										<td>${i.dept }</td>
										<td>${i.position }</td>
										<td>${i.hireDate }<br>
										~${i.retireDate}
										</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</c:if>
						</div>
						
						<p><span>학력</span></p>
						
						<div class="no_data_wrap" style="height: auto;">
							<div class="no_data">
								<c:if test="${empty academic }">
								<div class="no_img">
									<img alt="학력" src="${pageContext.request.contextPath }/resources/img/mypage/academic.png">
									<p>등록된 <span>'학력'</span>이 없습니다.</p>
								</div>
								</c:if>
								<c:if test="${not empty academic }">
									<table style="width: 100%;">
									<colgroup>
										<col width="30%">
										<col width="10%">
										<col width="10%">
										<col width="20%">
										<col width="15%">
										<col width="*%">
									</colgroup>
									<thead>
									<tr style="text-align: left;">
										<th>분류</th>
										<th>상태</th>
										<th>학교명</th>
										<th>전공</th>
										<th>입학일</th>
										<th>졸업일</th>
									</tr>
									</thead>
									<tbody>
								<c:forEach items="${academic }" var="i">
									<tr>
										<td>${i.school }</td>
										<td>${i.state }</td>
										<td>${i.sName }</td>
										<td>${i.major }</td>
										<td>${i.entrance }</td>
										<td>${i.graduate }</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
								</c:if>
							</div>
						</div>
						
						<p><span>자격증</span></p>
						
						<div class="no_data_wrap" style="height: auto;">
							<c:if test="${empty license }">
							<div class="no_data">
								<div class="no_img">
									<img alt="자격증" src="${pageContext.request.contextPath }/resources/img/mypage/license.png">
									<p>등록된 <span>'자격증'</span>이 없습니다.</p>
								</div>
							</div>
							</c:if>
							<c:if test="${not empty license }">
							<table style="width: 100%;">
									<colgroup>
										<col width="30%">
										<col width="20%">
										<col width="20%">
										<col width="*%">
									</colgroup>
									<thead>
									<tr style="text-align: left;">
										<th>자격증명</th>
										<th>발급기관</th>
										<th>발급일</th>
										<th>일련번호</th>
									</tr>
									</thead>
									<tbody>
								<c:forEach items="${license }" var="i">
									<tr>
										<td>${i.lName }</td>
										<td>${i.agency }</td>
										<td>${i.publishDate }</td>
										<td>${i.seiralNum }</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</c:if>
						</div>
						
					</section>
					<section class="profile_wrap">
						<p><span>평가</span><a href="#" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="평가" src="${pageContext.request.contextPath }/resources/img/mypage/evaluation.png">
									<p>등록된 <span>'평가'</span>가 없습니다.</p>
								</div>
							</div>
						</div>
						
					</section>
				</div>
			</div>
		</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>