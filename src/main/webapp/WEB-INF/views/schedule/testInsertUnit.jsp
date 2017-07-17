<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<c:import url="/WEB-INF/views/temp/bootstrap.jsp"></c:import>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/jui/jui.min.css"/>
<link href='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/SE2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/jui/jui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/lib/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/schedule/lib/main.css"/>
<link href='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src="${pageContext.request.contextPath}/resources/SE2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src='${pageContext.request.contextPath}/resources/schedule/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/schedule/lib/jquery-ui.custom.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/schedule/fullcalendar/fullcalendar.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/schedule/lib/niee-canvas-chart003.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/lib/ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/base.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/core.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/button.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/combo.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/dropdown.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/ui/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/uix/table.js"></script>
<script src="${pageContext.request.contextPath}/resources/schedule/js/uix/tree.js"></script>
 --%>
<script src="${pageContext.request.contextPath}/resources/schedule/myeon/test1.js" type="text/javascript" charset="utf-8"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>ScheduleMain</title>



</head>
<body>
<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

	<section class="main_section">

	
	<!-- 스케줄등록모달 -->
	<div id="writeModal" class="msgbox" style="display: block;">
		<div class="head">
			<span>등록 폼</span>
	    </div>
		<div class="body">
			<table>
				<tr>
					<td>
						<input class="input input-rect" id="title" name="title" style="width: 612px" maxlength="100" placeholder="제목"/>
					</td>
				</tr>
				<tr>
					<td>
						<div id="schedulePicker">
						<div style="float: left;">
							<input class="input input-rect" id="starttime" name="starttime" style="width: 192px" placeholder="시작일" readonly="readonly"/>
							<div id="spicker" class="datepicker">
							    <div class="head">
							        <div class="prev"></div>
							        <div class="title"></div>
							        <div class="next"></div>
							    </div>
							    <table class="body">
							        <tr>
							            <th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th>
							        </tr>
							    </table>
							</div>
						</div>
						<div style="float: left;margin-top: 100px;margin-left: 100px;">
							<a class="btn btn-gray btn-small"><i class="icon-chevron-right"></i></a>
						</div>
						<div style="float: right;">
						<input class="input input-rect" id="endtime" name="endtime" style="width: 192px" placeholder="종료일" readonly="readonly"/>
						<script data-jui="#spicker" data-tpl="dates" type="text/template">
    						<tr>
        						<! for(var i = 0; i < dates.length; i++) { !>
        						<td><!= dates[i] !></td>
        						<! } !>
    						</tr>
						</script>
						<div id="epicker" class="datepicker">
						    <div class="head">
						        <div class="prev"></div>
						        <div class="title"></div>
						        <div class="next"></div>
						    </div>
						    <table class="body">
						        <tr>
						            <th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th>
						        </tr>
						    </table>
						</div>
						<script data-jui="#epicker" data-tpl="dates" type="text/template">
    						<tr>
        						<! for(var i = 0; i < dates.length; i++) { !>
        						<td><!= dates[i] !></td>
        						<! } !>
    						</tr>
						</script>
						</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-spacing: 0px;border-collapse: 0px;border: 1px solid #BEBeBe;">
						<span id="schedulefileName"></span>
						<div id="scheduleFiles">
							<input type="file" name="schedulefile" id="schedulefile"><br>
							<a href="#" id="scheduleFileAddBtn" class="btn btn-gray btn-small">파일등록</a>(파일선택 후 등록해야 글 저장시 함께 등록 됩니다.)
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-spacing: 0px;border-collapse: 0px;height:25px;border: 1px solid #BEBeBe;">
						공유 여부 : <input type="checkbox" id="etcYn"><font color="red">(체크시 Etc 에 표시 되지 않습니다.)</font>
					</td>
				</tr>
				<tr>
					<td>
						<textarea class="input" id="contents" name="contents" style="width: 610px;height: 300px;" placeholder="내용"></textarea>
					</td>
				</tr>
			</table>
			<div style="text-align: center;">
				<a href="#" id="writeBtn" class="btn btn-gray btn-small">저장</a>
				<a href="#" id="writeClose" class="btn btn-gray btn-small">Close</a>
			</div>
		</div>
	</div>
	
	
	
	<!-- Schedule_View -->
		<div id="main_View" style="display: block;">
			<div class="group" >
				<a class="left btn btn-mini btn-gray-black" id="sview-refresh"><span>새로고침</span>&nbsp;<i class="icon-refresh"></i></a>
				(날짜의 빈공간을 클릭하면 스케줄을 등록 할 수 있습니다.)
			</div>
			<div id='schcalendar'></div>
		</div>
	
	
	
	
	 
	

	
	</section>
	
<script type="text/javascript">
function getContextPath(){
    var context = '${pageContext.request.contextPath}'
    return context;
}
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/js/intranet_JUI.js"></script>

<%-- 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/js/intranet_JUI.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/js/intranet_JQUERY.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/js/intranet_FUNCTION.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/schedule/js/intranet_DATE.js"></script>	

 --%>

<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>