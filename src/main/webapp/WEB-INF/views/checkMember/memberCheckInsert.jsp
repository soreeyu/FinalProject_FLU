<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<c:import url="/WEB-INF/views/temp/bootstrap.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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


p {
    display: block;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
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
   border-bottom: 1px solid #dedede;
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

.contents_0 {
   width: 800px;
   height: 550px;
   background-color: white;
   margin-top: 15px;
   border: 1px solid #dedede;
}

.contents_1 {
   width: 800px;
   height: 270px;
   background-color: white;
   margin-top: 15px;
   border: 1px solid #dedede;
}

.contents_2 {
   width: 800px;
   height: 270px;
   background-color: white;
   margin-top: 15px;
   border: 1px solid #dedede;
}



/* dddddddddddddddddddddddddddddddddd */

html {
    font-size: 62.5%;
    -webkit-tap-highlight-color: transparent;
    height: 100%;
}

element.style {
    margin-bottom: 15px;
}

.process-guide-box {
    border: 1px solid #dedede;

}

div {
    display: block;
}

body {
    font-family: "Nanum Gothic", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", AppleGothic, 돋움, Dotum, Helvetica, Arial, sans-serif;
    font-size: 14px;
    line-height: 1.42857;
    color: rgb(85, 85, 85);
    background-color: rgb(243, 244, 247);
    height: 100%;
    margin: 0px;
}


.process-guide-box .process-guide-up {
    margin-top: 16px;
    margin-bottom: 15px;
}

.process-guide-box .process-guide-up .process-guide-up-title {
    margin-bottom: 7px;
    color: #333333;
    font-weight: bold;
    line-height: 1;
}



b, strong {
    font-weight: bold;
}


.process-guide-box .process-guide-header-border {
    width: 676px;
    margin: 0 auto;
    border-top: 1px dashed #dedede;
}

.process-guide-box .process-guide-body-content-box {
    margin-bottom: 11px;
    padding-left: 30px;
}

element.style {
    color: #2099bb;
}



.process-guide-box .process-guide-body-table {
    margin-left: 53px;
    margin-top: 12px;
    margin-bottom: 16px;
    line-height: 1;
}


table {
    max-width: 100%;
    background-color: transparent;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}

.process-guide-box .process-guide-body-content-box {
    margin-bottom: 11px;
    padding-left: 30px;
}

.process-guide-box .process-guide-body-content-box:before, .process-guide-box .process-guide-body-content-box:after {
    content: " ";
    display: table;
    line-height: 0;
}

.process-guide-box .process-guide-body-content-box .process-guide-body-image-container {
    float: left;
}

.process-guide-box .process-guide-body-content-box .process-guide-body-image-container img {
    margin-top: 0;
    margin-left: 0;
    margin-right: 15px;
}

.process-guide-box img {
    float: left;
    margin: 15px 20px 0 20px;
}

img {
    vertical-align: middle;
}

.process-guide-box .process-guide-body-content-box .process-guide-body-paragraph {
    float: left;
    color: #333333;
    line-height: 1;
}

element.style {
    margin-bottom: 0;
}

.process-guide-box .process-guide-body-content-box:after {
    clear: both;
}

.process-guide-box .process-guide-body-content-box:before, .process-guide-box .process-guide-body-content-box:after {
    content: " ";
    display: table;
    line-height: 0;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

.process-guide-box .process-guide-body-table tr {
    border-top: 2px solid #2099bb;
    border-bottom: 1px solid #e7e7e7;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.process-guide-box .process-guide-body-table tr td {
    padding: 14px 20px;
}

td, th {
    display: table-cell;
    vertical-align: inherit;
}

element.style {
    border-right: none;
}


.process-guide-box .process-guide-header-border {
    width: 676px;
    margin: 0 auto;
    border-top: 1px dashed #dedede;
}

.process-guide-box .process-guide-body-content-box .process-guide-body-paragraph .process-guide-body-paragraph-title {
    margin-bottom: 7px;
    font-weight: bold;
    font-size: 1.2em;
}

.process-guide-box .process-guide-body-content-box .process-guide-body-paragraph .process-guide-body-paragraph-content {
    margin-bottom: 0;
    line-height: 22px;
}

.process-guide-box .process-guide-body-content-box:after {
    clear: both;
}

.process-guide-box .process-guide-body-table tr .odd {
    font-weight: bold;
    background: #f5f5f5;
}

.strong_title{
   font-size: 1.2em;

}

#sleep{

   width: 750px;
   height: 600px;
   margin: 0 auto;
   margin-top: 25px;

}

#table_form{

width: 500px;
margin: 0 auto;

}

#table_title{

font-weight: bold;
font-size: 1.2em;

}

