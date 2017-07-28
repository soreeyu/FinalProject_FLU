<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">
    
    
    
    var sock;
    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo"/>");
    
    //자바스크립트 안에 function을 집어넣을 수 있음.
    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
    sock.onmessage=onMessage;
    
    //데이터를 끊고싶을때 실행하는 메소드
    sock.onclose = onClose;
    
        
    $(function() {
	
        $("#sendBtn").click(function(){
            sendMessage();
        });

	});
    
    
    function sendMessage(){
            /*소켓으로 보내겠다.  */
            sock.send($("#message").val());
    }
   
    
    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    function onMessage(evt){
        var data = evt.data;
      	var sessionId = null;
      	var message = null;
      	
      	var strArray = data.split('|');
      	
      	for(var i=0; i<srtArray.length;i++){
      		console.log('str['+i+']: '+srtArray[i]);
      	}
      	
      	var curId = $('#curId').val();
        console.log('curId:'+curId);
      	
       sessionId = strArray[0];
       message = strArray[1]; 
      	
       if(sessionId==curId){
    	   var print = "<div class='well'>";
    	   print += "<div>";
    	   print += "<strong>["+sessionId+"]:"+message+"</strong>";
    	   print += "</div>";
  		   print += "</div>";
  		   
  		 $("#data").append(print);
       
       }else{
    	   var print = "<div class='well'>";
    	   print += "<div>";
    	   print += "<strong>["+sessionId+"]:"+message+"</strong>";
    	   print += "</div>";
  		   print += "</div>";
  		   
  		 $("#data").append(print);
       }
       
       console.log('chatData:'+data);
      
    }
    
    function onClose(evt){
        $("#data").append("연결 끊김");
    }
    
</script>

<title>Insert title here</title>
</head>
<body>
<input type="text" value="${member.email}" id="curId">
<input type="text" id="message"/>
<input type="button" id="sendBtn" value="전송"/>
<div id="data">

</div>
</body>
</html>