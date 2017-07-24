<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:forEach items="${each}" var="E" varStatus="e">
		<input type="hidden" id="eachRoom_num" value="${E.num}">
		<input type="hidden" id="eachRoom_name${E.num}" value="${E.name}"> 
		<div class="box_form">
		<ul class="reserve_lst">
			<li class="lst">
				<div class="flex_box">
					<div class="flex">
						<input  type="radio" name="eachRoom" value="${E.num}" id="eachRoom_${E.num}" title="${e.index}" class="eachRoom_class" >
						<label id="${E.name}${E.num}"> ${E.name} [${E.human}인실]</label>
					</div>
					<div class="flex_right">
						<strong>\ ${E.price}</strong>
						<span class="tit_unit">/시간(인)</span>
					</div>
				</div>
				<!--ajax  로 정보 뿌려주는 div  -->
				<div class="flex_info" style="display: none;" id="R${E.num}">
					
				</div>
			</li>
		</ul>
		</div>
		
		<span id="D${E.num}" class="del"> 삭제 </span>
		<span id="U${E.num}" class="update"> 수정 </span>
	</c:forEach>
