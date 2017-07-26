<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
    //canvas요소에 대한 Context 개체 가져오기            
    
    var ctx = document.getElementById('mycanvas').getContext('2d');
    if(!ctx) {
        return;
    }
   
   
    ctx.strokeStyle ='black';
    
    ctx.beginPath();
    ctx.moveTo(100,15);
    ctx.lineTo(100,100);
    ctx.fillText("전문성",85,10);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(19,75);
    ctx.fillText("적극성",0,65);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(49,169);
    ctx.fillText("일정 준수",25,179);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(151,169);
    ctx.fillText("의사소통",135,179);
    ctx.closePath();
    ctx.stroke();
    
    ctx.beginPath();
    ctx.moveTo(100,100);
    ctx.lineTo(181,75);
    ctx.fillText("만족도",168,65);
    ctx.closePath();
    ctx.stroke();
  
    
    //5
    ctx.beginPath();
    ctx.moveTo(100,15);
    ctx.lineTo(19,75);
    ctx.lineTo(49,169);
    ctx.lineTo(151,169);
    ctx.lineTo(181,75);
    ctx.closePath();
    ctx.stroke();
    
    //4
    ctx.beginPath();
    ctx.moveTo(100,30);
    ctx.lineTo(33,79);
    ctx.lineTo(58,157);
    ctx.lineTo(142,157);
    ctx.lineTo(167,79);
    ctx.closePath();
    ctx.stroke();
    
    //3
    ctx.beginPath();
    ctx.moveTo(100,45);
    ctx.lineTo(47,84);
    ctx.lineTo(67,146);
    ctx.lineTo(133,146);
    ctx.lineTo(153,84);
    ctx.closePath();
    ctx.stroke();
    
    //2
    ctx.beginPath();
    ctx.moveTo(100,60);
    ctx.lineTo(61,88);
    ctx.lineTo(76,134);
    ctx.lineTo(124,134);
    ctx.lineTo(139,88);
    ctx.closePath();
    ctx.stroke();
    
    //1
    ctx.beginPath();
    ctx.moveTo(100,75);
    ctx.lineTo(75,93);
    ctx.lineTo(85,123);
    ctx.lineTo(115,123);
    ctx.lineTo(125,93);
    ctx.closePath();
    ctx.stroke();
    


    //내 평점
    //위에서부터 왼쪽으로
    //         전문성          적극성         일정준수           의사소통            만족도
    //5점 좌표 {(100,15),(19,75),(49,169),(151,169),(181,75)}
    //4점 좌표 {(100,30),(33,79),(58,157),(142,157),(167,79)}
    //3점 좌표 {(100,45),(47,84),(67,146),(133,146),(153,84)}
    //2점 좌표 {(100,60),(61,88),(76,134),(124,134),(139,88)}
    //1점 좌표 {(100,75),(75,93),(85,123),(115,123),(125,93)}
    
   	var professional = Math.floor(${evaluation.professional });
    var passion = Math.floor(${evaluation.passion});
    var schedule = Math.floor(${evaluation.schedule });
    var communication = Math.floor(${evaluation.communication });
   	var satisfy =  Math.floor(${evaluation.satisfy });
   
    
/*     alert(schedule);
    alert(communication);
    alert(satisfy); */
   	
    ctx.strokeStyle = "blue";
    ctx.beginPath();
    
    if(professional==5){
    	ctx.moveTo(100,15); 
    }else if(professional==4){
    	ctx.moveTo(100,30);
    }else if(professional==3){
    	ctx.moveTo(100,45);
    }else if(professional==2){
    	ctx.moveTo(100,60);
    }else if(professional==1){
    	ctx.moveTo(100,75);
    }else{
    	ctx.moveTo(100,100);
    }
    
    if(passion==5){
    	ctx.lineTo(19,75);
    }else if(passion==4){
    	ctx.lineTo(33,79);
    }else if(passion==3){
    	ctx.lineTo(47,84);
    }else if(passion==2){
    	ctx.lineTo(61,88);
    }else if(passion==1){
    	ctx.lineTo(75,93);
    }else{
    	ctx.lineTo(100,100);
    }
    
    if(schedule==5){
    	ctx.lineTo(49,169);
    }else if(schedule==4){
    	ctx.lineTo(58,157);
    }else if(schedule==3){
    	ctx.lineTo(67,146);
    }else if(schedule==2){
    	ctx.lineTo(76,134);
    }else if(schedule==1){
    	ctx.lineTo(85,123);
    }else{
    	ctx.lineTo(100,100);
    }
    
    if(communication==5){
    	ctx.lineTo(151,169);
    }else if(communication==4){
    	ctx.lineTo(142,157);
    }else if(communication==3){
    	ctx.lineTo(133,146);
    }else if(communication==2){
    	ctx.lineTo(124,134);
    }else if(communication==1){
    	ctx.lineTo(115,123);
    }else{
    	ctx.lineTo(100,100);
    }
    
    if(satisfy==5){
    	ctx.lineTo(181,75);
    }else if(satisfy==4){
    	ctx.lineTo(167,79);
    }else if(satisfy==3){
    	ctx.lineTo(153,84);
    }else if(satisfy==2){
    	ctx.lineTo(139,88);
    }else if(satisfy==1){
    	ctx.lineTo(125,93);
    }else{
    	ctx.lineTo(100,100);
    }
    
    
    ctx.fillStyle = "yellow";
    ctx.globalAlpha = "0.7";
    ctx.fill();
    ctx.closePath();
    ctx.stroke();
    
    
});
</script>
</head>
<body>


<h2>Client INFO</h2>

<div class="canvas_div">
	<canvas  id="mycanvas" width="200" height="200">
	
	</canvas>
</div>

<div>
<h4>Client Table</h4>

</div>

<div>
<h4>Member Table</h4>
<p>${member.kind }</p>
<p>${member.email }</p>
<p><img alt="" src="${pageContext.servletContext.contextPath}/resources/upload/${member.fProfileImage}"></p>
<p>${member.type}</p>
<p>${member.phone}</p>
<p>${member.fax}</p>
<p>${member.bank} ${member.accountNumber} ${member.account}</p>
</div>

<div>
<h4>Client Table</h4>
<p>${client.homepage}</p>
<p>${client.registeredP}</p>
<p>${client.contractP}</p>
<p>${client.ongoingP}</p>
<p>${client.completeP}</p>
<p>${client.totalMoney}</p>
</div>

</body>
</html>