<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<form id="carrerform" action="${carrerPath }" method="post">
<div class="carrerform_div_wrap">
		<input type="hidden" name="email" value="${member.email }">
	<div class="carrerform_div1">
		<p><label>회사명</label><input id="companyName" type="text" name="companyName" value="${carrer.companyName }"></p>
		<p><label>부서명</label><input id="dept" type="text" name="dept" value="${carrer.dept }"></p>
		<p><label>직위</label><input id="position" type="text" name="position" value="${carrer.position }"></p>
		<p><label>입사일</label><input id="hireDate" type="date" name="hireDate" value="${carrer.hireDate }"><label>퇴사일</label><input id="retireDate" type="date" name="retireDate" value="${carrer.retireDate }" ></p>
		<c:if test="${not empty carrer }"><input type="hidden" name="num" value=${carrer.num }></c:if>
		<p class="btn_div1"><input id="carrer_ok" type="button" value="등록"><input id="carrer_cencel" type="button" value="취소"></p>
	</div>
</div>
</form>


