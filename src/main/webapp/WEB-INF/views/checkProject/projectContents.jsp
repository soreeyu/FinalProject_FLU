<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="title">
		<c:if test="${board=='done'}">
			<p>검수 전 프로젝트</p>
			<p>클라이언트로부터 등록된 프로젝트를 검수하는 곳입니다.</p>
		</c:if>
		<c:if test="${board=='finish'}">
			<p>완료된 프로젝트</p>
			<p>프로젝트를 완료한 고객에게 급여를 지급하는 곳입니다.</p>
		</c:if>
</div>

<div class="contents">
<form id="frm">
<div>
<select name="category" id="detail">
<option value="">전체</option>
<option value="개발">개발</option>
<option value="디자인">디자인</option>
</select>

<div id="result">
<select name="detailCategory" id="detail"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>
</div>

</div>

<div>
<select name="kind">
<option value="name">제목</option>
<option value="email">담당자</option>
<option value="contents">내용</option>
</select>
<input type="text" name="search" id="search" value="${listInfo.search}"><input type="button" value="검색" id="btn">
</div>

</form>

<table>
<tr>
<td>분야</td>
<td>세부분야</td>
<td>프로젝트명</td>
<td>담당자</td>
<td>상태</td>
<td>날짜</td>
</tr>


<c:forEach items="${list}" var="i">
<tr>
<td>${i.category}</td>
<td>${i.detailCategory}</td>
<td>
<c:if test="${i.state=='check' or i.state=='done'}">
<a href="../project/projectView?projectNum=${i.projectNum}">${i.name }</a>
</c:if>
<c:if test="${i.state=='finish'}">
<a href="../checkProject/checkCashView?projectNum=${i.projectNum}">${i.name }</a>
</c:if>
</td>
<td>${i.email }</td>
<td>
<c:if test="${i.state=='check'}">검수 단계</c:if>
<c:if test="${i.state=='done'}">검수 완료</c:if>
<c:if test="${i.state=='finish'}">프로젝트 종료</c:if>
</td>
<td>${i.reg_date}</td>
</tr>
</c:forEach>

</table>
</div>
