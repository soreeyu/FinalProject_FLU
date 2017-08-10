<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Insert title here</title>
<style type="text/css">
  
.main_section {
   min-width: 1160px;
   width: 1160px;
   height: auto;
   min-height: 2300px;
   margin: 0 auto;
   margin-top: 30px;
}

.project_header {
   height:122px;
   padding: 30px;
   margin-bottom: 20px;
   border: 1px solid #e6e6e6;
   margin-bottom: 20px;
   background-color: white;
}

#header_ttt {
   font-size: 24px;
   font-weight: bolder;
   margin-bottom: 20px;
}

/* 추가  */
.DateMius{
   font-size: 14px;
   background-color: #07b481;
   vertical-align: middle;
   margin-top: 5px;
   float: right;
   height: 20px;
   border-radius: 4px;
   color: white;
   line-height: 15px;
   padding: 2px 3px;
}

/* 추가 */
#header_t {
   font-size: medium;
   font-weight: lighter;
   color: #666;
}

.header_category{
	font-size: 20px;
   vertical-align: middle;
   margin-top: 5px;
   margin-right:50px;
   float: left;
   height: 20px;
   line-height: 20px;
}

/* 추가  */
.header_apply{
   font-size: 20px;
   vertical-align: middle;
   margin-top: 5px;
   margin-right:50px;
   float: right;
   height: 20px;
   line-height: 20px;

}
strong{
   color: #f48023;
   font-size: 22px;
   font-weight: 700;
}
.contents {
   width: 1260;
   height: 2000px;
   /* min-height: 1200px;
   max-height: 2700px; */
}
.clean{
   background-color: #f2f2f2;
   height: 15px;
   width: 100%;
}
/* 수정 */
.contents_sub {
   width: 250px;
   height: 1000px;
   display: block;
   float: right;
}
/* 수정 */
.contents_main {
   width: 900px;
   height: auto;
   max-height: 2100px;
   min-height: 250px;
   display: block;
   float: left;
}

.contents-back{
   width: 900px;
   height: auto;
   max-height: 2100px;
   min-height: 250px;
   display: block;
   float: left;
   background-color: white;
   border: 1px solid #dedede;
}
.pjsellDiv{
	width: 900px;
	height: auto;
	display: block;
	float: left;
	background-color: white;
	border: 1px solid #dedede;
	margin-bottom: 30px;
	padding: 20px 30px 20px 30px;
}

/* 추가 */
.project-detail-info{
   background-color: #f7f7f7;
   margin-top: 20px;
   border: 1px solid #dedede;
   border-radius: 2px;
   padding: 3px 0px 3px 15px;
   line-height: 30px;
   font-size: 16px;
   height: 50px;   
}
.project-detail-info-i{

   margin-top: 20px;
   border-top: 1px solid #dedede;
   border-bottom: 1px solid #dedede;
   border-radius: 2px;
   padding: 3px 0px 3px 15px;
   line-height: 30px;
   font-size: 16px;
   height: 50px;   
}

.fa{
   font-size: 16px;
   font-weight: bold;
   margin-right: 5px;
}
.material-icons{
 	font-size: 16px;
   font-weight: bold;
   margin-right: 5px;

}
.budget{
   line-height:44px;
   min-width: 270px;
   float: left;
}
.term{
   line-height:44px;
   min-width: 250px;
   float: left;
}
.deadline{
   line-height:44px;
   min-width: 250px;
   float: left;
}
.project-detail-box{
   padding: 15px 0 0 0;
}
.project-detail-top{
   border-top: 1px solid #dedede;
   display: inline-block;
}
.project-detail-bottom{
   border-top: 1px solid #dedede;
   border-bottom: 1px solid #dedede;   
   display: inline-block;
}
.detail-title{
   background-color: #f7f7f7;
   float: left;
   font-weight: bold;
   height: 40px;
   width: 130px;
   padding-left: 15px;
   padding-top: 10px;
}
.detail-data{
   float: left;
   width: 135px;
   height: 40px;
   padding-top: 10px;
   padding-left: 15px;
   font-size: 14px;
}
.project-detail{
   margin-top: 20px;
   border-bottom: 1px dotted #dedede;
   line-height: 20px;
   word-spacing: 3px;
   padding: 30px;
   height: auto;
   min-height: 400px;
}
.project-detail-title{
   font-weight: bolder;
   font-size: 20px;
   margin-bottom: 20px;
}

