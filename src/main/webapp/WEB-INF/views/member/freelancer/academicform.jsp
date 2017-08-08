<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style type="text/css">
.academicform_div1 th{
	width: 90px !important;
	border: 0;
	border-bottom: 1px solid #dedede;
	background-color: #f2f2f2;
	text-align: center;
	
}
.academicform_div1 td{
	padding: 4px 5px !important;
}
.academicform_div1 tr:FIRST-CHILD td, .academicform_div1 tr:FIRST-CHILD th {
	border-top: 2px solid #dedede;
}

.academicform_div1 td input[type=text], .academicform_div1 td input[type=date]{
    border: 1px solid #dedede;
    border-radius: 5px;
    height: 30px;
    padding-left: 9px;
	width: 96%;
}
</style>
<form id="academicform" action="${academicPath }" method="post">
<div class="academic_div_wrap">
		<input type="hidden" name="email" value="${member.email }">
	<div class=academicform_div1>
		<table>
			<thead>
			</thead>
			<tbody>
				<tr>
					<th>
					분류
					</th>
					<td>
						<input id="school" type="text" name="school" value="${academic.school }">
					</td>
					<th>
					상태
					</th>
					<td>
						<input id="state" type="text" name="state" value="${academic.state }">
					</td>
				</tr>
				<tr>
					<th>
					학교명
					</th>
					<td>
						<input id="sName" type="text" name="sName" value="${academic.sName }">
					</td>
					<th>
					전공
					</th>
					<td>
						<input id="major" type="text" name="major" value="${academic.major }">
					</td>
				</tr>
				
				<tr>
					<th>
					입학일
					</th>
					<td>
						<input id="entrance" type="date" name="entrance" value="${academic.entrance }">
					</td>
					<th>
					졸업일
					</th>
					<td>
						<input id="graduate" type="date" name="graduate" value="${academic.graduate }">
					</td>
				</tr>
			</tbody>
		
		
		</table>
		<c:if test="${not empty academic }"><input type="hidden" name="num" value=${academic.num }></c:if>
		<p class="btn_div1"><input id="academic_ok" type="button" value="등록"><input id="academic_cencel" type="button" value="취소"></p>
	</div>
</div>
</form>