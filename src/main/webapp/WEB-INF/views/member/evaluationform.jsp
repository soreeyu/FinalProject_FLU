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


.eval{
	margin-bottom: 10px;
	padding: 5px;
}
.eval label{
	margin-left: 25%;
	display: inline-block;
}

.evname{
	width: 150px;
	display: inline-block;
}
.eval input {
    height: 22px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.428571429;
    color: #666;
    background-color: #fff;
    background-image: none;
    border: 1px solid #dedede;
    border-radius: 2px;
}
#btn{
	float: right;
	width: 100px;
	height: 30px;
	border: 0;
	cursor: pointer;
}

#a{
	background-color: #66b3ff;
	color: white;
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
						<p><span>프리랜서 평가</span>
						
						</p>
					</section>
					<section class="profile_wrap">
						<p></p>
						
						<div class="no_data_wrap">
							<form action="" method="post">
								<input type="hidden" name="projectNum" value="${projectNum }" >
								<input type="hidden" name="fromEmail" value="${member.email}">
								<input type="hidden" name="toEmail" value="${email}">
								
								<p class="eval"><label><span class="evname">전문성</span><input type="number" name="professional" max="5"></label></p>
								<p class="eval"><label><span class="evname">만족도</span><input type="number" name="satisfy" max="5"></label></p>
								<p class="eval"><label><span class="evname">의사소통</span><input type="number" name="communication" max="5"></label></p>
								<p class="eval"><label><span class="evname">일정준수</span><input type="number" name="schedule" max="5"></label></p>
								<p class="eval"><label><span class="evname">적극성</span><input type="number" name="passion" max="5"></label></p>
								
								<p><input type="button" id="btn" value="등록"></p>
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

	$("#btn").click(function() {
		var professional = $("input[name='professional']").val();
		var satisfy = $("input[name='satisfy']").val();
		var communication = $("input[name='communication']").val();
		var schedule = $("input[name='schedule']").val();
		var passion = $("input[name='passion']").val();
		
		if(professional =="" || satisfy =="" || communication =="" || schedule =="" || passion ==""){
			alert("항목을 모두 채워주세요");
		}else{
			submit;
		}
	});
</script>


</html>