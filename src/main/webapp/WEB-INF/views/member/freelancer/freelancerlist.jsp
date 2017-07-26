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
	height: 42px;
	display: inline-block;
	font-size: 13px;
}




.freelancerstar{
	width: 300px;
	display: inline-block;
	padding: 30px;
}



</style>

</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
		<div class="wrap">
		<div class="project_header">
			<div class="header_text">
				<p id="header_ttt">프리랜서 목록</p>
				<p id="header_tt">명의 프리랜서가 있습니다.</p>
				
				<div class="search-part">
				


					<input type="hidden" name="curPage"> 
					
					<input type="hidden" name="kind" value="total">
					 <input type="hidden" name="arrange" id="arrange">
					<input type="text" name="search"> <input type="submit" value="SEARCH">


				</div>
			</div>
		</div>
			<div class="freelancerListform">
				<div class="freelancerdiv">
					<div class="freelancerimg">
						<a href="#"><img src="${pageContext.request.contextPath}/resources/profile/${dto.fProfileImage}"></a>
					</div>
					<div class="freelancerdata">
						<p><span class="username">개발자1</span><label><span class="avail">활동가능</span></label></p>
						<p><span class="kind">디자이너 | 사업자</span></p>
						<p><span class="intro">자기소개</span></p>
						<p><span class="skills">보유기술</span><span class="skills">보유기술</span><span class="skills">보유기술</span></p>
						<c:forEach begin="1" end="${list.member.size()}" var="i">
							${list.member.get(i)}<br>
							${list.freelancer.get(i)}<br>
							
						</c:forEach>
					</div>
				</div>
				<div class="freelancerstar">
					<div class="starpoint">
						${list.member}
						<p>****</p>
						<p>계약한 프로젝트</p>
						<p>포트폴리오</p>
					</div>
					<div class="access">
						<p>인증</p>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>