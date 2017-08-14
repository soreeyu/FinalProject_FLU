<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main_section {
   min-width: 1460px;
   width: 100%;
   min-height: 1000px;
   background-color: #f2f2f2;
}

.page_wrap {
   min-width: 1152px;
   width: 1152px;
   height: 100%;
   margin: 0 auto;
   margin-top: 30px;
}

.left {
   width: 352px;
   height: 100%;
   float: left;
}

.right {
   width: 800px;
   height: 100%;
   float: left;
}



.user {
   width: 248px;
   padding: 15px 30px;
   background-color: white;
   margin-bottom: 20px;
   border: 1px solid #dedede;
}

.user>span {
   font-size: 18px;
   display: block;
   font-weight: bold;
   padding-bottom: 11px;
   border-bottom: 1px solid #dedede;
   margin-bottom: 9px;
}

.user_name {
   display: inline-block;
}

.user_name>img {
   width: 50px;
   height: 50px;
   border-radius: 50%;
   float: left;
   border: 1px solid #dedede;
}

.user_name>span {
   width: 150px;
   display: inline-block;
   padding-left: 10px;
   float: left;
   line-height: 25px;
}

.user_name>a {
   width: 150px;
   display: inline-block;
   padding-left: 10px;
   float: left;
   line-height: 25px;
}

.user_name>a span {
   font-size: 12px;
   color: blue;
}

.history {
   width: 248px;
   padding: 15px 30px;
   background-color: white;
   margin-bottom: 20px;
   border: 1px solid #dedede;
   
}

.history>span:first-child {
   display: block;
   font-size: 18px;
   font-weight: bold;
   padding-bottom: 11px;
   margin-bottom: 9px;
}

.history>p {
   padding: 7px; font-size : 17px;
   line-height: 25px;
   margin-top: 5px;
   font-size: 17px;
}

.history>p:HOVER {
   cursor: pointer;
}

.title {
   width: 800px;
   height: 100px;
   background-color: white;
   border: 1px solid #dedede;
}

#t1{

   font-size: x-large;
   margin-top: 20px;
   margin-left: 30px;
   font-weight: bolder;
   color: rgb(85, 85, 85);
   
}

#t2{

   font-size: medium;
   margin-top: 15px;
   margin-left: 30px;
   font-weight: normal;
   color: #999;

}



#searchForm{

   width: 800px;
   height:220px;
   margin-top: 20px;
   background-color: white;
   border: 1px solid #dedede;

}

#searchBTN{
   
   width : 150px;
   height: 30px;
   background-color: #339bff;
   color: white;
   border: 1px solid #2099bb;
   font-size: 1.3em;
   margin: 0 auto;
   margin-top: 10px;
   text-align: center;
   line-height: normal;
}

#searchBTN:HOVER{

cursor: pointer;

}

#tb{

margin: 0 auto;
margin-top: 30px;

}

#tb td select{
   
   width: 160px;
   height: 25px;
   border: 1px solid #ccc;
   background-color: #f9f9f9;   
   border-radius: 0.1px;
   
}

#tb td input{
   
   width: 170px;
   height: 25px;
   border: 1px solid #ccc;
   background-color: #f9f9f9;
   
}



.tb_title{
width: 160px;
height: 30px;
text-align: center;
font-family: sans-serif;
font-weight: bold;

}

.tb_contents{



}

.contents {
   width: 800px;
   height: 100%;
   background-color: white;
   margin-top: 15px;
   border: 1px solid #dedede;
}

#detail {
   width: 120px;
}

.bbttnn:HOVER{

cursor: pointer;
   
}


.contents_paging{
   width: 380px;
   margin: 0 auto;
   text-align: center;
   font-weight: bold;
   margin-top: 10px;
   margin-bottom: 10px;
}
.contents_paging span{
   cursor: pointer;
}

.tavle{

   width: 750px;
   height: 100%;
   margin: 0 auto;
   margin-top: 20px;
}

thead tr td{
   
   height: 30px;
   font-size: 1.0em;
   font-weight: bold;
   color: gb(85, 85, 85);
   text-align:  center;
   line-height: 25px;
   border-bottom: 2px solid #005580;
   
}

