<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${state=='wait'}">
	<p>${client.account} ${client.phone}</p>
	<p>${client.email}</p>
	<p>${client.bank} ${client.accountNumber} <input type="button" title="${projectNum}" class="btn2" value="입금 확인 완료"></p>
</c:if>
<c:if test="${state=='ing'}">
	<p>${client.account} ${client.phone}</p>
	<p>${client.email}</p>
	<p>${client.bank} ${client.accountNumber} 입금완료</p>
</c:if>