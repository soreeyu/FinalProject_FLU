<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div id="cklist_section">
	<div id="unitSearch">
		<select>
			<c:forEach items="${userList}" var="user">
				<option value="${user.email}">${user.nickName}</option>
			</c:forEach>
			<option>test1(tester1)</option>
			<option>test1(tester1)</option>
			<option>test1(tester1)</option>
		</select> 
		<select>
			<c:forEach items="${partList}" var="part">
				<option value="${part.partNum}">${part.partName}</option>
			</c:forEach>
			<option>파트파트파트1</option>
			<option>파트파트파트2</option>
			<option>파트파트파트3</option>
		</select>
	</div>

	<table id="cklist_table">
		<thead>
			<tr id="unitTitle">
				<th id="task">할일</th>
				<th id="ing">진행중</th>
				<th id="comp">완료</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="unitWill">
					<div class="unit3Wrap">
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 할일1</div><input type="checkbox" class="unitWillOne" data-scheduleNum="${scheduleNum}" data-unitNum="1"  data-state="0" data-email="myeon02@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 할일2</div><input type="checkbox" class="unitWillOne" data-scheduleNum="${scheduleNum}" data-unitNum="2" data-state="0" data-email="myeon03@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 할일3</div><input type="checkbox" class="unitWillOne" data-scheduleNum="${scheduleNum}" data-unitNum="3"  data-state="0" data-email="myeon02@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 할일4</div><input type="checkbox" class="unitWillOne" data-scheduleNum="${scheduleNum}" data-unitNum="4"  data-state="0" data-email="myeon02@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 할일5</div><input type="checkbox" class="unitWillOne" data-scheduleNum="${scheduleNum}" data-unitNum="5"  data-state="0" data-email="myeon02@flu.com"></div>
					</div>
				</td>
				<td id="unitIng">
					<div class="unit3Wrap">
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 진행중1</div><input type="checkbox" class="unitIngOne" data-scheduleNum="${scheduleNum}" data-unitNum="6"  data-state="1"  data-email="myeon02@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 진행중2</div><input type="checkbox" class="unitIngOne" data-scheduleNum="${scheduleNum}" data-unitNum="7"  data-state="1" data-email="myeon02@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 진행중3</div><input type="checkbox" class="unitIngOne" data-scheduleNum="${scheduleNum}" data-unitNum="8"  data-state="1"  data-email="myeon03@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 진행중4</div><input type="checkbox" class="unitIngOne" data-scheduleNum="${scheduleNum}" data-unitNum="9"  data-state="1"  data-email="myeon02@flu.com" ></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 진행중5</div><input type="checkbox" class="unitIngOne" data-scheduleNum="${scheduleNum}" data-unitNum="10"  data-state="1"  data-email="myeon03@flu.com"></div>		
					</div>
				</td>
				<td id="unitDone" >
					<div class="unit3Wrap">
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 완료1</div><input type="checkbox" class="unitDoneOne" data-scheduleNum="${scheduleNum}" data-unitNum="11"  data-state="2"  data-email="myeon02@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 완료2</div><input type="checkbox" class="unitDoneOne" data-scheduleNum="${scheduleNum}" data-unitNum="12"  data-state="2"  data-email="myeon02@flu.com"></div>
						<div class="unit3"><div class="unitTitle">기나긴 이름들의 완료3</div><input type="checkbox" class="unitDoneOne" data-scheduleNum="${scheduleNum}" data-unitNum="13"  data-state="2"  data-email="myeon03@flu.com"></div>	
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<table id="cklist_table">
		<tr id="unitTitle">
			<th id="task">할일</th>
			<th id="ing">진행중</th>
			<th id="comp">완료</th>
		</tr>
		<tr>
			<td id="unitWill">
				<ul>
					<li><input type="checkbox">기나긴 이름들의 할일1</li>
					<li><input type="checkbox">기나긴 이름들의 할일2</li>
					<li><input type="checkbox">기나긴 이름들의 할일3</li>
					<li><input type="checkbox">기나긴 이름들의 할일4</li>
					<li><input type="checkbox">기나긴 이름들의 할일5</li>
				</ul>
			</td>
			<td id="unitIng">
				<ul>
					<li><input type="checkbox">기나긴 이름들의 진행중1</li>
					<li><input type="checkbox">기나긴 이름들의 진행중2</li>
					<li><input type="checkbox">기나긴 이름들의 진행중3</li>
					<li><input type="checkbox">기나긴 이름들의 진행중4</li>
					<li><input type="checkbox">기나긴 이름들의 진행중5</li>
				</ul>
			</td>
			<td id="unitDone">
				<ul>
					<li><input type="checkbox">기나긴 이름들의 완료1</li>
					<li><input type="checkbox">기나긴 이름들의 완료2</li>
					<li><input type="checkbox">기나긴 이름들의 완료3</li>
					<li><input type="checkbox">기나긴 이름들의 완료4</li>
					<li><input type="checkbox">기나긴 이름들의 완료5</li>
				</ul>
			</td>
		</tr>
	</table>
</div>

<!----------------- 달력&체크리스트 끝--------------->

<script>
	//data-state
	//할일: 0, 진행중:1 , 완료:2
	
	var email = '${member.email}';
	
	$("input[data-email!='${member.email}']").css("display","none"); //체크박스 설정
	
	
	$(document).on("click",".unitWillOne",function(){
		if ( $(this).prop('checked') ) { //true
			
			var scheduleNum = $(this).attr('data-scheduleNum') * 1;
			var unitNum = $(this).attr('data-unitNum');
			
			alert($(this).prop('checked'));
			alert($(this).attr('data-scheduleNum'));
			alert($(this).attr('data-unitNum'));
			
			$(this).prop('checked',false); 
			$(this).attr("data-state",1);//상태변경
			
			$(this).parent(".unit3").insertAfter("#unitIng .unit3:last"); //이동
			
			$(this).removeClass("unitWillOne");
			$(this).addClass("unitIngOne");
			
			stateChange(scheduleNum,unitNum,1);   
	     }
	});
	
	
	
	$(document).on("click",".unitIngOne",function(){
		if ( $(this).prop('checked') ) { //true
			alert($(this).prop('checked'));
			alert($(this).attr('data-scheduleNum'));
			alert($(this).attr('data-unitNum'));
			
			//modal 열어서 값 입력 성공하면 변환 
			
			
			
			$(this).prop('checked',false); 
			$(this).attr("data-state",2);
			
			$(this).parent("li").appendTo("#unitDone li:last"); //이동
			
			$(this).removeClass("unitIngOne");
			$(this).addClass("unitDoneOne");
			
			
			
			
			//State변경 완료로변경		
	     }
	});
	
	$(document).on("click",".unitDoneOne",function(){
		if ( $(this).prop('checked') ) { //true
			alert($(this).prop('checked'));
			alert($(this).attr('data-scheduleNum'));
			alert($(this).attr('data-unitNum'));
	        //$(this).parent().addClass("selected");
	     } else {
	        //$(this).parent().removeClass("selected");
	     }
	});
	
	
	function stateChange(scheduleNum,unitNum,unitState){
		//실제적으로 DB에 상태를 바꿔줘야한다
		$.ajax({
			url: "./stateChange",
			type: "POST",
			data: {
				email:email,
				scheduleNum:scheduleNum,
				unitNum:unitNum,
				unitState:unitState 
				
			},success:function(data){
				alert("성공쓰"+data);
			}
			
		});
		
	}

</script>



