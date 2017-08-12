<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${applicantList }" var="app" varStatus="i">
<tr class="check_wait_tr" id="click${app.projectNum}">
	<td class="tbody_td1 del${app.projectNum}"><span class="label">${memberList[i.index].type}</span></td>
	<td class="tbody_td2 del${app.projectNum}"><span class="name">${memberList[i.index].account}</span></td>
	<td class="tbody_td3 del${app.projectNum}">
	<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/checkProject/phone.png" style="width: 20px; height: 20px; vertical-align: text-top;">
	${memberList[i.index].phone}
	</td>
	<td class="tbody_td4 del${app.projectNum}"><p>${memberList[i.index].accountNumber }</p>
	<p><fmt:formatNumber type="currency">${app.pay*0.9}</fmt:formatNumber></p>
	</td>
	<td class="tbody_td5 del${app.projectNum}">${memberList[i.index].bank }</td>
	<td class="tbody_td6 del${app.projectNum}">
	<c:if test="${app.state=='finish'}">
	<p><input type="button" lang="${memberList[i.index].name}" title="${memberList[i.index].email}" class="btn2" value="지급확인"></p>
	</c:if>
	<c:if test="${app.state=='payFinish'}">
	지급완료
	</c:if>
	</td>
	<td class="tbody_td7 del${app.projectNum}"></td>
</tr>
</c:forEach>
