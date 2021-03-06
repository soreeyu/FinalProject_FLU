<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<c:import url="/WEB-INF/views/temp/bootstrap.jsp"/>
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smart",
        sSkinURI: "../resources/SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    



    $("#submitBTN").click(function() {
       alert("btn");
       
        
        alert("vvv");
       if(document.frm.detailCategory.value=="카테고리를 선택하세요"){
          alert("옵션 선택좀");
       } else if(document.frm.name.value==""){
          alert("제목을 입력하세요");
       }else if(document.frm.period.value==""){
          alert("기간을 입력하세요");
       }else if(document.frm.budget.value==""){
          alert("예상금액을 입력하세요");
       }else if(document.frm.planState.value==""){
          alert("기획상태를 입력하세요");
       }else if(document.frm.fileName.value==""){
          alert("File을 선택해주세요");
       }else if(document.frm.finishDate.value==""){
          alert("마감일을 선택해주세요");
       }else if(document.frm.addr_main.value==""){
          alert("주소를 입력해주세요");
       }else if(document.frm.startDate.value==""){
          alert("시작일을 선택해주세요");
       }else if(document.frm.exp.value==""){
          alert("매니징 경험을 선택해주세요");
       }else if(document.frm.quick.value==""){
          alert("급구 여부를 선택해주세요");
       } else if(document.frm.finishDate.value!=""){
          var finishDate = $("#finishDate").val();
           alert("finishDate="+finishDate); 
           var finish = new Date(finishDate);
           var today = new Date();
           alert("today="+today);
           var left = finish.getTime()-today.getTime();
           alert(left);
           var leftDate = Math.ceil(left/(24*60*60*1000));
           alert("leftDate="+leftDate);
           if(leftDate<7){
              alert("마감일은 최소 1주일입니다.");          
           }else{
              alert("마감일 괜춘");
              if(document.frm.startDate.value!=""){
                 var startDate = $("#startDate").val();
                 alert("startDate="+startDate);
                 var start = new Date(startDate);
                 alert("today="+today);
                 var lef = start.getTime()-finish.getTime();
                 alert(lef);
                 var lefDate = Math.ceil(lef/(24*60*60*1000));
                 alert("시작일-마감일="+lefDate);
                 if(lefDate<7){
                    alert("시작일은 마감일 이후 최소 1주일입니다.");
                 }else{
                    alert("시작일 적당");
                    editor_object.getById["smart"].exec("UPDATE_CONTENTS_FIELD", []);
                    alert("editor먹엇나");
                    document.frm.submit();
                 }
              }
           }

       }
    });
 
})
</script>
<style type="text/css">

*{
font-family: -webkit-body;
}
.main_section{
   min-width: 1160px;
   width: 1160px;
   height: 2700px;
   margin: 0 auto;
   margin-top: 30px;
}
.project_header{
   width: 1100px;
   padding: 30px;
   height: 60px;
   margin-bottom: 20px;
   border: 1px solid #e6e6e6;
   margin-bottom: 30px;
   background-color: white;
}
#header_ttt{
   font-size: x-large;
   font-weight: bolder;
   margin-bottom: 10px;
}
#header_tt{
   font-size: small;
   font-weight: lighter;
}
.contents{
   width: 1260;
   height: 2700px;
   border: 1px solid #e6e6e6;
   background-color: white;
}
.contents_main{
   width: 700px;
   height: 100%;
   display: block;
   float: left;
   padding: 30px;
}
.contents_sub{
   width: 350px;
   height: 100%;
   display: block;
   background-color: red;
   float: right;
}
.main-wrapper{
   display: block;
   background-color: blue;
   float: left;
   margin-right: 20px;
}
.sub-wrapper{
   display:block;
   background-color: yellow;
   float: left;
}

.cate-select{
   /* background: #F9F9F9 url("/static/libs/img/jquery.fs.selecter-arrow.png?cf737c1eb5b0") no-repeat right center; */
   width: 250px;
   height: 30px;
}
span{
   color: #f48023;
    font-weight: bold
}
input{
   border: 1px solid #e6e6e6;
}
.control-wrapper{
   width: 100%;
   height: 55px;
}
#detail{
   font-size: small;
   color: black;
   margin-top: 5px;
   display: block;
}

