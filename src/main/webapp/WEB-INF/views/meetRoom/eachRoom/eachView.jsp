<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="info_photo">
	<span>
		<img alt="" src="${pageContext.request.contextPath}/resources/upload/${dto.fname}">
	</span>
	<p>
		${dto.contents}
	</p>
</div>
<ul class="list_detail">
	<li>
		<span class="type_tit">공간유형</span>
		<span>${dto.type}</span>
	</li>
	<li>
		<span class="type_tit">수용인원</span>
		<span>${dto.human}</span>
	</li>
</ul>
<!--평의시설  -->
<ul>
		
</ul>
