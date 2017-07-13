<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<c:forEach items="${each}" var="E">
		<p>방이름 : ${E.name}</p>
		<p>세부내용 : ${E.contents}</p>
		<p>예약가능시간 : ${E.time}</p>
		<p>대표사진 : ${E.oname}</p>
		<p>공간유형 : ${E.type}</p>
		<p>수용인원 : ${E.human}</p>
		 <p>편의시설 : ${E.convenience}</p>
		 <p>가격 : ${E.price}</p>
		 <span id="${E.num}" class="del"> 삭제 </span>
		 <span id="${E.num}" class="update"> 수정 </span>
	</c:forEach>
