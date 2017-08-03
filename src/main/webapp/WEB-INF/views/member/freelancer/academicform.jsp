<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<form id="academicform" action="${academicPath }" method="post">
<div class="academic_div_wrap">
		<input type="hidden" name="email" value="${member.email }">
	<div class=academicform_div1>
		<p><label>분류</label><input id="school" type="text" name="school" value="${academic.school }"></p>
		<p><label>상태</label><input id="state" type="text" name="state" value="${academic.state }"></p>
		<p><label>학교명</label><input id="sName" type="text" name="sName" value="${academic.sName }"></p>
		<p><label>전공</label><input id="major" type="text" name="major" value="${academic.major }"></p>
		<p><label>입학일</label><input id="entrance" type="date" name="entrance" value="${academic.entrance }"><label>졸업일</label><input id="graduate" type="date" name="graduate" value="${academic.graduate }"></p>
		<c:if test="${not empty academic }"><input type="hidden" name="num" value=${academic.num }></c:if>
		<p class="btn_div1"><input id="academic_ok" type="button" value="등록"><input id="academic_cencel" type="button" value="취소"></p>
	</div>
</div>
</form>