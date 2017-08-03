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

.profile_wrap > .or{
	border-bottom: 1px dashed #dedede;
}

.no_data_wrap{
	width: 100%;
    height: 200px;
    padding-top: 15px;
    padding-bottom: 30px;
    margin-bottom: 20px;
    
}
.no_data{
	width: 100%;
    text-align: center;
    margin: 0 auto;
}
.no_img{
	
	border: 1px dashed #dedede;
	padding: 40px 0 40px 0;
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
	color: white;
	background-color: #66b3ff;
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
						<p><span>ㅁㅁㅁ의 포트폴리오</span>
						
						<c:if test="${list.size() < 3 }">
						<a href="portfolioInsert" style="margin-top: -5px;">등록 하기</a>
						</c:if>

						</p>
						
					</section>
					<section class="profile_wrap">
						
						
						<p><span>포트폴리오 (${list.size() }개)</span></p>
						
						<div class="no_data_wrap">
						<c:if test="${empty list }">
							<div class="no_data">
								<div class="no_img">
									<img alt="포트폴리오" src="${pageContext.request.contextPath }/resources/img/mypage/portfolio.png">
									<p>입력된 <span>'포트폴리오'</span>가 없습니다.</p>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty list }">
							<c:forEach items="${list }" var="i">
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
					
				</div>
			</div>
		</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>