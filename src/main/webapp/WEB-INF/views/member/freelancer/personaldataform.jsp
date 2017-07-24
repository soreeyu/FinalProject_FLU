<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.css.map">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>



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

#postcode{
	width: 200px;
	height:30px;
	display: inline-block;
	border: 1px solid #dedede;
	vertical-align: top;
	margin-bottom: 10px;
	font-size: 14px;
	line-height: 30px;
}
#address{
	width: 320px;
	font-size: 14px;
	height:30px;
	display: inline-block;
	border: 1px solid #dedede;
	margin-bottom: 10px;
	line-height: 30px;
}
#btn11{
	width: 100px;
	height:30px;
	display: inline-block;
	border: 1px solid black;
	margin-left: 20px;
	
}
#sample6_address2{
	width: 305px;
	height:18px;
	display: inline-block;
	border: 1px solid #dedede;
	font-size: 14px;
}







.thumbnail {
    display: block;
    padding: 4px;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: all .2s ease-in-out;
    -o-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
}
.thumbnail img{
 height: 100%;
}
input[type=file] {
    display: block;
}

.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}

.fileinput .btn {
    vertical-align: middle;
    min-width: 70px;
}


.btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}



form p span{
	vertical-align: top;
    line-height: 32px;
    width: 200px;
    display: inline-block;
   	text-align: right;
   	padding-right: 30px;
}	
select {
	width: 322px;
	height: 30px;
	padding-left: 10px;
	vertical-align: bottom;
}
form > p {
	margin-bottom: 10px
}

p input[type=text]{
	width: 100%;
	height: 16px;
	padding: 5px;
	padding-left: 10px;
}
p label{
	line-height: 30px;
	width: 303px;;
	display: inline-block;
}
p input[type=radio]{
	margin-right: 20px;
	margin-left: 9px;
}
p input[type=date]{
	width: 100%;
	height: 16px;
	padding: 5px;
	padding-left: 10px;
}
#btn{
	cursor: pointer;
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
    width: 70px;
    margin-top: 20px;
}

</style>
<script>
	$(function(){
		
	
	$("#btn11").click(function() {
		
	
    
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                $("#postcode").html(data.zonecode);
                document.getElementById('sample6_address').value = fullAddr;
				$("#address").html(fullAddr);
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
	});
	
	
	
	
	//개인, 팀, 사업자 폼
	

		var radio = $("#lgender").html();
	$("#type").change(function() {
		var type= $(this).val();
		 if(type == '개인'){
			$("#sname").text("이름");
			$("#sgender").text("성별");
			$("#lgender").html(radio);
			$("#sbirth").text("생년월일");
		}else if(type == '팀'){
			$("#sname").text("팀명");
			$("#sgender").text("팀대표명");
			$("#lgender").html("<input type='text' name='namegender' value=''>");
			
			$("#sbirth").text("설립일");
		}else{
			$("#sname").text("회사명");
			$("#sgender").text("대표자명");
			$("#lgender").html("<input type='text' name='namegender' value=''>");
			$("#sbirth").text("설립일");
		} 
	});
		
		
	$("#btn").click(function() {
		var name = $('input:text[name="name"]').val();
		var namegender = $('input:radio[name="namegender"]:checked').val();
		if(namegender == undefined){
			namegender = $('input:text[name="namegender"]').val();
		}
		var birth = $("#birth").val();
		
		var addr = $("#sample6_address").val();
		var addr2 = $("#sample6_address2").val();
		
		var f1 = $("#profile_img").val();
		
		
		
		if(name =="" || namegender =="" || birth == "" || addr =="" || addr2 == "" || f1 ==""){
			alert("항목을 채워주세요");
		}else{
			$("#form").submit();
		}
		
	});
	
	
	
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
						<p><span>계정 정보</span>
						
						</p>
					</section>
					<section class="profile_wrap">
						<p><span>내정보 수정</span></p>
						
						<div class="no_data_wrap">
							<form id="form" action="${path }" method="post" enctype="multipart/form-data">
							<input type="hidden" name="email" value="${member.email }">
							<div style="margin-bottom: 20px;">
								<div style="width: 210px; height: 200px; margin: 0 auto;">
								<div class="fileinput fileinput-new" data-provides="fileinput">
									<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
										<img src="${pageContext.request.contextPath }/resources/img/img.PNG" alt="...">
									</div>
									<div class="fileinput-preview fileinput-exists thumbnail" style="min-width:199px; min-height:149px; max-width: 200px; max-height: 150px;">
										<img src="">
									</div>
									<div style="margin-top: 10px;">
										<span class="btn btn-default btn-file">
										<span class="fileinput-new">Select image</span>
										<span class="fileinput-exists">Change</span>
										<input type="file" id="profile_img" name="f1"></span>
										<a style="float: right;" href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
									</div>
								</div>
								</div>
							</div>
							<p><span>파트너형태</span><select id="type" name="type">
								<option value="개인" selected="selected">개인</option>
								<option value="팀">팀</option>
								<option value="사업자">사업자</option>
							</select></p>
							<p><span id="sname">이름</span><label id="lname"><input type="text" name="name" value=""></label></p>
							<p><span id="sgender">성별</span><label id="lgender">남<input checked="checked" type="radio" name="namegender" value="남">여<input type="radio" name="namegender" value="여"></label></p>
							<p><span id="sbirth">생연월일</span><label id="lbirth"><input id="birth" type="date" name="birth" value=""></label></p>
							<div>
								<p><span>우편번호</span><label id="postcode" for="btn11"></label><input  type="hidden" id="sample6_postcode" name="addr_num"><input id="btn11" type="button" value="우편번호 찾기"></p>
								<p><span>주소</span><label id="address" for="btn11"style="min-width:320px; overflow:hidden; display: inline-block;"></label><input type="hidden" id="sample6_address" name="addr_main"></p>
								<p><span>나머지 주소</span><input type="text" id="sample6_address2" name="addr_detail"></p>
							</div>
							<p><span id="btn">수정완료</span></p>
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
</html>