<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<title>Home</title>
</head>
<body>

<!-- Channel Plugin Scripts -->
<script>
  window.channelPluginSettings = {
    "plugin_id": "ef582c73-3a40-4525-bb41-a68efc7f806b"
  };
  (function() {
    var node = document.createElement('div');
    node.id = 'ch-plugin';
    document.body.appendChild(node);
    var async_load = function() {
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = '//cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    };
    if (window.attachEvent) {
      window.attachEvent('onload', async_load);
    } else {
      window.addEventListener('load', async_load, false);
    }
  })();
</script>
<!-- End Channel Plugin -->


<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p><a href="./checkMember/checkMemberList">관리자가 신원확인 해주는 곳</a> </p>

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

</body>
</html>
