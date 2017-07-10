<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
span{
	color: red;
}
</style>
</head>

<body>
	<h2>Project ${type}</h2>

	<form action="projectWrite" method="post" id="frm">
	
	
	

		<div>
			<label><span>*</span>카테고리</label>
			<input type="text" name="category">
			<input type="text" name="detailCategory">
			<!-- <div class="control-wrapper">
				<div class="category-wrapper">
					<div class="main-wrapper">
						<select required="required">
							<option>카테고리</option>
							<option class="main_wrapper" value="1">개발</option>
							<option class="main_wrapper" value="2">디자인</option>
						</select> 
						
					</div>
					<div class="sub-wrapper">
						
					</div>
				</div>
		
				프로젝트 카테고리를 선택해 주세요.
			</div> -->
			
		</div>


		<div>
			<label><span>*</span>프로젝트 제목</label>
			<div>
				<input type="text" name="name">
			</div>
		</div>

		<div>
			<label><span>*</span>예상 기간</label>
			<div>
				<input type="text" name="period">일
			</div>
		</div>

		<div>
			<label><span>*</span>지출 가능 예산</label>
			<div>
				<input type="number" name="budget">원
			</div>
		</div>

		<div>
			<label><span>*</span>기획 상태</label>
			<div>
				<input type="radio" name="planState" value="idea">아이디어만
				<input type="radio" name="planState" value="some">간단히
				<input type="radio" name="planState" value="detail">상세문서
				
			</div>
		</div>

		<div>
			<label><span>*</span>프로젝트 내용</label>
			<div>
				<textarea rows="" cols="" name="contents"></textarea>
			</div>
		</div>
		<div>
			<label>state test</label>
			<div>
				<input type="text" name="state">
			</div>
		</div>
		<div>
			<label>관심 기술</label>
			<div>
				<input type="text" name="skill">
			</div>
		</div>
		
		<div>
			<label>기획 관련 파일</label>
			<div>
				<input type="file" name="oName">
			</div>
		</div>
		
		
		<div>
			<label><span>*</span>모집 마감일자</label>
			<div>
				<input type="date" name="finishDate">
			</div>
		</div>
		
		<div>
			<label><span>*</span>사전 미팅</label>
			<div>
				<select name="meetKind">
					<option value="off">오프라인</option>
					<option value="on">온라인</option>
				</select>
			</div>
		</div>
		
		<div>
			<label><span>*</span>클라이언트 위치</label>
			<div>
				<input type="text" name="addr_num">
				<input type="text" name="addr_main">
				<input type="text" name="addr_detail">
			</div>
		</div>

		<div>
			<label><span>*</span>프로젝트 예상 시작일</label>
			<div>
				<input type="date" name="startDate">
			</div>
		</div>
		
		<div>
			<label><span>*</span>프로젝트 매니징 경험</label>
			<div>
				<input type="radio" name="exp" value="y">예
				<input type="radio" name="exp" value="n">아니오
			</div>
		</div>
		
		<!-- mail은 클라이언트 email 받아오기  -->
		<div>
			<label><span>*</span>메일</label>
			<div>
				<input type="text" name="email">	
			</div>
		</div>
		
		<div>
			<label><span>*</span>급구 여부</label>
			<div>
				<input type="radio" name="quick" value="1">예
				<input type="radio" name="quick" value="0">아니오
			</div>
		</div>
		
		<div>
			<label><span>*</span>fname</label>
			<div>
				<input type="text" name="fName">
			</div>
		</div>
		<div>
			<label><span>*</span>oname</label>
			<div>
				<input type="text" name="oName">
			</div>
		</div>
		<button type="submit">등록</button>
	</form>
	
	

</body>
</html>