<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

	<h1>세부공간 정보 수정</h1>
	<form action="eachRoom/eachUpdate" method="post" enctype="multipart/form-data" id="frm">
	<p>방 이름  <input type="text" name="name" value="${dto.name} "> </p>
	<p>세부내용 <textarea rows="" cols="" name="contents"  id="smarteditor">${dto.contents}</textarea></p>
	<p>예약가능시간 <input type="text" name="time" value="${dto.time}"> </p>
	<p>대표사진 <input type="file" name="files" > </p>
	<p>공간유형 <input type="text" name="type" value="${dto.type}"> </p>
	<p>수용인원 <input type="text" name="human" value="${dto.human} "> </p>
	<p>편의시설 <input type="text" name="convenience" value="${dto.convenience}"> </p>
	<p>가격 <input type="number" name="price" value="${dto.price}"> </p>
	<p> <input type="hidden" name="num" value="${dto.num}">  </p>
	<p> <input type="hidden" name="snum" value="${dto.snum}">  </p>
	<input type="button" id="savebutton" value="방 정보 수정">
	</form>
