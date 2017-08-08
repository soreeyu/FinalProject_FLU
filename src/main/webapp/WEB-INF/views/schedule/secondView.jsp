<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<div class="schedule_main_container jui">
		<div id='schcalendar'></div>
</div>

<!-- 파트 클릭했을때 unitList 뿌려주기 -->
<div id="unitListModal" class="msgbox" style="display: none;">
    <div class="headWrap">
    	<div class="head">
    		<div id="partName">DB구축이라던가</div>
    	</div>      
    </div>
    <div class="bodyWrap">
		<div id="listModalContents">
			<!-- 여기에 table 그리기 -->
			<table>
				<tr>
					<td><span class="listModalUnit">상세할일 제목쓰</span></td>
					<td>2017-08-14</td>
					<td>담당자</td>
					<td>상태</td>
				</tr>
			</table>
			
			
			
			
			
		</div>
        <div style="text-align: center; margin: 30px;">
            <a class="closeBtn">Close</a>
        </div>
    </div>
</div>
	

