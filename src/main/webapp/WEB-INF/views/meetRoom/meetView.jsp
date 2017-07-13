<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cde07d5e2e22a53124fd5730df8d372b&libraries=services"></script>
<script type="text/javascript">
	$(function() {
		/*해당 업체가 보유하고 있는 방의 리스트를 뿌려주는 스크립트  */
		var num = ${dto.num};
		 $.ajax({
			url : "eachRoom/eachList",
			type : "POST",
			data : {num:num},
			success : function(data) {
				$("#eachRoom").html(data);
			}
		});
		 /*해당 업체가 보유하고 있는 방의 리스트를 뿌려주는 스크립트  */
		 
		 /*해당 업체가 보유하고 있는 방 하나를 삭제하는 스크립트  */
		$("#eachRoom").on("click", ".del", function() {
			var num = $(this).attr("id");
			
			$.ajax({
				url : "eachRoom/eachDelete",
				type : "POST",
				data : {num : num},
				success : function(data) {
					alert(data.trim());
					location.href="../meetRoom/meetView?num=${dto.num}";
				}
			})
		});
		/*해당 업체가 보유하고 있는 방 하나를 삭제하는 스크립트  */
		
		/* 해당 업체가 보유하고 있는 방 하나의 정보를 수정하는 스크립트 */
		 $("#eachRoom").on("click", ".update", function() {
				var num = $(this).attr("id");
				
				$.ajax({
					url : "eachRoom/eachUpdate?num="+num,
					type : "GET",
					success : function(data) {
						$("#eachRoom").html(data);
					}
				})
			});
		 /* 해당 업체가 보유하고 있는 방 하나의 정보를 수정하는 스크립트 */
		
	})

</script>
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
</head>
<body>
	<h1>view</h1>
		<h2>업체 이름 : ${dto.name}</h2>
		<input type="hidden" id="mak" value="${dto.name}">		
		<h2>운영 시간 : ${dto.time}</h2>
		<h2>업체 후무 : ${dto.holiday}</h2>
		<h2>주소  : ${dto.addr_main}</h2>
		<div>
			${dto.contents}
		</div>
		<input type="hidden" id="address_main" value="${dto.addr_main}">
		<div id="map" style="width:500px;height:400px;"></div>
		<h2>홈페이지 : ${dto.homePage}</h2>
		<p>세부공간</p>
		<a href="eachRoom/eachInsert?num=${dto.num}">세부공간 등록</a>
		<hr>
		<h2>세부공간 리스트</h2>
		<div id="eachRoom">
		</div>
		<hr>
		<a href="meetDelete?num=${dto.num}">업체 삭제</a>
		<a href="meetUpdate?num=${dto.num}">업체 수정</a>



		
<!-- 주소를 가져와 지도에 표시하는 API  -->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
var address = $("#address_main").val();
var maker = $("#mak").val();
// 주소로 좌표를 검색합니다
geocoder.addr2coord(address, function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><a href="http://map.daum.net/link/search/'+maker+'">'+maker+'</a></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>		
</body>
</html>