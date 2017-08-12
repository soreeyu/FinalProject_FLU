<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${state=='wait'}">
<tr class="check_wait_tr">
	<td class="tbody_td1 del${projectNum}"><span class="label">${client.type}</span></td>
	<td class="tbody_td2 del${projectNum}"><span class="name">${client.account}</span></td>
	<td class="tbody_td3 del${projectNum}">
	<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/checkProject/phone.png" style="width: 20px; height: 20px; vertical-align: text-top;">
	${client.phone}
	</td>
	<td class="tbody_td4 del${projectNum}"><p>${client.accountNumber}</p>
	<p><fmt:formatNumber type="currency">${budget}</fmt:formatNumber></p>
	</td>
	<td class="tbody_td5 del${projectNum}">${client.bank}</td>
	<td class="tbody_td6 del${projectNum}"><input type="button" title="${projectNum}" class="btn2" value="입금확인 완료"></td>
	<td class="tbody_td7 del${projectNum}"><span class="x">닫기</span></td>
</tr>
</c:if>

<c:if test="${state=='ing'}">
<tr class="check_wait_tr">
	<td class="tbody_td1 del${projectNum}"><span class="label">${client.type}</span></td>
	<td class="tbody_td2 del${projectNum}"><span class="name">${client.account}</span></td>
	<td class="tbody_td3 del${projectNum}">
	<img alt="" src="${pageContext.servletContext.contextPath}/resources/img/checkProject/phone.png" style="width: 20px; height: 20px;">
	${client.phone}
	</td>
	<td class="tbody_td4 del${projectNum}"><p>${client.accountNumber}</p>
	<p><fmt:formatNumber type="currency">${budget}</fmt:formatNumber></p>
	</td>
	<td class="tbody_td5 del${projectNum}">${client.bank}</td>
	<td class="tbody_td6 del${projectNum}">입금완료</td>
	<td class="tbody_td7 del${projectNum}"><span class="x">닫기</span></td>
</tr>
</c:if>
