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
    background-color: #339bff;
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


#a{
	background-color: #339bff;
	color: white;
}
.no_data_wrap > p{
	margin-bottom: 10px;
    margin-top: 10px;
	vertical-align: top;
    line-height: 32px;
    font-size: 18px;
    font-weight: bold;
}


.email_guide{
	padding: 15px 10px;
	border: 1px solid #dedede;
}
.email_guide:AFTER{
	content: " ";
    display: table;
    line-height: 0;
	clear: both;
}
.email_guide img{
	float: left;
    margin-right: 20px;
    margin-left: 20px;
}
.email_guide >div{
	float: left;
}
.email_guide > div p{
	font-size: 15px;
	margin-bottom:5px;
	opacity: 0.7;
}

.no_data_wrap > p > span:LAST-CHILD, .btn span{
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
    cursor: pointer;
    margin-right: 10px;
}

.account_form{
	
}
.form{
	margin-bottom: 23px;
	margin-top: 25px;
	line-height: 1;    
	
}
.form > div > span{
	width: 250px;
    margin-right: 17px;
    display: inline-block;
    text-align: right;
    vertical-align: top;
    font-weight: bold;
}
#form label{
	text-align: right;
	padding-top: 7px;
	padding-left: 70px;
    display: inline;
    float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 160px;
    font-weight: bold;
}
#form .form div{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 340px;
}
#form{
	display: inline-block;
}
#form .form{
	margin-bottom: 15px;
	margin-top: 0;
	display: inline-block;
}
.form_control{
	display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.428571429;
    color: #666;
    background-color: #fff;
    background-image: none;
    border: 1px solid #dedede;
    border-radius: 2px;
}
input[type=text]{
	height: 20px;
	width: 92%;
}



</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
		<div class="page_wrap">
		<div class="page">
			<c:import url="/WEB-INF/views/temp/personaldatasidbar.jsp"></c:import>
			
			<div class="contents">
				<div class="contents_inner">
					<section class="profile_title">
						<p><span>계좌 관리</span></p>
					</section>
					<section class="profile_wrap">
						
						
					</section>
					
				</div>
			</div>
		</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>


</html>