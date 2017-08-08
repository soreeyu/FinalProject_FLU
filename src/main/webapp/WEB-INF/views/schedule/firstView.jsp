<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
<div id= "#firstView_main_wrap">

	
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
														<span id="sDateforTitle">7월 25일
														${mainScheduleDTO.startDate}</span>
														
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
														<span id="fDateforTitle">8월 25일
														${mainScheduleDTO.finishDate}</span>
														
														<div class="tw-add-date-panel__remove-date">
															<i class="tw-icon tw-icon-close --name_close"></i>
														</div>
													</div>
												</section>
											</div>
										</div>
										
										<div>
											<div class="tw-project-analytics-status__head">경과 시간</div>
											<div class="tw-project-analytics-status__text --plain"><span  id="beforeDuration">-</span>일</div>
										</div>
										<div>
											<div class="tw-project-analytics-status__head">남은 시간</div>
											<div class="tw-project-analytics-status__text --plain" ><span  id="afterDuration">-</span>일</div>
										</div>
										<div>
											<div class="tw-project-analytics-status__head">목표 업무(총)</div>
											<div class="tw-project-analytics-status__text --plain"><span  id="totalUnitsCount">10</span>개
												업무 </div>
										</div>
										<div>
											<div class="tw-project-analytics-status__head">완료 업무</div>
											<div class="tw-project-analytics-status__text --plain" ><span id="totalDoneUnitsCount">3</span>개
												업무 (<span id="totalDoneUnitsPercent"></span>%)</div>
										</div>
									</div>
								</div>
								
								
								
								
								<div class="tw-project-analytics-overview">
									<div class="tw-project-analytics-overview__head">
										<h3>프로젝트 개요(업무상태별)</h3>
										<div class="tw-project-analytics-overview__head-legends">
											<div class="tw-project-analytics-overview__head-legend">
												<div class="tw-chart-legend__circle"
													style="border-color: rgb(233, 94, 81);"></div>
												<span class="tw-project-analytics-overview__head-legend-text">할일</span>
													<strong><span class="totalPercentWill">X</span>%</strong>&nbsp;(<span class="totalPercentWill">3</span>개 업무)
												
											</div>
											<div class="tw-project-analytics-overview__head-legend">
												<div class="tw-chart-legend__circle"
													style="border-color: rgb(255, 176, 36);"></div>
												<span class="tw-project-analytics-overview__head-legend-text">진행중</span>
													<strong><span class="totalPercentIng">X</span>%</strong>&nbsp;(<span class="totalPercentIng">3</span>개 업무)
												
											</div>
											<div class="tw-project-analytics-overview__head-legend">
												<div class="tw-chart-legend__circle"
													style="border-color: rgb(39, 182, 186);"></div>
												<span class="tw-project-analytics-overview__head-legend-text">완료</span>
													<strong><span class="totalPercentDone">X</span>%</strong>&nbsp;(<span class="totalPercentDone">3</span>개 업무)
											</div>
											
										</div>
									</div>
									
									
									<div class="tw-project-analytics-overview__bars">
										<div id="totalPercentBarPercentWill" style="background: rgb(233, 94, 81); width: 20%;"></div>
										<div id="totalPercentBarPercentIng" style="background: rgb(255, 176, 36); width: 10%;"></div>										
										<div id="totalPercentBarPercentDone" style="background: rgb(39, 182, 186); width: 60%;"></div>	
									</div>
								</div>
								
								
								
								
								
								
								
						<section class="tw-project-analytics-page__self-centric">
							
				
								
								<!--Div that will hold the pie chart-->
								<c:forEach items="${summary.userNames}" varStatus="i">
									<div class="tw-project-analytics-self-centric-chart">
					    				<div id="donutchart${i.index}" class="dounut"></div>
									</div>
								</c:forEach>
								
								
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
													<div class="tw-chart-legend__text">마감일지남</div>
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
																style="border: 4px solid rgb(233, 94, 81);"></div>
															<div class="tw-chart-legend__text --compact">할일</div>
														</div>
													</div>
						
													<div class="tw-chart-legend --compact" id="planned"
														style="height: 21px; line-height:21px;">
														<div class="tw-chart-legend__name">
															<div class="tw-chart-legend__circle --compact"
																style="border: 4px solid rgb(255, 176, 36);"></div>
															<div class="tw-chart-legend__text --compact">진행중</div>
														</div>
													</div>
													<div class="tw-chart-legend --compact" id="noDuedate"
														style="height: 21px; margin-right:50px">
														<div class="tw-chart-legend__name">
															<div class="tw-chart-legend__circle --compact"
																style="border: 4px solid rgb(39, 182, 186);"></div>
															<div class="tw-chart-legend__text --compact">완료</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										
										<div class="tw-bar-chart" style="height: 276px;">
											<div class="tw-bar-chart__chart-container">
												<div id="chart_div"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