.contents-register{
   background-color: white;
   margin-top: 10px;
   padding: 25px;
   border: 1px solid #dedede;
   margin-bottom: 30px;
}
.contents-register-inner span a{
   font-weight: bold;
   text-decoration: none;
   color: #2099bb;
}
.register-btn{
   width:230px;
   height:40px;
   color: white;
   background-color: #f1720c;
   border-color: #f48023;
   border-radius: 2px;
   display: inline-block;
   text-align: center;
   vertical-align: middle;
   padding: 10px 12px;
   margin-top: 15px;
   text-decoration: none;
}

.register-btn:p{
   text-decoration: none;
}
.owner-btn{
   width:230px;
   height:40px;
   color: white;
   background-color: #f1720c;
   border-color: #f48023;
   border-radius: 2px;
   display: inline-block;
   text-align: center;
   vertical-align: middle;
   padding: 10px 12px;
   margin-top: 15px;
   text-decoration: none;
}
.schedule-btn{
   width:230px;
   height:40px;
   color: white;
   background-color: #f1720c;
   border-color: #f48023;
   border-radius: 2px;
   display: inline-block;
   text-align: center;
   vertical-align: middle;
   padding: 10px 12px;
   margin-top: 15px;
   text-decoration: none;
}
.project-qna{
   margin-top: 10px;
   height: auto;
   max-height: 600px;
   background-color: white;
   padding: 30px;   
}
.project-apply-box{
   width: 100%;
   height: auto;
   border: 1px solid #dedede;
   border-radius: 3px;
   border-bottom-width: 2px;
   background-color: white;
   margin-bottom: 20px;
   padding: 5px 9px 20px;
}
.client-info-box{
   background-color: white;
   min-height: 450px;
   border: 1px solid #dedede;
}






.project-sort-text{
   height: 40px;
   margin-bottom: 15px;
   border-bottom: 1px solid #eeeeee;
   font-size: 14px;
   font-weight: bold;
   color: black;
   text-align: center;
   line-height: 40px;
}
.left-sort-box{
   height: 60px;
   width: 45%;
   float: left;
   margin-left: 10px;
   padding-right: 10px;
   border-right: 1px #dedede solid;
}
.right-sort-box{
   height: 60px;
   width: 40%;
   float: right;
   margin-right: 10px;
}
.sort-button{
   color: #666;
   font-size: 13px;
   cursor: pointer;
   margin-top: 5px;
   text-align: center;
}
.category-filter-box{
   height: 600px;
   border: 1px solid #dedede;
   border-radius: 3px;
   border-bottom-width: 2px;
   background-color: white;
}
.category-select-both{
   margin-left: 20px;
   height: 560px;
   background-image: url("${pageContext.request.contextPath}/resources/img/select.png");
   background-repeat: no-repeat;
}
.category-select-list{
   height: 230px;
   display: block;
   /* background-color: yellow;  */
}
.cate-skipper{
   height: 17px;
   width: 100%;
   float: left;
   cursor: pointer;
   display: block;
   margin-left: 20px;
}
.cate-chk{
   width: 13px;
   height: 13px;
   float: left;
   display: block;
   margin-left: 20px;
}
.cate-list input[type="checkbox"]{
   width: 13px;
   height: 13px;
   float: left;
   display: block;
   margin-left: 10px;
   margin-bottom: 5px;
}
.cate-label{
   font-weight: blod;
   display: block;
   margin-left: 20px;
   margin-bottom: 5px;
   width: 70px;
}
.cate-list li{
   display: block;
}
.cate-list li label{

   font-weight: normal;
   margin-left: 10px;
   display: block;
   width: 100%;
   /* margin-bottom: 10px; */
   margin-bottom: 7px;
}
.place-sort-box{
   height: 65px;
   width: 250px;
}
.place-selectbox{
   line-height: 65px;
   margin: 0 auto;
}
.address-select-btn{
   margin-left: 60px;
   width: 130px;
   text-align: center;
   border: 1px solid #dedede;
   border-radius: 5px;
   background-color: #ffffff;
}
.dropdown-selecter{
background-color: white;
   margin-left:60px;
   height: 200px;
   width: 130px;
   display: block;
   overflow: auto;
   visibility: hidden;
}
.project-unit{
   padding: 25px;
   background-color: aqua;
   height: 200px;
   margin-bottom: 5px;
}
.project-head{
   height: 27px;
   margin-bottom: 5px;
}
.project-title{
   color: #15647a;
   font-size: 18px;
   font-weight: bold;
}
.project-body{
   width: 100%;
   height: 120px;
   background-color: green;
}
.project-info{
   width: 100%;
   margin-bottom: 10px;
}

