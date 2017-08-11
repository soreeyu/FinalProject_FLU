<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>


<title>Insert title here</title>
<style type="text/css">
.main_section{
	min-width: 1460px;
	width: 100%;
	min-height: 2050px;
	background-color: #f2f2f2;
}
.page_wrap{
	width: 1152px;
	margin: 0 auto;
}
.page{
	width: 1152px;
	display: inline-block;
	margin-top: 30px;
}


/******************************** 왼쪽 메뉴 *******************************/
.side{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 250px;
}

.freelancer_name{
	background-color:white;
	padding: 15px;
	margin-bottom: 15px;
}
.freelancer_name > span:FIRST-CHILD{
	font-size: 16px;
	display: block;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	font-weight: 700;
	margin-bottom: 9px;
	color: #454545;
}
.free_img_div{
	width: 220px;
	font-size: 17px;
    color: #333333;
    font-weight: bold;
    text-align: center;
    
}
.free_img_div img{
	width: 216px;
    height: 216px;
    border: 1px solid #dedede;
    border-radius: 10%;
    
}
.free_img_div span{
	margin-top: 20px;
}

.sidebar_menu ul{
	border: 1px solid #dedede;
    border-radius: 3px;
    padding: 4px 8px;
    background-color: white;
    margin-bottom: 10px;
}
.sidebar_menu ul li{
	height: 40px;
    padding: 4px 0;
}
.sidebar_menu ul li a{
	border-radius: 2px;
    display: block;
    padding: 10px 15px;
    font-size: 14px;
    color: #999;
    line-height: 1.4;
    
}
/******************************** 왼쪽 메뉴 *******************************/
.contents{
	float: left;
    margin-left: 10px;
    margin-right: 10px;
    width: 790px;
}

.contents_inner{
	padding: 15px 30px 30px 30px;
	background-color: #fff;
    border-radius: 3px;
}
.profile_title{
	border-bottom: 1px dashed #dedede;
	padding-bottom: 25px;
}
.profile_title > p:FIRST-CHILD > a{
	float: right;
	margin-top: 7px;
	padding: 6px 12px;
    font-size: 14px;
    text-align: center;
    vertical-align: middle;
    background-color: #66b3ff;
    border-radius: .2em;
    color: white;
    line-height: 1.5;
}

.profile_title > p:FIRST-CHILD{
	margin-top: 20px;
}
.profile_title > p > span {
	font-size: 28px;
	font-weight: bold;
}

.profile_wrap{
	padding-bottom: 20px;
	margin-bottom: 20px;
}
.profile_wrap > p:FIRST-CHILD{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
}


.no_data_wrap{
	width: 100%;
    padding-top: 15px;
    padding-bottom: 15px;
}
.no_data_wrap p{
    line-height: 32px;
}
.no_data{
	width: 100%;
    height: 100%;
    text-align: center;
    margin: 0 auto;
}
.no_img p{
	font-size: 14px;
	margin-top: 15px;
	color: #999;
}
.no_img p span{
	font-weight: bold;
}

#a{
	background-color: #66b3ff;
	color: white;
}
p span{
	vertical-align: top;
    line-height: 32px;
    width: 200px;
    display: inline-block;
   	text-align: right;
   	padding-right: 30px;
   	font-weight: bold;
}	

#btn1{
	
	border: 0;
	color: white;
	background-color: blue;

}

#btn2{

	border: 0;
	color: white;
	background-color: blue;


}

.uuid{

	width: 100px;
	height : 70px;
	float: left;

}


