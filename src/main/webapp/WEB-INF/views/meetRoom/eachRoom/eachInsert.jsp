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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
})
</script>
<style type="text/css">
section {
	min-width : 1152px;
	width : 60%;
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
}
.option{
	position : absolute;
    top: 19px;
    right: 0;
    font-size: 14px;
    line-height: 14px;
    color: #656565;
}
.convenience_list .inner{
	margin-bottom: -25px;
}
.convenience_list .inner li:first-child {
    margin-left: 0;
}
.convenience_list .inner li {
    float: left;
    width: 90px;
    padding-bottom: 25px;
    margin: 0 3px;
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
	<input type="file" name="files" class="eachRoomInfo">	
	</div>
	
	공간유형
	<select name="type" class="eachRoomInfo">
		<option value="세미나실">세미나실</option>
		<option value="작업실">작업실</option>
		<option value="회의실">회의실</option>
	</select>

	<div class="eachRoom_form">
		<div class="tit_form">
			편의시설
		</div>
		<span class="option">구비된 편의시설을 선택해주세요</span>
		<div class="convenience_list">
			<ul class="inner">
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i></i>
						<span>TV/프로젝터</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i> </i>
						<span>인터넷/WIFI</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<span></span>
						<span>복사/인쇄기</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i> </i>
						<span>화이트보드</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i> </i>
						<span>음향/마이크</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i> </i>
						<span>주차</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i> </i>
						<span>금연</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i> </i>
						<span>PC/노트북</span>
					</label>
				</li>
				<li>	
					<input type="checkbox" name="convenience">
					<label>
						<i> </i>
						<span>의자/테이블</span>
					</label>
				</li>
			</ul>
		</div>
	</div>
	
	<div>
	수용인원 <input type="number" name="human" class="eachRoomInfo">
	</div>
	<div>
	가격 <input type="number" name="price" class="eachRoomInfo">
	
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