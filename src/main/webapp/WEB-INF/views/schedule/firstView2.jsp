<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../temp/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
.main_section{
	min-width: 1460px;
	width: 100%;
	min-height: 1000px;
	background-color: #f2f2f2;
	position: relative;
}


#main_wrap{
	width: 1152px;
	height: auto;
	margin: 0 auto;
	background: gray;
}

/* sublayout 시작 */
/* .tw-sub-layout {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  flex-direction: column;
}
.tw-sub-layout__header {
  position: relative;
  flex: none;
  z-index: 2;
} */
.tw-sub-layout__content {
	width: 1152px;
}

/* sublayout 끝 */

/* 첫째행 */
.tw-project-analytics-page__container {
    margin: auto;
    padding: 20px 0 50px;
    width: 90%;
    height: 100%;
}


.tw-project-analytics-page__container > div {
    margin: 10px auto;
    padding: 30px 35px;
    border-radius: 2px;
    background: #fff;
}



.tw-project-analytics-status {
    display: flex;
}


.tw-project-analytics-status > div {
    flex-grow: 1;
    padding: 0 20px;
    border-width: 0 1px 0 0;
    border-style: solid;
    border-color: #d4d6db;
}

.tw-project-analytics-status > div:first-child {
    padding-left: 0;
}

.tw-project-analytics-status > div:last-child {
    padding-right: 0;
    border-right-width: 0;
}

.tw-project-analytics-status__head {
    color: #696f7a;
    font-size: 14px;
}

.tw-project-analytics-status__text {
    color: #464c59;
    font-weight: 600;
    font-size: 18px;
}

.tw-add-date-panel {
    display: flex;
    flex-direction: row;
}

.tw-project-analytics-status .add-button {
    margin-top: 5px;
    width: 28px;
    height: 28px;
    border-radius: 4px;
    background: #e6e8ec;
    text-align: center;
    font-size: 14px;
}

.tw-project-analytics-status .add-button .tw-icon-add {
    line-height: 27px;
}

.tw-icon-add:before {
    content: "\E602";
}

.tw-project-analytics-status__text.\--plain {
    margin-top: 5px;
}

/* 첫째행 끝  */


/* 설정들? */

.tw-project-analytics-page h3 {
    margin: 0;
    color: #464c59;
    font-weight: 600;
    line-height: initial;
    font-size: 18px;
}
 
.tw-project-analytics-overview{
	height: 113px;
	background: white;
}

.tw-project-analytics-overview__head {
    display: flex;
    margin-bottom: 35px;
    color: #696f7a;
}

.tw-project-analytics-overview__head-legends {
    display: flex;
    flex: 1;
    flex-wrap: wrap;
    justify-content: flex-end;
    font-size: 14px;
}

.tw-project-analytics-overview__head-legend {
    display: flex;
    align-self: flex-end;
    align-items: center;
}

.tw-project-analytics-overview__head-legend-text {
    margin: 0 10px;
}

.tw-project-analytics-overview__head-legend strong {
    font-weight: 600;
}

.tw-project-analytics-overview__head .tw-chart-legend__circle {
    display: inline-block;
    margin: 0 0 0 35px;
    border-width: 4px;
    border-style: solid;
}

.tw-project-analytics-overview__bars {
    display: flex;
    height: 40px;
    border-radius: 2px;
    background: #d4d6db;
}

/* 설정들?  */








/* projectAnalysticPage 시작 */
.tw-project-analytics-page {
  min-height: 100vh;
  width: 100%;
}
.tw-project-analytics-page h3 {
  margin: 0;
  color: #464c59;
  font-weight: 600;
  line-height: initial;
}
.tw-project-analytics-page__project-overview-options {
  margin-top: 5px;
}
.tw-project-analytics-page__container {
  margin: auto;
  padding: 20px 0 50px;
  width: 90%;
  height: 100%;
}
.tw-project-analytics-page__container > div {
  margin: 10px auto;
  padding: 30px 35px;
  border-radius: 2px;
  background: #fff;
}
.tw-project-analytics-page__self-centric {
  display: flex;
  background: none;
}

.tw-project-analytics-page__self-centric:empty {
  display: none;
}
.tw-project-analytics-page__self-centric > div:first-child {
  margin-left: 0;
}
.tw-project-analytics-page__self-centric > div:last-child {
  margin-right: 0;
}

/* projectAnalysticPage 끝 */





/* projectAnalysticoverview 시작 */
.tw-project-analytics-overview__head {
  display: flex;
  margin-bottom: 35px;
  color: #696f7a;
}
.tw-project-analytics-overview__head-legends {
  display: flex;
  flex: 1;
  flex-wrap: wrap;
  justify-content: flex-end;
  font-size: 14px;
}
.tw-project-analytics-overview__head-legend {
  display: flex;
  align-self: flex-end;
  align-items: center;
}
.tw-project-analytics-overview__head-legend-text {
  margin: 0 10px;
}
.tw-project-analytics-overview__head-legend strong {
  font-weight: 600;
}
.tw-project-analytics-overview__head .tw-chart-legend__circle {
  display: inline-block;
  margin: 0 0 0 35px;
  border-width: 4px;
  border-style: solid;
}
.tw-project-analytics-overview__bars {
  display: flex;
  height: 40px;
  border-radius: 2px;
  background: #d4d6db;
}
.tw-project-analytics-overview__bars > div:first-child {
  border-radius: 2px 0 0 2px;
}
.tw-project-analytics-overview__bars > div:last-child {
  border-radius: 0 2px 2px 0;
}

/* projectAnalysticoverview 끝 */


/* chart따오기 */
.tw-project-analytics-self-centric-chart {
  overflow: hidden;
  box-sizing: border-box;
  margin: 0 5px;
  padding: 15px 15px 0;
  width: 33%;
  border-radius: 2px;
  background: #fff;
}
.tw-project-analytics-self-centric-chart__header {
  text-align: center;
}
.tw-project-analytics-self-centric-chart__header__container {
  margin-top: 5px;
}
.tw-project-analytics-self-centric-chart .tw-chart-legend {
  width: 230px; /* 3개일땐230px 4개일땐.... 5개일땐 170px */
  margin-right: 0;
  padding: 0;
  cursor: default;
}
.tw-project-analytics-self-centric-chart .tw-chart-legend__name {
  min-width: initial;
  width: 120px;
}
.tw-project-analytics-self-centric-chart .tw-chart-legend__circle {
  flex-shrink: 0;
}
.tw-project-analytics-self-centric-chart .tw-chart-legend__data {
  width: 60px;
}

/* chart따오기 */

.tw-donut-chart {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    padding: 20px 10px 0;
}

.tw-donut-chart__chart-container {
    position: relative;
    display: block;
    flex-shrink: 0;
    width: 200px;
    height: 200px;
}

.tw-donut-chart__title-container {
    position: absolute;
    padding-top: 25%;
    width: 100%;
    text-align: center;
}

.tw-donut-chart__chart {
    z-index: 1;
}

.tw-donut-chart__count {
    color: #464c59;
    font-size: 0.2em;
}

.tw-donut-chart__unit {
    color: #696f7a;
    font-size: 0.08em;
}

.tw-donut-chart__legend {
    margin-top: 10px;
}

.tw-chart-legend {
    display: flex;
    margin-top: 10px;
    margin-right: 10px;
    margin-bottom: 15px;
    padding: 0 10px;
    border-radius: 4px;
    opacity: 1;
    cursor: pointer;
    transition: 0.2s all ease-out;
}

.tw-chart-legend__name.\--has-data {
    overflow: hidden;
    width: calc(100% - 40px);
    /* width: 150px; */
    text-overflow: ellipsis;
}

.tw-chart-legend__name {
    display: inline-block;
    align-items: center;
}

.tw-chart-legend__circle {
    display: inline-block;
    width: 5px;
    height: 5px;
    border-radius: 50%;
}

.tw-chart-legend__text {
    display: inline-block;
    margin-left: 5px;
    color: #696f7a;
    font-size: 14px;
}

.tw-chart-legend__data {
    color: #696f7a;
    font-size: 14px;
}

.tw-chart-legend__value {
    padding-right: 5px;
    font-weight: 600;
}






.tw-tasklist-stats-panel__header {
    display: flex;
    margin-bottom: 10px;
}

.tw-tasklist-stats-panel__spacer {
    flex: 1;
}

.tw-chart-legend.\--compact {
    display: inline-flex;
}

.tw-chart-legend.\--selected {
    background-color: #f3f4f5;
}

.tw-tasklist-stats-panel__filter {
    float: right;
}

.tw-chart-legend {
    display: flex;
    margin-top: 10px;
    margin-right: 10px;
    margin-bottom: 15px;
    padding: 0 10px;
    border-radius: 4px;
    opacity: 1;
    cursor: pointer;
    transition: 0.2s all ease-out;
    -webkit-tap-highlight-color: transparent;
}

