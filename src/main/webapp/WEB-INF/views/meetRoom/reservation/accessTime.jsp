<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="timeList">
		<thead>
			<tr>
				<c:forEach begin="0" end="24" var="i" step="1">
					<td>${i}</td>
				</c:forEach>
			</tr>
		</thead>
		
		<tbody>
			<tr id="result_reserved">
				<c:forEach begin="0" end="23" var="i" step="1" varStatus="r">
					<c:choose>
						<c:when test="${access[0]<=r.index && access[1]>=r.index}" >
							<td>
								<div id="reserve${r.count}"  class="time" title="${r.index}" style="min-width: 86px; min-height: 76px; background-color: yellow; margin-left: 10px;" ></div>
							</td>								
						</c:when>
						<c:otherwise>
							<td>
								<div id="${r.count}"  class="time" title="${r.index}" style="min-width: 86px; min-height: 76px; background-color: gray; margin-left: 10px;" ></div>
							</td>
						</c:otherwise>
					</c:choose>			
				</c:forEach>
			</tr>
		</tbody>
	</table>