label{
   width: 160px;
   height: 100%;
   text-align: right;
   display: block;
   float: left;
   margin-right: 5px;
}
.category-wrapper{
   width: 530px;
   display: block;
   float: left;
   height: 100%;
}
.plan-wrapper{
   width: 100%;
   height: 150px;
}
.plan-radio{
   height: 130px;
   width: 160px;
   border: 1px dotted black;
   display: block;
   float: left;
   margin-right: 10px;
   font-size: 12px;
   font-weight: lighter;
   color: #999;
   text-align: center;
}
#plan-radio1{
   background-image: url("${pageContext.request.contextPath}/resources/img/project/idea.png");
}
#plan-radio2{
   background-image: url("${pageContext.request.contextPath}/resources/img/project/simple.png");
}
#plan-radio3{
   background-image: url("${pageContext.request.contextPath}/resources/img/project/detail.png");
}

.radio-text{
    margin-top: 90px;
    padding: 0px;
    width: 160px;
    line-height: 34px;
}
.control-wrapper-skill{
   width: 100%;
   height: 270px;
}
.skill-wrapper{
   width: 100%;
   height: 270px;
   
}
.skill-li{
   width: 140px;
   display: inline;
   float: left;
   line-height: 30px;
   margin-right: 30px;
   font-weight: bold;
   font-size: medium;
}
.long-text{
   font-size: small;
}
.btn{
   margin: 0 auto;
   text-align: ce
}
.progress-bar{
   height: 1em !important;
    margin-bottom: 8px;
    border: none;
    border-bottom-right-radius: 10px;
    border-bottom-left-radius: 10px;
    border-top-right-radius: 10px;
    border-top-left-radius: 10px;
    /* background: #446eab url(/static/libs/css/images/ui-bg_highlight-soft_75_cccccc_1x100.png) 50% 50% repeat-x; */
}
.progress-bar-in{
   margin-left: -1px !important;
    margin: 0 !important;
    height: 100% !important;
    /* border: none; */
    /* background: #dedede url(/static/libs/css/images/ui-bg_flat_75_ffffff_40x100.png) 50% 50% repeat-x; */
}
.project-add-helper-bottom{
   float: right;
}
.project-add-info-box{
   background-color: yellow;
   margin-top: 20px;
}
.info-data-img{
   margin-top: 20px;
   width: 40px;
   height: 40px;
/*    float: left; */
}

.project-info-text{
   margin-top: 20px;
    margin-left: 7px;
    display: block;
    float: right;
    white-space: normal;
    word-break: break-all;
    line-height: 14px;
    width: 250px;
    color: #666;
    font-size: 12px;
}

</style>


</head>


