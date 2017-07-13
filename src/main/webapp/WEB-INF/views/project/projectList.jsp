<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.main_section{
	width: 200px;
	padding: 30px;
	background-color: yellow;
}
</style>
<script type="text/javascript">
$(function() {
	
	
	$("#preview").click(function() {
		alert("preview");
		//location.href="${board}List?curPage=${listInfo.startNum-listInfo.perBlock}&search=${listInfo.search}&find=${listInfo.find}";
	});
	$(".num").click(function() {
		
		//form을 사용하는 방법
		/* document.frm.curPage.value=$(this).attr("id");
		document.frm.search.value='${listInfo.search}';
		document.frm.find.value='${listInfo.find}';
		document.frm.submit; */
		//
		
		//location을 이용하는 방법
		 var num = $(this).prop("id");
		alert(num);
		//location.href="${board}List?curPage="+num+"&search=${listInfo.search}&find=${listInfo.find}"; 
	});
	$("#nextview").click(function() {
		alert("nextview")
		//location.href="${board}List?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}";
	});
});
</script>
</head>
<body>
<h2>project ${type}</h2>
<section class="main_section">

<form action="" id="frm">


<input type="hidden" name="curPage"> 
		<select name="search">
			<option value="title">TITLE</option>
			<option value="writer">WRITER</option>
			<option value="contents">CONTENTS</option>
		</select>
		<input type="text" name="find">
		<input type="submit" value="SEARCH">

</form>
<table>
	<tr>
		<td>num</td><td>name</td><td>contents</td><td>reg_date</td>
	</tr>
<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.projectNum}</td><td><a href="projectView?projectNum=${dto.projectNum}">${dto.name}</a></td><td>${dto.contents}</td><td>${dto.reg_date}</td>
	</tr>
</c:forEach>

</table>


<%-- <c:if test="${listInfo.curBlock>1 }"> --%>
		<span id="preview">[이전]</span>
		<%-- <a href="${board}List?curPage=${listInfo.startNum-listInfo.perBlock}&search=${listInfo.search}&find=${listInfo.find}">[이전]</a> --%>
<%-- 	</c:if>
	 --%>
	<c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
		<span class="num" id="${i}" >${i}</span>
		<%-- <a href="${board}List?curPage=${i}&search=${listInfo.search}&find=${listInfo.find}">${i}</a> --%>		
	</c:forEach>
	
<%-- 	<c:if test="${listInfo.curBlock<listInfo.totalBlock }"> --%>
		<span id="nextview">[다음]</span>
		<%-- <a href="${board}List?curPage=${listInfo.lastNum+1}&search=${listInfo.search}&find=${listInfo.find}">[다음]</a> --%>
<%-- 	</c:if> --%>

<div>

	<p>curPage : ${listInfo.curPage }</p>
	<p>search : ${listInfo.search}</p>
	<p>find : ${listInfo.find }</p>
	<p>startNum : ${listInfo.startNum}</p>
	<p>lastNum : ${listInfo.lastNum}</p>
	<p>curBlock : ${listInfo.curBlock }</p>
</div>


</section>


</body>
</html>