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
	border-bottom: 1px dashed #dedede;
	padding-bottom: 25px;
}
.profile_title > p:FIRST-CHILD > a{
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

.profile_title > p:FIRST-CHILD{
	margin-top: 20px;
}
.profile_title > p > span {
	font-size: 28px;
	font-weight: bold;
}

.profile_wrap{
	padding-bottom: 20px;
	margin-bottom: 20px;
}
.profile_wrap > p:FIRST-CHILD{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
}


.no_data_wrap{
	width: 100%;
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

#a{
	background-color: #66b3ff;
	color: white;
}


.info_body{
	margin-top: 20px;
}

.info_div{
	
}
.info_div label{
	padding-left: 30px;
	width: 100px;
	display: inline-block;
}
.info_div > label:FIRST-CHILD{
	text-align: right;
}

.job_info label{
	font-size: 20px;
}
.job_info p{
	padding-left: 40px;
	margin-top: 10px;
	margin-bottom: 10px;
}
.job_info{
	display: inline-block;
	vertical-align: top;
}

.info1{
	line-height: 1;
    margin-bottom: 25px;
}

.info4 a{
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


</style>

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
						<p><span>프리랜서 정보</span></p>
					</section>
					<section class="profile_wrap">
						<div class="info_body">
							<div class="info1 info_div">
								<label>직종</label>
								<label>
								<c:if test="${not empty free.dto.jobKind }">
								${free.dto.jobKind }
								</c:if>
								<c:if test="${empty free.dto.jobKind }">
								X
								</c:if>
								</label>
							</div>
							<div class="info2 info_div">
								<label>관심분야</label>
								<div class="job_info">
									<label>개발</label>
									<c:if test="${not empty free.interesting }">
									<c:forEach items="${free.interesting }" var="i">
									<p>${i }</p>
									</c:forEach>
									</c:if>
									<c:if test="${empty free.interesting }">
									<p>아직 관심분야를 선택하지 않았습니다.</p>
									</c:if>
									<label>디자인</label>
									<c:if test="${not empty free.interesting2 }">
									<c:forEach items="${free.interesting2 }" var="i">
									<p>${i }</p>
									</c:forEach>
									</c:if>
									<c:if test="${empty free.interesting2 }">
									<p>아직 관심분야를 선택하지 않았습니다.</p>
									</c:if>
								</div>
							</div>
							<div class="info3 info_div">
								<label>활동가능성</label>
								<label>
								<c:if test="${not empty free.dto.possibility }">
								${free.dto.possibility }
								</c:if>
								<c:if test="${empty free.dto.possibility }">
								X
								</c:if>
								</label>
							</div>
							<div class="info4 info_div">
								<c:if test="${not empty free.dto.jobKind }">
								<a href="infoUpdate"><span>수정</span></a>
								</c:if>
								<c:if test="${empty free.dto.jobKind }">
								<a href="infoInsert"><span>수정</span></a>
								</c:if>
								
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