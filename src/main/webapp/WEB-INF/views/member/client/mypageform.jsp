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



.no_data_wrap{
	width: 100%;
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
.homepage_div{
	margin-top: 10px;
	margin-bottom: 10px;
}

input[type=text]{
	padding: 5px;
	margin-left: 10px;
	border-radius: 5px;
	border: 1px solid black;
}

#a{
	background-color: #446eab;
	color: white;
}
#ok{
	float: right;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: #446eab;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
    border: 0;
}
#cencel{
	float: right;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: #446eab;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
    border: 0;
    margin-right: 10px;
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
			<c:import url="/WEB-INF/views/temp/mypagesidebar2.jsp"></c:import>
			
			<div class="contents">
				<div class="contents_inner">
					
					<section class="profile_wrap">
						<p><span>클라이언트 수정</span></p>
						
						<div class="no_data_wrap">
							<form id="form" action="${path }" method="post">
								<input type="hidden" name="email" value="${member.email }">
								<div>
									<textarea style="border-radius: 10px;" name="intro" rows="10" cols="100">${dto.intro }</textarea>
								</div>
								
								<div class="homepage_div">
									<p><span style="width: 150px; display: inline-block; text-align: right;">홈페이지</span> <label><input type="text" name="homepage" value="${dto.homepage }"></label> </p>
									
								</div>
								<p><span id="ok">수정 완료</span><span id="cencel">취소</span></p>
							</form>
						</div>
						
					</section>
					
				</div>
			</div>
		</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	$(function() {
		$("#ok").click(function() {
			
			$("#form").submit();
			
		});
		
		$("#cencel").click(function() {
			history.back();
		});
		
	});
</script>
</html>