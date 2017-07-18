<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#detail{
width: 120px;

}

</style>
<script type="text/javascript">

	$(function() {
	
	$('select[name=category]').change(function() {
		
		var i = $(this).val();
		
		if(i=='개발'){
			$('#result').html('<select id="detail" name="detailCategory"><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>');
		}else{
			$('#result').html('<select id="detail" name="detailCategory"><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="제품">제품</option><option value="프레젠테이션">프레젠테이션</option><option value="인쇄물">인쇄물</option><option value="쇼핑몰">쇼핑몰</option><option value="로고">로고</option><option value="그래픽">그래픽</option><option value="영상">영상</option><option value="게임">게임</option><option value="기타">기타</option></select>');
		}
		
		
	});
	
	$('#btn').click(function() {
		$('#frm').submit();
		
	});
	
});

</script>
</head>
<body>

<form action="./checkProjectList" id="frm">

<div>
<select name="category" id="detail">
<option value="개발">개발</option>
<option value="디자인">디자인</option>
</select>

<div id="result">
<select name="detailCategory" id="detail"><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>
</div>

</div>

<div>
<select name="kind">
<option value="name">제목</option>
<option value="email">담당자</option>
<option value="contents">내용</option>
</select>
<input type="text" name="search"><input type="button" value="검색" id="btn">
</div>

</form>

<table>
<tr>
<td>분야</td>
<td>프로젝트명</td>
<td>담당자</td>
<td>상태</td>
<td>날짜</td>
</tr>


<c:forEach items="${list}" var="i">
<tr>
<td>${i.category}</td>
<td>
<c:if test="${i.state=='check' or i.state=='done'}">
<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
</c:if>
<c:if test="${i.state=='finish'}">
<a href="../checkProject/checkCashView?projectNum=${i.projectNum}">${i.name }</a>
</c:if>
</td>
<td>${i.email }</td>
<td>
<c:if test="${i.state=='check'}">검수 단계</c:if>
<c:if test="${i.state=='done'}">입금 대기중</c:if>
<c:if test="${i.state=='finish'}">프로젝트 종료</c:if>
</td>
<td>${i.reg_date}</td>
</tr>
</c:forEach>

</table>
</body>
</html>