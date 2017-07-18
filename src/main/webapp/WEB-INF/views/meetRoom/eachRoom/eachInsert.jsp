<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "${pageContext.request.contextPath}/resources/SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
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
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
        	
        }
    })
})
</script>
</head>
<body>
	<h1>세부공간등록</h1>
	<form action="eachInsert" method="post" enctype="multipart/form-data" id="frm">
	<p>방 이름  <input type="text" name="name" class="eachRoomInfo"> </p>
	<p>세부내용 <textarea rows="" cols="" name="contents" id="smarteditor"></textarea></p>
	<input type="hidden" name="time" value="${time[0]}">
	<input type="hidden" name="time" value="${time[1]}">
	<p>대표사진 <input type="file" name="files" class="eachRoomInfo"> </p>
	<p>공간유형 <input type="text" name="type" class="eachRoomInfo"> </p>
	<p>수용인원 <input type="text" name="human" class="eachRoomInfo"> </p>
	<p>편의시설 <input type="text" name="convenience"> </p>
	<p>가격 <input type="number" name="price" class="eachRoomInfo"> </p>
	<input type="hidden" name="snum" value="${num}">
	<input type="button" id="savebutton" value="방 등록">
	</form>
	
	
</body>
</html>