</div>


		
 <script type="text/javascript">
     google.charts.load('current', {packages: ['corechart']});    
     google.charts.load('current', {packages: ['corechart', 'bar']});
   </script>
 
    <script type="text/javascript">
    var scheduleNum = '${scheduleNum}';
    
     var data;
     var chart;
     var willCount = 1;
     var ingCount = 12;
     var finCount = 5;
     var warnCount = 9;
     var index=0;

    
    
     
     function drawStacked() {
          var data = google.visualization.arrayToDataTable([
           ['파트', '할일', '진행중','완료']//,
           //['호이야',2,3,4]
         ]);
          
          //OR 
          
          var data2 = new google.visualization.DataTable();
          data2.addColumn('string', 'PART');
          data2.addColumn('number', '할일');
          data2.addColumn('number', '진행중');
          data2.addColumn('number', '완료'); 
         
          

          $(".partNames").each(function(index){
        	  var partNames = $(".partNames:eq("+index+")").text();
        	  var partNamesWill = $(".partNamesWill:eq("+index+")").text()*1;
        	  var partNamesIng = $(".partNamesIng:eq("+index+")").text()*1;
        	  var partNamesDone = $(".partNamesDone:eq("+index+")").text()*1;
        	  var partNamesTotal = $(".partNamesTotal:eq("+index+")").text()*1;
              alert("하아아아"+partNames);
        	  data2.addRow([partNames,partNamesWill, partNamesIng ,partNamesDone]);
          });
            
         var options = {
           title: '파트별 업무리스트',
           chartArea: {width: '50%',height: '90%'},
           isStacked: 'percent',
           hAxis: {
             title: '',
             minValue: 0,
           },
           vAxis: {
             title: '파트별업무비율'
           },
           legend :{
     	    	position: 'none'
     	     },
           colors: ['rgb(233, 94, 81)', 'rgb(255, 176, 36)','rgb(39, 182, 186)','rgb(176, 180, 187)' ]
        
         };
         
        
         var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
         chart.draw(data2, options);
     }

     google.charts.setOnLoadCallback(drawStacked);

    
      // Set a callback to run when the Google Visualization API is loaded.
      for(var i=0;i<$(".userNames").length;i++){
    	 
    	  google.charts.setOnLoadCallback(drawChart1);
    	  
      }
      
      
      function drawChart1() {

	   	  willCount = $(".userNamesWill:eq("+index+")").text()*1;
	   	  ingCount = $(".userNamesIng:eq("+index+")").text()*1;
	   	  finCount = $(".userNamesDone:eq("+index+")").text()*1;
	   	  warnCount = 1;
   
    	
        var data = google.visualization.arrayToDataTable([
          ['Task'	, 'Hours per Day'],
          ['할일' 	,	willCount],
          ['진행중'	,	ingCount],
          ['완료'	,	finCount]
          //['마감일 지남', warnCount]
        ]);

        var options = {
          width: 300,
          height: 380,
          title: $(".userNames:eq("+index+")").text(),
          pieHole: 0.3,
          colors: ['rgb(233, 94, 81)','rgb(255, 176, 36)', 'rgb(39, 182, 186)', 'rgb(176, 180, 187)']
	      ,legend :{
  	    	position: 'bottom',
  	    	textStyle : {
  	    		fontSize: 12
  	    	}
  	      }
        };
		var id= 'donutchart'+(index);
		alert(id);
        var chart = new google.visualization.PieChart(document.getElementById(id));
        chart.draw(data, options);
        index++;
      }
       
   

      function selectHandler() {
        var selectedItem = chart.getSelection()[0];
        var value = data.getValue(selectedItem.row, 0);
        alert('The user selected ' + value);
      }

      
      //전체개요 값 세팅
      $(".totalPercentWill:eq(0)").html(Math.ceil(($("#allWill").text()*1)/($("#allTotal").text()*1)*100));
      $(".totalPercentIng:eq(0)").html(Math.ceil(($("#allIng").text()*1)/($("#allTotal").text()*1)*100));
      $(".totalPercentDone:eq(0)").html(Math.ceil(($("#allDone").text()*1)/($("#allTotal").text()*1)*100));
      $(".totalPercentWill:eq(1)").html($("#allWill").text());
      $(".totalPercentIng:eq(1)").html($("#allIng").text());
      $(".totalPercentDone:eq(1)").html($("#allDone").text());
      
      // $("#totalPercentBarPercentWill").css("width",Math.ceil(($("#allWill").text()*1)/($("#allTotal").text()*1)*100));
      //$("#totalPercentBarPercentIng").css("width",Math.ceil(($("#allIng").text()*1)/($("#allTotal").text()*1)*100));
      // $("#totalPercentBarPercentDone").css("width",Math.ceil(($("#allDone").text()*1)/($("#allTotal").text()*1)*100));
      
      //제목 설정 
      $("#sDateforTitle").html("4월 7일");
      $("#fDateforTitle").html("8월 7일");
      $("#beforeDuration").html(100);
      $("#afterDuration").html(1);
      $("#totalUnitsCount").html($("#allTotal").text());
      $("#totalDoneUnitsCount").html($("#allDone").text());
      $("#totalDoneUnitsPercent").html(Math.ceil(($("#allDone").text()*1)/($("#allTotal").text()*1)*100));

    </script>
