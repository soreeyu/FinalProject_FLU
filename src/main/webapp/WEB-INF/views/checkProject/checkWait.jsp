<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${state=='wait'}">
<div class="hello">
	<p><span class="label">${client.type}</span>${client.name} <img alt="" src=""> ${client.phone}<span class="x">X</span></p>
	<p><span>금액: <fmt:formatNumber type="currency">${budget}</fmt:formatNumber></span></p>
	<p><span>${client.bank} ${client.accountNumber} ${client.account} <input type="button" title="${projectNum}" class="btn2" value="입금 확인 완료"></span></p>
</div>
</c:if>

<c:if test="${state=='ing'}">
<div class="hello">
	<span class="label">클라이언트</span>
	<span>담당자 정보: ${client.account} ${client.phone}</span><span class="x">X</span>
	<span>금액: <fmt:formatNumber type="currency">${budget}</fmt:formatNumber></span>
	<span>${client.bank} ${client.accountNumber} 입금완료</span>
</div>
</c:if>