.filebox input[type="file"] { 
   position: absolute; 
   width: 1px; 
   height: 1px; 
   padding: 0; 
   margin: -1px;
   overflow: hidden; 
   clip:rect(0,0,0,0); border: 0;
    } 
    
.filebox label {
 display: inline-block; 
 padding: .5em .75em;
 color: white;
 font-size: 1.0em;
 font-weight: normal;
 line-height: normal; 
 vertical-align: middle; 
 background-color: #2099bb;
 cursor: pointer; 
 border: 1px solid #ebebeb; 
 border-bottom-color: #e2e2e2; 
 border-radius: .25em; 
 } 
 
 /* named upload */ 
 
 .filebox .upload-name { 
 display: inline-block; 
 padding: .5em .75em; /* label의 패딩값과 일치 */ 
 font-size: inherit; 
 font-family: inherit; 
 line-height: normal; 
 vertical-align: middle; 
 background-color: #f5f5f5; 
 border: 1px solid #ebebeb; 
 border-bottom-color: #e2e2e2; 
 border-radius: .25em; 
 -webkit-appearance: none; /* 네이티브 외형 감추기 */
 -moz-appearance: none;
  appearance: none;

}

.fileBTN:HOVER {
   
   cursor: pointer;

}

#submitBTN{

   width: 100px;
   height: 40px;
    background-color: #446eab;
    color: #fff;
    margin: 0 auto;
    margin-top: 30px;
   border-radius: .25em; 
   text-align: center;
   font-weight: bold;
   font-size: 1.1em;
   line-height: 35px;
   
}
#submitBTN:HOVER {
   cursor: pointer;
}

#cancelBTN{

   width: 200px;
   height: 35px;
    background-color: #446eab;
    color: #fff;
   float: right;
    margin-top: 20px;
   border-radius: .25em; 
   text-align: center;
   font-weight: bold;
   font-size: 1.1em;
   line-height: 30px;
   
}
#cancelBTN:HOVER {
   cursor: pointer;
}


#t1{ 

   font-size: x-large;
   margin-top: 20px;
   margin-left: 30px;
   margin-bottom: 10px;
   font-weight: bolder;
   color: rgb(85, 85, 85);
   
}

#t2{
   font-size: medium;
   margin-left: 30px;
   font-weight: normal;
   color: #999;

}


.wrap{

   width: 750px;
   height: 220px;
   border: 1px solid #dedede;
   margin-left: 25px;
   margin-top: 25px;

}

.img{
   
   width: 250px;
   height: 180px;
   float: left;
   margin-top: 20px;
   margin-left: 20px;
}

.naeyong{

   width: 400px;
   color: rgb(85, 85, 85);
   margin: 0 auto;
   float: left;
   margin-top: 40px;
   margin-left: 30px;

}

#auth_ing1{

   font-size: 1.5em;
   font-weight: bold;

}

#auth_ing2{

   font-size: 1.1em;
   margin-top: 10px;
}

#auth_ing3{

   font-size: 1.1em;
   margin-top: 10px;
   font-weight: bold;
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
#a{
   background-color: #446eab;
   color: white;
}

</style>
<script type="text/javascript">

$(document).ready(function(){ 
   
   var fileTarget = $('.filebox .upload-hidden'); 
   
   fileTarget.on('change', function(){
      // 값이 변경되면
      
      if(window.FileReader){ // modern browser 
         var filename = $(this)[0].files[0].name; 
      }else { // old IE 
         var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
      } // 추출한 파일명 삽입
         $(this).siblings('.upload-name').val(filename); }); 

   $('#submitBTN').click(function() {
      
      if(confirm("제출 하시겠습니까?")){
         $('#frm').submit();
      }else{
         
      }
      
      
   });
   
   $('#cancelBTN').click(function() {
      
      var sessionEmail = '${member.email}';
      
      if(confirm("접수를 취소하시겠습니까?")){
         location.href="./memberCheckCancel?email="+sessionEmail;
      }else{
         
      }
      
      
   });
   
}); 



</script>
</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

<section class="main_section">
      <section class="page_wrap">
         <c:import url="/WEB-INF/views/temp/personaldatasidbar.jsp"></c:import>
         
         <article class="right">
            <div class="title">
                  <p id="t1">신원인증</p>
                  <p id="t2">안전한 프로젝트 계약을 위해 신분증(사업자등록증)을 통한 신원 확인이 필요합니다.</p>
            </div>
         
<c:if test="${member.authenticState =='0'}">

<div class="contents_0">

