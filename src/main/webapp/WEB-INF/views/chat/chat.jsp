<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs-1.0.3.min.js" ></script>
<!-- <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> -->
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
	
    	var check = 0;
    	
		$('#file2').change(function() {
			
	    	alert("check=1");
	    	check = 1;
		
		});		
	    		
	        $("#sendBtn").click(function(){
	            sendMessage();
	            $("#message").val("");
	        
	            
	            if(check==1){

		        	alert("파일을 업로드하러 들어왔도다");
			    	var from = $('#frm')[0];
			    	var formData = new FormData(from);
			    	
			    	$.ajax({
			    		
			    		url:'./chatFile',
			    		processData: false,
			    		contentType: false,
			    		data: formData,
			    		type:'POST',
			    		success:function(result){
			    			sock.send(result);
			    		}
			    	
			    	 });
			    	
			    	
		        }else{
		        
		        }
	        
	        });
	             
});
	        
		    	
    
    function sendMessage(){
            /*소켓으로 보내겠다.  */
            sock.send($("#message").val());

    }
   
    
    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    function onMessage(evt){

      	var message = evt.data;
      	var curId = '${user}';

    	   var print = "<div>";
    	   print += "<p>["+curId+"]:"+message+"</p>";
  		   print += "</div>";

  		 $("#data").append(print);

       
       
    }
    
    function onClose(evt){
        $("#data").append("연결 끊김");
    }

    
    
</script>
<title>Insert title here</title>
</head>
<body>
<input type="text" id="message" value=""/>
<input type="button" id="sendBtn" value="전송"/>
<form id="frm" method="post" enctype="multipart/form-data">
<input type="file" name="file2" id="file2"/>
</form>
<div id="data">

</div>
</body>
</html>