<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "../resources/SE2/SmartEditor2Skin.html", 
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
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})
</script>
</head>
<body>
	<h2>업체정보 수정</h2>
	<form action="meetUpdate"  method="post" enctype="multipart/form-data" id="frm">
	<p>업체이름<input type="text" name="name" value="${dto.name}" ></p>
	<p>업체소개<textarea rows="" cols="" name="contents" id="smarteditor" >${dto.contents} </textarea></p>
	<p>이용시간<input type="text" name="time" value="${dto.time}"></p>
	<p><input type="button" value="파일추가" id="Fbtn"></p>
	<p>대표이미지<input type="file" name="file"></p>
	<p>휴무<input type="text" name="holiday" value="${dto.holiday}"></p>
	<p>주소_넘<input type="text" name="addr_num" value="${dto.addr_num}"></p>
	<p>주소_메인<input type="text" name="addr_main" value="${dto.addr_main}"></p>
	<p>주소_디테일<input type="text" name="addr_detail" value="${dto.addr_detail}"></p>
	<p>홈페이지<input type="text" name="homePage" value="${dto.homePage}"></p>
	<p><input type="hidden" name="num" value="${dto.num}"></p>
	<input type="button" id="savebutton" value="정보수정">
	</form>	
</body>
</html>