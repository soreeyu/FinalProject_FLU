<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs-1.0.3.min.js" ></script>
<style type="text/css">

#fileForm{

	visibility: hidden;
}

#data{

width: 500px;
height: 500px;
background-color: yellow;
overflow-y: auto;


}



</style>
<script type="text/javascript">
 
    
	$(function() {
		 var sock;
		//웸소켓을 지정한 url로 연결한다.
		    sock = new SockJS("<c:url value="/echo"/>");
		    sock.onopen=onEntrance;
		    //자바스크립트 안에 function을 집어넣을 수 있음.
		    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
		    sock.onmessage=onMessage;
		    
		    //데이터를 끊고싶을때 실행하는 메소드
		    sock.onclose = onClose;
		    

		    function onEntrance() {
		    	var hello = $('#sessionID').val()+"님이 입장하셨습니다.";
		    	sock.send(hello);
			}
		    
		    function sendMessage(message){
		            /*소켓으로 보내겠다.  */
		            sock.send(message);

		    }
		   
		    
		    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
		    function onMessage(evt){
				var data = evt.data;
				var curID = null;
				var array = data.split(":");

				var messageIP = array[0]; //message를 보내는 사람의 IP
				var messageID = array[1]; //message를 보낸 사람의 ID
				var message = array[2]; //message 내용
				var messageFile = array[3];
		      	var clientIP = '${clientIP}'; //chatDo로 접속할때의 session IP
				var clientID = '${user}';
		      	
/* 				alert("메세지 보낸사람의 IP:"+messageIP);
				alert("메세지 내용:"+message); 
				alert("지금 내 IP:"+clientIP); 
				alert("메세지 보낸사람의 ID: "+messageID); */
				
				if(messageIP==clientIP){
					curID = clientID;
				}else{
					curID = messageID;
				}
				
				if(message==null){
					var print = "<div>";
			    	    print += messageID+"</p>";
			  		    print += "</div>";
				}else if(messageFile==null){
		     	   var print = "<div>";
		    	   print += "<p>["+curID+"]:"+message+"</p>";
		  		   print += "</div>";
		      	}else{
		     	   var print = "<div>";
		    	   print += "<p>["+curID+"]:"+message+messageFile+"</p>";
		  		   print += "</div>";
		      	}
				
				

		  		 $("#data").append(print);
		      
		    }
		    
		    function onClose(evt){
		        $("#data").append("연결 끊김");
		    }

		
		
		    $('input#message').keydown(function(key) {
				
		    	if(key.keyCode==13){
		    		var message = $('#sessionID').val()+":"+$("#message").val();
		    		sendMessage(message);
		            $("#message").val("");
		            $('#data').scrollTop($('#data').prop('scrollHeight'));
		    	}
		    	
		    	
			});
		    
		    
		    
		
    	var check = 0;
 
	        $("#sendBtn").click(function(){
	        	
	        	var message = $('#sessionID').val()+":"+$("#message").val();
	        	sendMessage(message);
	            $("#message").val("");
	            $('#data').scrollTop($('#data').prop('scrollHeight'));

	            if(check==1){

			    	var from = $('#frm')[0];
			    	var formData = new FormData(from);
			    	
			    	$.ajax({
			    		
			    		url:'./chatFile',
			    		processData: false,
			    		contentType: false,
			    		data: formData,
			    		type:'POST',
			    		success:function(result){
			    			alert(result);
			    			sock.send($('#sessionID').val()+":"+$("#message").val()+":(첨부파일)"+result);
			    		}
			    	
			    	 });
			    	
			    	
		        }else{
		        
		        }
	        
	            
	            
	        });          
	        
	     $('#fileStart').click(function() {
	        	
	        	alert("check=1");
	        	$('#fileForm').css("visibility","visible");
		    	check = 1;
	        	
			});
	        
	        $('#x').click(function() {
				
	        	alert("check=0");
	        	$('#fileForm').css("visibility","hidden");
	        	check = 0;
	        	
			});
	        
    
	});  


</script>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${member.name}" id="sessionID">
<input type="text" id="message" value=""/>
<input type="button" id="sendBtn" value="전송"/><input type="button" value="파일을 첨부하실 경우 클릭하세요" id="fileStart">
<form id="frm" method="post" enctype="multipart/form-data">
<div id="fileForm">
<input type="file" name="file2" id="file2"/><span id="x">X</span>
</div>
</form>
<div id="data">

</div>
</body>
</html>