<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
<section class="main_section">

   
   
   
   <div class="project_header">
      <div class="header_text">
         <p id="header_ttt">프로젝트 정보 등록</p>
         <p id="header_tt">상세하게 작성해주실수록 더 적합한 파트너스를 만날 수 있습니다.</p>
      </div>
   </div>

      <div class="contents">
         <section class="contents_main">
            <c:if test="${type eq 'insert'}">
               <form action="projectInsert" method="post" id="frm" name="frm" enctype="multipart/form-data">
            </c:if>
            
            <c:if test="${type eq 'update'}">
               <form action="projectUpdate" method="post" id="frm" name="frm" enctype="multipart/form-data">
                  <input type="hidden" name="projectNum" value="${dto.projectNum}">
            </c:if>
            
            
            <!-- state는 프로젝트 등록시 검수중(check)으로 넘어가므로 hidden으로 값을 넘겨줌 -->
                  <input type="hidden" name="state" value="check">
                  
            <!-- email은 로그인한 클라이언트 email 땡겨오기 -->
                  <input type="hidden" name="email" value="${member.email}">
            <!-- 프로젝트 등록시 del_Check=0으로 넣어주기 -->
                  <input type="hidden" name="del_Check" value="0">
      
            
            
            
            
            <div class="control-wrapper">
               <label><span>*</span>카테고리</label>
               <div class="category-wrapper">
                  <div class="main-wrapper">
                        <select class="cate-select" id="category" name="category" onChange="changeSelect(value)" required="required">
                            <option>카테고리</option>
                            <option class="main_opt category" value="개발">개발</option>
                            <option class="main_opt category" value="디자인">디자인</option>
                        </select>
                     </div>

               <div class="sub-wrapper" id="wrapper-program">
                  <div>
                  <select  class="cate-select"  name="detailCategory" required="required">
                      <option class="sub_opt">카테고리를 선택하세요</option>
                  </select>
                  </div>

               </div>
               <br>
               <span id="detail">프로젝트를 선택해 주세요</span>
               </div>
            </div>
            
            
            
            <div class="control-wrapper">
               <label><span>*</span>프로젝트 제목</label>
               <div class="category-wrapper">
                  <input id="name" type="text" name="name" style="width: 100%;" value="${dto.name }">
               <span id="detail">프로젝트 이름을 선택해 주세요</span>
               </div>
            </div>

            <div class="control-wrapper">
               <label><span>*</span>예상 기간</label>
               <div class="category-wrapper">
                  <input id="period" type="text" name="period" value="${dto.period }">일
                  <span id="detail">프로젝트를 진행할 기간을 일 단위로 입력해 주세요. (최대 3자리)</span>
               </div>
            </div>

            <div class="control-wrapper">
               <label><span>*</span>지출 가능 예산</label>
               <div class="category-wrapper">
                  <input id="budget" type="number" name="budget" value="${dto.budget }">원
                  <span id="detail">지출 가능한 예산을 입력해 주세요. ( 부가세 별도, 예 : 1,000,000)</span>
               </div>
            </div>

            <div class="plan-wrapper">
               <label><span>*</span>기획 상태</label>
               <div>
                  <div class="plan-radio">
                  <div id="plan-radio1">
                     <input class="radio-text planState" type="radio" name="planState" value="idea">
                     아이디어만 있습니다.                      
                  </div>
                  </div>
                  
                  <div class="plan-radio">
                  <div id="plan-radio2">
                     <input class="radio-text planState" type="radio" name="planState" value="simple">
                     필요한 내용들을 <br> 간단히 정리해두었습니다.                      
                  </div>
                  </div>
                  
                  <div class="plan-radio">
                  <div id="plan-radio3">
                     <input class="radio-text planState" type="radio" name="planState" value="detail">
                     상세한 기획문서가 <br> 존재합니다.                  
                  </div>
                  </div>

               </div>
            </div>

            <div>
               <label><span>*</span>프로젝트 내용</label>
               <div>
                  <textarea rows="30" cols="80" name="contents" id="smart">${dto.contents}</textarea>
               </div>
            </div>
            
            
            <div class="control-wrapper" style="height: 40px; margin-top: 10px;">
               <label><span>*</span>관심 기술</label>
            </div>
            <hr>
            <div class="control-wrapper-skill" style="height: 250px;">
               <label style="line-height: 250px;">개발 분야</label>
               <div class="skill-wrapper">
               <ul >
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value=".NET">.NET
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="ANDROID">ANDROID
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="ASP">ASP
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="ASP.NET">ASP.NET
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="C">C
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="C#">C#
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="C++">C++
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="CSS">CSS
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="DB">DB
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="IOS">IOS
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="JAVA">JAVA
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="JS">JS
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="JSP">JSP
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="LINUX">LINUX
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="PHP">PHP
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="PYTHON">PYTHON
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="QA">QA
                  </li>
                  <li class="skill-li"> 
                  <input type="checkbox" class="chk" name="skill" value="RUBY">RUBY
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="SERVER">SERVER
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="VB">VB
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="VC++">VC++
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="WINDOWS">WINDOWS
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="임베디드">임베디드
                  </li>
                  <li class="skill-li long-text">
                  <input type="checkbox" class="chk" name="skill" value="POWER BUILDER">POWER BUILDER
                  </li>
               </ul>
               </div>
               </div>
            <hr>
               
            <div class="control-wrapper-skill">
               <label style="line-height: 270px;">개발 전문분야</label>
               <div class="skill-wrapper">
               <ul>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="AJAX">AJAX
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="BI">BI
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="CODEIGNITER">CODEIGNITER
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="DDK">DDK
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="ERP">ERP
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="GIT">GIT
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="HADOOP">HADOOP
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="IBSHEET">IBSHEET
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="JEUS">JEUS
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="JSTL">JSTL
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="LabVIEW">LabVIEW
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="MFC">MFC
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="MSTR">MSTR
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="MVC">MVC
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="OPENGL">OPENGL
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="SCM">SCM
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="SOAP">SOAP
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="SWING">SWING
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="WDK">WDK
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="반응형웹">반응형웹
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="보안진단">보안진단
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="빅데이터">빅데이터
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="WordPress">WordPress
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="하이브리드앱">하이브리드앱
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="프레젠테이션">프레젠테이션
                  </li>
               </ul>
               </div>
            </div>
            <hr>
            
            <div class="control-wrapper-skill" style="height: 100px;">
               <label style="line-height: 100px;">기획 컨설턴트</label>
               <div class="skill-wrapper">
               <ul>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="Oracle컨설턴트">Oracle 컨설턴트
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="PM">PM
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="PMO">PMO
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="SAP컨설턴트">SAP컨설턴트
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="기획">기획
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="모바일기획">모바일기획
                  </li>
                  <li class="skill-li">
                  <input type="checkbox" class="chk" name="skill" value="웹기획">웹기획
                  </li>
                  </ul>
               </div>
               </div>
               <hr>

               <div class="control-wrapper-skill" style="height: 130px;">
                  <label style="line-height: 130px;">디자인/퍼블리싱</label>
                  <div class="skill-wrapper">
                  <ul>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="HTML5">HTML5
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="Graphic">그래픽디자인
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="MobileDesign">모바일
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="WebDesign">웹디자인
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="WebStandard">웹표준
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="PPT">파워포인트
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="Publishing">퍼블리싱
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="Photoshop">포토샵편집
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="Flash">플래쉬
                     </li>
                     <li class="skill-li">
                     <input type="checkbox" class="chk" name="skill" value="3D">3D
                     </li>
                     </ul>
                     </div>
                  </div>
                  <hr>


            <div class="control-wrapper" style="margin-top: 20px;">
               <label><span>*</span>기획 관련 파일</label>
               <div class="category-wrapper">
                  <input type="file" name="fileName" value="${dto.fileName }">
                  <span id="detail">프로젝트 등록시 참고문서가 될 수 있습니다.</span>
               </div>
            </div>


            <div class="control-wrapper">
               <label><span>*</span>모집 마감일자</label>
               <div class="category-wrapper">

                  <input type="date" name="finishDate" id="finishDate" value="${dto.finishDate }">
               </div>
            </div>

            <div class="control-wrapper">
               <label><span>*</span>사전 미팅</label>
               <div class="category-wrapper">
                  <select name="meetKind" required="required">
                     <option class="meetKind" value="오프라인">오프라인</option>
                     <option class="meetKind" value="온라인">온라인</option>
                  </select>
               </div>
            </div>

            <div class="control-wrapper">
               <label><span>*</span>클라이언트 위치</label>
               <div class="category-wrapper">
                  <input type="text" name="addr_num" id="sample6_postcode" placeholder="우편번호" value="${dto.addr_num}">
                  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                  <input type="text" name="addr_main" id="sample6_address" placeholder="주소" required="required" value="${dto.addr_main}">
                  <input type="text" name="addr_detail" id="sample6_address2" placeholder="상세주소" required="required" value="${dto.addr_detail}">
               </div>
            </div>

            <div class="control-wrapper">
               <label><span>*</span>프로젝트 <br> 예상 시작일</label>
               <div class="category-wrapper">

                  <input type="date" name="startDate" id="startDate" value="">

               </div>
            </div>

            <div class="control-wrapper">
               <label><span>*</span>프로젝트 <br>매니징 경험</label>
               <div class="category-wrapper">
                  <input class="exp" type="radio" name="exp" value="y">예 
                  <input class="exp" type="radio" name="exp" value="n">아니오
               </div>
            </div>

            

            <div class="control-wrapper">
               <label><span>*</span>급구 여부</label>
               <div class="category-wrapper">
                  <input class="quick" type="radio" name="quick" value="1">예 
                  <input class="quick" type="radio" name="quick" value="0">아니오
               </div>
            </div>


            
            <input type="button" class="btn btn-default" id="submitBTN" value="등록">
            </form>
            
            
         </section>
         <section class="contents_sub">
            
            <!-- 옆구리 CSS껴넣기 사진들 -->
         </section>
      </div>

   </section>
