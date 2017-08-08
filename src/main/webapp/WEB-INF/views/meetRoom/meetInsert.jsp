<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"/>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cde07d5e2e22a53124fd5730df8d372b"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		//전송버튼 클릭이벤트
		$("#savebutton").click(
				function() {				
					//폼 submit
					var meetRoomInfo = document.getElementsByClassName("meetRoomInfo");
					
					if(meetRoomInfo[0].value==""){
						alert("업체명을 입력하세요.");
					}else if(meetRoomInfo[1].value==""){
						alert("오픈시간을 입력하세요.")
					}else if(meetRoomInfo[2].value==""){
						alert("마감시간을 입력하세요.")
					}else if(meetRoomInfo[3].value==""){
						alert("대표 사진을 올려주세요.")
					}else if(meetRoomInfo[4].value==""){
						alert("우편번호를 입력하세요.")
					}else if(meetRoomInfo[5].value==""){
						alert("메인주소를 입력하세요.")
					}else if(meetRoomInfo[6].value==""){
						alert("상세주소를 입력하세요.")
					}else if(meetRoomInfo[7].value==""){
						alert("오픈시간을 입력하세요.")
					}else {	
						$('#frm').submit();
					}
				});
	
	$("#holiday_select_day").hide();
	$("#holiday_select").change(function() {
		if($(this).val()=="휴무없음"){
			$("#holiday_select_day").hide();
		}else {
			$("#holiday_select_day").show();
		}
	});
	
	
	$("#imfile").change(function() {
	    var input = event.target;
	    var reader = new FileReader();
	    reader.onload = function(){
	      var dataURL = reader.result;
	      var output = document.getElementById('output');
	      output.src = dataURL;
	    };
	    reader.readAsDataURL(input.files[0]);
		
	})
	
	/* $(".holiday").click(function() {
		
	}) */
	
	})
</script>
<!-- 주소검색 API  -->
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<style type="text/css">
section {
	min-width : 1152px;
	width : 60%;
	margin : 0 auto;

}
#meetRoom_header{
	display: table;
    position: relative;
    width: 100%;
    padding-bottom: 24px;
    border-bottom: 4px solid #339bff;
    margin-top: 40px;
}
.meetRoom_name {
	margin-top: 30px;
	position: relative;
}
.meetRoom_name .tit{
	line-height: 50px;
    font-size: 18px;
    margin-bottom: 0;
    padding: 0;
}
label {
	cursor:  pointer;
}

.meetRoom_name > input {
	display: inline-block;
    position: relative;
    width: 97%;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    line-height: 50px;
}
#meetRoom_contents {
	margin-top: 30px;
	position: relative;
}
#meetRoom_contents .tit{
	line-height: 50px;
    font-size: 18px;
    margin-bottom: 0;
    padding: 0;
}
#meetRoom_contents > textarea{
	width: 100%;
	position: relative;
	vertical-align: top;
}
.flex_wrap{
    margin: 44px 0 0;
    height : 133px;
    position: relative;
    margin-top: 45px;
}
.flex_wrap .tit {
    line-height: 50px;
    font-size: 18px;
    margin-bottom: 0;
    padding: 0;
    display: block;
    
}
.flex_wrap .column2 {
    margin-left: 0;
    margin-right: 0;
}

.flex_wrap > div {
    float: left;
    display:inline-block; 
}
.flex_wrap.column2>div:nth-child(1){
	padding-right: 20px;
}
.flex_wrap.column2>div:nth-child(2){
	padding-left: 28px;
	position: relative;
}

.box_form{
	width: 45%;
    padding: 0;
    margin-top: 30px;
    position: relative;

}
.box_form .tit {
    line-height: 50px;
    font-size: 15px;
    margin-bottom: 0;
    padding: 0;
}
.box_form>span {
    display: block;
}
.row{
	position: relative;
}

.select {
    display: inline-block;
    position: relative;
    width: 40%;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    margin-left: 0;
    
}
.officehour .select:first-child {
    margin-left: 0;
}
.officehour .select, .box_form .select {
    width: 40%;
}
.select>select {
    position: relative;
    z-index: 2;
    padding: 0 30px 0 13px;
    margin: 0;
    height: 48px;
    border: 0;
    background-color: transparent;
    line-height: 48px;
    vertical-align: top;
    width: 100%;
}

