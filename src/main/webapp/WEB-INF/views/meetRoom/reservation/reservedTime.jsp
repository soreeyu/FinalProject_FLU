<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table id="timeList">
		<thead>
			<tr>
				<c:forEach begin="0" end="24" var="i" step="1">
					<td>${i}</td>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					${dto[0]}  /  ${dto[1]}
				</td>
			</tr>
			
			<tr id="result_reserved">
				<c:forEach begin="0" end="24" var="i" step="1" varStatus="r">
					<c:choose >
						<c:when test="${access[0]<=r.index && access[1]>=r.index}" >
							<c:choose>
							<c:when test="${dto[0]<=r.index && dto[1]>=r.index}">
							<td>
								<div id="reserved${r.count}"  class="time" title="${r.index}" style="min-width: 86px; min-height: 76px; background-color: white; margin-left: 10px;" ></div>
							</td>																
							</c:when>
							<c:otherwise>
							<td>
								<div id="reserve${r.count}"  class="time" title="${r.index}" style="min-width: 86px; min-height: 76px; background-color: yellow; margin-left: 10px;" ></div>
							</td>
							</c:otherwise>							
							</c:choose>
						</c:when>
						<c:otherwise>
							<td>
								<div class="time" title="${r.index}" style="min-width: 86px; min-height: 76px; background-color: black; margin-left: 10px;"></div>
							</td>					
						</c:otherwise>
					</c:choose>			
				</c:forEach>
			</tr>
		</tbody>
	</table>
