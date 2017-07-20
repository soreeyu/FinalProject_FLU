<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		var partCount=1;
		
		$("#addPartBtn").click(function(){
			partCount++;
			//alert('part 추가');
			//alert($("#partSection").html());
			var partDOM = '<div class="partOne"> part 이름 : <input type="text" class="partName" name="partName">';
			partDOM = partDOM + ' part 시작일:<input type="date" class="partStartDate" name="partStartDate">'; 
			partDOM = partDOM + ' part 마감일:<input type="date" class="partFinishDate" name="partFinishDate">';
			partDOM = partDOM + ' part 설명첨부파일:<input type="file" class="partDescFileO" name="partDescFile">';
			partDOM = partDOM + ' <span class="partDel">X</span></div>';
			$("#partSection").append(partDOM);
		});
		
		$("#partSection").on("click",".partDel",(function(){
			partCount --;
			$(this).parent(".partOne").remove(); //눌린 본인의 부모 P를 삭제하다
		}));
		
	});
</script>


<form action="./create" method="POST"  enctype="multipart/form-data">
	<%-- <input type="hidden" id="scheduleNum" name="scheduleNum" value="${scheduleNum}"> --%>
	<div>
		프로젝트 시작일:<input type="date" name="startDate" value=""> 
		프로젝트 마감일:<input type="date" name="finishDate"> 
	</div>
	<div>
		<h3>시작일은 설정하지 않을경우 당일로 등록되고 마감일은 파트 마감일중 가장 마지막날로 등록된다</h3>
		<h3>파트의 시작일을 설정하지 않은경우는 프로젝트 시작일로 등록되고 마감일을 등록하지 않은경우는 마감일로 등록된다</h3>
	</div>
	<div id="partSection">
		<div class="partOne">	
			part 이름 : <input type="text" class="partName" name="partName">
			part 시작일:<input type="date" class="partStartDate" name="partStartDate"> 
			part 마감일:<input type="date" class="partFinishDate" name="partFinishDate">
			part 설명첨부파일:<input type="file" class="partDescFileO" name="partDescFile">
			<span class="partDel">X</span>
		</div>
	</div>
	<input type="button" id="addPartBtn" value="part추가">
	
	<button>등록</button>
</form>
