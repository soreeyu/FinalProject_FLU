<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootstrap.jsp"></c:import>
<script type="text/javascript">

function getContextPath(){
	alert('${pageContext.request.contextPath}');
	var context = '${pageContext.request.contextPath}';
	return context;
}

</script>
<title>Insert title here</title>

<script type="text/javascript">

$(function(){

	$("#scheduleBtn").click(function(){
		var projectNum = $("#projectNum").val();
		getScheduleNum(projectNum);
	});
	
});



/* 
 * 	
 * Controller에서 이미 프로젝트의 존재여부는 확인하고 들어와진 상태라고 보면된다 
	DB 에 해당 프로젝트의 스케줄이 있는지 확인 후 
	있으면 users, parts , units 정보를 가져오는 함수호출
	없으면 스케줄 생성여부를 물어본 뒤 
		생성한다고하면 생성함수호출 
		안한다고 하면 이전 화면
*/
function getScheduleNum(projectNum){
	
	$.ajax({
		url: getContextPath()+"/schedule/check?projectNum="+projectNum,
		type: "GET",
		success: function(data){
			//alert(JSON.stringify(data));
			
			if(data.schedule=='n'){
				//스케줄 생성하도록 창띄워주기
				if(confirm('스케줄을 생성하시겠소?')){
					createSchedule(data.projectNum);
				}else{
					//이전 화면으로 가기 
					//window.history.back();
					//혹은
					location.href = $(location).attr('href');
				}
				
			}else if(data.schedule=='y'){
				
				var scheduleNum = data.scheduleMainDTO.scheduleNum;
				alert("ajax 성공시 scheduleNum(있을경우) = "+scheduleNum);
				location.href = "./test?scheduleNum="+scheduleNum;
			}else{
				alert("스케줄 생성 오류");
				location.href = $(location).attr('href');
				//location.href = getContextPath();
			}
		}
	});
}



/* 
	스케줄 생성함수 
*/
function createSchedule(projectNum){
	var scheduleNum = 0;
	$.ajax({
		url: getContextPath()+"/schedule/create?projectNum="+projectNum,
		type: "GET",
		success:function(data){
			//alert("스케줄 생성해야됨"+data);
			if(data.result == 'y'){
				alert("생성된 scheduleNum = "+data.scheduleNum);
				location.href = "./test?scheduleNum="+data.scheduleNum;
			}else{
				alert("스케줄생성오류");
			}
		}
	});
}


	
</script>
</head>
<body>

		보배언니의 프로젝트 뷰에 넣어야함	
		<input type="text" id="projectNum" name="projectNum" value="3000">
		<input type="button" id="scheduleBtn" value="스케줄생성하기">

</body>
</html>