<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<p>project View &emsp;
<c:if test="${dto.state=='done'}">
검수완료
</c:if>
<c:if test="${dto.state=='ing'}">
진행중
</c:if>
</p>

<p>${dto.projectNum}</p>
<p>${dto.name}</p>
<p>${dto.category }</p>
<p>${dto.detailCategory}</p>
<p>${dto.name}</p>
<p>${dto.period}</p>
<p>${dto.startDate}</p>
<p>${dto.budget }</p>
<p>${dto.planState }</p>
<p>${dto.contents }</p>
<p>${dto.skill }</p>
<p>${dto.finishDate }</p>
<p>${dto.meetKind }</p>
<p>${dto.exp }</p>
<p>${dto.state }</p>
<p>${dto.email }</p>
<p>${dto.quick }</p>
<p><a href="../file/fileDown?fname=${dto.fName }">${dto.oName }</a></p>
<p>${dto.addr_num } ${dto.addr_main } ${dto.addr_detail }
<p>${dto.reg_date }</p>

<p>클라이언트 부분</p>
<p><a href="projectUpdate?projectNum=${dto.projectNum}">Update</a></p>
<p><a href="projectDelete?projectNum=${dto.projectNum}">Delete</a></p>
<hr>

<p>관리자 부분</p>
<form action="../checkProject/checkProjectUpdate" id="frm">
<input type="hidden" name="state" value="${dto.state}">
<input type="hidden" name="projectNum" value="${dto.projectNum}">
<c:if test="${dto.state=='check'}">
<input type="button" value="프로젝트 검수 완료" id="${dto.state }">
</c:if>
<c:if test="${dto.state=='wait'}">
<input type="button" value="프로젝트 진행하기" id="${dto.state }">
</c:if>

</form>

<p><a href="">Delete</a></p>


<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
<script type="text/javascript">

	var state = '${dto.state}';
	
	$('#'+state).click(function() {
		
		if(state=='check'){
			
			if(confirm("프로젝트 검수를 완료하시겠습니까?")){
				$('#frm').submit();
			}
			else{
				alert("no"); 
			}

		}else{
			if(confirm("프로젝트를 진행하시겠습니까??")){
				$('#frm').submit();
			}
			else{
				alert("no"); 
			}
		}
			
	});

</script>
</html>