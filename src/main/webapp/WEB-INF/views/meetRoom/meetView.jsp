<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"/>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=cde07d5e2e22a53124fd5730df8d372b&libraries=services"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result){
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
			}
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
		
		 
		 //예약하기 버튼을 눌렀을떄
		 $("#reservation_btn").click(function() {
			//선택한 방의 넘버를 가져온다.
			var reservation_num = $("#eachRoom_num").val();
			var meetroom_num = $("#snum").val();
			var reservation_check  = $("input:radio[name='eachRoom']:checked").val();
			var eachroom_name = $("input:hidden[id='eachRoom_name"+reservation_check+"']").val();
			if(reservation_check == undefined){
				alert("세부 공간을 선택해주세요");
			}else {
				alert(eachroom_name);
				location.href="reservation/reserveInsert?num="+reservation_num+"&snum="+meetroom_num+"&name="+eachroom_name; 
			}
			
			
		});
		
		 
	})

</script>
<style type="text/css">
section {
	min-width : 1152px;
	width : 70%;
	margin : 0 auto;
}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section>
		<h1>view</h1>
		<input type="hidden" value="${dto.num}" id="snum">
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
		<input type="button" id="reservation_btn" value="예약하기">
		<hr>
		<a href="meetDelete?num=${dto.num}">업체 삭제</a>
		<a href="meetUpdate?num=${dto.num}">업체 수정</a>
		</section>


		<c:import url="../temp/footer.jsp"/>
		
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