.td1{
   width: 5%;

}

.td2{
   width: 13%;

}

.td3{
   width: 28%;

}

.td4{
   width: 15%;

}

.td5{

   width: 10%;
}

.td6{
   width: 12%;

}

.td7{
   width: 7%;

}



.yui .tbody_td1{
   
   width: 5%;
   font-size: 0.8em;
   height: 30px;
   line-height: 25px;
   text-align:  center;
   border-bottom: 0.5px solid #d0e2e2;
   vertical-align: middle;
   
}

.yui .tbody_td2{
   
   width: 13%;
   font-size: 0.8em;
   height: 30px;
   line-height: 25px;
   text-align:  center;
   border-bottom: 0.5px solid #d0e2e2;
   vertical-align: middle;

}
.yui .tbody_td3{
   
   width: 28%;
   font-size: 0.8em;
   height: 30px;
   line-height: 25px;
   text-align:  center;
   border-bottom: 0.5px solid #d0e2e2;
   vertical-align: middle;

}
.yui .tbody_td4{
   
   width: 15%;
   font-size: 0.8em;
   height: 30px;
   line-height: 25px;
   text-align:  center;
   border-bottom: 0.5px solid #d0e2e2;
   vertical-align: middle;

}
.yui .tbody_td5{
   width: 10%;
   font-size: 0.8em;
   height: 30px;
   line-height: 25px;
   text-align:  center;
   border-bottom: 0.5px solid #d0e2e2;
   vertical-align: middle;

}
.yui .tbody_td6{
   width: 12%;
   font-size: 0.8em;
   height: 30px;
   line-height: 25px;
   text-align:  center;
   border-bottom: 0.5px solid #d0e2e2;
   vertical-align: middle;

}

.yui .tbody_td7{
   
   width: 7%;
   font-size: 0.8em;
   height: 30px;
   line-height: 25px;
   text-align:  center;
   border-bottom: 0.5px solid #d0e2e2;
   vertical-align: middle;

}


.label{
    display: inline;
    padding: .2em .6em .2em;
    font-size: 65%;
    font-weight: bold;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .2em;
    background-color: #00b386;
  
}

.check_wait_tr{
   background-color: #f7ffff;
}

.stop{
   color:red;
}

.hello{
   border-bottom: 0.5px solid #d0e2e2;
}

.btn2{

   width: 100px;
   height: 30px;
   border: 0;
   background-color: #2099bb;
   color: white;
   font-weight: bold;

}

.btn2:HOVER {
   
   cursor: pointer;
   background-color: #25b3da;
   
}

.x:HOVER {
   
   cursor: pointer;
   
}

