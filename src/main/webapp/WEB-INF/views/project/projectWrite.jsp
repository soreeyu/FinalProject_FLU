<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"/>
<title>Insert title here</title>
<style type="text/css">

*{
font-family: -webkit-body;
}
.main_section{
	min-width: 1160px;
	width: 1160px;
	height: 2400px;
	background-color: aqua;
	margin: 0 auto;
	margin-top: 30px;
}
.project_header{
	width: 1100px;
	background-color: yellow;
	padding: 30px;
	height: 60px;
	margin-bottom: 20px;
}
#header_ttt{
	font-size: x-large;
	font-weight: bolder;
	margin-bottom: 10px;
}
#header_tt{
	font-size: small;
	font-weight: lighter;
}
.contents{
	width: 1160;
	height: 2000px;
	background-color: blue;
	padding: 20px;
}
.contents_main{
	width: 700px;
	height: 100%;
	background-color:gray; 
	display: block;
	float: left;
	padding: 30px;
}
.contents_sub{
	width: 350px;
	height: 100%;
	display: block;
	background-color: red;
	float: right;
}
span{
	color: #f48023;
    font-weight: bold
}

.control-wrapper{
	width: 100%;
	height: 60px;
}
#detail{
	font-size: small;
	color: black;
	margin-top: 10px;
	display: block;
}

label{
	width: 160px;
	height: 100%;
	text-align: right;
	display: block;
	float: left;
	margin-right: 5px;
}
.category-wrapper{
	width: 530px;
	display: block;
	float: left;
	height: 100%;
}
.plan-wrapper{
	width: 100%;
	height: 150px;
}
.plan-radio{
	height: 130px;
	width: 160px;
	border: 1px dotted black;
	display: block;
	float: left;
	margin-right: 10px;
	font-size: 12px;
	font-weight: lighter;
	color: #999;
	text-align: center;
}
#plan-radio1{
	background-image: url("${pageContext.request.contextPath}/resources/img/idea.png");
}
#plan-radio2{
	background-image: url("${pageContext.request.contextPath}/resources/img/simple.png");
}
#plan-radio3{
	background-image: url("${pageContext.request.contextPath}/resources/img/detail.png");
}

.radio-text{
    margin-top: 100px;
    padding: 0px;
    width: 160px;
    line-height: 34px;
}
.control-wrapper-skill{
	width: 100%;
	height: 550px;
}
.skill-wrapper{
	width: 100%;
	height: 550px;
	background-color: red;
}
.skill-li{
	width: 140px;
	display: inline;
	float: left;
	line-height: 30px;
	margin-right: 30px;
	font-weight: bold;
	font-size: medium;
}
</style>


</head>