<div id="sleep">
   
   <div class="process-guide-box" style="margin-bottom: 15px;">
   
      <img
         src="${pageContext.servletContext.contextPath}/resources/img/checkMember/process-guide-success.png"
         style="margin-right: 15px;" />
      <div class="process-guide-up">
         <p class="process-guide-up-title">
            <strong class="strong_title">[ 인증 서류 관리 가이드 ]</strong>
         </p>
         <p class="process-guide-up-content">
            제출한 인증 서류는 <strong style="color: #2099bb"> <a
               href="/privacy/">개인정보 처리방침</a></strong>에 의해 관리됩니다.
         </p>
      </div>

      <div class="process-guide-header-border"></div>
      <div class="process-guide-body-content-box" style="margin-top: 15px;">
         <div class="process-guide-body-image-container">
            <img src="${pageContext.servletContext.contextPath}/resources/img/checkMember/identity_guide_one.png" />
         </div>
         <div class="process-guide-body-paragraph" style="margin-bottom: 0;">
            <p class="process-guide-body-paragraph-title">인증 서류 제출</p>
            <p class="process-guide-body-paragraph-content">
               프로젝트의 계약을 위해, <strong>인증 서류 제출이 꼭 필요합니다.</strong><br /> 신원인증 서류는
               계약서 작성 시에 이용됩니다.
            </p>
         </div>
      </div>
      <table class="process-guide-body-table">
         <tbody>
            <tr>
               <td class="odd">사업자</td>
               <td class="even">사업자 등록증</td>
               <td class="odd">개인 , 팀</td>
               <td class="even" style="border-right: none;">주민등록증, 운전면허증</td>
            </tr>
         </tbody>
      </table>
      <div class="process-guide-body-content-box">
         <div class="process-guide-body-image-container">
            <img src="${pageContext.servletContext.contextPath}/resources/img/checkMember/identity_guide_two.png" />
         </div>
         <div class="process-guide-body-paragraph">
            <p class="process-guide-body-paragraph-title">신원 인증 처리 중</p>
            <p class="process-guide-body-paragraph-content">
               신원 인증 처리에는 <strong>최대 24시간이 소요</strong>됩니다.<br /> 인증 서류에 문제가 있을
               경우에는 <strong>플루 팀에서 가입하신 이메일로 연락</strong>을 드립니다.
            </p>
         </div>
      </div>
      <div class="process-guide-body-content-box">
         <div class="process-guide-body-image-container">
            <img src="${pageContext.servletContext.contextPath}/resources/img/checkMember/identity_guide_three.png" />
         </div>
         <div class="process-guide-body-paragraph">
            <p class="process-guide-body-paragraph-title">신원 인증 처리 완료</p>
            <p class="process-guide-body-paragraph-content">
               신원 인증 서류를 변경하실 경우에는 고객센터로 전화를 주시면 신속하게 도와드립니다.<br /> 고객센터: (02)
               6925-4849
            </p>
         </div>
      </div>
   
      
   </div>
   
<form action="./memberCheckInsert" method="post" enctype="multipart/form-data" id="frm">
   <input type="hidden" name="email" value="${member.email}">
   <input type="hidden" name="name" value="${member.name}">   
<div id="table_form">
   <table>
      <tr>
         <td id="table_title">인증 서류 이미지:</td>
      <td>
      <div class="filebox">
         <input class="upload-name" value="제출된 '이미지가'가 없습니다." disabled="disabled" style="width: 200px; margin-left: 10px;">
         <label for="ex_filename">+ 이미지 등록</label> 
         <input type="file" name="file1" id="ex_filename" class="upload-hidden">
      </div>
      </td>
      </tr>
   </table>
</div>   
   <div id="submitBTN">제출하기</div>
</form>
   
</div>
</div>
</c:if>

<c:if test="${member.authenticState == '1'}">
   <div class="contents_1">
      <div class="wrap">
         <div class="img">
            <img alt="" src="../resources/img/checkMember/auth.jpg" style="width: 100%; height: 100%;">   
         </div>
         <div class="naeyong">
            <p id="auth_ing1">고객님의 신원을 확인하고 있습니다.</p>
            <p id="auth_ing2">최대한 빠른 일처리로 고객의 편의만을 생각하겠습니다.</p>
            <div id="cancelBTN">인증요청 취소하기</div>
         </div>   
      </div>
   </div>
</c:if>

<c:if test="${member.authenticState == '2'}">
   <div class="contents_2">
      <div class="wrap">
         <div class="img">
            <img alt="" src="../resources/img/checkMember/auth_complete.png" style="width: 100%; height: 100%;">   
         </div>
         <div class="naeyong">
            <p id="auth_ing1">고객님의 신원이 확인되었습니다.</p>
            <p id="auth_ing2">신원 인증 서류를 변경하실 경우에는 고객센터로  <br/>전화를 주시면 신속하게 도와드리겠습니다. </p>
            <p id="auth_ing3">고객센터: (02)6925-4849</p>
         </div>   
      </div>
   </div>
</c:if>


</article>
</section>
</section>
   <c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>