.select:after {
    background-position: -370px -232px;
    width: 18px;
    height: 10px;
    z-index: 5;
}
.txt_hour {
	height : 50px;
	font-size : 16px;
    margin-left: 5px;
    line-height: 50px;
    vertical-align: top;
}
.p_guide .normal {
    font-size: 14px;
    line-height: 18px;
    padding-left: 23px;
    margin: 20px 1px 0 1px;
    color: #656565;
}
.check_list .week {
    max-width: 344px;
}
.select+.check_list {
    margin-top: 10px;
    left: 0;
    bottom: 0;
}
.check_list {
    border-top: 1px solid rgba(0,0,0,0.1);
}   
	
input[type="checkbox"]{
    position: absolute;
    left: -99999px;
    font-size: 16px;
    border-radius: 0;
    color: #000;
    display: inline-block;
    width: 100%;
    border: 1px solid #e0e0e0;
    background-color: #fff;
}
.check_list .week li input+label {
    padding: 16px 0;
    font-size: 15px;
}

.check_list li input+label {
    display: block;
    padding: 11px 10px;
    min-height: 37px;
    font-size: 13px;
    color: #656565;
    border-left: 0;
    background-color: #fff;
}
  
.check_list li input+label:before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    border-left: 1px solid rgba(0,0,0,0.1);
    border-bottom: 1px solid rgba(0,0,0,0.1);
}
.check_list.week li {
    width: 14.28%;
    border-top: 0;
    position: relative;
    float: left;
    vertical-align : middle;
    text-align: center;
}
.check_list:after{
	content: '';
    display: table;
    clear: both;
}
.box_file {
	position: relative;
    margin-top: 100px;
}
.box_file .tit{
    line-height: 50px;
    font-size: 18px;
    margin-bottom: 0;
    padding: 0;
}
.option{
	position : absolute;
    top: 19px;
    right: 0;
    font-size: 14px;
    line-height: 14px;
    color: #656565;
}
.file {
    position: relative;
    padding-right: 174px;

    overflow: hidden;
}
.file .inner_img {
    min-height: 156px;
    font-size: 16px;
    line-height: 16px;
    background-color: #fff;
    border: 1px solid #e0e0e0;
    padding: 16px 16px 0;
    color: #b2b2b2;
}
.btn_box {
    width: 154px;
    height : 50px;
    line-height: 50px;
    position: absolute;
    top: 0;
    right: 0;
    margin-left: 10px;
    overflow: hidden;
}
.file .btn_box .btn {
    display: block;
    width: 100%;
    height: 100%;
    line-height: 50px;
    background-color: #339bff;
    border: 0;
    color: #fff;
    text-align: center;
    font-size: 20px;
    -webkit-border-radius: 0;
    border-radius: 0;
}
.file .result_img {
    position: relative;
    float: left;
    width: 122px;
    height: 122px;
    margin: 0 16px 16px 0;
    vertical-align: top;
}
#output{
	width : 100%;
	height: 100%;
	border: 1px white solid;
}

input[type=text]{
	height: 50px;
    padding: 0 16px;
    line-height: 50px;

}
.box_file .input{
	margin-top: 10px;
}
.input inpu:first-child {
	width: 50%;
}

.check_list li input:checked+label {
    border-color: #5940ac;
    background-color: #704de4;
    color: #fff;
}
#smarteditor{
	resize: none;
}

