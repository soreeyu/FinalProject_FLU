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
    line-height: 16px;
    color: #fff;
    text-align: center;
    border-radius: .2em;
    padding: .2em .6em .2em;
    vertical-align: bottom;
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
    padding-top: 15px;
    padding-bottom: 15px;
}
.no_data{
	width: 100%;
    height: 100%;
    text-align: center;
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
						
						<p><span>soreeyu</span><span class="availability">활동여부</span><a href="infoUpdate" >업데이트 하기</a></p>
						<p><span><i class="fa fa-keyboard-o"></i><span>개발자<span class="bar">|</span></span></span>
						<span><i class="fa fa-user"></i><span>개인<span class="bar">|</span></span></span>
						<span><i class="fa fa-address-card"></i><span>신원 확인 여부<span class="bar">|</span></span></span>
						<span><i class="fa fa-phone"></i><span>연락처 등록 여부</span></span></p>
					</section>
					<section class="profile_wrap">
						<div class="profile_1">
						
						</div>
						활동 요약 정보,세부 항복 평가, 진행한 카테고리
					</section>
					<section class="profile_wrap">
						<p><span>자기소개</span><a href="#" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="자기소개" src="${pageContext.request.contextPath }/resources/img/mypage/intro.png">
									<p>입력된 <span>'자기소개'</span>가 없습니다.</p>
								</div>
							</div>
						</div>
						
					</section>
					<section class="profile_wrap">
						<p><span>포트폴리오</span><a href="#" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="포트폴리오" src="${pageContext.request.contextPath }/resources/img/mypage/portfolio.png">
									<p>입력된 <span>'포트폴리오'</span>가 없습니다.</p>
								</div>
							</div>
						</div>
					</section>
					<section class="profile_wrap">
						<p><span>보유기술</span><a href="#" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="기술" src="${pageContext.request.contextPath }/resources/img/mypage/skill.png">
									<p>등록된 <span>'기술'</span>이 없습니다.</p>
								</div>
							</div>
						</div>
						
					</section>
					<section class="profile_wrap">
						<p><span>경력</span><a href="#" style="margin-top: -5px;">업데이트 하기</a></p>
						
						<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="경력" src="${pageContext.request.contextPath }/resources/img/mypage/carrer.png">
									<p>등록괸 <span>'경력'</span>이 없습니다.</p>
								</div>
							</div>
						</div>
						
						<p><span>학력</span></p>
						
						<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="학력" src="${pageContext.request.contextPath }/resources/img/mypage/academic.png">
									<p>등록된 <span>'학력'</span>이 없습니다.</p>
								</div>
							</div>
						</div>
						
						<p><span>자격증</span></p>
						
						<div class="no_data_wrap">
							<div class="no_data">
								<div class="no_img">
									<img alt="자격증" src="${pageContext.request.contextPath }/resources/img/mypage/license.png">
									<p>등록된 <span>'자격증'</span>이 없습니다.</p>
								</div>
							</div>
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