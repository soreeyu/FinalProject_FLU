<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<p>사업자형태: ${checkMember.kind}</p>
<p>email: ${checkMember.email}</p>
<p>pw: ${checkMember.pw}</p>
<p>닉네임: ${checkMember.nickName}</p>
<p>프로필사진이름: ${checkMember.oProfileImage}</p>
<p>프로필사진 오리지날 이름: ${checkMember.fProfileImage}</p>
<p>타입?: ${checkMember.type}</p>
<p>주소: ${checkMember.addr_num} ${checkMember.addr_main} ${checkMember.addr_detail}</p>
<p>폰: ${checkMember.phone}</p>
<p>팩스: ${checkMember.fax}</p>
<p>은행: ${checkMember.bank}</p>
<p>계좌: ${checkMember.account}</p>
<p>계좌번호: ${checkMember.accountNumber}</p>
<p>인증상태: ${checkMember.authenticState}</p>
<p>타입: ${checkMember.typeInfo}</p>

<p><a href="../file/fileDown?fname=${checkMember.fname}">${checkMember.oname}</a>

<p>진짜이름: ${checkMember.name}</p>

<c:if test="${checkMember.authenticState=='1'}">
<form action="./checkMemberUpdate" id="frm1">
	<input type="hidden" name="email" value="${checkMember.email}">
	<input type="button" name="check" value="신원확인 완료" id="btn1">
</form>
</c:if>

<c:if test="${checkMember.authenticState=='2'}">
<form action="./checkMemberDelete" id="frm2">
	<input type="hidden" name="email" value="${checkMember.email}">
	<input type="button" name="check" value="삭제하기" id="btn2">
</form>
</c:if>

</body>
<script type="text/javascript">

	$("#btn1").click(function() {
		if(confirm("신원확인을 완료 하시겠습니까?")){
			$('#frm1').submit();
		}
		else{
			alert("no"); 
		}
	});
	
	$("#btn2").click(function() {
		if(confirm("삭제하시면 신원확인이 취소됩니다. 정말 삭제하시겠습니까?")){
			$('#frm2').submit();
		}
		else{
			alert("no"); 
		}
	});
	
</script>
</html>