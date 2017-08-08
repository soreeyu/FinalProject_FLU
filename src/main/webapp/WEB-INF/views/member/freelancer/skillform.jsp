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
.main_section {
	min-width: 1460px;
	width: 100%;
	min-height: 2050px;
	background-color: #f2f2f2;
}

.page_wrap {
	width: 1152px;
	margin: 0 auto;
}

.page {
	width: 1152px;
	display: inline-block;
	margin-top: 30px;
}

/******************************** 왼쪽 메뉴 *******************************/
.side {
	float: left;
	margin-left: 10px;
	margin-right: 10px;
	width: 250px;
}

.freelancer_name {
	background-color: white;
	padding: 15px;
	margin-bottom: 15px;
}

.freelancer_name>span:FIRST-CHILD {
	font-size: 16px;
	display: block;
	padding-bottom: 11px;
	border-bottom: 1px solid #dedede;
	font-weight: 700;
	margin-bottom: 9px;
	color: #454545;
}

.free_img_div {
	width: 220px;
	font-size: 17px;
	color: #333333;
	font-weight: bold;
	text-align: center;
}

.free_img_div img {
	width: 216px;
	height: 216px;
	border: 1px solid #dedede;
	border-radius: 10%;
}

.free_img_div span {
	margin-top: 20px;
}

.sidebar_menu ul {
	border: 1px solid #dedede;
	border-radius: 3px;
	padding: 4px 8px;
	background-color: white;
	margin-bottom: 10px;
}

.sidebar_menu ul li {
	height: 40px;
	padding: 4px 0;
}

.sidebar_menu ul li a {
	border-radius: 2px;
	display: block;
	padding: 10px 15px;
	font-size: 14px;
	color: #999;
	line-height: 1.4;
}
/******************************** 왼쪽 메뉴 *******************************/
.contents {
	float: left;
	margin-left: 10px;
	margin-right: 10px;
	width: 790px;
}

.contents_inner {
	padding: 15px 30px 30px 30px;
	background-color: #fff;
	border-radius: 3px;
}

.profile_title {
	border-bottom: 1px dashed #dedede;
	padding-bottom: 25px;
}

.profile_title>p:FIRST-CHILD>a {
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

.profile_title>p:FIRST-CHILD {
	margin-top: 20px;
}

.profile_title>p>span {
	font-size: 28px;
	font-weight: bold;
}

.profile_wrap {
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.profile_wrap>p:FIRST-CHILD {
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
}

#a {
	background-color: #66b3ff;
	color: white;
}

.control-wrapper {
	width: 100%;
	height: 55px;
}

.control-wrapper-skill {
	width: 100%;
	height: 270px;
}

.skill-wrapper {
	width: 100%;
	height: 270px;
}

.skill-li {
	width: 150px;
	display: inline;
	float: left;
	line-height: 30px;
	margin-right: 30px;
	font-weight: bold;
	font-size: medium;
}

#detail {
	font-size: small;
	color: black;
	margin-top: 5px;
	display: block;
}

.control-wrapper-skill>label {
	width: 160px;
	height: 100%;
	text-align: right;
	display: block;
	float: left;
	margin-right: 5px;
}

#skill_div {
	margin-top: 50px;
	width: 100%;
	text-align: left;
}

#skill_div input[type=text] {
	width: 300px;
	height: 20px;
	padding: 5px;
	font-size: 16px;
	font-weight: bold;
}

#skill_div select {
	width: 80%;
	height: 33px;
	padding: 5px;
}

.del {
	border: 1px solid #e6e6e6;
	border-radius: 3px;
	line-height: 33px;
	width: 33px;
	height: 33px;
	background-color: #dedede;
	display: inline-block;
	cursor: pointer;
}

tr {
	line-height: 40px;
}

th {
	font-size: 17px;
}

#ok {
	width: 70px;
	height: 30px;
	display: inline-block;
	background-color: #6d6d6d;
	line-height: 30px;
	text-align: center;
	float: right;
	margin-right: 20px;
	cursor: pointer;
}

#cencel {
	width: 70px;
	height: 30px;
	display: inline-block;
	background-color: #6d6d6d;
	line-height: 30px;
	text-align: center;
	float: right;
	margin-right: 20px;
	cursor: pointer;
}