.fa-reg_date{
   padding-left: 10px;
   font-size: small;
   color: #ccc;
   font-size: 12px;
   display: inline-block;
}
.project-contents{
   width: 630px;
   color: #999;
   font-size: 13px;
   text-overflow: ellipsis;
   overflow: hidden;
   max-height: 60px;
   float: left;
   height: 60px;
   background-color: red;
   padding-top: 5px;
}
.project-contents-right{
   font-size: 13px;
   width: 150px;
   float: right;
   height: 54px;
   line-height: 13px;
}
.right-contents-sub{
   border-bottom: 1px solid #dedede;
   margin-bottom: 5px;
   height: 20px;
}
.project-bottom{
   margin-top: 10px;
   line-height: 18px;
   background-color: white;
}
.main-cate{
   color: #999;
}
.sub-cate{
   border-right: 1px solid #dedede;
   color: #666;
   margin-right: 10px;
   padding-right: 10px;   
}
.skill-box{
   display: inline-block;
}
.skill-title{
   margin-left: 10px;
   color: #666;
}

.contents_bottom{
   margin-top: 30px;
   width: 100%;
}
.contents_paging{
   width: 380px;
   margin: 0 auto;
   text-align: center;
   font-weight: bold;
}
.contents_paging span{
   cursor: pointer;
}
.project-title a{
   text-decoration: none;
   color: #2099bb;
}
.project-reply-box{
   background-color: aqua;
   width: 100%;
   height: 300px;
}
.project-reply-box-inner{
   background-color: yellow;
   min-height: 200px;
   max-height: 300px;
   height: auto;
}
.owner_option{
   width: 100%;
}
.owner_option_btn{

}
.dto_profile_box{
   padding: 10px 20px 10px 20px;
   width: 100%;
   height: 250px;
   background-color: blue;
}
.dto_profile{
   background-color: yellow;
   height: 100%;
   width: 100%;
}
.modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }

