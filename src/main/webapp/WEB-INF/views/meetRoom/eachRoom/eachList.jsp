<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<%-- 	<input type="hidden" id="eachRoom_name${E.num}" value="${E.name}"> 
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
		<br>
		<input type="hidden" id="eachRoom_num" value="${E.num}"> --%>
	
	<c:forEach items="${each}" var="E">
		<input type="hidden" id="eachRoom_num" value="${E.num}">
		<input type="hidden" id="eachRoom_name${E.num}" value="${E.name}"> 
		<ul>
			<li>
				<div class="flex_box">
					<div class="flex">
						<input  type="radio" name="eachRoom" value="${E.num}" id="eachRoom_${E.num}" class="eachRoom_class" >
						<label> ${E.name} [${E.human}인실]</label>
					</div>
					<div class="flex_right">
						<strong>\ ${E.price}</strong>
						<span class="tit_unit">/시간(인)</span>
					</div>
				</div>
				<!--ajax  로 정보 뿌려주는 div  -->
				<div class="flex_info">
				
				</div>
			</li>
		</ul>
		<span id="${E.num}" class="del"> 삭제 </span>
		<span id="${E.num}" class="update"> 수정 </span>
	</c:forEach>