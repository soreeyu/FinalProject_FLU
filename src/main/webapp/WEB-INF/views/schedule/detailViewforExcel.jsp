<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<script type="text/javascript">
 $(function(){
	 

	$("#goExcel").click(function(){
		alert("엑셀생성");
		$.ajax({
			url: "/flu/schedule/makeExcel",
			type: "GET",
			success: function(data){
				alert("성공");
			}
		});
	});
	
 });
</script>
</head>
<body>
<div>
	<table>
		<tr>
			<td>파트</td><td>업무</td><td>상태</td><td>담당자</td>
			<td>시작일</td><td>마감일</td><td>상세설명</td>
		</tr>
		<tr>
			<td>DB구축구축</td><td></td><td></td><td></td>
			<td>2017-07-08</td><td>2017-08-08</td><td>DB를 열심히 구축하면됩니다</td>
		</tr>
		<tr>
			<td></td><td>프로젝트DB생성하기</td><td>할일</td><td>myeon01@flu.com</td>
			<td>2017-07-10</td><td>2017-07-15</td><td>DB를 열심히 구축하면됩니다</td>
		</tr>
		<tr>
			<td></td><td>MEMBER DB생성하기</td><td>할일</td><td>myeon01@flu.com</td>
			<td>2017-07-10</td><td>2017-07-15</td><td>MEMBER 를 열심히 분석해서 어떻게할지 정하세요</td>
		</tr>
	</table>
	<div id="goExcel">엑셀파일생성</div>
</div>
</body>
</html>