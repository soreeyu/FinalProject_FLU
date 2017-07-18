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
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 마우스 휠 플러그인 -->
<script type='text/javascript' src='../resources/js/jquery.mousewheel.min.js'></script>
<script type="text/javascript">
	$(function() {
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "smarteditor",
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
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
						//id가 smarteditor인 textarea에 에디터에서 대입
						editor_object.getById["smarteditor"].exec(
								"UPDATE_CONTENTS_FIELD", []);
	
						// 이부분에 에디터 validation 검증
						$('#frm').submit();
					}
				})

	$("#meetRoom_time").mouseenter(function() {
		$(this).mousewheel(function(event, delta) {
			this.scrollLeft -= (delta * 30);    
		     event.preventDefault();
		});
		
	});
		
				
	var check=0;
	var index1=0;
	var index2=0;
 	$(".time").each(function(index){
		$(this).click(function(){
			if(check<2){
				check++;
				if(check==1){
					index1 = $(this).attr("title");			
					$(this).css("background-color", "red");
					
				}
				else if(check==2) {
					index2 = $(this).attr("title");
					$(this).css("background-color", "red");
					
					sel(index1,index2); 
					
				
				}
			}else {
				check=0;
				$(".time").css("background-color", "black");
			}
			
			
		});
 			
	});	 
	
	
	
	function sel(index1,index2){
		alert('함수안 index1='+index1+" index2="+index2);
		$(".time").each(function(index){
			if(index>=index1 && index<=index2){
				$(this).css("background-color", "red");
			}else if(index>=index2 && index<=index1){
				$(this).css("background-color", "red");
			}
			
		});	
		
		
		if(index1*1>index2*1){
			alert("index1이 index2보다 큰 경우");
			$("#topen").val(index2);
			$("#tclose").val(index1);
		}else if(index1*1<index2*1) {
			$("#topen").val(index1);
			$("#tclose").val(index2);
		}else if(index1*1==index2*1){
			alert("오픈시간과 마감시간을 확인하세요");
			$(".time").css("background-color", "black");
			
		}
	}
	
	 
	 
	$("#reset_btn").click(function() {
		var topen = $("#topen").val()*1;
		var tclose = $("#tclose").val()*1;
		
		if(topen!="" && tclose!=""){
			alert("시간을 다시 설정합니다.");
			$(".time").css("background-color", "black");
			check=0;
			$("#topen").val("");
			$("#tclose").val("");
		}else if(topen=="" || tclose ==""){
			alert("오픈 시간과 마감시간을 입력해주세요");
		}
	})
	
	$("#holiday_select_day").hide();
	$("#holiday_select").change(function() {
		if($(this).val()=="none"){
			$("#holiday_select_day").hide();
		}else {
			$("#holiday_select_day").show();
		}
	});
	
	

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
	width : 70%;
	margin : 0 auto;
	height: 1000px;
}
#meetRoom_header{
	display: table;
    position: relative;
    width: 100%;
    padding-bottom: 24px;
    border-bottom: 4px solid #0066ff;
    margin-top: 40px;
}
.meetRoom_name {
	margin-top: 40px;
	position: relative;
}
.meetRoom_name > input {
	display: inline-block;
    position: relative;
    width: 100%;
    border: 1px solid #e0e0e0;
    background-color: #fff;
    line-height: 50px;
}
#meetRoom_contents {
	margin-top: 40px;
	position: relative;
}
#meetRoom_contents > textarea{
	width: 99%;
	margin: 0 auto;
}
#meetRoom_time {
	width : 100%;
	overflow: hidden;
}
#holiday {
	display: inline-block;
    position: relative;
    width: 50%;
    border: 1px solid #e0e0e0;
    background-color: #fff
}
#holiday > selecet {
	position: relative;
    z-index: 2;
    padding: 0 35px 0 13px;
    margin: 0;
    height: 48px;
    border: 0;
    background-color: transparent;
    line-height: 48px;
    vertical-align: top;
    width: 100%;
}
#holiday_select_day li {
	display : inline;
	float: left;	
	list-style: none;
}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"/>
	<section>
	<div id="meetRoom_header">
		공간 정보를 입력해주세요
	</div>
	
	<form action="meetInsert" method="post" enctype="multipart/form-data" id="frm">
	<div class="meetRoom_name">
		공간명<br>
		<input type="text" name="name" placeholder="공간명을 입력해주세요." class="meetRoomInfo">
	</div>
	<div id="meetRoom_contents">
		공간소개
		<textarea rows="" cols="" name="contents" id="smarteditor"> </textarea>
	</div>
		<p>이용시간</p>
		<div id="meetRoom_time">
		<table id="timeList">
			<thead>
				<tr>
					<c:forEach begin="0" end="24" var="i" step="1">
						<td>
							${i}
						</td>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach begin="0" end="23" var="i" varStatus="r" step="1">
						<td>
							<div class="time" title="${r.index}" style="min-width: 90px; min-height: 76px; background-color: black; margin-left: 10px;"></div>
						</td>
					</c:forEach>
				</tr>
			</tbody>

		</table>
		</div>
		<div id="timeresult">
			<input type="hidden" name="time" id="topen" class="meetRoomInfo">
			<input type="hidden" name="time" id="tclose" class="meetRoomInfo">
			<input type="button" id="reset_btn" value="RESET">
		</div>
		<br>
		정기 휴무
		<div id="holiday">
		<select id="holiday_select" name="holiday">
			<option value="none">휴무 없음</option>
			<option value="weekly">매주</option>
			<option value="week1">매월 첫째주</option>
			<option value="week2">매월 둘째주</option>
			<option value="week3">매월 셋째주</option>
			<option value="week4">매월 넷째주</option>
			<option value="lastweek">매월 마지막주</option>
			<option value="monthly">직접지정</option>
		</select>
		</div>
		<div id="holiday_select_day">
		 <ul class="check_list week" id="weekError">
				<li><input type="checkbox" name="holiday" id="date_MON" value="MON"> <label for="date_MON">월</label></li>
				<li><input type="checkbox" name="holiday" id="date_TUE" value="TUE"> <label for="date_TUE">화</label></li>
				<li><input type="checkbox" name="holiday" id="date_WED" value="WED"> <label for="date_WED">수</label></li>
				<li><input type="checkbox" name="holiday" id="date_THU" value="THU"> <label for="date_THU">목</label></li>
				<li><input type="checkbox" name="holiday" id="date_FRI" value="FRI"> <label for="date_FRI">금</label></li>
				<li><input type="checkbox" name="holiday" id="date_SAT" value="SAT"> <label for="date_SAT">토</label></li>
				<li><input type="checkbox" name="holiday" id="date_SUN" value="SUN"> <label for="date_SUN">일</label></li>
			</ul>
		</div>

		대표이미지<br>
		<input type="file" name="file" id="files" class="meetRoomInfo">
		<p>우편번호<input type="text" name="addr_num" id="sample6_postcode" placeholder="우편번호" class="meetRoomInfo"></p>
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		<br>
		<p>주소<input type="text" name="addr_main" id="sample6_address" placeholder="주소" class="meetRoomInfo"></p>
		<p>상세주소<input type="text" name="addr_detail" id="sample6_address2" placeholder="상세주소" class="meetRoomInfo"></p>
		<div class="meetRoom_name">
		홈페이지
		<input type="text" name="homePage" class="meetRoomInfo">		
		</div>
		<input type="button" id="savebutton" value="전송">
	</form>
	</section>
	<c:import url="../temp/footer.jsp"/>
</body>
</html>