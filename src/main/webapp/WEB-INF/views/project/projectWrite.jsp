<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
span{
	color: red;
}
</style>


</head>

<body>
	<h2>Project ${type}</h2>
	<c:if test="${type eq 'write'}">
		<form action="projectWrite" method="post" id="frm">
	</c:if>
	<c:if test="${type eq 'update'}">
		<form action="projectUpdate" method="post" id="frm">
	<input type="hidden" name="projectNum" value="${dto.projectNum}">
	</c:if>
	
	

		<div>
			<label><span>*</span>카테고리</label>
			<!-- <input type="text" name="category"> -->
			
			 <div class="control-wrapper">
				<div class="category-wrapper">
					<div class="main-wrapper">
						<select name="category" required="required">
							<option>카테고리</option>
							<option class="main_opt" value="program">개발</option>
							<option class="main_opt" value="design">디자인</option>
						</select> 
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
					<c:if test="">
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
			<label><span>*</span>프로젝트 제목</label>
			<div>
				<input type="text" name="name">
			</div>
		</div>

		<div>
			<label><span>*</span>예상 기간</label>
			<div>
				<input type="text" name="period">일
			</div>
		</div>

		<div>
			<label><span>*</span>지출 가능 예산</label>
			<div>
				<input type="number" name="budget">원
			</div>
		</div>

		<div>
			<label><span>*</span>기획 상태</label>
			<div>
				<input type="radio" name="planState" value="idea">아이디어만
				<input type="radio" name="planState" value="simple">간단히
				<input type="radio" name="planState" value="detail">상세문서
				
			</div>
		</div>

		<div>
			<label><span>*</span>프로젝트 내용</label>
			<div>
				<textarea rows="" cols="" name="contents"></textarea>
			</div>
		</div>
		<div>
			<label>state test</label>
			<div>
			<!-- state는 프로젝트 등록시 검수중으로 넘어가므로 hidden으로 값을 넘겨줌 -->
				<input type="hidden" name="state" value="검수중">
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
				<input type="checkbox" class="chk" name="skill" value="POWER BUILDER">POWER BUILDER
				<input type="checkbox" class="chk" name="skill" value="PYTHON">PYTHON
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
				<input type="text" name="addr_num">
				<input type="text" name="addr_main">
				<input type="text" name="addr_detail">
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
				<input type="radio" name="exp" value="y">예
				<input type="radio" name="exp" value="n">아니오
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
				<input type="radio" name="quick" value="1">예
				<input type="radio" name="quick" value="0">아니오
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
		<button type="submit">등록</button>
	</form>
	
<script type="text/javascript">

$(function() {
	alert("${type}");
	
	
	$(".chk").click(function(){
    	alert((this).value);
	});
});


</script>

</body>
</html>