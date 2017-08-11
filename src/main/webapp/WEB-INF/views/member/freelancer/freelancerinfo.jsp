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
    background-color: #446eab;
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
	background-color: #446eab;
	color: white;
}




/************************ 수정 ***************************/
.jobkind{
	margin-left: 0 !important;
    margin-right: 0 !important;
    margin-bottom: 20px;
}
.jobkind > label, .interesting_div > label, .possibility_div > label{
	margin-top: 7px !important;
    margin-right: 20px;
    text-align: right;
    width: 110px;
    float: left;
    color: #555;
    font-size: 16px;
    font-weight: bold;
}
.jobkind span, .possibility_div span{
	color: red;
	font-weight: bold;
}
.jobkind :LAST-CHILD{
	display: inline-block;
}
#job, #possibility{
	width: 230px;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    border-radius: 2px;
}

.interesting_div{
	display: inline-block;
}
.interesting_div label{	
	font-size: 16px;
	font-weight: bold;
	color: #555;
}
.job_check{
	display: inline-block;
}
.checkbox_list{
	padding-left: 0px;
    width: 100%;
    min-height: 27px;
    margin-bottom: 15px !important;
    padding-top: 12px !important;
    padding-bottom: 15px;
    border-bottom: 1px dashed #dedede;
}
.checkbox_list:LAST-CHILD{
	border-bottom: 0;
}
.checkbox_list label{
	font-size: 14px;
    color: #333;
    float: none !important;
    width: 110px;
    display: inline-block;
    margin-left: 10px;
    margin-right: 0 !important;
    margin-bottom: 12px;
}
.checkbox_list input{
	float: none;
	width: 14px;
	height: 14px;
	margin-left: 0px;
}


.button_div{
	float: right;
}

#cencel{
	color: #fff;
    background-color: #e1e1e1;
    border-color: #d4d4d4;
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.428571429;
    border-radius: 2px;
}
#ok{
	margin-left: 5px;
	margin-right: 5px;
	color: #fff;
    background-color: #94a2af;
    border-color: #8595a4;
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.428571429;
    border-radius: 2px;
}
#p_job{
	margin-top: 10px;
	color: red;
	font-size: 14px;
	padding-left: 141px;
}

