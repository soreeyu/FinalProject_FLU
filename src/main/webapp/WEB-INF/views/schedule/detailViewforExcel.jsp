<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">

#a{
	background-color: #66b3ff;
	color: white;
}

#excelViewContainer{
	margin-top:20px;
	margin-bottom: 20px;
	width:992px;
	height: auto;
	background: white;
}

#btnWrap {
    width: 80%;
    margin: 0 auto;
	height: auto;
	margin-top:20px;
	margin-bottom: 20px;
}


</style>

<script type="text/javascript">
 $(function(){
	alert("호이"); 
	

	$("#goExcel").click(function(){
		alert("엑셀생성");
		$.ajax({
			url: "/flu/schedule/makeExcel?scheduleNum=${scheduleNum}",
			type: "GET",
			success: function(data){
				alert("성공");
				var link = "다운클릭";
				$("#excelDiv").text(link);
			}
		});
	});
	
 });
</script>

<div>
	<div id="excelViewContainer">
		<div id="btnWrap">
			<c:if test="${member.kind eq 'client'}">
			<button type="button" class="btn btn-default" id="addPartModalBtn">파트 추가</button>
			<button type="button" class="btn btn-default" id="addUnitModalBtn">업무 추가</button>
			</c:if>
			<button type="button" class="btn btn-default" id="goExcel">엑셀파일생성 추가</button>
			<div id="excelDiv"></div>

		</div>
	
		<table id="excelTable" style="width: 80%; text-align: left; font-size:10px;">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="7%">
				<col width="13%">
				<col width="11%">
				<col width="11%">
				<col width="*%">
			</colgroup>
			<thead>
			<tr>
				<th>파트</th>
				<th>업무</th>
				<th>상태</th>
				<th>담당자</th>
				<th>시작일</th>
				<th>마감일</th>
				<th>상세설명</th>
			</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${map.partList}" var="part">
				<tr>
					<td>${part.partName}</td>
					<td></td>
					<td></td>
					<td></td>
					<td>${part.partStartDate}</td>
					<td>${part.partFinishDate}</td>
					<td>${part.partDescFileO}</td>
				</tr>
				
				<c:forEach items="${part.unitList}" var="unit">
					<tr>
						<td></td>
						<td>${unit.unitName}</td>
						<td>${unit.unitState}</td>
						<td>${unit.email}</td>
						<td>${unit.unitStartDate}</td>
						<td>${unit.unitFinishDate}</td>
						<td>${unit.unitDescribe}</td>
					</tr>	
				</c:forEach>
				
			</c:forEach>
			
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
			</tbody>
		</table>

		
	</div>
</div>
