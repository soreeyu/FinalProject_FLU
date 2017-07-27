<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
<p>${memberDTO.bank } ${memberDTO.accountNumber } ${memberDTO.account }</p>
<p>최종 금액:<fmt:formatNumber type="currency" currencySymbol="">${pay }</fmt:formatNumber>원</p>
<input type="button" id="${memberDTO.email}" class="btn2" value="지급확인" title="${pay }">
</div>