<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

<script type="text/javascript">



var type="${type}";
alert("type == "+type); 
alert("사용자email = ${member.email}");
var fdate = "${dto.finishDate}";
alert(fdate);
var finishDate = new Date(fdate);
var finishDay = finishDate.getDate();
var finishMonth = finishDate.getMonth()+1;
var finishYear = finishDate.getFullYear();
/* alert(finishDay);
alert(finishMonth);
alert(finishYear); */


if(type=='update'){

<<<<<<< HEAD
	/* 기술 Check해놓는거  */
	var dtoSkill='${dto.skill}';
	var skillSize = '${skillSize}';
	alert("skillSize="+skillSize);
	var skills = '${skills}';
	 skillSize = skillSize*1+1;

	  for(var i=1;i<skillSize;i++){
		var skil = dtoSkill.split(",");
		
		$(".chk").each(function() {
			if(skil[i-1]==$(this).val()){
				$(this).prop("checked", true);
			}
		});
		
	}  /* for문 끝 */
		
}
	if(type=='update'){
		
	var dtoState = '${dto.planState}';
	alert("dtoState="+dtoState);
	
	$(".planState").each(function() {
		if(dtoState == $(this).val()){
			
		$(this).prop("checked", true);
		}
	});
	
	var dtoMeet = '${dto.meetKind}';
	alert("dtoMeet="+dtoMeet);
	

	$(".meetKind").prop("selected", dtoMeet);
	/* check인가?... */
			
			
	var dtoExp = '${dto.exp}';
	alert("dtoExp="+dtoExp);
	
	$(".exp").each(function() {
		if(dtoExp==$(this).val()){
			$(this).prop("checked", true);
		}
	});
	
	var dtoQuick = '${dto.quick}';
	alert("dtoQuick="+dtoQuick);
	
	$(".quick").each(function() {
		if(dtoQuick==$(this).val()){
			$(this).prop("checked", true);
		}
	});

	var dtoStart = '${dto.startDate}';
	alert("dtoStart="+dtoStart);

	 var startYear = dtoStart.substr(2, 2);
	 var startMonth = dtoStart.substr(5,2);
	 var startDay = dtoStart.substr(8,2);

	 
	 $("#startDate").val('20'+startYear+"-"+startMonth+"-"+startDay);
	 
	 
	 var dtoFinish = '${dto.finishDate}';
		alert("dtoFinish="+dtoFinish);

		 var finishYear = dtoFinish.substr(2, 2);
		 var finishMonth = dtoFinish.substr(5,2);
		 var finishDay = dtoFinish.substr(8,2);
		 alert(startDay);
		 alert(startMonth);
		 alert(startYear);	 
		 
		 $("#finishDate").val('20'+finishYear+"-"+finishMonth+"-"+finishDay);
	 
	  	 

	  else if(document.frm.fileName.value==""){
		alert("File을 선택해주세요");
	}else if(document.frm.finishDate.value==""){
		alert("마감일을 선택해주세요");
	}else if(document.frm.addr_main.value==""){
		alert("주소를 입력해주세요");
	}else if(document.frm.startDate.value==""){
		alert("시작일을 선택해주세요");
	}else if(document.frm.exp.value==""){
		alert("매니징 경험을 선택해주세요");
	}else if(document.frm.quick.value==""){
		alert("급구 여부를 선택해주세요");
	} else if(document.frm.finishDate.value!=""){
		var finishDate = $("#finishDate").val();
		 alert("finishDate="+finishDate); 
		 var finish = new Date(finishDate);
		 var today = new Date();
		 alert("today="+today);
		 var left = finish.getTime()-today.getTime();
		 alert(left);
		 var leftDate = Math.ceil(left/(24*60*60*1000));
		 alert("leftDate="+leftDate);
		 if(leftDate<7){
			 alert("마감일은 최소 1주일입니다.");
			 
			 
		 }else{
			 alert("마감일 괜춘");
			 if(document.frm.startDate.value!=""){
				 var startDate = $("#startDate").val();
				 alert("startDate="+startDate);
				 var start = new Date(startDate);
				 alert("today="+today);
				 var lef = start.getTime()-finish.getTime();
				 alert(lef);
				 var lefDate = Math.ceil(lef/(24*60*60*1000));
				 alert("시작일-마감일="+lefDate);
				 if(lefDate<7){
					 alert("시작일은 마감일 이후 최소 1주일입니다.");
				 }else{
					 alert("시작일 적당");
					 document.frm.submit();
				 }
			 }
		 }


	}
	
	
	
=======
   /* 기술 Check해놓는거  */
   var dtoSkill='${dto.skill}';
   var skillSize = '${skillSize}';
   alert("skillSize="+skillSize);
   var skills = '${skills}';
    skillSize = skillSize*1+1;

     for(var i=1;i<skillSize;i++){
      var skil = dtoSkill.split(",");
      
      $(".chk").each(function() {
         if(skil[i-1]==$(this).val()){
            $(this).prop("checked", true);
         }
      });
      
   }  /* for문 끝 */
      
}
   if(type=='update'){
      
   var dtoState = '${dto.planState}';
   alert("dtoState="+dtoState);
   
   $(".planState").each(function() {
      if(dtoState == $(this).val()){
         
      $(this).prop("checked", true);
      }
   });
   
   var dtoMeet = '${dto.meetKind}';
   alert("dtoMeet="+dtoMeet);
   
   $(".meetKind").prop("selected", dtoMeet);
   /* check인가?... */
         
         
   var dtoExp = '${dto.exp}';
   alert("dtoExp="+dtoExp);
   
   $(".exp").each(function() {
      if(dtoExp==$(this).val()){
         $(this).prop("checked", true);
      }
   });
   
   var dtoQuick = '${dto.quick}';
   alert("dtoQuick="+dtoQuick);
   
   $(".quick").each(function() {
      if(dtoQuick==$(this).val()){
         $(this).prop("checked", true);
      }
   });

   var dtoStart = '${dto.startDate}';
   alert("dtoStart="+dtoStart);

    var startYear = dtoStart.substr(2, 2);
    var startMonth = dtoStart.substr(5,2);
    var startDay = dtoStart.substr(8,2);

    
    $("#startDate").val('20'+startYear+"-"+startMonth+"-"+startDay);
    
    
    var dtoFinish = '${dto.finishDate}';
      alert("dtoFinish="+dtoFinish);

       var finishYear = dtoFinish.substr(2, 2);
       var finishMonth = dtoFinish.substr(5,2);
       var finishDay = dtoFinish.substr(8,2);
       alert(startDay);
       alert(startMonth);
       alert(startYear);    
       
       $("#finishDate").val('20'+finishYear+"-"+finishMonth+"-"+finishDay);
    
         
    
   }
   
   
   
>>>>>>> ParkJunHo3




/*  //전송버튼 클릭이벤트
 $("#savebutton").click(function(){
     //id가 smarteditor인 textarea에 에디터에서 대입
     editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
      
     // 이부분에 에디터 validation 검증
      
     //폼 submit
     $("#frm").submit();
 })

 */


/* 옵션 처리하는 부분 */

pArray = new Array("웹","애플리케이션", "워드프레스", "퍼블리싱", "일반소프트웨어", "쇼핑몰", "게임", "임베디드", "기타");
dArray = new Array("웹","애플리케이션","제품","프레젠테이션","인쇄물","쇼핑몰","로고","그래픽","영상","게임","기타"); 

function changeSelect(value) {
document.all.detailCategory.length=1;
 if(value == "개발") {
  for(i=0; i<pArray.length; i++) {
   option = new Option(pArray[i]);
   document.all.detailCategory.options[i+1] = option;
  }
 }
 if(value == "디자인") {
  for(i=0; i<dArray.length; i++) {
   option = new Option(dArray[i]);
   document.all.detailCategory.options[i+1] = option;
  }
 }
}




/* 주소 불러오는 부분 */
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}

</script>
</body>
</html>