.tw-chart-legend__name {
    display: inline-block;
    align-items: center;
}







.tw-bar-chart__chart-container {
    position: relative;
    width: 95%;
    height: 90%;
}

.tw-bar-chart__chart-background {
    position: absolute;
    box-sizing: border-box;
    padding: 10px;
    width: 100%;
    height: 98%;
}

.tw-bar-chart__tasklists {
    position: absolute;
    box-sizing: border-box;
    padding: 65px 10px 10px;
    width: 100%;
    height: 100%;
}

.tw-bar-chart__label-x {
    position: absolute;
    width: 150px;
    color: #8d919a;
    text-align: center;
    font-size: 12px;
}

.tw-bar-chart__label-x.\--bottom {
    bottom: 14px;
}

.tw-bar-chart__background-table {
    margin-left: 150px;
    width: calc(100% - 150px);
    height: 100%;
    color: #8d919a;
    font-weight: 600;
    font-size: 12px;
}


.tw-bar-chart__background-table tr:nth-child(1) td {
    vertical-align: top;
}

.tw-bar-chart__background-table td:nth-child(odd) {
    border-right: solid 1px #f3f4f5;
}

.tw-bar-chart__background-table td:nth-child(1) {
    border-left: solid 1px #e6e8ec;
}

.tw-bar-chart__background-table td {
    padding-right: 5px;
    width: 10%;
    border-right: solid 1px #e6e8ec;
    vertical-align: bottom;
    text-align: right;
}


.tw-bar-chart__tasklists {
    position: absolute;
    box-sizing: border-box;
    padding: 65px 10px 10px;
    width: 100%;
    height: 100%;
}

.tw-bar-chart__tasklist {
    display: inline-flex;
    margin-bottom: 20px;
    width: 100%;
    height: 25px;
}

.tw-bar-chart__tasklist-title {
    display: inline;
    overflow: hidden;
    padding: 5px 10px 0 0;
    width: 140px;
    color: #464c59;
    text-align: right;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size: 12px;
}

.tw-bar-chart__chart {
    display: flex;
    flex: 1;
    overflow: hidden;
    width: 100%;
    font-weight: 600;
    font-size: 12px;
    transition: 0.2s all ease-out;
}
.tw-bar-chart__subChart {
    color: #fff;
    text-align: right;
    transition: 0.2s all ease-out;
}
.tw-bar-chart__subChart-text {
    overflow: hidden;
    margin: 5px 10px 0 0;
}




</style>

<script type="text/javascript">
	$(function(){
		
		//part별 갯수로 설정 //1개 기준 150 + 55px //tw-bar-chart
		var partCount = 3;
		var graphHeight = 55;
		var fullGraphHeight = (150+(partCount*graphHeight))+"px";
		alert(fullGraphHeight);
		$(".tw-bar-chart").css("height",fullGraphHeight);
	});
</script>
</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

