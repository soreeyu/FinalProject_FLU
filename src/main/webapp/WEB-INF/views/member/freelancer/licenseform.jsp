<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<form id="licenseform" action="${licensePath }" method="post">
<div class="license_div_wrap">
		<input type="hidden" name="email" value="${member.email }">
	<div class="license_div1">
		<p><label>자격증명</label><input id="lName" type="text" name="lName" value="${license.lName }"></p>
		<p><label>발급기관</label><input id="agency" type="text" name="agency" value="${license.agency }"></p>
		<p><label>발급일</label><input id="publishDate" type="date" name="publishDate" value="${license.publishDate }"></p>
		<p><label>일련번호</label><input id="seiralNum" type="number" name="seiralNum" value="${license.seiralNum }"></p>
		<c:if test="${not empty license }"><input type="hidden" name="num" value=${license.num }></c:if>
		<p class="btn_div1"><input id="license_ok" type="button" value="등록"><input id="license_cencel" type="button" value="취소"></p>
	</div>
</div>
</form>