</style>
<script type="text/javascript">
   $(function() {

      var board = '${board}';

      if (board == 'Check') {
         $('#checkBTN').css('background-color', '#446eab');
         $('#checkBTN').children("#check").css('color', 'white');
         $('#failBTN').css('background-color', 'white');
         $('#failBTN').children("#fail").css('color', 'black');
         $('#cancelBTN').css('background-color', 'white');
         $('#cancelBTN').children("#cancel").css('color', 'black');
      } else if (board == 'Fail') {
         $('#failBTN').css('background-color', '#446eab');
         $('#failBTN').children("#fail").css('color', 'white');
         $('#checkBTN').css('background-color', 'white');
         $('#checkBTN').children("#check").css('color', 'black');
         $('#cancelBTN').css('background-color', 'white');
         $('#cancelBTN').children("#cancel").css('color', 'black');
      } else if (board == 'Wait') {
         $('#waitBTN').css('background-color', '#446eab');
         $('#waitBTN').children("#wait").css('color', 'white');
         $('#finishBTN').css('background-color', 'white');
         $('#finishBTN').children("#finish").css('color', 'black');
      } else if (board == 'Finish') {
         $('#finishBTN').css('background-color', '#446eab');
         $('#finishBTN').children("#finish").css('color', 'white');
         $('#waitBTN').css('background-color', 'white');
         $('#waitBTN').children("#wait").css('color', 'black');
      } else if(board=='Cancel'){
         $('#checkBTN').css('background-color', 'white');
         $('#checkBTN').children("#check").css('color', 'black');
         $('#failBTN').css('background-color', 'white');
         $('#failBTN').children("#fail").css('color', 'black');
         $('#cancelBTN').css('background-color', '#446eab');
         $('#cancelBTN').children("#cancel").css('color', 'white');
         
      }

      
      // category 갱신
      $('select[name=category]').change(function() {

         var i = $(this).val();

         if (i == '개발') {
            $('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="워드프레스">워드프레스</option><option value="퍼블리싱">퍼블리싱</option><option value="일반소프트웨어">일반소프트웨어</option><option value="쇼핑몰">쇼핑몰</option><option value="게임">게임</option><option value="임베디드">임베디드</option><option value="기타">기타</option></select>');
         } else {
            $('#result').html('<select id="detail" name="detailCategory"><option value="">전체</option><option value="웹">웹</option><option value="어플리케이션">어플리케이션</option><option value="제품">제품</option><option value="프레젠테이션">프레젠테이션</option><option value="인쇄물">인쇄물</option><option value="쇼핑몰">쇼핑몰</option><option value="로고">로고</option><option value="그래픽">그래픽</option><option value="영상">영상</option><option value="게임">게임</option><option value="기타">기타</option></select>');
         }

      });

      
      
      //검색
      
       $('#searchBTN').click(function() {

         var board = '${board}';

         if (board == 'Check') {
            $('#frm').prop('action', "./checkProjectCheckList");
         } else if (board == 'Fail') {
            $('#frm').prop('action', "./checkProjectFailList");
         } else if(board=='Wait'){
            $('#frm').prop('action', "./checkProjectWaitList");
         } else if(board=='Finish'){
            $('#frm').prop('action', "./checkProjectFinishList");
         }
         else {

         }

         $('#frm').submit();

      });
      
      
       $("select[name=category] option").each(function() {
         if ($(this).val() == "${projectDTO.category}") {
            $(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
         }
      });

      $("select[name=detailCategory] option").each(function() {
         if ($(this).val() == "${projectDTO.detailCategory}") {
            $(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
         }
      });

      $("select[name=planState] option").each(function() {
         if ($(this).val() == "${projectDTO.planState}") {
            $(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
         }
      }); 
      
      $("#name").val("${projectDTO.name}");
      $("#email").val("${projectDTO.email}");
      
      var startDate = '${projectDTO.startDate}';
      
      var y = startDate.substr(0, 2);
       var m = startDate.substr(3, 2);
       var d = startDate.substr(6, 2);
       
       
       startDate = y+"-"+m+"-"+d;
       
      var finishDate = '${projectDTO.finishDate}';
      
      $("#startDate").val('20'+y+"-"+m+"-"+d);
      
      y = finishDate.substr(0, 2);
       m = finishDate.substr(3, 2);
       d = finishDate.substr(6, 2);
       
       $("#finishDate").val('20'+y+"-"+m+"-"+d);
       
      var reg_date = '${projectDTO.reg_date}';
      
      y = reg_date.substr(0, 2);
       m = reg_date.substr(3, 2);
       d = reg_date.substr(6, 2);

       $("#reg_date").val('20'+y+"-"+m+"-"+d);
       
       $("select[name=searchDate] option").each(function() {
         if($(this).val()=='${searchDate}'){
            $(this).attr("selected", "selected");
         }
      })
          
      $("select[name=type] option").each(function() {
         
         if($(this).val()=='${listInfo.type}'){
            $(this).attr('selected','selected')
         }
      })   
         
      
      $('.bbttnn').click(function() {
         
         var email = $(this).attr('title');
         var state = $(this).attr('role');
         var projectNum = $(this).attr('lang');
         
         if('${board}'=='Finish' || '${board}'=='Wait'){
            $(".visible"+projectNum).show();
         }
         else if('${board}'=='Cancel'){
            
             if(confirm("프로젝트를 중단하시겠습니까?")){   
               location.href="./checkProjectUpdate?email="+email+"&projectNum="+projectNum+"&state="+state;   
            } 
             
         }else if('${board}'=='Fail'){
            
                  var url="./moreDate";
                  var option = "width=440,height=340,top=100,left=300";
                 
                  window.open(url,'moreDate',option);
            
         }else{
            
         }
         
      });
       
       
       
       $(".btn2").click(function() {
          
          var email = $(this).attr('title');
          var state = $(this).attr('lang');
          var projectNum = $(this).attr('role');
          var name = $(this).attr('accesskey');
          
          ${app.name}
          if('${board}'=='Finish'){ //프리랜서 대금 관리
             
               if(confirm(name+"님의 대금처리를 완료하시겠습니까?")){
                  location.href = "../applicant/applicantPayFinish?email="+email+"&projectNum="+projectNum;
               }else{
                  
               } 
             
          }else if('${board}'=='Wait'){//프로젝트 대금관리
             

            if(confirm("입급여부를 확정하고 프로젝트를 시작하시겠습니까?")){
               
               location.href="./checkProjectUpdate?projectNum="+projectNum+"&state="+state+"&email="+email;
               
            }else{
               
            }
             
          } 
          
      });
       
       

       $('.x').click(function() {
         
          var visible = $(this).attr('title');
          
          $("."+visible).hide();
          
      });
      
         
       $(".check_wait_tr").hide();
       
      
   
       //----------paging-----------------------
       
       $('.page').click(function() {
          
          var board = '${board}';
          var curPage = $(this).attr('title');
          
          $('input[name=curPage]').val(curPage);
          
         if (board == 'Check') {
            $('#frm').prop('action', "./checkProjectCheckList");
         } else if (board == 'Fail') {
            $('#frm').prop('action', "./checkProjectFailList");
         } else if(board=='Wait'){
            $('#frm').prop('action', "./checkProjectWaitList");
         } else if(board=='Finish'){
            $('#frm').prop('action', "./checkProjectFinishList");
         }
         else {

         }

         $('#frm').submit();
          
      });
       
       
      
   });
   
</script>
</head>
<body>
   <c:import url="/WEB-INF/views/temp/header.jsp"></c:import>


   <section class="main_section">
      <section class="page_wrap">
         <article class="left">
            <div class="user">
               <span></span>
               <div class="user_name">
                  <img alt="프로필 사진"
                     src="${pageContext.request.contextPath}/resources/img/FLU.png">
                  <span>관리자</span> <a><span>기본 정보 수정</span></a>
               </div>
            </div>
            <div class="history">
               <c:if test="${board=='Check' or board=='Fail' or board=='Cancel'}">
                  <p id="checkBTN">
                     <a id="check" href="./checkProjectCheckList">검수 전 프로젝트</a>
                  </p>
                  <p id="failBTN">
                     <a id="fail" href="./checkProjectFailList">모집실패 프로젝트</a>
                  </p>
                  <p id="cancelBTN">
                     <a id="cancel" href="./checkProjectCancelList">중단요청 프로젝트</a>
                  </p>
               </c:if>
               <c:if test="${board=='Wait' or board=='Finish'}">
                  <p id="waitBTN">
                     <a id="wait" href="./checkProjectWaitList">입금대기 프로젝트</a>
                  </p>
                  <p id="finishBTN">
                     <a id="finish" href="./checkProjectFinishList">프리랜서 대금관리</a>
                  </p>
               </c:if>
               <c:if test="${board=='Client' or board=='Freelancer'}">
                  <p id="clientBTN">
                     <a id="client" href="./checkProjectClientList">클라이언트 관리</a>
                  </p>
                  <p id="freelancerBTN">
                     <a id="freelancer" href="./checkProjectFreelancerList">프리랜서 관리</a>
                  </p>
               </c:if>
            </div>

         </article>
         <article class="right">
            <div class="title">
               <c:if test="${board=='Check'}">
                  <p id="t1">검수 전 프로젝트</p>
                  <p id="t2">클라이언트로부터 등록된 프로젝트를 검수하는 곳입니다.</p>
               </c:if>
               <c:if test="${board=='Fail'}">
                  <p id="t1">모집종료 프로젝트</p>
                  <p id="t2">기간이 완료되어 모집종료된 프로젝트를 보여주는 곳입니다.</p>
               </c:if>
               <c:if test="${board=='Wait'}">
                  <p id="t1">입급대기 프로젝트</p>
                  <p id="t2">미팅이 완료된 프로젝트를 보여주는 곳입니다. 프로젝트 진행여부를 결정할 수 있습니다.</p>
               </c:if>
               <c:if test="${board=='Finish'}">
                  <p id="t1">프리랜서 대금관리</p>
                  <p id="t2">프로젝트를 완료한 회원들에게 급여를 지급하는 곳입니다.</p>
               </c:if>
               <c:if test="${board=='Client'}">
                  <p id="t1">클라이언트 신원확인</p>
                  <p id="t2">클라이언트들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
               </c:if>
               <c:if test="${board=='Freelancer'}">
                  <p id="t1">프리랜서 신원확인</p>
                  <p id="t2">프리랜서들의 신원확인 신청을 받아 승인하는 곳입니다.</p>
               </c:if>
               <c:if test="${board=='Cancel'}">
                  <p id="t1">중단요청 프로젝트</p>
                  <p id="t2">클라이언트로부터 중단 요청을 받은 프로젝트를 처리하는 곳입니다.</p>
               </c:if>
            </div>
            
         <form id="frm" action="">
               <div id="searchForm">

                  <table id="tb">
                  <tr>
                     <td class="tb_title">1차 분류</td>
                     <td class="tb_contents">
                        <select name="category">
                           <option value="">전체</option>
                           <option value="개발">개발</option>
                           <option value="디자인">디자인</option>
                        </select>
                     </td>
                  <c:if test="${board=='Check' or board=='Fail' or board=='Wait' or board=='Cancel'}">
                     <td class="tb_title">기획 상태</td>
                     <td class="tb_contents">
                        <select name="planState">
                           <option value="">전체</option>
                           <option value="idea">아이디어까지만 존재</option>
                           <option value="simple">필요한 내용만 간단히 정리</option>
                           <option value="detail">상세한 기획문서 존재</option>
                        </select>
                     </td>
                  </c:if>
                  <c:if test="${board=='Finish'}">
                     <td class="tb_title">사업자 종류</td>
                     <td class="tb_contents">
                     <select name="type">
                        <option value="">전체</option>   
                        <option value="개인">개인</option>
                        <option value="팀">팀</option>
                        <option value="사업자">사업자</option>
                     </select>
                     </td>
                  </c:if>   
                  </tr>
                  <tr>
                     <td class="tb_title">2차 분류</td>
                     <td class="tb_contents">
                        <div id="result">
                           <select name="detailCategory">
                              <option value="">전체</option>
                              <option value="웹">웹</option>
                              <option value="어플리케이션">어플리케이션</option>
                              <option value="워드프레스">워드프레스</option>
                              <option value="퍼블리싱">퍼블리싱</option>
                              <option value="일반소프트웨어">일반소프트웨어</option>
                              <option value="쇼핑몰">쇼핑몰</option>
                              <option value="게임">게임</option>
                              <option value="임베디드">임베디드</option>
                              <option value="기타">기타</option>
                           </select>
                        </div>
                     </td>
                     <td class="tb_title">프로젝트 명</td>
                     <td class="tb_contents"><input type="text" name="name" id="name" value="${projectDTO.name}" placeholder="프로젝트 명을 입력하세요"></td>
                  </tr>
                  <tr>
                     <td class="tb_title">
                     <c:if test="${board=='Check'}">
                     예상 시작일
                     </c:if>
                     <c:if test="${board=='Fail' or board=='Wait' or board=='Finish' or board=='Cancel'}">
                     프로젝트 시작일
                     </c:if>
                     </td>
                     <td class="tb_contents"><input type="date" name="startDate" id="startDate"></td>      
                  <c:if test="${board=='Check' or board=='Fail' or board=='Wait' or board=='Cancel'}">
                     <td class="tb_title">담당자 이메일</td>
                     <td class="tb_contents"><input type="text" name="email" id="email" value="${projectDTO.email}" placeholder="클라이언트를 입력하세요"></td>
                  </c:if>
                  <c:if test="${board=='Finish'}">
                     <td class="tb_title">이름</td>
                     <td class="tb_contents"><input type="text" name="memberName" id="memberName" value="${listInfo.memberName}"></td>
                  </c:if>
                  
                  </tr>
                  <tr>
                     <td class="tb_title">
                     <c:if test="${board=='Check'}">
                     모집마감일
                     </c:if>
                     <c:if test="${board=='Fail' or board=='Wait' or board=='Finish' or board=='Cancel'}">
                     프로젝트 종료일
                     </c:if>
                     </td>
                     <td class="tb_contents"><input type="date" name="finishDate" id="finishDate"></td>
                     
                     
                     <td class="tb_title">기간</td>
                     <td class="tb_contents">
                     <select name="searchDate">
                        <option value="">전체</option>
                        <option value="week">최근 1주</option>
                        <option value="month">최근 1개월</option>
                        <option value="month3">최근 3개월</option>
                        <option value="month3">최근 6개월</option>
                        <option value="year">최근 1년</option>
                     </select>
                     </td>
                  </tr>
                  
               </table>
               
                  <div id="searchBTN">검색하기</div>
               </div>   

            
            

            <div class="contents">
            <div class="tavle">
               <table class="yui">
                  <thead>
                  <tr>
                     <td class="td1">분야</td>
                     <td class="td2">세부분야</td>
                     <td class="td3">프로젝트명</td>
                     <td class="td4">담당자</td>
                     <td class="td5">등록날짜</td>
                     <td class="td6">상태</td>
                     <td class="td7"></td>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="i" varStatus="e">
                     <tr id="append${i.projectNum }">
                        <td class="tbody_td1">${i.category}</td>
                        <td class="tbody_td2">${i.detailCategory}</td>
                        <td class="tbody_td3">
                        <a href="../project/projectView?projectNum=${i.projectNum}">
                        ${i.name }
                        <c:if test="${i.del_check=='1'}"><span class="stop">중단요청</span></c:if>
                        <c:if test="${i.del_check=='2'}"><span class="stop">중단</span></c:if>
                        </a>
                        </td>
                        <td class="tbody_td4">${i.email }</td>
                        <td class="tbody_td5">${i.reg_date}</td>
                        <td class="tbody_td6">
                            <c:if test="${i.state=='check'}">검수 단계</c:if>
                            <c:if test="${i.state=='done'}">검수 완료</c:if>
                            <c:if test="${i.state=='recruit'}">모집 완료</c:if>
                            <c:if test="${i.state=='wait'}">입금대기중</c:if>
                            <c:if test="${i.state=='ing'}">진행중</c:if>
                            <c:if test="${i.state=='finish'}">미지급</c:if>
                            <c:if test="${i.state=='fail'}">모집 실패</c:if>
                            <c:if test="${i.state=='payFinish'}">지급완료</c:if>
                            
                         </td>
                         <td class="tbody_td7">
                         <c:if test="${board=='Finish' or board=='Wait'}">
                            <span class="bbttnn" title="${i.email}" lang="${i.projectNum}" role="${i.state }">열기</span>
                         </c:if>
                         <c:if test="${board=='Cancel' and i.del_check=='1'}">
                            <span class="bbttnn" title="${i.email}" lang="${i.projectNum}" role="cancel">중단하기</span>
                         </c:if>
                         <c:if test="${board=='Fail'}">
                            <span class="bbttnn" title="${i.email}" lang="${i.projectNum}" role="fail" id="opener">기간연장</span>
                         </c:if>
                         </td>
                     </tr>

<c:if test="${board=='Wait'}">
   <c:if test="${i.state=='wait'}">
      <tr class="check_wait_tr visible${i.projectNum }">
         <td class="tbody_td1"><span class="label">${memberList[e.index].type}</span></td>
         <td class="tbody_td2"><span class="name">${memberList[e.index].account}</span></td>
         <td class="tbody_td3">
         <img alt="" src="${pageContext.servletContext.contextPath}/resources/img/checkProject/phone.png" style="width: 20px; height: 20px; vertical-align: text-top;">
         ${memberList[e.index].phone}
         </td>
         <td class="tbody_td4"><p>${memberList[e.index].accountNumber}</p>
         <p><fmt:formatNumber type="currency">${i.budget}</fmt:formatNumber></p>
         </td>
         <td class="tbody_td5">${memberList[e.index].bank}</td>
         <td class="tbody_td6"><input type="button" title="${i.email}" lang="${i.state}" role="${i.projectNum}" class="btn2" value="입금확인 완료"></td>
         <td class="tbody_td7"><span class="x" title="visible${i.projectNum}">닫기</span></td>
      </tr>
      </c:if>
      
      <c:if test="${i.state=='ing'}">
      <tr class="check_wait_tr visible${i.projectNum}">
         <td class="tbody_td1"><span class="label">${memberList[e.index].type}</span></td>
         <td class="tbody_td2"><span class="name">${memberList[e.index].account}</span></td>
         <td class="tbody_td3">
         <img alt="" src="${pageContext.servletContext.contextPath}/resources/img/checkProject/phone.png" style="width: 20px; height: 20px;">
         ${memberList[e.index].phone}
         </td>
         <td class="tbody_td4"><p>${memberList[e.index].accountNumber}</p>
         <p><fmt:formatNumber type="currency">${i.budget}</fmt:formatNumber></p>
         </td>
         <td class="tbody_td5">${memberList[e.index].bank}</td>
         <td class="tbody_td6">입금완료</td>
         <td class="tbody_td7"><span class="x" title="visible${i.projectNum}">닫기</span></td>
      </tr>
   </c:if>
</c:if>

<c:if test="${board=='Finish' }">
   <c:forEach items="${applicantList[e.index] }" var="app" varStatus="i">
      <tr class="check_wait_tr visible${app.projectNum }">
         <td class="tbody_td1">
            <span class="label">${app.type}</span>
         </td>
         <td class="tbody_td2">
            <span class="name">${app.account}</span>
         </td>
         <td class="tbody_td3">
            <img alt="" src="${pageContext.servletContext.contextPath}/resources/img/checkProject/phone.png" style="width: 20px; height: 20px; vertical-align: text-top;">
            ${app.phone}
         </td>
         <td class="tbody_td4">
            <p>${app.accountNumber }</p>
            <p><fmt:formatNumber type="currency">${app.pay*0.9}</fmt:formatNumber></p>
         </td>
         <td class="tbody_td5">
            ${app.bank }
         </td>
         <td class="tbody_td6">
            <c:if test="${app.state=='finish'}">
               <p><input type="button" title="${app.email}" role="${app.projectNum}" accesskey="${app.name}" class="btn2" value="지급확인"></p>
            </c:if>
            <c:if test="${app.state=='payFinish'}">
               지급완료
            </c:if>
         </td>
         <td class="tbody_td7">
            <span class="x" title="visible${app.projectNum}">닫기</span>
         </td>
      </tr>
   </c:forEach>
</c:if>                  


                  </c:forEach>
                  </tbody>
               </table>
               </div>
            <!-- 페이징 -->
            <div class="contents_paging">
               <c:if test="${listInfo.curBlock>1 }">
               <span id="preview">[이전]</span>      
               </c:if>
         
               <c:forEach begin="${listInfo.startNum}" end="${listInfo.lastNum}" var="i">
                  <span class="num" ><a class="page" title="${i}">${i}</a></span>   
               </c:forEach>
               <input type="hidden" name="curPage" value=""> <!-- 페이징을 위해 반드시 필요 지우지 말것 -->
               <c:if test="${listInfo.curBlock<listInfo.totalBlock }">
               <span id="nextview">[다음]</span>         
               </c:if>
            </div>
               
               
               
               
               
               
            </div>
         </form>
         
         
         </article>


      </section>







   </section>
   <c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>