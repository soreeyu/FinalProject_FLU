<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${state=='wait'}">
	<span class="label">클라이언트</span>
	${client.account} ${client.phone}<span class="x">X</span>
	<span>금액: ${budget}</span>
	<span>${client.bank} ${client.accountNumber} <input type="button" title="${projectNum}" class="btn2" value="입금 확인 완료"></span>
</c:if>

<c:if test="${state=='ing'}">
	<span class="label">클라이언트</span>
	<span>담당자 정보: ${client.account} ${client.phone}</span><span class="x">X</span>
	<span>금액: ${budget}</span>
	<span>${client.bank} ${client.accountNumber} 입금완료</span>
</c:if>