<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
<section class="main_section">

	
	
	
	<div class="project_header">
		<div class="header_text">
			<p id="header_ttt">프로젝트 정보 등록</p>
			<p id="header_tt">상세하게 작성해주실수록 더 적합한 파트너스를 만날 수 있습니다.</p>
		</div>
	</div>

		<div class="contents">
			<section class="contents_main">
				<c:if test="${type eq 'write'}">
					<form action="projectWrite" method="post" id="frm"
						enctype="multipart/form-data">
				</c:if>
				<c:if test="${type eq 'update'}">
					<form action="projectUpdate" method="post" id="frm"
						enctype="multipart/form-data">
						<input type="hidden" name="projectNum" value="${dto.projectNum}">
				</c:if>
				
				
				
				<!-- state는 프로젝트 등록시 검수중(check)으로 넘어가므로 hidden으로 값을 넘겨줌 -->
						<input type="hidden" name="state" value="check">
				
				
				
				
				<div class="control-wrapper">
					<label><span>*</span>카테고리</label>
					<div class="category-wrapper">
						<div class="main-wrapper">
						<input type="text" name="category">
						<input type="text" name="detailCategory">
						</div>
					<span id="detail">프로젝트를 선택해 주세요</span>
					</div>
				</div>
				<div class="control-wrapper">
					<label><span>*</span>프로젝트 제목</label>
					<div class="category-wrapper">
						<input type="text" name="name" style="width: 100%;"">
					<span id="detail">프로젝트 이름을 선택해 주세요</span>
					</div>
				</div>

				<div class="control-wrapper">
					<label><span>*</span>예상 기간</label>
					<div class="category-wrapper">
						<input type="text" name="period">일
						<span id="detail">프로젝트를 진행할 기간을 일 단위로 입력해 주세요. (최대 3자리)</span>
					</div>
				</div>

				<div class="control-wrapper">
					<label><span>*</span>지출 가능 예산</label>
					<div class="category-wrapper">
						<input type="number" name="budget">원
						<span id="detail">지출 가능한 예산을 입력해 주세요. ( 부가세 별도, 예 : 100,000,000)</span>
					</div>
				</div>

				<div class="plan-wrapper">
					<label><span>*</span>기획 상태</label>
					<div>
						<div class="plan-radio">
						<div id="plan-radio1">
							<input class="radio-text" type="radio" name="planState" value="idea">
							아이디어만 있습니다. 							
						</div>
						</div>
						
						<div class="plan-radio">
						<div id="plan-radio2">
							<input class="radio-text" type="radio" name="planState" value="simple">
							필요한 내용들을 간단히 정리해두었습니다. 							
						</div>
						</div>
						
						<div class="plan-radio">
						<div id="plan-radio3">
							<input class="radio-text" type="radio" name="planState" value="detail">
							상세한 기획 문서가 존재합니다.						
						</div>
						</div>

					</div>
				</div>

				<div>
					<label><span>*</span>프로젝트 내용</label>
					<div>
						<textarea rows="30" cols="70" name="contents"></textarea>
					</div>
				</div>
				
				
				<div class="control-wrapper" style="height: 40px; margin-top: 10px;">
					<label><span>*</span>관심 기술</label>
				</div>
				<div class="control-wrapper-skill">
					<label style="line-height: 270px;">개발 분야</label>
					<div class="skill-wrapper">
					<ul >
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value=".NET">.NET
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="ANDROID">ANDROID
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="ASP">ASP
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="ASP.NET">ASP.NET
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="C">C
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="C#">C#
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="C++">C++
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="CSS">CSS
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="DB">DB
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="IOS">IOS
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="JAVA">JAVA
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="JS">JS
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="JSP">JSP
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="LINUX">LINUX
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="PHP">PHP
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="PYTHON">PYTHON
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="QA">QA
						</li>
						<li class="skill-li"> 
						<input type="checkbox" class="chk" name="skill" value="RUBY">RUBY
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="SERVER">SERVER
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="VB">VB
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="VC++">VC++
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="WINDOWS">WINDOWS
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="임베디드">임베디드
						</li>
						<li class="skill-li">
						<input type="checkbox" class="chk" name="skill" value="POWER BUILDER" style="font-size: small;">POWER BUILDER
						</li>
					</ul>
					<hr>
						<!-- 개발 전문분야
				 AJAX, BI, BPM, CODEIGNITER, DDK,  DW, EJB, ERP,  GIT, HADOOP, IBSHEET, JEUS, JSTL, LabVIEW,
				LAFJ, MFC, MIPLATFORM, MSTR, MVC, OPENGL, OZREPORT, OZREPORT, PLM, SCM, SITEMESH, SOAP, STRUTS, SWING, TRUSTFORM
				 UNITY3D, WDK, XPLATFORM, 반응형웹, 보안진단, 빅데이터, 외환
				워드프레스,  하이브리드앱, 프레젠테이션  -->

						<!-- 기획 컨설턴트
				Oracle컨설턴트, PM, PMO, SAP컨설턴트, 기획, 모바일기획, 웹기획 -->


						<!-- 디자인/퍼블리싱
				HTML5 그래픽디자인 모바일 액션스크립트 웹디자인 웹표준 파워포인트 퍼블리싱 포토샵편집 플래시 3D
				 -->



					</div>
				</div>
				
				<div class="control-wrapper">
					<label><span>*</span>기획 관련 파일</label>
					<div class="category-wrapper">
						<input type="file" name="oName">
					</div>
				</div>


				<div class="control-wrapper">
					<label><span>*</span>모집 마감일자</label>
					<div class="category-wrapper">
						<input type="date" name="finishDate">
					</div>
				</div>

				<div class="control-wrapper">
					<label><span>*</span>사전 미팅</label>
					<div class="category-wrapper">
						<select name="meetKind">
							<option value="offline">오프라인</option>
							<option value="online">온라인</option>
						</select>
					</div>
				</div>

				<div class="control-wrapper">
					<label><span>*</span>클라이언트 위치</label>
					<div class="category-wrapper">
						<input type="text" name="addr_num"> <input type="text"
							name="addr_main"> <input type="text" name="addr_detail">
					</div>
				</div>

				<div class="control-wrapper">
					<label><span>*</span>프로젝트 예상 시작일</label>
					<div class="category-wrapper">
						<input type="date" name="startDate">
					</div>
				</div>

				<div class="control-wrapper">
					<label><span>*</span>프로젝트 매니징 경험</label>
					<div class="category-wrapper">
						<input type="radio" name="exp" value="y">예 <input
							type="radio" name="exp" value="n">아니오
					</div>
				</div>

				<!-- mail은 클라이언트 email 받아오기  -->
				<div class="control-wrapper">
					<label><span>*</span>메일</label>
					<div class="category-wrapper">
						<input type="text" name="email">
					</div>
				</div>

				<div class="control-wrapper">
					<label><span>*</span>급구 여부</label>
					<div class="category-wrapper">
						<input type="radio" name="quick" value="1">예 <input
							type="radio" name="quick" value="0">아니오
					</div>
				</div>
				
				<%-- <div>	
					<label><span>*</span>카테고리</label>
					<!-- <input type="text" name="category"> -->

					<div class="control-wrapper">
						<div class="category-wrapper">
							<div class="main-wrapper">
								<select id="category" name="category" required="required"
									onchange="mainCategory">
									<option>카테고리</option>
									<option class="main_opt" value="program">개발</option>
									<option class="main_opt" value="design">디자인</option>
								</select>

								<p id="demo"></p>
								<input type="text">

							</div>
							<div class="sub-wrapper">
								<c:if test="">
						<select name="detailCategory" required="required">
							<option>세부 카테고리</option>
							<option class="sub_opt" value="web">웹</option>
							<option class="sub_opt" value="application">애플리케이션</option>
							<option class="sub_opt" value="wordpress">워드프레스</option>
							<option class="sub_opt" value="publishing">퍼블리싱</option>
							<option class="sub_opt" value="software">일반 소프트웨어</option>
							<option class="sub_opt" value="commerce">커머스, 쇼핑몰</option>
							<option class="sub_opt" value="game">게임</option>
							<option class="sub_opt" value="embedded">임베디드</option>
							<option class="sub_opt" value="program_etc">기타</option>
						</select>
					</c:if>
					<c:if test="${categoru eq design }">
						<select name="detailCategory" required="required">
							<option class="sub_opt" value="design_web">웹</option>
							<option class="sub_opt" value="design_application">애플리케이션</option>
							<option class="sub_opt" value="product">제품</option>
							<option class="sub_opt" value="presentation">프레젠테이션</option>
							<option class="sub_opt" value="printing">인쇄물</option>
							<option class="sub_opt" value="design_commerce">커머스, 쇼핑몰</option>
							<option class="sub_opt" value="logo">로고</option>
							<option class="sub_opt" value="graphic">그래픽</option>
							<option class="sub_opt" value="video">영상</option>
							<option class="sub_opt" value="game">게임</option>
							<option class="sub_opt" value="design_etc">기타</option>							
						</select> 
					</c:if>

							</div>
						</div>

						프로젝트 카테고리를 선택해 주세요.
					</div>

				</div>


				<div>
					<label>관심 기술</label>
					<div>
						<input type="checkbox" class="chk" name="skill" value=".NET">.NET
						<input type="checkbox" class="chk" name="skill" value="ANDROID">ANDROID
						<input type="checkbox" class="chk" name="skill" value="ASP">ASP
						<input type="checkbox" class="chk" name="skill" value="ASP.NET">ASP.NET
						<input type="checkbox" class="chk" name="skill" value="C">C
						<input type="checkbox" class="chk" name="skill" value="C#">C#
						<input type="checkbox" class="chk" name="skill" value="C++">C++
						<input type="checkbox" class="chk" name="skill" value="CSS">CSS
						<input type="checkbox" class="chk" name="skill" value="DB">DB
						<input type="checkbox" class="chk" name="skill" value="IOS">IOS
						<input type="checkbox" class="chk" name="skill" value="JAVA">JAVA
						<input type="checkbox" class="chk" name="skill" value="JS">JS
						<input type="checkbox" class="chk" name="skill" value="JSP">JSP
						<input type="checkbox" class="chk" name="skill" value="LINUX">LINUX
						<input type="checkbox" class="chk" name="skill" value="PHP">PHP
						<input type="checkbox" class="chk" name="skill"
							value="POWER BUILDER">POWER BUILDER <input
							type="checkbox" class="chk" name="skill" value="PYTHON">PYTHON
						<input type="checkbox" class="chk" name="skill" value="QA">QA
						<input type="checkbox" class="chk" name="skill" value="RUBY">RUBY
						<input type="checkbox" class="chk" name="skill" value="SERVER">SERVER
						<input type="checkbox" class="chk" name="skill" value="VB">VB
						<input type="checkbox" class="chk" name="skill" value="VC++">VC++
						<input type="checkbox" class="chk" name="skill" value="WINDOWS">WINDOWS
						<input type="checkbox" class="chk" name="skill" value="임베디드">임베디드

						<!-- 개발 전문분야
				 AJAX, BI, BPM, CODEIGNITER, DDK, DJANGO, DW, EJB, ERP, GAUCE, GIT, HADOOP, IBSHEET, JEUS, JSTL, LabVIEW,
				LAFJ, MFC, MIPLATFORM, MSTR, MVC, OPENGL, OZREPORT, OZREPORT, PLM, SCM, SITEMESH, SOAP, STRUTS, SWING, TRUSTFORM
				TUXEDO, UNITY3D, WDK, WEBLOGIC, WEBSPHERE, WEBSQURE, XPLATFORM, 반응형웹, 보안진단, 빅데이터, 수신, 여신, 외환
				워드프레스, 웹접근성, 전자정부프레임워크, 카드, 하이브리드앱, 프레젠테이션  -->

						<!-- 기획 컨설턴트
				Oracle컨설턴트, PM, PMO, SAP컨설턴트, 기획, 모바일기획, 웹기획 -->


						<!-- 디자인/퍼블리싱
				HTML5 그래픽디자인 모바일 액션스크립트 웹디자인 웹표준 파워포인트 퍼블리싱 포토샵편집 플래시 3D
				 -->



					</div>
				</div>

				<div>
					<label>기획 관련 파일</label>
					<div>
						<input type="file" name="oName">
					</div>
				</div>


				<div>
					<label><span>*</span>모집 마감일자</label>
					<div>
						<input type="date" name="finishDate">
					</div>
				</div>

				<div>
					<label><span>*</span>사전 미팅</label>
					<div>
						<select name="meetKind">
							<option value="offline">오프라인</option>
							<option value="online">온라인</option>
						</select>
					</div>
				</div>

				<div>
					<label><span>*</span>클라이언트 위치</label>
					<div>
						<input type="text" name="addr_num"> <input type="text"
							name="addr_main"> <input type="text" name="addr_detail">
					</div>
				</div>

				<div>
					<label><span>*</span>프로젝트 예상 시작일</label>
					<div>
						<input type="date" name="startDate">
					</div>
				</div>

				<div>
					<label><span>*</span>프로젝트 매니징 경험</label>
					<div>
						<input type="radio" name="exp" value="y">예 <input
							type="radio" name="exp" value="n">아니오
					</div>
				</div>

				<!-- mail은 클라이언트 email 받아오기  -->
				<div>
					<label><span>*</span>메일</label>
					<div>
						<input type="text" name="email">
					</div>
				</div>

				<div>
					<label><span>*</span>급구 여부</label>
					<div>
						<input type="radio" name="quick" value="1">예 <input
							type="radio" name="quick" value="0">아니오
					</div>
				</div>

				<div>
					<label><span>*</span>fname</label>
					<div>
						<input type="text" name="fName">
					</div>
				</div>
				<div>
					<label><span>*</span>oname</label>
					<div>
						<input type="text" name="oName">
					</div>
				</div>
				<button type="submit">등록</button> --%>
				</form>
			</section>
			<section class="contents_sub">
			
			</section>
		</div>

	</section>
<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

<script type="text/javascript">


$(function() {
	//alert("${type}");
	//alert(document.getElementById("category").value);
	
	
	$(".chk").click(function(){
    	alert((this).value);
	});
});

/* function mainCategory() {
    var x = document.getElementById("category").value;
    document.getElementById("demo").innerHTML = "You selected: " + x;
} */
	
</script>

</body>
</html>