<section class="main_section">

	<div id= "main_wrap">
	
				<div class="tw-sub-layout__content">
					<section>
						<div class="tw-project-analytics-page">
							<div class="tw-project-analytics-page__container">
								<div>
									<div class="tw-project-analytics-status">
										<div>
											<div class="tw-project-analytics-status__head">시작일</div>
											<div class="tw-project-analytics-status__text">
												<section class="tw-add-date-panel">
													<div class="tw-add-date-panel__added-date with-close-icon">
														<!-- react-text: 437 -->
														7월 25일
														<!-- /react-text -->
														<div class="tw-add-date-panel__remove-date">
															<i class="tw-icon tw-icon-close --name_close"></i>
														</div>
													</div>
												</section>
											</div>
										</div>
										<div>
											<div class="tw-project-analytics-status__head">마감일</div>
											<div class="tw-project-analytics-status__text">
												<section class="tw-add-date-panel">
													<div class="tw-add-date-panel__added-date with-close-icon">
														<!-- react-text: 437 -->
														8월 25일
														<!-- /react-text -->
														<div class="tw-add-date-panel__remove-date">
															<i class="tw-icon tw-icon-close --name_close"></i>
														</div>
													</div>
												</section>
											</div>
										</div>
										<!-- <div>
											<div class="tw-project-analytics-status__head">완료일</div>
											<div class="tw-project-analytics-status__text">
												<section class="tw-add-date-panel">
													<div class="tw-add-date-panel__left">
														<div class="tw-add-date-panel__input">
															<div class="add-button">
																<i class="tw-icon tw-icon-add --name_add"></i>
															</div>
														</div>
													</div>
												</section>
											</div>
										</div> -->
										<div>
											<div class="tw-project-analytics-status__head">경과 시간</div>
											<div class="tw-project-analytics-status__text --plain">-</div>
										</div>
										<div>
											<div class="tw-project-analytics-status__head">남은 시간</div>
											<div class="tw-project-analytics-status__text --plain">32일</div>
										</div>
										<div>
											<div class="tw-project-analytics-status__head">목표 업무(총)</div>
											<div class="tw-project-analytics-status__text --plain">10개
												업무 </div>
										</div>
										<div>
											<div class="tw-project-analytics-status__head">완료 업무</div>
											<div class="tw-project-analytics-status__text --plain">3개
												업무 (60%)</div>
										</div>
									</div>
								</div>
								
								
								
								
								<div class="tw-project-analytics-overview">
									<div class="tw-project-analytics-overview__head">
										<h3>프로젝트 개요(업무상태별)</h3>
										<div class="tw-project-analytics-overview__head-legends">
											<div class="tw-project-analytics-overview__head-legend">
												<div class="tw-chart-legend__circle"
													style="border-color: rgb(39, 182, 186);"></div>
												<span
													class="tw-project-analytics-overview__head-legend-text">완료</span><strong>
													<!-- react-text: 468 -->60<!-- /react-text -->
													<!-- react-text: 469 -->%<!-- /react-text -->
												</strong>
												<!-- react-text: 470 -->
												&nbsp; (
												<!-- /react-text -->
												<!-- react-text: 471 -->
												3개 업무
												<!-- /react-text -->
												<!-- react-text: 472 -->
												)
												<!-- /react-text -->
											</div>
											<div class="tw-project-analytics-overview__head-legend">
												<div class="tw-chart-legend__circle"
													style="border-color: rgb(233, 94, 81);"></div>
												<span
													class="tw-project-analytics-overview__head-legend-text">마감일
													지남</span><strong>
													<!-- react-text: 477 -->20<!-- /react-text -->
													<!-- react-text: 478 -->%<!-- /react-text -->
												</strong>
												<!-- react-text: 479 -->
												&nbsp; (
												<!-- /react-text -->
												<!-- react-text: 480 -->
												1개 업무
												<!-- /react-text -->
												<!-- react-text: 481 -->
												)
												<!-- /react-text -->
											</div>
											<div class="tw-project-analytics-overview__head-legend">
												<div class="tw-chart-legend__circle"
													style="border-color: rgb(255, 176, 36);"></div>
												<span
													class="tw-project-analytics-overview__head-legend-text">할일</span><strong>
													<!-- react-text: 486 -->20<!-- /react-text -->
													<!-- react-text: 487 -->%<!-- /react-text -->
												</strong>
												<!-- react-text: 488 -->
												&nbsp; (
												<!-- /react-text -->
												<!-- react-text: 489 -->
												1개 업무
												<!-- /react-text -->
												<!-- react-text: 490 -->
												)
												<!-- /react-text -->
											</div>
											<div class="tw-project-analytics-overview__head-legend">
												<div class="tw-chart-legend__circle"
													style="border-color: rgb(176, 180, 187);"></div>
												<span
													class="tw-project-analytics-overview__head-legend-text">진행중
													</span><strong>
													<!-- react-text: 495 -->0<!-- /react-text -->
													<!-- react-text: 496 -->%<!-- /react-text -->
												</strong>
												<!-- react-text: 497 -->
												&nbsp; (
												<!-- /react-text -->
												<!-- react-text: 498 -->
												0개 업무
												<!-- /react-text -->
												<!-- react-text: 499 -->
												)
												<!-- /react-text -->
											</div>
										</div>
									</div>
									<div class="tw-project-analytics-overview__bars">
										<div style="background: rgb(39, 182, 186); width: 60%;"></div>
										<div style="background: rgb(233, 94, 81); width: 20%;"></div>
										<div style="background: rgb(255, 176, 36); width: 10%;"></div>
										<div style="background: rgb(176, 180, 187); width: 10%;"></div>
									</div>
								</div>
								
								
								
								
								
								
								
						<section class="tw-project-analytics-page__self-centric">
							<%-- <div class="tw-project-analytics-self-centric-chart">
									<div class="tw-project-analytics-self-centric-chart__header">
										<h3>사용자1</h3>
									</div>
									<div class="tw-donut-chart">
										<div class="tw-donut-chart__chart-container">
											<div class="tw-donut-chart__title-container"
												style="font-size: 200px;">
												<div class="tw-donut-chart__count">0</div>
												<div class="tw-donut-chart__unit">전체 업무</div>
											</div>
											<div id="tw-project-analytics-self-centric-chart__나에게-배정된-업무"
												class="tw-donut-chart__chart --hidden c3"
												style="max-height: 200px; position: relative;">
												<svg width="200" height="200" style="overflow: hidden;">
													<defs>
													<clipPath id="c3-1500894564437-clip">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-xaxis">
													<rect x="-31" y="-20" width="262" height="40"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-yaxis">
													<rect x="-29" y="-4" width="20" height="200"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-grid">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-subchart">
													<rect width="200"></rect></clipPath></defs>
													<g transform="translate(0.5,4.5)">
													<text class="c3-text c3-empty" text-anchor="middle"
														dominant-baseline="middle" x="100" y="88"
														style="opacity: 0;"></text>
													<rect class="c3-zoom-rect" width="200" height="176"
														style="opacity: 0;"></rect>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-regions" style="visibility: hidden;"></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-grid)"
														class="c3-grid" style="visibility: hidden;">
													<g class="c3-xgrid-focus">
													<line class="c3-xgrid-focus" x1="-10" x2="-10" y1="0"
														y2="176" style="visibility: hidden;"></line></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-chart">
													<g class="c3-event-rects c3-event-rects-single"
														style="fill-opacity: 0;">
													<rect class=" c3-event-rect c3-event-rect-0" x="0" y="0"
														width="200" height="176"></rect></g>
													<g class="c3-chart-bars">
													<g class="c3-chart-bar c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-bars c3-bars-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-bars c3-bars-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-bars c3-bars-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-bars c3-bars-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-lines">
													<g class="c3-chart-line c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-lines c3-lines-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-areas c3-areas-completed"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-circles c3-circles-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-lines c3-lines-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-areas c3-areas-overdue"></g>
													<g class=" c3-selected-circles c3-selected-circles-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-circles c3-circles-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-lines c3-lines-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-areas c3-areas-planned"></g>
													<g class=" c3-selected-circles c3-selected-circles-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-circles c3-circles-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-lines c3-lines-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-areas c3-areas-noDuedate"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-circles c3-circles-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-arcs" transform="translate(100,83)">
													<text class="c3-chart-arcs-title"
														style="text-anchor: middle; opacity: 1;"></text>
													<g class="c3-chart-arc c3-target c3-target-completed">
													<g
														class=" c3-shapes c3-shapes-completed c3-arcs c3-arcs-completed">
													<path class=" c3-shape c3-shape c3-arc c3-arc-completed"
														transform="scale(1,1)"
														style="fill: rgb(39, 182, 186); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-overdue">
													<g
														class=" c3-shapes c3-shapes-overdue c3-arcs c3-arcs-overdue">
													<path class=" c3-shape c3-shape c3-arc c3-arc-overdue"
														transform="scale(1,1)"
														style="fill: rgb(233, 94, 81); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-planned">
													<g
														class=" c3-shapes c3-shapes-planned c3-arcs c3-arcs-planned">
													<path class=" c3-shape c3-shape c3-arc c3-arc-planned"
														transform="scale(1,1)"
														style="fill: rgb(255, 176, 36); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-noDuedate">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-arcs c3-arcs-noDuedate">
													<path class=" c3-shape c3-shape c3-arc c3-arc-noDuedate"
														transform="scale(1,1)"
														style="fill: rgb(176, 180, 187); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g></g>
													<g class="c3-chart-texts">
													<g class="c3-chart-text c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-completed"></g></g>
													<g class="c3-chart-text c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-overdue"></g></g>
													<g class="c3-chart-text c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-planned"></g></g>
													<g class="c3-chart-text c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-noDuedate"></g></g></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-grid)"
														class="c3-grid c3-grid-lines">
													<g class="c3-xgrid-lines"></g>
													<g class="c3-ygrid-lines"></g></g>
													<g class="c3-axis c3-axis-x"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-xaxis)"
														transform="translate(0,176)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-x-label" transform="" x="200"
														dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text>
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g>
													<g class="c3-axis c3-axis-y"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-yaxis)"
														transform="translate(0,0)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-y-label" transform="rotate(-90)" x="0"
														dx="-0.5em" dy="1.2em" style="text-anchor: end;"></text>
													<path class="domain" d="M-6,1H0V176H-6"></path></g>
													<g class="c3-axis c3-axis-y2" transform="translate(200,0)"
														style="visibility: hidden; opacity: 0;">
													<text class="c3-axis-y2-label" transform="rotate(-90)"
														x="0" dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text>
													<g class="tick" transform="translate(0,176)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0</tspan></text></g>
													<g class="tick" transform="translate(0,159)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.1</tspan></text></g>
													<g class="tick" transform="translate(0,141)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.2</tspan></text></g>
													<g class="tick" transform="translate(0,124)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.3</tspan></text></g>
													<g class="tick" transform="translate(0,106)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.4</tspan></text></g>
													<g class="tick" transform="translate(0,89)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.5</tspan></text></g>
													<g class="tick" transform="translate(0,71)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.6</tspan></text></g>
													<g class="tick" transform="translate(0,54)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.7</tspan></text></g>
													<g class="tick" transform="translate(0,36)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.8</tspan></text></g>
													<g class="tick" transform="translate(0,19)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.9</tspan></text></g>
													<g class="tick" transform="translate(0,1)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">1</tspan></text></g>
													<path class="domain" d="M6,1H0V176H6"></path></g></g>
													<g transform="translate(0.5,200.5)"
														style="visibility: hidden;">
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-subchart)"
														class="c3-chart">
													<g class="c3-chart-bars"></g>
													<g class="c3-chart-lines"></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-brush"
														style="pointer-events: all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
													<rect class="background" x="0" width="200"
														style="visibility: hidden; cursor: crosshair;"></rect>
													<rect class="extent" x="0" width="0" style="cursor: move;"></rect>
													<g class="resize e" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g>
													<g class="resize w" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g></g>
													<g class="c3-axis-x" transform="translate(0,0)"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-xaxis)"
														style="visibility: hidden; opacity: 0;">
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g></g>
													<g transform="translate(0,180)">
													<g class=" c3-legend-item c3-legend-item-completed"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">completed</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(39, 182, 186); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-overdue"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">overdue</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(233, 94, 81); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-planned"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">planned</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(255, 176, 36); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-noDuedate"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">noDuedate</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(176, 180, 187); pointer-events: none;"></line></g></g>
													<text class="c3-title" x="100" y="0"></text></svg>
												<div class="c3-tooltip-container"
													style="position: absolute; pointer-events: none; display: none;"></div>
											</div>
											<div class="tw-donut-chart__empty"
												style="width: 160px; height: 160px;"></div>
										</div>
										<div class="tw-donut-chart__legend">
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(39, 182, 186);"></div>
													<div class="tw-chart-legend__text">완료</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 319 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(233, 94, 81);"></div>
													<div class="tw-chart-legend__text">마감일 지남</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 326 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(255, 176, 36);"></div>
													<div class="tw-chart-legend__text">할일</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 333 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(176, 180, 187);"></div>
													<div class="tw-chart-legend__text">진행중</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 340 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tw-project-analytics-self-centric-chart">
									<div class="tw-project-analytics-self-centric-chart__header">
										<h3>사용자1</h3>
									</div>
									<div class="tw-donut-chart">
										<div class="tw-donut-chart__chart-container">
											<div class="tw-donut-chart__title-container"
												style="font-size: 200px;">
												<div class="tw-donut-chart__count">0</div>
												<div class="tw-donut-chart__unit">전체 업무</div>
											</div>
											<div id="tw-project-analytics-self-centric-chart__나에게-배정된-업무"
												class="tw-donut-chart__chart --hidden c3"
												style="max-height: 200px; position: relative;">
												<svg width="200" height="200" style="overflow: hidden;">
													<defs>
													<clipPath id="c3-1500894564437-clip">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-xaxis">
													<rect x="-31" y="-20" width="262" height="40"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-yaxis">
													<rect x="-29" y="-4" width="20" height="200"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-grid">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-subchart">
													<rect width="200"></rect></clipPath></defs>
													<g transform="translate(0.5,4.5)">
													<text class="c3-text c3-empty" text-anchor="middle"
														dominant-baseline="middle" x="100" y="88"
														style="opacity: 0;"></text>
													<rect class="c3-zoom-rect" width="200" height="176"
														style="opacity: 0;"></rect>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-regions" style="visibility: hidden;"></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-grid)"
														class="c3-grid" style="visibility: hidden;">
													<g class="c3-xgrid-focus">
													<line class="c3-xgrid-focus" x1="-10" x2="-10" y1="0"
														y2="176" style="visibility: hidden;"></line></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-chart">
													<g class="c3-event-rects c3-event-rects-single"
														style="fill-opacity: 0;">
													<rect class=" c3-event-rect c3-event-rect-0" x="0" y="0"
														width="200" height="176"></rect></g>
													<g class="c3-chart-bars">
													<g class="c3-chart-bar c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-bars c3-bars-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-bars c3-bars-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-bars c3-bars-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-bars c3-bars-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-lines">
													<g class="c3-chart-line c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-lines c3-lines-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-areas c3-areas-completed"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-circles c3-circles-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-lines c3-lines-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-areas c3-areas-overdue"></g>
													<g class=" c3-selected-circles c3-selected-circles-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-circles c3-circles-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-lines c3-lines-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-areas c3-areas-planned"></g>
													<g class=" c3-selected-circles c3-selected-circles-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-circles c3-circles-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-lines c3-lines-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-areas c3-areas-noDuedate"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-circles c3-circles-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-arcs" transform="translate(100,83)">
													<text class="c3-chart-arcs-title"
														style="text-anchor: middle; opacity: 1;"></text>
													<g class="c3-chart-arc c3-target c3-target-completed">
													<g
														class=" c3-shapes c3-shapes-completed c3-arcs c3-arcs-completed">
													<path class=" c3-shape c3-shape c3-arc c3-arc-completed"
														transform="scale(1,1)"
														style="fill: rgb(39, 182, 186); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-overdue">
													<g
														class=" c3-shapes c3-shapes-overdue c3-arcs c3-arcs-overdue">
													<path class=" c3-shape c3-shape c3-arc c3-arc-overdue"
														transform="scale(1,1)"
														style="fill: rgb(233, 94, 81); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-planned">
													<g
														class=" c3-shapes c3-shapes-planned c3-arcs c3-arcs-planned">
													<path class=" c3-shape c3-shape c3-arc c3-arc-planned"
														transform="scale(1,1)"
														style="fill: rgb(255, 176, 36); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-noDuedate">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-arcs c3-arcs-noDuedate">
													<path class=" c3-shape c3-shape c3-arc c3-arc-noDuedate"
														transform="scale(1,1)"
														style="fill: rgb(176, 180, 187); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g></g>
													<g class="c3-chart-texts">
													<g class="c3-chart-text c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-completed"></g></g>
													<g class="c3-chart-text c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-overdue"></g></g>
													<g class="c3-chart-text c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-planned"></g></g>
													<g class="c3-chart-text c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-noDuedate"></g></g></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-grid)"
														class="c3-grid c3-grid-lines">
													<g class="c3-xgrid-lines"></g>
													<g class="c3-ygrid-lines"></g></g>
													<g class="c3-axis c3-axis-x"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-xaxis)"
														transform="translate(0,176)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-x-label" transform="" x="200"
														dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text>
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g>
													<g class="c3-axis c3-axis-y"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-yaxis)"
														transform="translate(0,0)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-y-label" transform="rotate(-90)" x="0"
														dx="-0.5em" dy="1.2em" style="text-anchor: end;"></text>
													<path class="domain" d="M-6,1H0V176H-6"></path></g>
													<g class="c3-axis c3-axis-y2" transform="translate(200,0)"
														style="visibility: hidden; opacity: 0;">
													<text class="c3-axis-y2-label" transform="rotate(-90)"
														x="0" dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text>
													<g class="tick" transform="translate(0,176)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0</tspan></text></g>
													<g class="tick" transform="translate(0,159)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.1</tspan></text></g>
													<g class="tick" transform="translate(0,141)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.2</tspan></text></g>
													<g class="tick" transform="translate(0,124)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.3</tspan></text></g>
													<g class="tick" transform="translate(0,106)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.4</tspan></text></g>
													<g class="tick" transform="translate(0,89)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.5</tspan></text></g>
													<g class="tick" transform="translate(0,71)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.6</tspan></text></g>
													<g class="tick" transform="translate(0,54)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.7</tspan></text></g>
													<g class="tick" transform="translate(0,36)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.8</tspan></text></g>
													<g class="tick" transform="translate(0,19)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.9</tspan></text></g>
													<g class="tick" transform="translate(0,1)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">1</tspan></text></g>
													<path class="domain" d="M6,1H0V176H6"></path></g></g>
													<g transform="translate(0.5,200.5)"
														style="visibility: hidden;">
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-subchart)"
														class="c3-chart">
													<g class="c3-chart-bars"></g>
													<g class="c3-chart-lines"></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-brush"
														style="pointer-events: all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
													<rect class="background" x="0" width="200"
														style="visibility: hidden; cursor: crosshair;"></rect>
													<rect class="extent" x="0" width="0" style="cursor: move;"></rect>
													<g class="resize e" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g>
													<g class="resize w" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g></g>
													<g class="c3-axis-x" transform="translate(0,0)"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-xaxis)"
														style="visibility: hidden; opacity: 0;">
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g></g>
													<g transform="translate(0,180)">
													<g class=" c3-legend-item c3-legend-item-completed"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">completed</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(39, 182, 186); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-overdue"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">overdue</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(233, 94, 81); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-planned"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">planned</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(255, 176, 36); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-noDuedate"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">noDuedate</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(176, 180, 187); pointer-events: none;"></line></g></g>
													<text class="c3-title" x="100" y="0"></text></svg>
												<div class="c3-tooltip-container"
													style="position: absolute; pointer-events: none; display: none;"></div>
											</div>
											<div class="tw-donut-chart__empty"
												style="width: 160px; height: 160px;"></div>
										</div>
										<div class="tw-donut-chart__legend">
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(39, 182, 186);"></div>
													<div class="tw-chart-legend__text">완료</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 319 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(233, 94, 81);"></div>
													<div class="tw-chart-legend__text">마감일 지남</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 326 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(255, 176, 36);"></div>
													<div class="tw-chart-legend__text">할일</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 333 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(176, 180, 187);"></div>
													<div class="tw-chart-legend__text">진행중</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 340 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tw-project-analytics-self-centric-chart">
									<div class="tw-project-analytics-self-centric-chart__header">
										<h3>사용자1</h3>
									</div>
									<div class="tw-donut-chart">
										<div class="tw-donut-chart__chart-container">
											<div class="tw-donut-chart__title-container"
												style="font-size: 200px;">
												<div class="tw-donut-chart__count">0</div>
												<div class="tw-donut-chart__unit">전체 업무</div>
											</div>
											<div id="tw-project-analytics-self-centric-chart__나에게-배정된-업무"
												class="tw-donut-chart__chart --hidden c3"
												style="max-height: 200px; position: relative;">
												<svg width="200" height="200" style="overflow: hidden;">
													<defs>
													<clipPath id="c3-1500894564437-clip">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-xaxis">
													<rect x="-31" y="-20" width="262" height="40"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-yaxis">
													<rect x="-29" y="-4" width="20" height="200"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-grid">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564437-clip-subchart">
													<rect width="200"></rect></clipPath></defs>
													<g transform="translate(0.5,4.5)">
													<text class="c3-text c3-empty" text-anchor="middle"
														dominant-baseline="middle" x="100" y="88"
														style="opacity: 0;"></text>
													<rect class="c3-zoom-rect" width="200" height="176"
														style="opacity: 0;"></rect>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-regions" style="visibility: hidden;"></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-grid)"
														class="c3-grid" style="visibility: hidden;">
													<g class="c3-xgrid-focus">
													<line class="c3-xgrid-focus" x1="-10" x2="-10" y1="0"
														y2="176" style="visibility: hidden;"></line></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-chart">
													<g class="c3-event-rects c3-event-rects-single"
														style="fill-opacity: 0;">
													<rect class=" c3-event-rect c3-event-rect-0" x="0" y="0"
														width="200" height="176"></rect></g>
													<g class="c3-chart-bars">
													<g class="c3-chart-bar c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-bars c3-bars-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-bars c3-bars-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-bars c3-bars-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-bars c3-bars-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-lines">
													<g class="c3-chart-line c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-lines c3-lines-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-areas c3-areas-completed"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-circles c3-circles-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-lines c3-lines-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-areas c3-areas-overdue"></g>
													<g class=" c3-selected-circles c3-selected-circles-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-circles c3-circles-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-lines c3-lines-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-areas c3-areas-planned"></g>
													<g class=" c3-selected-circles c3-selected-circles-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-circles c3-circles-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-lines c3-lines-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-areas c3-areas-noDuedate"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-circles c3-circles-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-arcs" transform="translate(100,83)">
													<text class="c3-chart-arcs-title"
														style="text-anchor: middle; opacity: 1;"></text>
													<g class="c3-chart-arc c3-target c3-target-completed">
													<g
														class=" c3-shapes c3-shapes-completed c3-arcs c3-arcs-completed">
													<path class=" c3-shape c3-shape c3-arc c3-arc-completed"
														transform="scale(1,1)"
														style="fill: rgb(39, 182, 186); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-overdue">
													<g
														class=" c3-shapes c3-shapes-overdue c3-arcs c3-arcs-overdue">
													<path class=" c3-shape c3-shape c3-arc c3-arc-overdue"
														transform="scale(1,1)"
														style="fill: rgb(233, 94, 81); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-planned">
													<g
														class=" c3-shapes c3-shapes-planned c3-arcs c3-arcs-planned">
													<path class=" c3-shape c3-shape c3-arc c3-arc-planned"
														transform="scale(1,1)"
														style="fill: rgb(255, 176, 36); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-noDuedate">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-arcs c3-arcs-noDuedate">
													<path class=" c3-shape c3-shape c3-arc c3-arc-noDuedate"
														transform="scale(1,1)"
														style="fill: rgb(176, 180, 187); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g></g>
													<g class="c3-chart-texts">
													<g class="c3-chart-text c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-completed"></g></g>
													<g class="c3-chart-text c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-overdue"></g></g>
													<g class="c3-chart-text c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-planned"></g></g>
													<g class="c3-chart-text c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-noDuedate"></g></g></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-grid)"
														class="c3-grid c3-grid-lines">
													<g class="c3-xgrid-lines"></g>
													<g class="c3-ygrid-lines"></g></g>
													<g class="c3-axis c3-axis-x"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-xaxis)"
														transform="translate(0,176)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-x-label" transform="" x="200"
														dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text>
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g>
													<g class="c3-axis c3-axis-y"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-yaxis)"
														transform="translate(0,0)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-y-label" transform="rotate(-90)" x="0"
														dx="-0.5em" dy="1.2em" style="text-anchor: end;"></text>
													<path class="domain" d="M-6,1H0V176H-6"></path></g>
													<g class="c3-axis c3-axis-y2" transform="translate(200,0)"
														style="visibility: hidden; opacity: 0;">
													<text class="c3-axis-y2-label" transform="rotate(-90)"
														x="0" dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text>
													<g class="tick" transform="translate(0,176)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0</tspan></text></g>
													<g class="tick" transform="translate(0,159)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.1</tspan></text></g>
													<g class="tick" transform="translate(0,141)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.2</tspan></text></g>
													<g class="tick" transform="translate(0,124)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.3</tspan></text></g>
													<g class="tick" transform="translate(0,106)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.4</tspan></text></g>
													<g class="tick" transform="translate(0,89)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.5</tspan></text></g>
													<g class="tick" transform="translate(0,71)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.6</tspan></text></g>
													<g class="tick" transform="translate(0,54)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.7</tspan></text></g>
													<g class="tick" transform="translate(0,36)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.8</tspan></text></g>
													<g class="tick" transform="translate(0,19)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.9</tspan></text></g>
													<g class="tick" transform="translate(0,1)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">1</tspan></text></g>
													<path class="domain" d="M6,1H0V176H6"></path></g></g>
													<g transform="translate(0.5,200.5)"
														style="visibility: hidden;">
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-subchart)"
														class="c3-chart">
													<g class="c3-chart-bars"></g>
													<g class="c3-chart-lines"></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip)"
														class="c3-brush"
														style="pointer-events: all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
													<rect class="background" x="0" width="200"
														style="visibility: hidden; cursor: crosshair;"></rect>
													<rect class="extent" x="0" width="0" style="cursor: move;"></rect>
													<g class="resize e" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g>
													<g class="resize w" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g></g>
													<g class="c3-axis-x" transform="translate(0,0)"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564437-clip-xaxis)"
														style="visibility: hidden; opacity: 0;">
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g></g>
													<g transform="translate(0,180)">
													<g class=" c3-legend-item c3-legend-item-completed"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">completed</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(39, 182, 186); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-overdue"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">overdue</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(233, 94, 81); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-planned"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">planned</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(255, 176, 36); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-noDuedate"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">noDuedate</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(176, 180, 187); pointer-events: none;"></line></g></g>
													<text class="c3-title" x="100" y="0"></text></svg>
												<div class="c3-tooltip-container"
													style="position: absolute; pointer-events: none; display: none;"></div>
											</div>
											<div class="tw-donut-chart__empty"
												style="width: 160px; height: 160px;"></div>
										</div>
										<div class="tw-donut-chart__legend">
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(39, 182, 186);"></div>
													<div class="tw-chart-legend__text">완료</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 319 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(233, 94, 81);"></div>
													<div class="tw-chart-legend__text">마감일 지남</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 326 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(255, 176, 36);"></div>
													<div class="tw-chart-legend__text">할일</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 333 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(176, 180, 187);"></div>
													<div class="tw-chart-legend__text">진행중</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 340 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
										</div>
									</div>
								</div> --%>
								<div class="tw-project-analytics-self-centric-chart">
									<div class="tw-project-analytics-self-centric-chart__header">
										<h3>사용자2</h3>
									</div>
									<div class="tw-donut-chart">
										<div class="tw-donut-chart__chart-container">
											<div class="tw-donut-chart__title-container"
												style="font-size: 200px;">
												<div class="tw-donut-chart__count">6</div>
												<div class="tw-donut-chart__unit">전체 업무</div>
											</div>
											<div id="tw-project-analytics-self-centric-chart__내가-작성한-업무"
												class="tw-donut-chart__chart c3"
												style="max-height: 200px; position: relative;">
												<svg width="200" height="200" style="overflow: hidden;">
													<defs>
													<clipPath id="c3-1500894564463-clip">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564463-clip-xaxis">
													<rect x="-31" y="-20" width="262" height="40"></rect></clipPath>
													<clipPath id="c3-1500894564463-clip-yaxis">
													<rect x="-29" y="-4" width="20" height="200"></rect></clipPath>
													<clipPath id="c3-1500894564463-clip-grid">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564463-clip-subchart">
													<rect width="200"></rect></clipPath></defs>
													<g transform="translate(0.5,4.5)">
													<text class="c3-text c3-empty" text-anchor="middle"
														dominant-baseline="middle" x="100" y="88"
														style="opacity: 0;"></text>
													<rect class="c3-zoom-rect" width="200" height="176"
														style="opacity: 0;"></rect>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip)"
														class="c3-regions" style="visibility: hidden;"></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip-grid)"
														class="c3-grid" style="visibility: hidden;">
													<g class="c3-xgrid-focus">
													<line class="c3-xgrid-focus" x1="-10" x2="-10" y1="0"
														y2="176" style="visibility: hidden;"></line></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip)"
														class="c3-chart">
													<g class="c3-event-rects c3-event-rects-single"
														style="fill-opacity: 0;">
													<rect class=" c3-event-rect c3-event-rect-0" x="0" y="0"
														width="200" height="176"></rect></g>
													<g class="c3-chart-bars">
													<g class="c3-chart-bar c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-bars c3-bars-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-bars c3-bars-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-bars c3-bars-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-bars c3-bars-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-lines">
													<g class="c3-chart-line c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-lines c3-lines-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-areas c3-areas-completed"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-circles c3-circles-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-lines c3-lines-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-areas c3-areas-overdue"></g>
													<g class=" c3-selected-circles c3-selected-circles-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-circles c3-circles-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-lines c3-lines-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-areas c3-areas-planned"></g>
													<g class=" c3-selected-circles c3-selected-circles-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-circles c3-circles-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-lines c3-lines-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-areas c3-areas-noDuedate"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-circles c3-circles-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-arcs" transform="translate(100,83)">
													<text class="c3-chart-arcs-title"
														style="text-anchor: middle; opacity: 1;"></text>
													<g class="c3-chart-arc c3-target c3-target-completed">
													<g
														class=" c3-shapes c3-shapes-completed c3-arcs c3-arcs-completed">
													<path class=" c3-shape c3-shape c3-arc c3-arc-completed"
														transform="scale(1,1)"
														style="fill: rgb(39, 182, 186); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-overdue">
													<g
														class=" c3-shapes c3-shapes-overdue c3-arcs c3-arcs-overdue">
													<path class=" c3-shape c3-shape c3-arc c3-arc-overdue"
														transform="scale(1,1)"
														style="fill: rgb(233, 94, 81); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 68.28610308840298,39.42499999999998L61.357899858127475,35.42499999999998A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(49.05925659263371,-28.324374999999996)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-planned">
													<g
														class=" c3-shapes c3-shapes-planned c3-arcs c3-arcs-planned">
													<path class=" c3-shape c3-shape c3-arc c3-arc-planned"
														transform="scale(1,1)"
														style="fill: rgb(255, 176, 36); cursor: pointer; opacity: 1;"
														d="M68.28610308840298,39.42499999999998A78.85,78.85 0 0,1 -68.28610308840297,39.425000000000026L-61.35789985812746,35.42500000000002A70.85,70.85 0 0,0 61.357899858127475,35.42499999999998Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-noDuedate">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-arcs c3-arcs-noDuedate">
													<path class=" c3-shape c3-shape c3-arc c3-arc-noDuedate"
														transform="scale(1,1)"
														style="fill: rgb(176, 180, 187); cursor: pointer; opacity: 1;"
														d="M-68.28610308840297,39.425000000000026A78.85,78.85 0 0,1 -1.4484510016915318e-14,-78.85L-1.3014933857938495e-14,-70.85A70.85,70.85 0 0,0 -61.35789985812746,35.42500000000002Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(-49.05925659263372,-28.324374999999957)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g></g>
													<g class="c3-chart-texts">
													<g class="c3-chart-text c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-completed"></g></g>
													<g class="c3-chart-text c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-overdue"></g></g>
													<g class="c3-chart-text c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-planned"></g></g>
													<g class="c3-chart-text c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-noDuedate"></g></g></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip-grid)"
														class="c3-grid c3-grid-lines">
													<g class="c3-xgrid-lines"></g>
													<g class="c3-ygrid-lines"></g></g>
													<g class="c3-axis c3-axis-x"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip-xaxis)"
														transform="translate(0,176)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-x-label" transform=""
														style="text-anchor: end;" x="200" dx="-0.5em" dy="-0.5em"></text>
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g>
													<g class="c3-axis c3-axis-y"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip-yaxis)"
														transform="translate(0,0)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-y-label" transform="rotate(-90)"
														style="text-anchor: end;" x="0" dx="-0.5em" dy="1.2em"></text>
													<g class="tick" transform="translate(0,176)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">-0.1</tspan></text></g>
													<g class="tick" transform="translate(0,162)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0</tspan></text></g>
													<g class="tick" transform="translate(0,147)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.1</tspan></text></g>
													<g class="tick" transform="translate(0,133)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.2</tspan></text></g>
													<g class="tick" transform="translate(0,118)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.3</tspan></text></g>
													<g class="tick" transform="translate(0,104)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.4</tspan></text></g>
													<g class="tick" transform="translate(0,89)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.5</tspan></text></g>
													<g class="tick" transform="translate(0,74)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.6</tspan></text></g>
													<g class="tick" transform="translate(0,60)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.7</tspan></text></g>
													<g class="tick" transform="translate(0,45)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.8</tspan></text></g>
													<g class="tick" transform="translate(0,31)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.9</tspan></text></g>
													<g class="tick" transform="translate(0,16)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">1</tspan></text></g>
													<g class="tick" transform="translate(0,1)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">1.1</tspan></text></g>
													<path class="domain" d="M-6,1H0V176H-6"></path></g>
													<g class="c3-axis c3-axis-y2" transform="translate(200,0)"
														style="visibility: hidden; opacity: 0;">
													<text class="c3-axis-y2-label" transform="rotate(-90)"
														style="text-anchor: end;" x="0" dx="-0.5em" dy="-0.5em"></text>
													<g class="tick" transform="translate(0,176)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0</tspan></text></g>
													<g class="tick" transform="translate(0,159)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.1</tspan></text></g>
													<g class="tick" transform="translate(0,141)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.2</tspan></text></g>
													<g class="tick" transform="translate(0,124)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.3</tspan></text></g>
													<g class="tick" transform="translate(0,106)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.4</tspan></text></g>
													<g class="tick" transform="translate(0,89)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.5</tspan></text></g>
													<g class="tick" transform="translate(0,71)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.6</tspan></text></g>
													<g class="tick" transform="translate(0,54)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.7</tspan></text></g>
													<g class="tick" transform="translate(0,36)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.8</tspan></text></g>
													<g class="tick" transform="translate(0,19)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.9</tspan></text></g>
													<g class="tick" transform="translate(0,1)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">1</tspan></text></g>
													<path class="domain" d="M6,1H0V176H6"></path></g></g>
													<g transform="translate(0.5,200.5)"
														style="visibility: hidden;">
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip-subchart)"
														class="c3-chart">
													<g class="c3-chart-bars"></g>
													<g class="c3-chart-lines"></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip)"
														class="c3-brush"
														style="pointer-events: all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
													<rect class="background" x="0" width="200"
														style="visibility: hidden; cursor: crosshair;"></rect>
													<rect class="extent" x="0" width="0" style="cursor: move;"></rect>
													<g class="resize e" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g>
													<g class="resize w" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g></g>
													<g class="c3-axis-x" transform="translate(0,0)"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564463-clip-xaxis)"
														style="visibility: hidden; opacity: 0;">
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g></g>
													<g transform="translate(0,180)">
													<g class=" c3-legend-item c3-legend-item-completed"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">completed</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(39, 182, 186); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-overdue"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">overdue</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(233, 94, 81); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-planned"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">planned</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(255, 176, 36); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-noDuedate"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">noDuedate</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(176, 180, 187); pointer-events: none;"></line></g></g>
													<text class="c3-title" x="100" y="0"></text></svg>
												<div class="c3-tooltip-container"
													style="position: absolute; pointer-events: none; display: none;"></div>
											</div>
											<div class="tw-donut-chart__empty --hidden"
												style="width: 160px; height: 160px;"></div>
										</div>
										<div class="tw-donut-chart__legend">
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(39, 182, 186);"></div>
													<div class="tw-chart-legend__text">완료</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">3</span>
													<!-- react-text: 358 -->
													(50%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(233, 94, 81);"></div>
													<div class="tw-chart-legend__text">마감일 지남</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">1</span>
													<!-- react-text: 365 -->
													(17%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(255, 176, 36);"></div>
													<div class="tw-chart-legend__text">할일</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">1</span>
													<!-- react-text: 372 -->
													(17%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(176, 180, 187);"></div>
													<div class="tw-chart-legend__text">진행중</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">1</span>
													<!-- react-text: 379 -->
													(16%)
													<!-- /react-text -->
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tw-project-analytics-self-centric-chart">
									<div class="tw-project-analytics-self-centric-chart__header">
										<h3>사용자3</h3>
									</div>
									<div class="tw-donut-chart">
										<div class="tw-donut-chart__chart-container">
											<div class="tw-donut-chart__title-container"
												style="font-size: 200px;">
												<div class="tw-donut-chart__count">5</div>
												<div class="tw-donut-chart__unit">전체 업무</div>
											</div>
											<div
												id="tw-project-analytics-self-centric-chart__내가-팔로우하는-업무"
												class="tw-donut-chart__chart c3"
												style="max-height: 200px; position: relative;">
												<svg width="200" height="200" style="overflow: hidden;">
													<defs>
													<clipPath id="c3-1500894564503-clip">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564503-clip-xaxis">
													<rect x="-31" y="-20" width="262" height="40"></rect></clipPath>
													<clipPath id="c3-1500894564503-clip-yaxis">
													<rect x="-29" y="-4" width="20" height="200"></rect></clipPath>
													<clipPath id="c3-1500894564503-clip-grid">
													<rect width="200" height="176"></rect></clipPath>
													<clipPath id="c3-1500894564503-clip-subchart">
													<rect width="200"></rect></clipPath></defs>
													<g transform="translate(0.5,4.5)">
													<text class="c3-text c3-empty" text-anchor="middle"
														dominant-baseline="middle" x="100" y="88"
														style="opacity: 0;"></text>
													<rect class="c3-zoom-rect" width="200" height="176"
														style="opacity: 0;"></rect>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip)"
														class="c3-regions" style="visibility: hidden;"></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip-grid)"
														class="c3-grid" style="visibility: hidden;">
													<g class="c3-xgrid-focus">
													<line class="c3-xgrid-focus" x1="-10" x2="-10" y1="0"
														y2="176" style="visibility: hidden;"></line></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip)"
														class="c3-chart">
													<g class="c3-event-rects c3-event-rects-single"
														style="fill-opacity: 0;">
													<rect class=" c3-event-rect c3-event-rect-0" x="0" y="0"
														width="200" height="176"></rect></g>
													<g class="c3-chart-bars">
													<g class="c3-chart-bar c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-bars c3-bars-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-bars c3-bars-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-bars c3-bars-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-bar c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-bars c3-bars-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-lines">
													<g class="c3-chart-line c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-completed c3-lines c3-lines-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-areas c3-areas-completed"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-completed"></g>
													<g
														class=" c3-shapes c3-shapes-completed c3-circles c3-circles-completed"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-overdue c3-lines c3-lines-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-areas c3-areas-overdue"></g>
													<g class=" c3-selected-circles c3-selected-circles-overdue"></g>
													<g
														class=" c3-shapes c3-shapes-overdue c3-circles c3-circles-overdue"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-planned c3-lines c3-lines-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-areas c3-areas-planned"></g>
													<g class=" c3-selected-circles c3-selected-circles-planned"></g>
													<g
														class=" c3-shapes c3-shapes-planned c3-circles c3-circles-planned"
														style="cursor: pointer;"></g></g>
													<g class="c3-chart-line c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-lines c3-lines-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-areas c3-areas-noDuedate"></g>
													<g
														class=" c3-selected-circles c3-selected-circles-noDuedate"></g>
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-circles c3-circles-noDuedate"
														style="cursor: pointer;"></g></g></g>
													<g class="c3-chart-arcs" transform="translate(100,83)">
													<text class="c3-chart-arcs-title"
														style="text-anchor: middle; opacity: 1;"></text>
													<g class="c3-chart-arc c3-target c3-target-completed">
													<g
														class=" c3-shapes c3-shapes-completed c3-arcs c3-arcs-completed">
													<path class=" c3-shape c3-shape c3-arc c3-arc-completed"
														transform="scale(1,1)"
														style="fill: rgb(39, 182, 186); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,-78.85L4.3383112859794985e-15,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,-56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-overdue">
													<g
														class=" c3-shapes c3-shapes-overdue c3-arcs c3-arcs-overdue">
													<path class=" c3-shape c3-shape c3-arc c3-arc-overdue"
														transform="scale(1,1)"
														style="fill: rgb(233, 94, 81); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,-78.85A78.85,78.85 0 0,1 4.82817000563844e-15,78.85L4.3383112859794985e-15,70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,-70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(56.64874999999999,0)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-planned">
													<g
														class=" c3-shapes c3-shapes-planned c3-arcs c3-arcs-planned">
													<path class=" c3-shape c3-shape c3-arc c3-arc-planned"
														transform="scale(1,1)"
														style="fill: rgb(255, 176, 36); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,78.85A78.85,78.85 0 0,1 4.82817000563844e-15,78.85L4.3383112859794985e-15,70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(3.4687355181599307e-15,56.64874999999999)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g>
													<g class="c3-chart-arc c3-target c3-target-noDuedate">
													<g
														class=" c3-shapes c3-shapes-noDuedate c3-arcs c3-arcs-noDuedate">
													<path class=" c3-shape c3-shape c3-arc c3-arc-noDuedate"
														transform="scale(1,1)"
														style="fill: rgb(176, 180, 187); cursor: pointer; opacity: 1;"
														d="M4.82817000563844e-15,78.85A78.85,78.85 0 0,1 -1.4484510016915318e-14,-78.85L-1.3014933857938495e-14,-70.85A70.85,70.85 0 0,0 4.3383112859794985e-15,70.85Z"></path></g>
													<text dy=".35em" class=""
														transform="translate(-56.64874999999999,6.9374710363198614e-15)"
														style="opacity: 1; text-anchor: middle; pointer-events: none;"></text></g></g>
													<g class="c3-chart-texts">
													<g class="c3-chart-text c3-target c3-target-completed"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-completed"></g></g>
													<g class="c3-chart-text c3-target c3-target-overdue"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-overdue"></g></g>
													<g class="c3-chart-text c3-target c3-target-planned"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-planned"></g></g>
													<g class="c3-chart-text c3-target c3-target-noDuedate"
														style="opacity: 1; pointer-events: none;">
													<g class=" c3-texts c3-texts-noDuedate"></g></g></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip-grid)"
														class="c3-grid c3-grid-lines">
													<g class="c3-xgrid-lines"></g>
													<g class="c3-ygrid-lines"></g></g>
													<g class="c3-axis c3-axis-x"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip-xaxis)"
														transform="translate(0,176)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-x-label" transform=""
														style="text-anchor: end;" x="200" dx="-0.5em" dy="-0.5em"></text>
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g>
													<g class="c3-axis c3-axis-y"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip-yaxis)"
														transform="translate(0,0)"
														style="visibility: visible; opacity: 0;">
													<text class="c3-axis-y-label" transform="rotate(-90)"
														style="text-anchor: end;" x="0" dx="-0.5em" dy="1.2em"></text>
													<g class="tick" transform="translate(0,176)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">-0.1</tspan></text></g>
													<g class="tick" transform="translate(0,162)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0</tspan></text></g>
													<g class="tick" transform="translate(0,147)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.1</tspan></text></g>
													<g class="tick" transform="translate(0,133)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.2</tspan></text></g>
													<g class="tick" transform="translate(0,118)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.3</tspan></text></g>
													<g class="tick" transform="translate(0,104)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.4</tspan></text></g>
													<g class="tick" transform="translate(0,89)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.5</tspan></text></g>
													<g class="tick" transform="translate(0,74)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.6</tspan></text></g>
													<g class="tick" transform="translate(0,60)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.7</tspan></text></g>
													<g class="tick" transform="translate(0,45)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.8</tspan></text></g>
													<g class="tick" transform="translate(0,31)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">0.9</tspan></text></g>
													<g class="tick" transform="translate(0,16)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">1</tspan></text></g>
													<g class="tick" transform="translate(0,1)"
														style="opacity: 1;">
													<line x2="-6"></line>
													<text x="-9" y="0" style="text-anchor: end;">
													<tspan x="-9" dy="3">1.1</tspan></text></g>
													<path class="domain" d="M-6,1H0V176H-6"></path></g>
													<g class="c3-axis c3-axis-y2" transform="translate(200,0)"
														style="visibility: hidden; opacity: 0;">
													<text class="c3-axis-y2-label" transform="rotate(-90)"
														style="text-anchor: end;" x="0" dx="-0.5em" dy="-0.5em"></text>
													<g class="tick" transform="translate(0,176)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0</tspan></text></g>
													<g class="tick" transform="translate(0,159)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.1</tspan></text></g>
													<g class="tick" transform="translate(0,141)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.2</tspan></text></g>
													<g class="tick" transform="translate(0,124)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.3</tspan></text></g>
													<g class="tick" transform="translate(0,106)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.4</tspan></text></g>
													<g class="tick" transform="translate(0,89)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.5</tspan></text></g>
													<g class="tick" transform="translate(0,71)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.6</tspan></text></g>
													<g class="tick" transform="translate(0,54)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.7</tspan></text></g>
													<g class="tick" transform="translate(0,36)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.8</tspan></text></g>
													<g class="tick" transform="translate(0,19)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">0.9</tspan></text></g>
													<g class="tick" transform="translate(0,1)"
														style="opacity: 1;">
													<line x2="6" y2="0"></line>
													<text x="9" y="0" style="text-anchor: start;">
													<tspan x="9" dy="3">1</tspan></text></g>
													<path class="domain" d="M6,1H0V176H6"></path></g></g>
													<g transform="translate(0.5,200.5)"
														style="visibility: hidden;">
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip-subchart)"
														class="c3-chart">
													<g class="c3-chart-bars"></g>
													<g class="c3-chart-lines"></g></g>
													<g
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip)"
														class="c3-brush"
														style="pointer-events: all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
													<rect class="background" x="0" width="200"
														style="visibility: hidden; cursor: crosshair;"></rect>
													<rect class="extent" x="0" width="0" style="cursor: move;"></rect>
													<g class="resize e" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g>
													<g class="resize w" transform="translate(0,0)"
														style="cursor: ew-resize; display: none;">
													<rect x="-3" width="6" height="6"
														style="visibility: hidden;"></rect></g></g>
													<g class="c3-axis-x" transform="translate(0,0)"
														clip-path="url(https://enterprise.taskworld.com/59757de75472871088fcbe49/#c3-1500894564503-clip-xaxis)"
														style="visibility: hidden; opacity: 0;">
													<g class="tick" transform="translate(100, 0)"
														style="opacity: 1;">
													<line y2="6" x1="0" x2="0"></line>
													<text y="9" x="0" transform=""
														style="text-anchor: middle; display: block;">
													<tspan x="0" dy=".71em" dx="0">0</tspan></text></g>
													<path class="domain" d="M0,6V0H200V6"></path></g></g>
													<g transform="translate(0,180)">
													<g class=" c3-legend-item c3-legend-item-completed"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">completed</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(39, 182, 186); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-overdue"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">overdue</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(233, 94, 81); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-planned"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">planned</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(255, 176, 36); pointer-events: none;"></line></g>
													<g class=" c3-legend-item c3-legend-item-noDuedate"
														style="visibility: hidden; cursor: pointer;">
													<text x="14" y="9" style="pointer-events: none;">noDuedate</text>
													<rect class="c3-legend-item-event" x="0" y="-5" width="0"
														height="0" style="fill-opacity: 0;"></rect>
													<line class="c3-legend-item-tile" x1="-2" y1="4" x2="8"
														y2="4" stroke-width="10"
														style="stroke: rgb(176, 180, 187); pointer-events: none;"></line></g></g>
													<text class="c3-title" x="100" y="0"></text></svg>
												<div class="c3-tooltip-container"
													style="position: absolute; pointer-events: none; display: none;"></div>
											</div>
											<div class="tw-donut-chart__empty --hidden"
												style="width: 160px; height: 160px;"></div>
										</div>
										<div class="tw-donut-chart__legend">
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(39, 182, 186);"></div>
													<div class="tw-chart-legend__text">완료</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">3</span>
													<!-- react-text: 397 -->
													(60%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(233, 94, 81);"></div>
													<div class="tw-chart-legend__text">마감일 지남</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">1</span>
													<!-- react-text: 404 -->
													(20%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(255, 176, 36);"></div>
													<div class="tw-chart-legend__text">할일</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">0</span>
													<!-- react-text: 411 -->
													(0%)
													<!-- /react-text -->
												</div>
											</div>
											<div class="tw-chart-legend">
												<div class="tw-chart-legend__name --has-data">
													<div class="tw-chart-legend__circle"
														style="border: 4px solid rgb(176, 180, 187);"></div>
													<div class="tw-chart-legend__text">진행중</div>
												</div>
												<div class="tw-chart-legend__data">
													<span class="tw-chart-legend__value">1</span>
													<!-- react-text: 418 -->
													(20%)
													<!-- /react-text -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>

							<div class="tw-project-analytics-page__task-overview">
									<div class="tw-tasklist-stats-panel">
										<div class="tw-tasklist-stats-panel__header">
											<h3 class="tw-tasklist-stats-panel__title">업무리스트 개요(파트별)</h3>
											<div class="tw-tasklist-stats-panel__spacer"></div>
											<div class="tw-tasklist-stats-panel__filter">
												<div class="tw-tasklist-stats-panel__legend-container">
													<div class="tw-chart-legend --compact --selected" id="all"
														style="height: 21px; line-height:21px;">
														<div class="tw-chart-legend__name">
														<div class="tw-chart-legend__text --compact"
															style="margin-left: 0px;">전체</div>
													</div>
													</div>
													<div class="tw-chart-legend --compact --selected" id="completed"
														style="height: 21px; line-height:21px;">
														<div class="tw-chart-legend__name">
															<div class="tw-chart-legend__circle --compact"
																style="border: 4px solid rgb(39, 182, 186);"></div>
															<div class="tw-chart-legend__text --compact">완료</div>
														</div>
													</div>
													<div class="tw-chart-legend --compact" id="overdue"
														style="height: 21px; line-height:21px;">
														<div class="tw-chart-legend__name">
															<div class="tw-chart-legend__circle --compact"
																style="border: 4px solid rgb(233, 94, 81);"></div>
															<div class="tw-chart-legend__text --compact" >마감일 지남</div>
														</div>
													</div>
													<div class="tw-chart-legend --compact" id="planned"
														style="height: 21px; line-height:21px;">
														<div class="tw-chart-legend__name">
															<div class="tw-chart-legend__circle --compact"
																style="border: 4px solid rgb(255, 176, 36);"></div>
															<div class="tw-chart-legend__text --compact">할일</div>
														</div>
													</div>
													<div class="tw-chart-legend --compact" id="noDuedate"
														style="height: 21px; margin-right:50px">
														<div class="tw-chart-legend__name">
															<div class="tw-chart-legend__circle --compact"
																style="border: 4px solid rgb(176, 180, 187);"></div>
															<div class="tw-chart-legend__text --compact">진행중</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tw-bar-chart" style="height: 276px;">
											<div class="tw-bar-chart__chart-container">
												<div class="tw-bar-chart__chart-background">
													<div class="tw-bar-chart__label-x">업무 비율</div>
													<div class="tw-bar-chart__label-x --bottom">업무 비율</div>
													<table class="tw-bar-chart__background-table">
														<tbody>
															<tr>
																<td>10%</td>
																<td>20%</td>
																<td>30%</td>
																<td>40%</td>
																<td>50%</td>
																<td>60%</td>
																<td>70%</td>
																<td>80%</td>
																<td>90%</td>
																<td>100%</td>
															</tr>
															<tr>
																<td>10%</td>
																<td>20%</td>
																<td>30%</td>
																<td>40%</td>
																<td>50%</td>
																<td>60%</td>
																<td>70%</td>
																<td>80%</td>
																<td>90%</td>
																<td>100%</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="tw-bar-chart__tasklists">
													<div class="tw-bar-chart__tasklist">
														<div class="tw-bar-chart__tasklist-title">
															<!-- react-text: 693 -->
															파트1
															<!-- /react-text -->
															<span class="tw-tooltip__dummy-element"
																style="display: none;"></span>
														</div>
														<div class="tw-bar-chart__chart">
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(39, 182, 186); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 699 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 700 -->
																	<!-- /react-text -->
																	<!-- react-text: 701 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(233, 94, 81); width: 100%;">
																<div class="tw-bar-chart__subChart-text --percent">100%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 705 -->
																	1
																	<!-- /react-text -->
																	<!-- react-text: 706 -->
																	<!-- /react-text -->
																	<!-- react-text: 707 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(255, 176, 36); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 711 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 712 -->
																	<!-- /react-text -->
																	<!-- react-text: 713 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(176, 180, 187); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 717 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 718 -->
																	<!-- /react-text -->
																	<!-- react-text: 719 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
														</div>
													</div>
													<div class="tw-bar-chart__tasklist">
														<div class="tw-bar-chart__tasklist-title">
															<!-- react-text: 722 -->
															파트2
															<!-- /react-text -->
															<span class="tw-tooltip__dummy-element"
																style="display: none;"></span>
														</div>
														<div class="tw-bar-chart__chart">
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(39, 182, 186); width: 67%;">
																<div class="tw-bar-chart__subChart-text --percent">67%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 728 -->
																	2
																	<!-- /react-text -->
																	<!-- react-text: 729 -->
																	<!-- /react-text -->
																	<!-- react-text: 730 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(233, 94, 81); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 734 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 735 -->
																	<!-- /react-text -->
																	<!-- react-text: 736 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(255, 176, 36); width: 33%;">
																<div class="tw-bar-chart__subChart-text --percent">33%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 740 -->
																	1
																	<!-- /react-text -->
																	<!-- react-text: 741 -->
																	<!-- /react-text -->
																	<!-- react-text: 742 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(176, 180, 187); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 746 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 747 -->
																	<!-- /react-text -->
																	<!-- react-text: 748 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
														</div>
													</div>
													<div class="tw-bar-chart__tasklist">
														<div class="tw-bar-chart__tasklist-title">
															<!-- react-text: 751 -->
															파트3
															<!-- /react-text -->
															<span class="tw-tooltip__dummy-element"
																style="display: none;"></span>
														</div>
														<div class="tw-bar-chart__chart">
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(39, 182, 186); width: 100%;">
																<div class="tw-bar-chart__subChart-text --percent">100%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 757 -->
																	1
																	<!-- /react-text -->
																	<!-- react-text: 758 -->
																	<!-- /react-text -->
																	<!-- react-text: 759 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(233, 94, 81); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 763 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 764 -->
																	<!-- /react-text -->
																	<!-- react-text: 765 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(255, 176, 36); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 769 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 770 -->
																	<!-- /react-text -->
																	<!-- react-text: 771 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(176, 180, 187); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 775 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 776 -->
																	<!-- /react-text -->
																	<!-- react-text: 777 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
														</div>
													</div>
													<div class="tw-bar-chart__tasklist">
														<div class="tw-bar-chart__tasklist-title">
															<!-- react-text: 751 -->
															파트4
															<!-- /react-text -->
															<span class="tw-tooltip__dummy-element"
																style="display: none;"></span>
														</div>
														<div class="tw-bar-chart__chart">
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(39, 182, 186); width: 100%;">
																<div class="tw-bar-chart__subChart-text --percent">100%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 757 -->
																	1
																	<!-- /react-text -->
																	<!-- react-text: 758 -->
																	<!-- /react-text -->
																	<!-- react-text: 759 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(233, 94, 81); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 763 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 764 -->
																	<!-- /react-text -->
																	<!-- react-text: 765 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(255, 176, 36); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 769 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 770 -->
																	<!-- /react-text -->
																	<!-- react-text: 771 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
															<div class="tw-bar-chart__subChart"
																style="background-color: rgb(176, 180, 187); width: 0%;">
																<div class="tw-bar-chart__subChart-text --percent">0%</div>
																<div class="tw-bar-chart__subChart-text">
																	<!-- react-text: 775 -->
																	0
																	<!-- /react-text -->
																	<!-- react-text: 776 -->
																	<!-- /react-text -->
																	<!-- react-text: 777 -->
																	업무
																	<!-- /react-text -->
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>



</section>

<c:import url="../temp/footer.jsp"></c:import>


</body>
</html>