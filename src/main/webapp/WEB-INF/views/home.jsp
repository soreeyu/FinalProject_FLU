<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<title>Home</title>
</head>
<body>

<script type="text/javascript">
	var message = '${message}';
	if(message!=''){
		alert(message);
	}
</script>

<!-- Channel Plugin Scripts -->

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>



<a href="./checkMember/checkMemberInsert?email=${member.email}">신원확인 신청하기</a> <!-- email파라미터로 Session아이디 가져와야함 -->

<c:if test="${empty member.email}">
<p><a href="./checkMember/loginTest">임시 로그인</a></p>
</c:if>
<c:if test="${not empty member.email}">
나이스
</c:if>


<a href="member/MemberJoin">MemberJoinForm</a>

<a href="meetRoom/meetList">LIST</a>


<a href="member/memberTest">MemberTest</a>


<h1>
	<a href="./schedule/create?projectNum=6000">스케줄 생성하기</a> 
</h1>


<a href="project/projectList">List</a>
<a href="project/projectWrite">write</a>

</body>
</html>
