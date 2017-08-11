<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style type="text/css">
.carrerform_div1 th{
	width: 90px !important;
	border: 0;
	border-bottom: 1px solid #dedede;
	background-color: #f2f2f2;
	text-align: center;
	
}
.carrerform_div1 td{
	padding: 4px 5px !important;
}
.carrerform_div1 tr:FIRST-CHILD td, .carrerform_div1 tr:FIRST-CHILD th {
	border-top: 2px solid #dedede;
}

.carrerform_div1 td input[type=text], .carrerform_div1 td input[type=date]{
    border: 1px solid #dedede;
    border-radius: 5px;
    height: 30px;
    padding-left: 9px;
	width: 96%;
}
</style>
<form id="carrerform" action="${carrerPath }" method="post">
<div class="carrerform_div_wrap">
		<input type="hidden" name="email" value="${member.email }">
	<div class="carrerform_div1">
		<table>
			<thead>
			</thead>
			<tbody>
				<tr>
					<th>
					회사명
					</th>
					<td colspan="4">
						<input required="required" id="companyName" type="text" name="companyName" value="${carrer.companyName }">
					</td>
				</tr>
				<tr>
					<th>
					부서명
					</th>
					<td>
						<input required="required" id="dept" type="text" name="dept" value="${carrer.dept }">
					</td>
					<th>
					직위
					</th>
					<td>
						<input required="required" id="position" type="text" name="position" value="${carrer.position }">
					</td>
				</tr>
				
				<tr>
					<th>
					입사일
					</th>
					<td>
						<input required="required" id="hireDate" type="date" name="hireDate" value="${carrer.hireDate }">
					</td>
					<th>
					퇴사일
					</th>
					<td>
						<input required="required" id="retireDate" type="date" name="retireDate" value="${carrer.retireDate }" >
					</td>
				</tr>
			</tbody>
		
		
		</table>
		<c:if test="${not empty carrer }"><input type="hidden" name="num" value=${carrer.num }></c:if>
		<p class="btn_div1"><input id="carrer_ok" type="button" value="등록"><input id="carrer_cencel" type="button" value="취소"></p>
	</div>
</div>
</form>