</style>
<script type="text/javascript">
	$(function() {
		
		//취소버튼
		$("#cencel").click(function() {
			location="myinfoView";
			
		});
		
		//submit 버튼
		$("#ok").click(function() {
			var job = $("#job").val();
			if(job == 0){
				$("#p_job").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>이 항목은 필수입니다.</label>");
			}else{
				$("#form").submit();
			}
		});
		
		//직종 선택
		$("option").each(function() {
			
			if($(this).val() == "${free.dto.jobKind}"){
				$(this).prop("selected", true);
			}
		
		});
		
		var interesting3 = "${free.interesting.size()}";
		if(interesting3 == ""){
			interesting3 = 0;
		}
		//관심 분야 개발쪽 체크
		for(var i = 0; i < interesting3; i++){
			var interesting = "${free.interesting}";
			
			interesting = interesting.split(",");
			if(interesting3 > 2){
				if(i == 0){
					
					interesting[0] = interesting[0].substr(1);
				}else if(i == interesting3-1){
					
					interesting[interesting3-1] = interesting[interesting3-1].trim();
					interesting[interesting3-1] = interesting[interesting3-1].split("]",1);
				}
			
			}else if(interesting3 == 1){
				interesting[0] = interesting[0].substr(1);
				interesting[0] = interesting[0].split("]",1);
			}else if(interesting3 == 2){
			
				if(i == 0){
					interesting[0] = interesting[0].substr(1);
				}else if(i == 1){
					interesting[interesting3-1] = interesting[interesting3-1].trim();
					interesting[interesting3-1] = interesting[interesting3-1].split("]",1);
				}
			}
			
			var interclass = $(".ch1").attr("title");
			if(i !=interesting3-1){
			interesting[i] = interesting[i].trim();
			}
		
			$(".ch1").each(function() {
				if($(this).attr("title") == interesting[i]){
					$(this).prop("checked", true);
				}
			});
			
			
		}
		var interesting4 = "${free.interesting2.size()}";
		if(interesting4 == ""){
			interesting4 = 0;
		}
		//관심 분야 디자인쪽 체크
		for(var i = 0; i < interesting4; i++){
			var interesting2 = "${free.interesting2}";
			var interclass = $(".ch2").attr("title");
			
			
			interesting2 = interesting2.split(",");
			if(interesting4 > 2){
			if(i == 0){
			interesting2[0] = interesting2[0].substr(1);
			}else if(i == interesting4){
			interesting2[interesting4-1] = interesting2[interesting4-1].trim();
			interesting2[interesting4-1] = interesting2[interesting4-1].split("]",1);
			}
				
			}else if(interesting4 == 1){
				interesting2[0] = interesting2[0].substr(1);
				interesting2[0] = interesting2[0].split("]",1);
			}else if(interesting4 == 2){
				if(i == 0){
					interesting2[0] = interesting2[0].substr(1);
				}else if(i == 1){
					interesting2[interesting4-1] = interesting2[interesting4-1].trim();
					interesting2[interesting4-1] = interesting2[interesting4-1].split("]",1);
				}
			}
			
			if(i !=interesting4-1){
			interesting2[i] = interesting2[i].trim();
			}
			
			
			$(".ch2").each(function() {
				if($(this).attr("title") == interesting2[i]){
					$(this).prop("checked", true);
				}
			});
		}
		
		
		
		
		
		
	});
	
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
						<p><c:if test="${memberDTO.email eq member.email }"><span>프리랜서 정보 등록</span></c:if></p>
					</section>
					<section class="profile_wrap">
						
						<div class="no_data_wrap">
							<div class="no_data">
								<form id="form" action="${path }" method="post">
									<input type="hidden" name="email" value="${member.email }">
									<div class="jobkind infodiv">
										<label><span>*</span>직종</label>
										<div>
											<select id="job" name="jobKind">
												<option value="0">선택</option>
												<option value="개발자">개발자</option>
												<option value="디자이너">디자이너</option>
											</select>
										</div>
											<p class="p_label" id="p_job"></p>
									</div>
									<div class="interesting_div">
										<label>관심 분야</label>
										<div class="job_check">
											<span>개발</span>
											<div class="checkbox_list">
												<input class="ch1" title="웹" value="개발_웹" name="Interesting" type="checkbox"><label>웹</label>
												<input class="ch1" title="어플리케이션" value="개발_어플리케이션" name="Interesting" type="checkbox"><label>어플리케이션</label>
												<input class="ch1" title="워드프레스" value="개발_워드프레스" name="Interesting" type="checkbox"><label>워드프레스</label>
												<input class="ch1" title="퍼블리싱" value="개발_퍼블리싱" name="Interesting" type="checkbox"><label>퍼블리싱</label><br>
												<input class="ch1" title="일반 소프트웨어" value="개발_일반 소프트웨어" name="Interesting" type="checkbox"><label>일반 소프트웨어</label>
												<input class="ch1" title="쇼핑몰" value="개발_쇼핑몰" name="Interesting" type="checkbox"><label>쇼핑몰</label>
												<input class="ch1" title="게임" value="개발_게임" name="Interesting" type="checkbox"><label>게임</label>
												<input class="ch1" title="임베디드" value="개발_임베디드" name="Interesting" type="checkbox"><label>임베디드</label><br>
												<input class="ch1" title="기타" value="개발_기타" name="Interesting" type="checkbox"><label>기타</label>
											</div>
											<span>디자인</span>
											<div class="checkbox_list">
												<input class="ch2" title="웹" value="디자인_웹" name="Interesting" type="checkbox"><label>웹</label>
												<input class="ch2" title="어플리케이션" value="디자인_어플리케이션" name="Interesting" type="checkbox"><label>어플리케이션</label>
												<input class="ch2" title="제품" value="디자인_제품" name="Interesting" type="checkbox"><label>제품</label>
												<input class="ch2" title="프레젠테이션" value="디자인_프레젠테이션" name="Interesting" type="checkbox"><label>프레젠테이션</label><br>
												<input class="ch2" title="인쇄물" value="디자인_인쇄물" name="Interesting" type="checkbox"><label>인쇄물</label>
												<input class="ch2" title="쇼핑몰" value="디자인_쇼핑몰" name="Interesting" type="checkbox"><label>쇼핑몰</label>
												<input class="ch2" title="로고" value="디자인_로고" name="Interesting" type="checkbox"><label>로고</label>
												<input class="ch2" title="그래픽" value="디자인_그래픽" name="Interesting" type="checkbox"><label>그래픽</label><br>
												<input class="ch2" title="영상" value="디자인_영상" name="Interesting" type="checkbox"><label>영상</label>
												<input class="ch2" title="게임" value="디자인_게임" name="Interesting" type="checkbox"><label>게임</label>
												<input class="ch2" title="기타" value="디자인_기타" name="Interesting" type="checkbox"><label>기타</label>
											</div>
										</div>
									</div>
									<div class="possibility_div">
										<label><span>*</span>활동가능성</label>
										<div>
											<select id="possibility" name="possibility">
												<option selected="selected" value="활동가능">활동가능</option>
												<option value="협의필요">협의필요</option>
												<option value="활동불가">활동불가</option>
											</select>
										</div>
									</div>
									<div class="button_div">
										<input id="cencel" type="button" value="취소">
										<input id="ok" type="button" value="수정완료">
									</div>
								</form>
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