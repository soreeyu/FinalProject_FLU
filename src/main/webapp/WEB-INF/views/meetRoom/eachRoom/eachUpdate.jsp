<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

	<h1>세부공간 정보 수정</h1>
	<form action="eachRoom/eachUpdate" method="post" enctype="multipart/form-data" id="frm">
	<p>방 이름  <input type="text" name="name" value="${dto.name} "> </p>
	<p>세부내용 <textarea rows="" cols="" name="contents"  id="smarteditor">${dto.contents}</textarea></p>
	<p>예약가능시간 <input type="text" name="time" value="${dto.time}"> </p>
	<p>대표사진 <input type="file" name="files" > </p>
	<p>공간유형 <input type="text" name="type" value="${dto.type}"> </p>
	<p>수용인원 <input type="text" name="human" value="${dto.human} "> </p>
	<p>편의시설 <input type="text" name="convenience" value="${dto.convenience}"> </p>
	<p>가격 <input type="number" name="price" value="${dto.price}"> </p>
	<p> <input type="hidden" name="num" value="${dto.num}">  </p>
	<p> <input type="hidden" name="snum" value="${dto.snum}">  </p>
	<input type="button" id="savebutton" value="방 정보 수정">
	</form>
	
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
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
    
    //업체 등록 성공시에
   
})
</script>