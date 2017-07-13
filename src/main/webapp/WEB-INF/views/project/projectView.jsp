<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>project View</h2>

${dto.projectNum}
${dto.name}
${dto.skill}


<script>
 mArray = new Array("팝송","가요");
 aArray = new Array("중세미술","근대미술","현대미술"); 
 
 function changeSelect(value) {
 document.all.medium.length=1;
  if(value == 'music') {
   for(i=0; i<mArray.length; i++) {
    option = new Option(mArray[i]);
    document.all.medium.options[i+1] = option;
   }
  }
  if(value == 'art') {
   for(i=0; i<aArray.length; i++) {
    option = new Option(aArray[i]);
    document.all.medium.options[i+1] = option;
   }
  }
 }
</script>
 
<select name="big" onChange="changeSelect(value)">
 <option>대분류
 <option value="music">음악
 <option value="art">미술
</select>
<select name="medium">
 <option>중분류
</select>

<p>
<a href="projectUpdate?projectNum=${dto.projectNum}">Update</a>
<a href="projectDelete?projectNum=${dto.projectNum}">Delete</a>
</p>
</body>
</html>