.reply_img{
	height: 30px;
	width: 30px;
	margin-right: 10px;
	border-radius: 2px;
	display: inline;
}
.pjsellContents{
	margin-top: 30px;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<section class="main_section">

      <!--  header -->
      <div class="project_header">
         <div class="header_text">
            <p id="header_ttt" style="margin-bottom: 20px;">
            <span>${dto.name}</span>
            <c:choose>
            	<c:when test="${dto.state eq 'check' || dto.state eq 'done' || dto.state eq 'recruit' }">
		            <span class="DateMius"><span class="regDate"></span> - <span class="finishDate"></span></span>
            	</c:when>
            	<c:when test="${dto.state eq 'wait' || dto.state eq 'ing' || dto.state eq 'finish' }">
            		<span class="DateMius"><span class="startDate"></span> - <span class="finishDate"></span></span>
            	</c:when>
            </c:choose>
            
            </p>
            <p id="header_t">
            <span class="header_category">${dto.category} > ${dto.detailCategory }</span>
            
            <c:if test="${dto.state eq 'done' }">
            <span class="header_apply">
            <img src="${pageContext.request.contextPath}/resources/img/project/proposal.png">
         		   총<strong>${applyCount}명</strong>지원</span>
            </c:if>
            
            
            </p>
         </div>
      </div>
      
      <c:if test="${member.kind eq 'freelancer' && dto.state eq 'done' && (member.phone eq null || freelancer.intro eq null || portfolio[0] eq null || skills[0] eq null)}">
      <div class="contents-register">
            <div class="contents-register-inner" style="text-align: center;">
            
            <c:if test="${member.kind=='admin' }">
               <p><a href="../file/fileDown?fname=${dto.fName }">${dto.oName }</a></p>
            </c:if>
            <c:if test="${member.kind=='freelancer'}">
               <p>프로젝트 지원을 위해
               <c:if test="${member.phone eq null }">
               <span><a href="../member/personaldataView">기본정보</a></span>
               </c:if>
               <c:if test="${freelancer.intro eq null }">
               <span><a href="../member/introView">자기소개</a></span>
               </c:if>
               <c:if test="${skills[0] eq null }">
               <span><a href="../member/skillList">보유기술</a></span>
               </c:if>
               <c:if test="${portfolio[0] eq null }">
               <span><a href="../member/portfolioList">포트폴리오</a></span>
               </c:if>
               을(를) 입력해주세요
               </p>
              
            </c:if>
            
           
            </div>
         </div>
      </c:if>
  
      
      
      <!-- contents -->
      <div class="contents">
      
      
      <!-- dto.state가 sell일 때 나타나는 pjsell 정보 목록들  -->
      
      
      
      <!-- left contents  -->
         <section class="contents_main" >
         
         <c:if test="${dto.state eq 'sell'}">
     		 <section class="pjsellDiv">
      			  <div class="project-detail-info-i" style="margin-top: 0px;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ">
		               <div class="budget">
		                  <span class="fa">판매자</span>
		                <i class="material-icons">person</i>
		                  	${mem.nickName}
		               </div>
		               <div class="term">
		                  <span class="fa">연락처</span>
		                 <i class="material-icons">phone</i>
		                  ${mem.phone}
		               </div>
		               <div class="deadline">
		                  <span class="fa">판매금액</span> 
		                   <i class="fa fa-krw"></i>
		                  ${pjsell.price} 
		                  <!-- <span class="finishDate"></span> -->
		               </div>
		          </div>
		          
		          <div class="pjsellContents">
		          프로젝트 판매 내용
		          </div>
      	
 
     		 </section>
      </c:if>
         
         
         
         
         <div class="contents-back" style="padding: 30px;">
         
         <c:if test="${dto.state ne 'sell' }">
         
         
         <c:if test="${dto.state eq 'check' || dto.state eq 'done' || dto.state eq 'recruit' }">
            <div class="project-detail-info">
               <div class="budget">
                  <i class="fa fa-krw"></i>
                  <span class="fa">예상금액</span>
                  ${dto.budget}원
               </div>
               <div class="term">
                  <i class="fa fa-clock-o"></i>
                  <span class="fa">예상기간</span>${dto.period}일
               </div>
               <div class="deadline">
                  <i class="fa fa-pencil"></i>
                  <span class="fa">모집마감</span><span class="finishDate"></span>
               </div>
            </div>
         </c:if>
         
         
         <c:if test="${dto.state eq 'wait' || dto.state eq 'ing' || dto.state eq 'finish' }">
            <div class="project-detail-info">
               <div class="budget">
                  <i class="fa fa-krw"></i>
                  <span class="fa">금액</span>
                  ${dto.budget}원
               </div>
               <div class="term">
                  <i class="fa fa-clock-o"></i>
                  <span class="fa">프로젝트 기간</span>${dto.period}일
               </div>
               <div class="deadline">
                  <i class="fa fa-pencil"></i>
                  <span class="fa">프로젝트 마감</span><span class="finishDate"></span>
               </div>
            </div>
         </c:if>
         
         
         
            
            
            <div class="project-detail-box">
               <div class="project-detail-top">
                  <div class="detail-title">기획상태</div>
                  <div class="detail-data" id="planState"></div>
                  <div class="detail-title">매니징 경험</div>
                  <div class="detail-data" id="exp"></div>
                  <div class="detail-title">등록 일자</div>
                  <div class="detail-data" id="reg_date"></div>
               </div>
               <div class="project-detail-bottom">
               <c:choose>
               	<c:when test="${dto.state eq 'check' || dto.state eq 'done' || dto.state eq 'recruit' || dto.state eq 'fail'}">
                  <div class="detail-title">예상 시작일</div>
               	</c:when>
               	<c:otherwise>
               		<div class="detail-title">시작일</div>
               	</c:otherwise>
               </c:choose>
                  <div class="detail-data startDate"></div>
                  <div class="detail-title">미팅 방식</div>
                  <div class="detail-data" id="meetKind"></div>
                  <div class="detail-title">위치</div>
                  <div class="detail-data" style="overflow: hidden;">${dto.addr_main}</div>
               </div>
            </div>
         </c:if>
         <c:if test="${dto.state eq 'sell' }">
         
         	 <div class="project-detail-box" style="border-bottom: 1px solid #dedede;">
               <div class="project-detail-top">
                  <div class="detail-title">시작일</div>
                   <div class="detail-data startDate"></div>
                  <div class="detail-title">종료일</div>
                  <div class="detail-data finishDate"></div>
                  <div class="detail-title">위치</div>
                  <div class="detail-data" style="overflow: hidden;">${dto.addr_main}</div>
               </div>
             </div>
         </c:if>
         
         
         
           
            
            
            
            
            <!-- 프로젝트 내용 -->
            <div class="project-detail">
               <div class="project-detail-title">프로젝트 내용</div>   
               <div>${dto.contents }</div>
               
            </div>
            
            <div>
               <div class="project-detail-title" style="margin-top: 20px;">관련 기술</div>
               <span class="project-skill">
               
               <c:forEach items="${dto.skills}" var="sk">
					<span class="skill-name">${sk}</span>
							
							</c:forEach>
               
               </span>
      
               
               
            </div>
         </div>
         <div style="clear: both;"></div>

         
         
         
         
         
         <c:if test="${dto.state eq 'ing' || dto.state eq 'done'}">
         <div class="project-qna">
            <div class="project-detail-title">프로젝트 문의 </div>
            <div style="border-bottom: 1px dotted #dedede;"></div>
            
            <div style="margin-top: 30px;" class="project-reply-box">

            <div class="project-reply-box-inner">
               <div class="project-reply-box-top">
                
               <!-- Reply 가 들어가는 부분-->
               
               </div>
            </div>
            
            
            <form action="../reply/replyInsert" id="frm" method="post">
            <div class="project-reply-box-bottom" style="margin-top: 50px; background-color: blue;">
               <input type="hidden" name="projectNum" value="${dto.projectNum}">
               
               <!-- member의 img를 넣자 -->
            
               <div class="reply_img_box"><img style="height: 30px; width: 30px; border-radius: 3px; margin-right: 10px;" src="${pageContext.request.contextPath}/resources/profile/${member.fProfileImage}"></div>
               <input type="text" name="contents">
               <input type="checkbox" id="reply_check">비공개 설정
               <input type="hidden" name="replyChk" id="replyChk" value="true">
               <input type="button" id="btn" value="작성">
            </div>
            </form>
            
            </div>
         </div>
         </c:if>
         
         
               

         
         
         </section>
         
         
         
         
         <!-- right contents  -->
      <section class="contents_sub">
      
      <!-- 오른쪽 상단 버튼 프리랜서일때 설정하기 -->
      <c:if test="${member.kind eq 'freelancer' && (dto.state eq 'done' || dto.state eq 'ing') }">
      
         <div class="project-apply-box">
            <c:if test="${dto.state eq 'done'}">
            <div class="register-btn" id="btn_apply" data-toggle="modal" >
            <img src="${pageContext.request.contextPath}/resources/img/project/register-popol.png">
            <span id="span_apply">
            <c:if test="${check eq 0 && checkCount eq 0 && member.phone ne null && freelancer.intro ne null && portfolio[0] ne null && skills[0] ne null}">
            	프로젝트 지원하기
            </c:if>
            
            <c:if test="${check eq 0 && checkCount eq 0 && member.phone eq null || freelancer.intro eq null || portfolio[0] eq null || skills[0] eq null }">
            	프로젝트 지원 불가
            </c:if>
            <c:if test="${check eq 1 || checkCount eq 1}">
          	 프로젝트 지원 취소
            </c:if>
            </span>
            </div>
          </c:if>
            <c:if test="${dto.state eq 'ing'}">
            <div id="scheduleBtn" class="schedule-btn">프로젝트 스케줄 </div>
          </c:if>
         
             </div>
            </c:if>
            
         
           <!----------------------- Modal ---------------------------------->

            
        

  <!-- Modal -->
 <div class="modal fade" id="App_Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-edit"></span>  Application</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="../applicant/insertApplicant">
            <div class="form-group">
            <input type="hidden" name="projectNum" value="${dto.projectNum }">
            <input type="hidden" name="email" value="${member.email}">
            <div>프로젝트Num : ${dto.projectNum }</div>
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Applicant email</label>
              <div>${member.email}</div>
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> pay</label>
              <input type="number" class="form-control" name="pay" placeholder="Enter pay">
            </div>
         
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Apply</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
      
          <p>프로젝트 미팅시 조율이 있을 수 있습니다.</p>
         
        </div>
      </div>
      
    </div>
  </div>  
         
         
             
          
<%-- <<<<<<< HEAD
		확인필요
          <c:if test="${dto.state eq 'ing' && member.kind ne 'admin'}">
            <div id="scheduleBtn" class="schedule-btn">프로젝트 스케줄 </div>
======= --%>
          <!-- 오른쪽 상단버튼 클라이언트일때 설정하기 -->
          <c:if test="${member.kind eq 'client' && member.email==dto.email}">
          <div class="project-apply-box">
          <c:if test="${dto.state eq 'ing'}">
            <div id="scheduleBtn" class="schedule-btn">프로젝트 스케줄 </div>
          </c:if>
          <c:if test="${dto.state eq 'recruit' || dto.state eq 'ing' }">
            <div class="schedule-btn">미팅룸 예약하기 </div>
          </c:if>
          	<c:if test="${dto.state eq 'check'}">
                <div class="owner-btn" id="pj-update">Update</div>
            </c:if>
                <div class="owner-btn" id="pj-delete">Delete</div>

          </div>

          </c:if>

          
          
          <c:if test="${member.kind eq 'admin'}">
          <div class="project-apply-box">
           
             <c:if test="${dto.state=='done'}">
            프로젝트 상태 : <strong>검수완료</strong> 
            </c:if>
            <c:if test="${dto.state=='wait'}">
            프로젝트 상태 : <strong>입금 대기중</strong>
            </c:if>
            <c:if test="${dto.state=='ing'}">
            프로젝트 상태 : <strong>진행중</strong>
            </c:if>
            <c:if test="${dto.state=='fail'}">
            프로젝트 상태 : <strong>모집 실패</strong>
            </c:if>
            
             
             <form action="" id="frmm" method="get">
			 <input type="hidden" name="state" value="${dto.state}">
            <input type="hidden" name="projectNum" value="${dto.projectNum}">
			<input type="hidden" name="email" value="${dto.email}">
            <c:if test="${dto.state eq 'check'}">
            <input type="button" class="register-btn" value="프로젝트 검수 완료" id="doneBTN">
            </c:if>
            
            <c:if test="${dto.state eq 'fail'}">
            <input type="button" class="register-btn" value="프로젝트 연장" id="dateBTN">
            </c:if>
            
            <input type="button" class="register-btn" value="프로젝트 삭제" id="deleteBTN">
            
            </form>
            </div>
          </c:if>
      
            
         
            
            
            <div class="client-info-box">
               <div>
           
               <div class="dto_profile_box">
                  <div class="dto_profile">
                  	<img style="width: 100%; height: 100%;" src="${pageContext.request.contextPath}/resources/profile/${mem.fProfileImage}">
                  </div>
               </div>
               <div class="dto_profile_detail">
                  <div>프로젝트 등록자 : ${dto.email}</div>
                  <div><span>프로젝트 등록</span><span id="total_pjcount">${totalCount}건 </span></div>
                  <div><span>진행중인 프로젝트</span><span id="ing_pjcount">${ingCount } 건</span></div>
                  <div><span>완료한 프로젝트</span><span id="finish_pjcount">${finishCount } 건</span></div>
                  <div><span>판매중인 프로젝트</span><span id="recurit_pjcount">${conCount } 건</span></div>
               </div>
               </div>
            </div>

            
      
         </section>
      </div>
      
      


</section>
<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

<script type="text/javascript">

/* 기본셋팅 */
var projectNum = "${dto.projectNum}";
var email = "${member.email}";
var state = '${dto.state}';
var check = "${check}";
var apply_check = $("#btn_apply").text().trim();
alert(state);
alert("${member.oProfileImage }");
alert("중복인가="+check);
alert("checkCount=${checkCount}");
alert(apply_check);
alert("intro--=${freelancer.intro}");


/* reply ajax */
$.get("../reply/replyList?projectNum="+projectNum+"&curPage=1",function(data){
   $(".project-reply-box-top").html(data);
});


/* 기획상태 뿌려주기 */
var planState = "${dto.planState}";
if(planState=='idea'){
   $("#planState").text("아이디어만 존재");   
}else if(planState=='simple'){
   $("#planState").text("필요한 내용 정리");
}else{
   $("#planState").text("상세한 기획문서 존재");
}


/* 매니징경험 뿌려주기 */
 var exp = "${dto.exp}";
 if(exp=='y'){
    $("#exp").text("있음");
 }else{
    $("#exp").text("없음");
 }

/* 등록일자 뿌려주기 */
 var rdate = "${dto.reg_date}";
 var reg_date = new Date(rdate);
 var reg_Day = reg_date.getDate();
 var reg_Month = reg_date.getMonth()+1;
 var reg_Year = reg_date.getFullYear();
 $("#reg_date").text(reg_Year+"년 "+reg_Month+"월 "+reg_Day+"일");
 $(".regDate").text(reg_Year+"년 "+reg_Month+"월 "+reg_Day+"일");
 
 
 /* 예상시작일 뿌려주기 */
 var sdate = "${dto.startDate}";
 var startDate = new Date(sdate);
 var startDay = startDate.getDate();
 var startMonth = startDate.getMonth()+1;
 var startYear = startDate.getFullYear();
 $(".startDate").text(startYear+"년 "+startMonth+"월 "+startDay+"일");
 
 
 /* 미팅방식 뿌려주기 */
var meetKind = "${dto.meetKind}";
if(meetKind=='offline'){
   $("#meetKind").text("오프라인");
}else{
   $("#meetKind").text("온라인");
}

/* 모집마감일 뿌려주기 */
 var fdate = "${dto.finishDate}";
 var finishDate = new Date(fdate);
 var finishDay = finishDate.getDate();
 var finishMonth = finishDate.getMonth()+1;
 var finishYear = finishDate.getFullYear();
 $(".finishDate").text(finishYear+"년 "+finishMonth+"월 "+finishDay+"일");
 
 


/* reply 작성 */
 $("#btn").click(function() {
   var chk = $("#reply_check").prop("checked");
   
   /* 비밀글이면 true, 공개댓글이면 false값 */
   if(chk==true){
      alert("true");
      alert($("#replyChk").val());
      $("#replyChk").prop("value", "true");
   }else{
      alert("false");
      $("#replyChk").prop("value", "false");
   }
   $("#frm").submit();
});

var testId = "";
/* 답글버튼 */
 $(".project-reply-box-top").on("click",".listReply",function() {

      alert($(this).attr("id"));
      testId = $(this).attr("id");

         $(".rere").html("");
         $("."+testId).html('<input type="text" id="recontents" name="contents"><input type="checkbox" id="reply_check">비공개'
        		 +'<input type="button" class="replybtn" value="댓글달기">'
        		 +'<input type="button"class="cancle" id="'+testId+'" value="취소">');
         $(".listReply").attr("data-on", "off");
         $(this).attr("data-on", "on");
       
         
   });
   
 /* 댓글 취소 */
 $(".project-reply-box-top").on("click",".cancle",function() {
   var testId = $(this).attr("id");
   alert("testid=="+testId);
   $("."+testId).html("");
   $(".listReply").show();
   
 });
 
 
 /* 댓글달기 checkbox클릭 */
 var chkk="";	  
 $(".project-reply-box-top").on("click", "#reply_check", function() {
    	  chkk = $("#reply_check").prop("checked");
    	  alert($("#reply_check").prop("checked"));
    	  alert("chkk=="+chkk);
    	  alert("클릭");
		if(chkk==true){
			alert("체크됨");
			alert("비공개댓글에 댓글은 자동비공개, 공개댓글의 댓글은 체크하기");
		}else{
			alert("비공개d댓글");
		}
	});
 
  $(".project-reply-box-top").on("click", ".replybtn", function() {
	
    alert("댓글id="+testId);
    var contents = $("#recontents").val();
    $.ajax({
    	type:"POST",
    	url:"../reply/reReply?num="+testId,
    	data:{
    		writer:email,
    		contents:contents,
    		projectNum:projectNum,
    		replyChk:chkk
    	},
    	success:function(result){
    		window.location.reload(true);
    	}
    });
  });
   



	/* 프로젝트 지원하기 */
	(function($) {
		$("#btn_apply").click(function() {
			
			if(apply_check=="프로젝트 지원 취소"){
				alert("프로젝트 지원 취소");
				var ch = confirm("삭제하시겠습니까?\n삭제한 프로젝트는 복구할 수 없습니다.");
				if(ch == true){
					$.get("../applicant/deleteApplicant?email="+email+"&projectNum="+projectNum, function(data) {
					});
					location.href="../member/freelancer/myproject?email"+email;
				}else{
					alert("취소되었습니다.");
				}
			}else if(apply_check=="프로젝트 지원 불가"){
				alert("프로젝트 지원 불가");
			}else{
		
			alert("프로젝트 지원!");
			$("#App_Modal").modal();
			
			}
		});
		
		   
		   
	 //프로젝트스케줄 //면 //아래잇는거 지우고 function 안으로 넣음 
		 $("#scheduleBtn").click(function(){
			var test = getScheduleNum(projectNum);
	    });
		   

	})(jQuery);


   var projectNum = '${dto.projectNum}';
      
   $('#deleteBTN').click(function() {
      
      if(confirm("정말로 프로젝트를 삭제하시겠습니까?")){
         $('#frmm').attr('action','./projectDelete');
         $('#frmm').submit();
      }else{
         
      }   
      
   });
 
   
   $('#doneBTN').click(function() {
      if(confirm("프로젝트 검수를 완료하시겠습니까?")){
         $('#frmm').attr('action','../checkProject/checkProjectUpdate');
         $('#frmm').submit();
      }
      else{

      }
      
   });
   
   

   function getContextPath(){
	   	alert('${pageContext.request.contextPath}');
	   	var context = '${pageContext.request.contextPath}';
	   	return context;
   }



   /* 
    * 	
    * Controller에서 이미 프로젝트의 존재여부는 확인하고 들어와진 상태라고 보면된다 
   	DB 에 해당 프로젝트의 스케줄이 있는지 확인 후 
   	있으면 users, parts , units 정보를 가져오는 함수호출
   	없으면 스케줄 생성여부를 물어본 뒤 
   		생성한다고하면 생성함수호출 
   		안한다고 하면 이전 화면
   */
   function getScheduleNum(projectNum){
   	var test = "";
   	$.ajax({
   		url: "${pageContext.request.contextPath}/schedule/check?projectNum="+projectNum,
   		type: "GET",
   		async : false,
   		success: function(data){
   			//alert(JSON.stringify(data));
   			
   			if(data.schedule=='n'){
   				//스케줄 생성하도록 창띄워주기
   				if(confirm('스케줄을 생성하시겠소?')){
   					createSchedule(data.projectNum);
   				}else{
   					//이전 화면으로 가기 
   					//window.history.back();
   					//혹은
   					location.href = $(location).attr('href');
   				}
   				
   			}else if(data.schedule=='y'){
   				
   				var scheduleNum = data.scheduleMainDTO.scheduleNum;
   				alert("ajax 성공시 scheduleNum(있을경우) = "+scheduleNum);
   				location.href = getContextPath()+"/schedule/test?scheduleNum="+scheduleNum;
   			}else{
   				alert("스케줄 생성 오류");
   				location.href = $(location).attr('href');
   				//location.href = getContextPath();
   			}
   		}
   	 });
   	
   	return test;
   }



   /* 
   	스케줄 생성함수 
   */
   function createSchedule(projectNum){
   	var scheduleNum = 0;
   	$.ajax({
   		url: getContextPath()+"/schedule/create?projectNum="+projectNum,
   		type: "GET",
   		success:function(data){
   			//alert("스케줄 생성해야됨"+data);
   			if(data.result == 'y'){
   				alert("생성된 scheduleNum = "+data.scheduleNum);
   				location.href = getContextPath()+"/schedule/test?scheduleNum="+data.scheduleNum;
   			}else{
   				alert("스케줄생성오류");
   			}
   		}
   	});
   }



	
	
	
	$("#pj-delete").click(function() {

		if(state=="check" || state=="done"){

			var ch = confirm("삭제하시겠습니까?\n삭제한 프로젝트는 복구할 수 없습니다.");
	
			if (ch == true) {
				$.get("projectDelete?projectNum=" + projectNum+"&state="+state, function(data) {
					location.href = "../member/client/clientproject";
				});
			}else {
				alert("취소되었습니다.");
				location.href = "projectView?projectNum=" + projectNum;
			}
		}else if(state=="recruit" || state=="ing" || state=="fail"){
			alert("관리자에게 프로젝트 삭제 요청들어가기");
		}else{
			alert("완료된 프로젝트나 판매중인 프로젝트를 삭제시 \n프리랜서의 커리어에서 삭제되기 때문에 삭제 불가합니다. \n관리자에게 문의하세요.");
		}
		
	});

	$("#pj-update").click(
			function() {
				location.href = "projectUpdate?projectNum=" + projectNum
						+ "&email=" + email;
			});

	$('#' + state).click(function() {

		var projectNum = '${dto.projectNum}';

		$('#deleteBTN').click(function() {

			if (confirm("정말로 프로젝트를 삭제하시겠습니까?")) {
				$('#frmm').attr('action', './projectDelete');
				$('#frmm').submit();
			} else {

			}

		});
	});

	$('#doneBTN').click(function() {
		if (confirm("프로젝트 검수를 완료하시겠습니까?")) {
			$('#frmm').attr('action', '../checkProject/checkProjectUpdate');
			$('#frmm').submit();
		} else {


		}

	});
	
	
</script>
</body>
</html>