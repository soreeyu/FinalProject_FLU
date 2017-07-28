<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
<c:forEach items="${applicantList }" var="app" varStatus="i">
<p>이름: ${memberList[i.index].account} [ ${memberList[i.index].type} ]</p>
<p>은행정보: ${memberList[i.index].bank } ${memberList[i.index].accountNumber }</p>
<p>급여: <fmt:formatNumber type="currency">${app.pay}</fmt:formatNumber></p>
<p>최종금액: <fmt:formatNumber type="currency">${app.pay*0.9}</fmt:formatNumber></p>
<c:if test="${app.state=='finish'}">
<p><input type="button" lang="${memberList[i.index].name}" title="${memberList[i.index].email}" class="btn2" value="지급확인"></p>
</c:if>
<c:if test="${app.state=='payFinish'}">
<p>지급완료</p>
</c:if>
</c:forEach>
</div>
