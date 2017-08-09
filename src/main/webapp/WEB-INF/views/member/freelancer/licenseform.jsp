<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style type="text/css">
.license_div1 th{
	width: 90px !important;
	border: 0;
	border-bottom: 1px solid #dedede;
	background-color: #f2f2f2;
	text-align: center;
	
}
.license_div1 td{
	padding: 4px 5px !important;
}
.license_div1 tr:FIRST-CHILD td, .license_div1 tr:FIRST-CHILD th {
	border-top: 2px solid #dedede;
}

.license_div1 td input[type=text], .license_div1 td input[type=date], .license_div1 td input[type=number]{
    border: 1px solid #dedede;
    border-radius: 5px;
    height: 30px;
    padding-left: 9px;
	width: 96%;
}
</style>
<form id="licenseform" action="${licensePath }" method="post">
<div class="license_div_wrap">
		<input type="hidden" name="email" value="${member.email }">
	<div class="license_div1">
		<table>
			<thead>
			</thead>
			<tbody>
				<tr>
					<th>
					자격증명
					</th>
					<td colspan="4">
						<input id="lName" type="text" name="lName" value="${license.lName }">
					</td>
				</tr>
				<tr>
					<th>
					발급기관
					</th>
					<td>
						<input id="agency" type="text" name="agency" value="${license.agency }">
					</td>
					<th>
					발행일자
					</th>
					<td>
						<input id="publishDate" type="date" name="publishDate" value="${license.publishDate }">
					</td>
				</tr>
				
				<tr>
					<th>
					일련번호
					</th>
					<td colspan="4">
						<input id="seiralNum" type="number" name="seiralNum" value="${license.seiralNum }">
					</td>
					
					
				</tr>
			</tbody>
		
		
		</table>
	<c:if test="${not empty license }"><input type="hidden" name="num" value=${license.num }></c:if>
		<p class="btn_div1"><input id="license_ok" type="button" value="등록"><input id="license_cencel" type="button" value="취소"></p>
	</div>
</div>
</form>