</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
	
	<section class="main_section">
		<div class="page_wrap">
		<div class="page">
			<c:import url="/WEB-INF/views/temp/personaldatasidbar.jsp"></c:import>
			
			<div class="contents">
				<div class="contents_inner">
					<section class="profile_title">
						<p><span>계정 정보</span>
						
						
						<a href="personaldataUpdate" style="margin-top: -5px;">내 정보 수정</a>
						
						</p>
					</section>
					<section class="profile_wrap">
						<p><span>내 정보</span></p>
						
						<div class="no_data_wrap">
							<div>
								<div>
									<p style="display: inline-block; vertical-align: top;"><span>프로필 사진</span></p>
									<c:if test="${not empty dto.fProfileImage }">
									<img style="border-radius: 10%; width: 200px; height: 200px; border: 1px solid #dedede;" src="${pageContext.request.contextPath}/resources/profile/${dto.fProfileImage}">
									</c:if>
									<c:if test="${empty dto.fProfileImage }">
									<img style="border-radius: 10%; width: 200px; height: 200px; border: 1px solid #dedede;" src="${pageContext.request.contextPath}/resources/img/FLU.png">
									</c:if>
								</div>
								<p><span>프리랜서 형태</span>
								<c:if test="${not empty dto.type }">${dto.type }</c:if>
								<c:if test="${empty dto.type }">정보가 없습니다.</c:if>
								</p>
								<p><span>성명 </span>
								<c:if test="${not empty dto.name }">${dto.name }</c:if>
								<c:if test="${empty dto.name }">정보가 없습니다.</c:if>
								</p>
								<p><span>닉네임</span>
								<c:if test="${not empty dto.nickName }">${dto.nickName }</c:if>
								<c:if test="${empty dto.nickName }">정보가 없습니다.</c:if>
								</p>
								<p><span>성별</span>
								<c:if test="${not empty dto.namegender }">${dto.namegender }</c:if>
								<c:if test="${empty dto.namegender }">정보가 없습니다.</c:if>
								</p>
								<p><span>생년월일</span>
								<c:if test="${not empty dto.birth }">${dto.birth }</c:if>
								<c:if test="${empty dto.birth }">정보가 없습니다.</c:if>
								</p>
								<p><span>상세주소</span>
								<c:if test="${not empty dto.addr_main }">${dto.addr_main }&nbsp;${dto.addr_detail}</c:if>
								<c:if test="${empty dto.addr_main }">정보가 없습니다.</c:if>
								</p>
								<p><span>핸드폰번호</span>
								<c:if test="${not empty dto.phone }">
								${dto.phone }
								</c:if>
								<c:if test="${empty dto.phone }">
								정보가 없습니다.
								</c:if>
								</p>
								<p><span>전화번호</span>
								<c:if test="${not empty dto.phone2 }">
								${dto.phone2 }
								</c:if>
								<c:if test="${empty dto.phone2 }">
								정보가 없습니다.
								</c:if></p>
								<p><span>팩스번호</span>
								<c:if test="${not empty dto.fax }">
								${dto.fax }
								</c:if>
								<c:if test="${empty dto.fax }">
								정보가 없습니다.
								</c:if></p>
								
								<c:if test="${member.kind=='admin'}">
									<p><span id="identity">신원 인증 자료:</span> 
										<a href="../file/fileDown?fname=${dto.fname}">${dto.oname}</a></p>
								<div class="uuid">
								<c:if test="${dto.authenticState=='1'}">			
									<form action="../checkMember/checkMemberUpdate" id="frm1">
										<input type="hidden" name="email" value="${dto.email}">
										<input type="button" name="check" value="신원확인 완료" id="btn1">
									</form>
								</c:if>
									
								<c:if test="${dto.authenticState=='2'}">
									<form action="../checkMember/checkMemberDelete" id="frm2">
										<input type="hidden" name="email" value="${dto.email}">
										<input type="button" name="check" value="신원확인 취소하기" id="btn2">
									</form>
								</c:if>
								</div>
								</c:if>
								
							</div>
						</div>
						
					</section>
					
				</div>
			</div>
		</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
<script type="text/javascript">

	$("#btn1").click(function() {
		if(confirm("신원확인을 완료 하시겠습니까?")){
			$('#frm1').submit();
		}
		else{
			alert("no"); 
		}
	});
	
	$("#btn2").click(function() {
		if(confirm("삭제하시면 신원확인이 취소됩니다. 정말 삭제하시겠습니까?")){
			$('#frm2').submit();
		}
		else{
			alert("no"); 
		}
	});
	
</script>

</html>