.button_div {
	margin-top: 20px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<section class="main_section">
		<div class="page_wrap">
			<div class="page">
				<c:import url="/WEB-INF/views/temp/mypagesidebar.jsp"></c:import>

				<div class="contents">
					<div class="contents_inner">
						<section class="profile_title">
							<p>
								<span>ㅁㅁㅁ의 보유기술</span><a href="#" style="margin-top: -5px;">업데이트
									하기</a>
							</p>
						</section>
						<section class="profile_wrap">
							<p>
								<span>보유기술</span>
							</p>

							<div class="no_data_wrap">
								<div class="control-wrapper"
									style="height: 40px; margin-top: 10px;"></div>
								<hr>
								<div class="control-wrapper-skill" style="height: 250px;">
									<label style="line-height: 250px;">개발 분야</label>
									<div class="skill-wrapper">
										<ul>
											<li class="skill-li"><input id="0" type="checkbox"
												class="chk" name="skill" value="NET"><label for="0">NET</label>
											</li>
											<li class="skill-li"><input id="1" type="checkbox"
												class="chk" name="skill" value="ANDROID"><label
												for="1">ANDROID</label></li>
											<li class="skill-li"><input id="2" type="checkbox"
												class="chk" name="skill" value="ASP"><label for="2">ASP</label>
											</li>
											<li class="skill-li"><input id="3" type="checkbox"
												class="chk" name="skill" value="ASP.NET"><label
												for="3">ASP.NET</label></li>
											<li class="skill-li"><input id="4" type="checkbox"
												class="chk" name="skill" value="C"><label for="4">C</label>
											</li>
											<li class="skill-li"><input id="5" type="checkbox"
												class="chk" name="skill" value="C#"><label for="5">C#</label>
											</li>
											<li class="skill-li"><input id="6" type="checkbox"
												class="chk" name="skill" value="C++"><label for="6">C++</label>
											</li>
											<li class="skill-li"><input id="7" type="checkbox"
												class="chk" name="skill" value="CSS"><label for="7">CSS</label>
											</li>
											<li class="skill-li"><input id="8" type="checkbox"
												class="chk" name="skill" value="DB"><label for="8">DB</label>
											</li>
											<li class="skill-li"><input id="9" type="checkbox"
												class="chk" name="skill" value="IOS"><label for="9">IOS</label>
											</li>
											<li class="skill-li"><input id="10" type="checkbox"
												class="chk" name="skill" value="JAVA"><label
												for="10">JAVA</label></li>
											<li class="skill-li"><input id="11" type="checkbox"
												class="chk" name="skill" value="JS"><label for="11">JS</label>
											</li>
											<li class="skill-li"><input id="12" type="checkbox"
												class="chk" name="skill" value="JSP"><label for="12">JSP</label>
											</li>
											<li class="skill-li"><input id="13" type="checkbox"
												class="chk" name="skill" value="LINUX"><label
												for="13">LINUX</label></li>
											<li class="skill-li"><input id="14" type="checkbox"
												class="chk" name="skill" value="PHP"><label for="14">PHP</label>
											</li>
											<li class="skill-li"><input id="15" type="checkbox"
												class="chk" name="skill" value="PYTHON"><label
												for="15">PYTHON</label></li>
											<li class="skill-li"><input id="16" type="checkbox"
												class="chk" name="skill" value="QA"><label for="16">QA</label>
											</li>
											<li class="skill-li"><input id="17" type="checkbox"
												class="chk" name="skill" value="RUBY"><label
												for="17">RUBY</label></li>
											<li class="skill-li"><input id="18" type="checkbox"
												class="chk" name="skill" value="SERVER"><label
												for="18">SERVER</label></li>
											<li class="skill-li"><input id="19" type="checkbox"
												class="chk" name="skill" value="VB"><label for="19">VB</label>
											</li>
											<li class="skill-li"><input id="20" type="checkbox"
												class="chk" name="skill" value="VC++"><label
												for="20">VC++</label></li>
											<li class="skill-li"><input id="21" type="checkbox"
												class="chk" name="skill" value="WINDOWS"><label
												for="21">WINDOWS</label></li>
											<li class="skill-li"><input id="22" type="checkbox"
												class="chk" name="skill" value="임베디드"><label
												for="22">임베디드</label></li>
											<li class="skill-li long-text"><input id="23"
												type="checkbox" class="chk" name="skill"
												value="POWER BUILDER"><label for="23">POWER
													BUILDER</label></li>
										</ul>
									</div>
								</div>
								<hr>

								<div class="control-wrapper-skill">
									<label style="line-height: 270px;">개발 전문분야</label>
									<div class="skill-wrapper">
										<ul>
											<li class="skill-li"><input id="24" type="checkbox"
												class="chk" name="skill" value="AJAX"><label
												for="24">AJAX</label></li>
											<li class="skill-li"><input id="25" type="checkbox"
												class="chk" name="skill" value="BI"><label for="25">BI</label>
											</li>
											<li class="skill-li"><input id="26" type="checkbox"
												class="chk" name="skill" value="CODEIGNITER"><label
												for="26">CODEIGNITER</label></li>
											<li class="skill-li"><input id="27" type="checkbox"
												class="chk" name="skill" value="DDK"><label for="27">DDK</label>
											</li>
											<li class="skill-li"><input id="28" type="checkbox"
												class="chk" name="skill" value="ERP"><label for="28">ERP</label>
											</li>
											<li class="skill-li"><input id="29" type="checkbox"
												class="chk" name="skill" value="GIT"><label for="29">GIT</label>
											</li>
											<li class="skill-li"><input id="30" type="checkbox"
												class="chk" name="skill" value="HADOOP"><label
												for="30">HADOOP</label></li>
											<li class="skill-li"><input id="31" type="checkbox"
												class="chk" name="skill" value="IBSHEET"><label
												for="31">IBSHEET</label></li>
											<li class="skill-li"><input id="32" type="checkbox"
												class="chk" name="skill" value="JEUS"><label
												for="32">JEUS</label></li>
											<li class="skill-li"><input id="33" type="checkbox"
												class="chk" name="skill" value="JSTL"><label
												for="33">JSTL</label></li>
											<li class="skill-li"><input id="34" type="checkbox"
												class="chk" name="skill" value="LabVIEW"><label
												for="34">LabVIEW</label></li>
											<li class="skill-li"><input id="35" type="checkbox"
												class="chk" name="skill" value="MFC"><label for="35">MFC</label>
											</li>
											<li class="skill-li"><input id="36" type="checkbox"
												class="chk" name="skill" value="MSTR"><label
												for="36">MSTR</label></li>
											<li class="skill-li"><input id="37" type="checkbox"
												class="chk" name="skill" value="MVC"><label for="37">MVC</label>
											</li>
											<li class="skill-li"><input id="38" type="checkbox"
												class="chk" name="skill" value="OPENGL"><label
												for="38">OPENGL</label></li>
											<li class="skill-li"><input id="39" type="checkbox"
												class="chk" name="skill" value="SCM"><label for="39">SCM</label>
											</li>
											<li class="skill-li"><input id="40" type="checkbox"
												class="chk" name="skill" value="SOAP"><label
												for="40">SOAP</label></li>
											<li class="skill-li"><input id="41" type="checkbox"
												class="chk" name="skill" value="SWING"><label
												for="41">SWING</label></li>
											<li class="skill-li"><input id="42" type="checkbox"
												class="chk" name="skill" value="WDK"><label for="42">WDK</label>
											</li>
											<li class="skill-li"><input id="43" type="checkbox"
												class="chk" name="skill" value="반응형웹"><label
												for="43">반응형웹</label></li>
											<li class="skill-li"><input id="44" type="checkbox"
												class="chk" name="skill" value="보안진단"><label
												for="44">보안진단</label></li>
											<li class="skill-li"><input id="45" type="checkbox"
												class="chk" name="skill" value="빅데이터"><label
												for="45">빅데이터</label></li>
											<li class="skill-li"><input id="46" type="checkbox"
												class="chk" name="skill" value="WordPress"><label
												for="46">WordPress</label></li>
											<li class="skill-li"><input id="47" type="checkbox"
												class="chk" name="skill" value="HybridApp"><label
												for="47">하이브리드앱</label></li>
											<li class="skill-li"><input id="48" type="checkbox"
												class="chk" name="skill" value="Presentation"><label
												for="48">프레젠테이션</label></li>
										</ul>
									</div>
								</div>
								<hr>

								<div class="control-wrapper-skill" style="height: 100px;">
									<label style="line-height: 100px;">기획 컨설턴트</label>
									<div class="skill-wrapper">
										<ul>
											<li class="skill-li"><input id="49" type="checkbox"
												class="chk" name="skill" value="Oracle"><label
												for="49">Oracle 컨설턴트</label></li>
											<li class="skill-li"><input id="50" type="checkbox"
												class="chk" name="skill" value="PM"><label for="50">PM</label>
											</li>
											<li class="skill-li"><input id="51" type="checkbox"
												class="chk" name="skill" value="PMO"><label for="51">PMO</label>
											</li>
											<li class="skill-li"><input id="52" type="checkbox"
												class="chk" name="skill" value="SAP"><label for="52">SAP컨설턴트</label>
											</li>
											<li class="skill-li"><input id="53" type="checkbox"
												class="chk" name="skill" value="Planning"><label
												for="53">기획</label></li>
											<li class="skill-li"><input id="54" type="checkbox"
												class="chk" name="skill" value="MobilePlanning"><label
												for="54">모바일기획</label></li>
											<li class="skill-li"><input id="55" type="checkbox"
												class="chk" name="skill" value="WebPlanning"><label
												for="55">웹기획</label></li>
										</ul>
									</div>
								</div>
								<hr>

								<div class="control-wrapper-skill" style="height: 130px;">
									<label style="line-height: 130px;">디자인/퍼블리싱</label>
									<div class="skill-wrapper" style="height: 100%;">
										<ul>
											<li class="skill-li"><input id="56" type="checkbox"
												class="chk" name="skill" value="HTML5"><label
												for="56">HTML5</label></li>
											<li class="skill-li"><input id="57" type="checkbox"
												class="chk" name="skill" value="Graphic"><label
												for="57">그래픽디자인</label></li>
											<li class="skill-li"><input id="58" type="checkbox"
												class="chk" name="skill" value="MobileDesign"><label
												for="58">모바일</label></li>
											<li class="skill-li"><input id="59" type="checkbox"
												class="chk" name="skill" value="WebDesign"><label
												for="59">웹디자인</label></li>
											<li class="skill-li"><input id="60" type="checkbox"
												class="chk" name="skill" value="WebStandard"><label
												for="60">웹표준</label></li>
											<li class="skill-li"><input id="61" type="checkbox"
												class="chk" name="skill" value="PPT"><label for="61">파워포인트</label>
											</li>
											<li class="skill-li"><input id="62" type="checkbox"
												class="chk" name="skill" value="Publishing"><label
												for="62">퍼블리싱</label></li>
											<li class="skill-li"><input id="63" type="checkbox"
												class="chk" name="skill" value="Photoshop"><label
												for="63">포토샵편집</label></li>
											<li class="skill-li"><input id="64" type="checkbox"
												class="chk" name="skill" value="Flash"><label
												for="64">플래쉬</label></li>
											<li class="skill-li"><input id="65" type="checkbox"
												class="chk" name="skill" value="3D"><label for="65">3D</label>
											</li>
										</ul>
									</div>
									<hr>
								</div>
								<form id="form" action="${path }" method="post">
									<input type="hidden" name="email" value="${member.email }">
									<table id="skill_div">
										<colgroup>
											<col width="45%">
											<col width="18%">
											<col width="27%">
											<col width="*%">
										</colgroup>
										<tr>
											<th>종류</th>
											<th>숙련도</th>
											<th>경험</th>
											<th>도구</th>
										</tr>

									</table>
									<p class="p_label" style="color: red;"></p>
									<div class="button_div">
										<span id="ok">등록</span><span id="cencel">취소</span>
									</div>
								</form>

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
$(function() {
	
	
	
	
	$(".chk").change(function() {
		if($(this).is(":checked")){
			var skill = "<tr id='"+$(this).val()+"'><td><input type='text' name='kind' readonly='readonly'value='"+$(this).val()+"'></td>"
						+"<td><select class='level' name='slevel'><option value='0'>숙련도</option>"
						+"<option value='1'>초급</option>	<option value='2'>중급</option>"
						+"<option value='3'>고급</option>	<option value='4'>특급</option></select></td>"
						+"<td><select class='exp' name='exp'><option value='0'>경험</option><option value='1'>1년미만</option>"
						+"<option value='2'>1년이상 3년미만</option>	<option value='3'>3년이상 5년미만</option>"
						+"<option value='4'>5년이상 10년미만</option><option value='5'>10년이상</option></select></td>"
						+"<td><span title='"+$(this).val()+"' class='del'>삭제</span></td></tr>"
						
						
			$("#skill_div").append(skill);
		}else{
			var skill =$(this).val();
			
			$("#"+skill).remove();
		}
	});
	
	$("#skill_div").on("click",".del",function() {
		var skill = $(this).attr("title");
		$("#"+skill).remove();
		$(".chk").each(function() {
			if($(this).val() == skill){
				$(this).prop("checked", false);
			}
		});
	});
	
	$("#ok").click(function() {
		var ck1 = 0;
		var ck2 = 0;
		$(".level").each(function(){
			
			var skill1 = $(this).val();
			if(skill1 == 0){
				$(this).css("border-color", "red");
				ck1++;
			}else{
				$(this).css("border-color", "rgb(169, 169, 169)");
			}
		});
		
		$(".exp").each(function() {
			
			var skill2 = $(this).val();
			if(skill2 == 0){
				$(this).css("border-color", "red");
				ck2++;
			}else{
				$(this).css("border-color", "rgb(169,169,169)");
			}
		});
		
		
		if(ck1 > 0 || ck2 >0){
			$(".p_label").html("<i class='fa fa-exclamation-circle'></i>&nbsp;<label>필수항목 입니다.</label>");
		}else{
			$(".p_label").html("");
			var chk_length = $("input:checkbox[class='chk']:checked").length;
			if(chk_length == 0){
				var hidden = "<input type='hidden' name='kind' value='0'>"
							+"<input type='hidden' name='level' value='0'>"
							+"<input type='hidden' name='exp' value='0'>"
				$(".p_label").html(hidden);
			}
				$("#form").submit();
		}
		
	});
	
	
	$("#cencel").click(function() {
		location.href="skillView";
		
	});
	
	if(${data} == 0){
		$.ajax({
			url: "myskillList",
			type: "get",
			data:{},
			success:function(data){
				var listsplit = data.trim();
				listsplit = listsplit.split(",");
					
				
					var exp = "${exp}";
					var slevel = "${slevel}";
					
					exp = exp.split(",");
					slevel = slevel.split(",");
					alert(exp.length);
					var count =500;
				for(var i =1; i < listsplit.length; i++){
				  
					if(i-1 == exp.length-1){
						alert("여기들어옴?");
						exp[i-1] = exp[i-1].substr(1);
						slevel[i-1] = slevel[i-1].substr(1);
						exp[i-1] = exp[i-1].trim();
						exp[i-1] = exp[i-1].split("]", 1);
						slevel[i-1] = slevel[i-1].trim();
						slevel[i-1] = slevel[i-1].split("]", 1);
					}else{
						alert("여기임?");
						exp[i-1] = exp[i-1].substr(1);
						slevel[i-1] = slevel[i-1].substr(1);
					}
					
					if(i != listsplit.length-1){
						exp[i-1] = exp[i-1].trim();
						slevel[i-1] = slevel[i-1].trim();
					}
					
					$(".chk").each(function() {
						if(listsplit[i] == $(this).val()){
							$(this).prop("checked", true);
							
							
							var skill = "<tr id='"+$(this).val()+"'><td><input type='text' name='kind' readonly='readonly'value='"+$(this).val()+"'></td>"
							+"<td><select id='"+count+"' class='level' name='slevel'><option value='0'>숙련도</option>"
							+"<option value='1'>초급</option>	<option value='2'>중급</option>"
							+"<option value='3'>고급</option>	<option value='4'>특급</option></select></td>"
							+"<td><select id='"+$(this).val()+i+"' class='exp' name='exp'><option value='0'>경험</option><option value='1'>1년미만</option>"
							+"<option value='2'>1년이상 3년미만</option>	<option value='3'>3년이상 5년미만</option>"
							+"<option value='4'>5년이상 10년미만</option><option value='5'>10년이상</option></select></td>"
							+"<td><span title='"+$(this).val()+"' class='del'>삭제</span></td></tr>"
							
							
							$("#skill_div").append(skill);
							alert("경험"+exp[i-1]);
							$("#"+$(this).val()+i).val(exp[i-1]);
						}
					});
							$("#"+count).val(slevel[i-1]);
							
							count++;
				}
				
			}//success 끝
		});//ajax 끝
	}//if끝
	
});
	

</script>
</html>