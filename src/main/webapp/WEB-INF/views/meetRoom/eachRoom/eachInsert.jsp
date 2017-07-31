<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../temp/bootstrap.jsp"/>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 아이콘 -->
<script type="text/javascript">$(function(){
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        var eachRoomInfo = document.getElementsByClassName("eachRoomInfo");
        if(eachRoomInfo[0].value==""){
        	alert("방 이름을 입력하세요.");
        }else if(eachRoomInfo[1].value==""){
        	alert("대표사진을 첨부하세요.");
        }else if(eachRoomInfo[2].value==""){
        	alert("공간의 유형을 입력하세요.");
        }else if(eachRoomInfo[3].value==""){
        	alert("수용인원을 입력하세요.");
        }else if(eachRoomInfo[4].value==""){
        	alert("가격을 입력하세요");
        }else {
	        //폼 submit
	        $("#frm").submit();
        	
        }
    })
    
    	//편의시설 하나 클릭 했을때
    	var convenience = document.getElementsByName("convenience");
    	var check=0;
		$(".fa").click(function() {
			check++;
			
			var title = $(this).attr("title");
			
			if(title=="TV/프로젝터"){
				convenience[0].value=title;
				alert(convenience[0].value);
				$("#tv").css("background-color", "white");				
			}else if(title=="인터넷/WIFI"){
				convenience[1].value=title;
				alert(convenience[1].value);
				$("#wifi").css("background-color", "white");
			}else if(title=="복사/인쇄기"){
				convenience[2].value=title;
				alert(convenience[2].value);
				$("#print").css("background-color", "white");
			}else if(title=="음향/마이크"){
				convenience[3].value=title;
				alert(convenience[3].value);
				$("#mic").css("background-color", "white");
			}else if(title=="주차"){
				convenience[4].value=title;
				alert(convenience[4].value);
				$("#parking").css("background-color", "white");
			}else if(title=="금연"){
				convenience[5].value=title;
				alert(convenience[5].value);
				$("#nosomking").css("background-color", "white");
			}else if(title=="PC/노트북"){
				convenience[6].value=title;
				alert(convenience[6].value);
				$("#laptop").css("background-color", "white"); 
			}
			
		});

		
		$("#human_minus").click(function() {
			var num = $("#human").val();
			num--;
			$("#human").val(num);
		});
		$("#human_plus").click(function() {
			var num = $("#human").val();
			num++;
			$("#human").val(num);
		});
		
		$("#price_plus").click(function() {
			var num = $("#price").val();
			num = (num*1)+100;
			$("#price").val(num);
		});
		$("#price_minus").click(function() {
			var num = $("#price").val();
			num = (num*1)-100;
			$("#price").val(num);
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
			
				
			
			
	
		
		
		
})
</script>
<style type="text/css">
section {
	min-width : 1152px;
	width : 60%;
	height: 1500px;
	margin : 0 auto;
}
#eachRoom_header{
	display: table;
    position: relative;
    width: 100%;
    padding-bottom: 24px;
    border-bottom: 4px solid #0066ff;
    margin-top: 40px;
}
#eachRoom_name {
	margin-top: 40px;
	position: relative;
}
#eachRoom_name > input {
	display: inline-block;
    position: relative;
    width: 100%;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    line-height: 50px;
}
#eachRoom_contents {
	margin-top: 40px;
	position: relative;
}
#eachRoom_contents > textarea{
	width: 100%;
	position: relative;
	vertical-align: top;
}
.eachRoom_form{
	position: relative;
    margin-top: 45px;
    display: block;
}
.eachRoom_form > span{
	display: block;
}
.tit_form {
	margin-bottom: 30px;
	line-height: 50px;
    font-size: 18px;
    padding: 0;
    border-bottom: 1px solid #e0e0e0;
    display: block;
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
    background-color: #704de4;
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
.convenience_list{
	height: 130px;
}
.convenience_list .inner{
	margin-bottom: -25px;
	list-style: none;
    -webkit-box-sizing: border-box;
}
.convenience_list .inner li:first-child {
    margin-left: 0;
}
.convenience_list .inner li {
    float: left;
    width: 90px;
    padding-bottom: 25px;
    margin: 0 3px;
    text-align: center;
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
.convenience_list input[type=checkbox]+label {
    display: inline-block;
    height: 90px;
    padding: 17px;
    margin-bottom: 15px;
    border: 1px solid #e0e0e0;
    background: #f6f6f6;
    text-align: center;
    cursor: pointer;
    
}
input[type=checkbox]+label span {
    display: block;
    width: 90px;
    padding: 26px 0 0;
    margin: 0 -17px;
    font-size: 14px;
    color: #000;
    line-height: 17px;
    text-align: center;
}
input[type=checkbox]+label .fa{
    background-position: -236px -380px;
    width: 50px;
    height: 50px;
}


.flex_wrap.column2 {
	margin-top: 10px;
    margin-left: 0;
    margin-right: 0;
}
.flex_wrap.column2>dl {
    width: 50%;
    padding: 0 34px 0 0;
    margin-top: 0;
}
.pull_left {
    float: left;
    width: 170px;
}
.pull_right{
	float: left;
}
.box_setting {
    position: relative;
    width: 250px;
    height: 50px;
    border: 1px solid #e0e0e0;
    background: #fff;
    text-align: center;
}
.input {
    display: inline-block;
    position: relative;
}
input[type=tel]{
    width: 58px;
    height: 48px;
    padding: 0 2px;
    border: 0;
    text-align: right;
    vertical-align: top;
    font-size: 18px;
    line-height: 48px;
}
.unit {
    display: inline-block;
    margin-top: 0;
    font-size: 18px;
    color: #000;
    line-height: 50px;
}
.btn_minus {
    position: absolute;
    top: 0;
    left: 0;
    border-right: 1px solid #ebebeb;
}
.box_setting .btn_plus {
    position: absolute;
    top: 0;
    right: 0;
    border-left: 1px solid #ebebeb;
}
a {
	text-decoration: none;
}
.box:after{
    content: '';
    display: table;
    clear: both;
}
.type_sub {
	line-height: 50px;
    font-size: 18px;
    margin-bottom: 30px;
    padding: 0;
}

</style>
</head>
<body>
	<c:import url="../../temp/header.jsp"/>
	
	<section>
	<div id="eachRoom_header">
		세부공간 정보를 입력해주세요	
	</div>
	
	<form action="eachInsert" method="post" enctype="multipart/form-data" id="frm">
	<div id="eachRoom_name">
		<span>
			세부공간 명
		</span>
		<input type="text" name="name" placeholder="세부 공간명을 입력해주세요." class="eachRoomInfo">
	</div>
	
	<div id="eachRoom_contents">
		<span>
			세부공간 소개
		</span>
		<textarea rows="" cols="" name="contents"></textarea>
	</div>
	
	<div class="eachRoom_form">
		<div class="tit_form">
			대표이미지 	
		</div>
		<span class="option">
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
					<input type="file" name="files" class="eachRoomInfo" style="display: none;" id="imfile" accept='image/*' > 	
				</label>	
			</div>	
		</div>
	</div>
	
	<div class="eachRoom_form">
	<div class="tit_form">
	공간유형	
	</div>
	<select name="type" class="eachRoomInfo">
		<option value="세미나실">세미나실</option>
		<option value="작업실">작업실</option>
		<option value="회의실">회의실</option>
	</select>
	</div>

	<div class="eachRoom_form">
		<div class="tit_form">
			편의시설
		</div>
		<span class="option">구비된 편의시설을 선택해주세요</span>
		<div class="convenience_list">
			<ul class="inner">
				<li style="display: list-item;">	
					<input type="checkbox" name="convenience" id="1">
					<label for="1" id="tv">
						<i class="fa fa-television" style="font-size:36px" title="TV/프로젝터"></i>
						<span>TV/프로젝터</span>
					</label>
				</li>
				<li style="display: list-item;">	
					<input type="checkbox" name="convenience" id="2">
					<label for="2" id="wifi">
						<i class="fa material-icons" style="font-size:36px" title="인터넷/WIFI">wifi</i>
						<span>인터넷/WIFI</span>
					</label>
				</li>
				<li style="display: list-item;">	
					<input type="checkbox" name="convenience" id="3">
					<label for="3" id="print">
						<i class="fa fa-print" style="font-size:36px" title="복사/인쇄기"></i>
						<span>복사/인쇄기</span>
					</label>
				</li>
				<li style="display: list-item;">	
					<input type="checkbox" name="convenience" id="4">
					<label for="4" id="mic">
						<i class="fa fa-microphone" style="font-size:36px" title="음향/마이크"></i>
						<span>음향/마이크</span>
					</label>
				</li>
				<li style="display: list-item;">	
					<input type="checkbox" name="convenience" id="5">
					<label for="5" id="parking">
						<i class="fa material-icons" style="font-size:36px" title="주차">local_parking</i>
						<span>주차</span>
					</label>
				</li>
				<li style="display: list-item;">	
					<input type="checkbox" name="convenience" id="6">
					<label for="6" id="nosomking">
						<i class="fa material-icons" style="font-size:36px" title="금연">smoke_free</i>
						<span>금연</span>
					</label>
				</li>
				<li style="display: list-item;" >	
					<input type="checkbox" name="convenience" id="7">
					<label for="7" id="laptop">
						<i class="fa fa-laptop" style="font-size:36px" title="PC/노트북"></i>
						<span>PC/노트북</span>
					</label>
				</li>
			</ul>
		</div>
	</div>
	
	
	<div class="eachRoom_form">
	<div class="tit_form">
		추가정보
	</div>
	<div class="flex_wrap column2">
	<dl class="box reservation">
		<dt class="pull_left tit">
			<label>
				수용인원
			</label>
		</dt>
		<dd class="pull_right">
			<div class="box_setting">
				<span class="input won">
					<input type="tel" name="human" id="human" class="eachRoomInfo" value="1" min="0">
					<strong class="txt unit">명</strong>
				</span>
				<span class="btn_minus" id="human_minus">
					<i class="fa fa-minus" style="font-size:48px"></i>
				</span>
				<span class="btn_plus" id="human_plus">
					<i class="fa fa-plus" style="font-size:48px"></i>
				</span>
			</div>
		</dd>
	</dl>
	<dl class="box">
		<dt class="pull_left tit">
			<label>
				가격
			</label>
		</dt>
		<dd class="pull_right">
			<div class="box_setting">
				<span class="input won">
					<input type="tel" name="price" id="price" class="eachRoomInfo" value="1000" step="100" min="0">
					<strong class="txt unit">원</strong>
				</span>
				<span class="btn_minus" id="price_minus">
					<i class="fa fa-minus" style="font-size:48px"></i>
				</span>
				<span class="btn_plus" id="price_plus">
					<i class="fa fa-plus" style="font-size:48px"></i>
				</span>
			</div>
		</dd>
	</dl>
	</div>
	
	</div>
	
	<input type="button" id="savebutton" value="방 등록">


	<input type="hidden" name="snum" value="${num}">
	<input type="hidden" name="time" value="${time[0]}">
	<input type="hidden" name="time" value="${time[1]}">
	</form>
	</section>
	
	<c:import url="../../temp/footer.jsp"/>
</body>
</html>