</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section>
	<div id="meetRoom_header">
		공간 정보를 입력해주세요
	</div>
	<c:if test="${empty dto.num }">
	<form action="meetInsert" method="post" enctype="multipart/form-data" id="frm">	
	</c:if>
	<c:if test="${not empty dto.num }">
	<form action="meetUpdate" method="post" enctype="multipart/form-data" id="frm">
	</c:if>
	<div class="meetRoom_name">
		
			<span class="tit">
				공간명		
			</span>
			
		
		
		<input type="text" name="name" placeholder="공간명을 입력해주세요." class="meetRoomInfo" value="${dto.name}"> 
		
	</div>
	<div id="meetRoom_contents">
		<span class="tit">
				공간소개		
			</span>
		<textarea rows="" cols="" name="contents" id="smarteditor"  style="height: 108px;" placeholder="공간을 상세하게 소개해보세요. 공간의 특징이나 주변환경 등의 세부정보를 작성하시면 효과적입니다.">${dto.contents}</textarea>
	</div>
	
	<div class="flex_wrap column2">
		<div class="box_form officehour">
			<span class="tit">
				<label>
					이용시간
				</label>
			</span>
			<div class="row">
				<div class="select">
						<select name="time" class="meetRoomInfo">
							<c:forEach begin="0" end="23" var="i">
								<option value="${i}">${i}시</option>
							</c:forEach>
						</select>
				</div>
				<span class="txt_hour">부터</span>
				<div class="select">
						<select name="time" class="meetRoomInfo">
							<c:forEach begin="0" end="24" var="i">
								<option value="${i}">${i}시</option>
							</c:forEach>
						</select>
				</div>
				<span class="txt_hour">까지</span>
			</div>
			<p class="p_guide normal" style="margin-top: 20px;">
				실제로 공유 가능한 시간을 입력해주세요.
			</p>
		</div>
		
		<div class="box_form">
			<span class="tit">
				<label >정기휴무</label>
			</span>
			<div class="dayOff">
				<div class="select ">
					<select id="holiday_select" name="holiday">
						<option value="휴무없음">휴무 없음</option>
						<option value="매주">매주</option>
						<option value="매월 첫째주">매월 첫째주</option>
						<option value="매월 둘째주">매월 둘째주</option>
						<option value="매월 셋째주">매월 셋째주</option>
						<option value="매월 넷째주">매월 넷째주</option>
						<option value="매월 마지막주">매월 마지막주</option>
					</select>				
				</div>
					 <ul class="check_list week" id="holiday_select_day" style="display: block;">
							<li><input type="checkbox" name="holiday" class="holiday" id="date_MON" value="월요일"> <label for="date_MON">월</label></li>
							<li><input type="checkbox" name="holiday" class="holiday" id="date_TUE" value="화요일"> <label for="date_TUE">화</label></li>
							<li><input type="checkbox" name="holiday" class="holiday" id="date_WED" value="수요일"> <label for="date_WED">수</label></li>
							<li><input type="checkbox" name="holiday" class="holiday" id="date_THU" value="목요일"> <label for="date_THU">목</label></li>
							<li><input type="checkbox" name="holiday" class="holiday" id="date_FRI" value="금요일"> <label for="date_FRI">금</label></li>
							<li><input type="checkbox" name="holiday" class="holiday" id="date_SAT" value="토요일"> <label for="date_SAT">토</label></li>
							<li><input type="checkbox" name="holiday" class="holiday" id="date_SUN" value="일요일"> <label for="date_SUN">일</label></li>
					</ul>		
			</div>
		</div>
	</div>
	
		
		<div class="box_file" style="display: block;">
			<span class="tit">
				대표이미지 	
			</span>
			<span class="option" > 
				2048 *1158 권장, 한 장당 최대 10MB
			</span>
			<div class="file">
				<div class="inner_img">
					<div>이미지 파일을 추가해 주세요. (JPG, JPEG, PNG)</div>
						<div class="result_img" >
							<img id="output">
						</div>
					</div>
				<div class="btn_box " >
					<label class="btn">
						<div>파일첨부</div>
						<input type="file" name="file"  class="meetRoomInfo"style="display: none;" id="imfile" accept='image/*'>
					</label>	
				</div>	
			</div>
		</div>
		
		<div class="box_file">
			<span class="tit">
				<label>
				주소(위치)				
				</label>
			</span>
			
			<div class="file">
				<input type="text" name="addr_num" id="sample6_postcode" placeholder="우편번호" class="meetRoomInfo" value="${dto.addr_num}">
				<div class="btn_box">
				<label class="btn">
					<div>우편번호 찾기</div>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" accept='image/*'>																		
				</label>
				</div>
			</div>
			<div class="input">
				<input type="text" name="addr_main" id="sample6_address" placeholder="주소" class="meetRoomInfo" value="${dto.addr_main}">
				<input type="text" name="addr_detail" id="sample6_address2" placeholder="상세주소" class="meetRoomInfo" value="${dto.addr_detail}">						
			</div>
		</div>
	
		
		<div class="meetRoom_name">
		<span class="tit">
		홈페이지
		</span>
		<input type="text" name="homePage" class="meetRoomInfo" value="${dto.homePage}">		
		</div>
		
		<input type="button" id="savebutton" value="공간등록" style="margin-top: 50px;  margin-bottom:50px; width: 100%; background-color:#339bff; height: 50px; border: none; color: #fff; font-size: 1.5em; ">
	</form>
	</section>
	<c:import url="../temp/footer.jsp"/>
</body>
</html>