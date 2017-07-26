<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script>
        //Connect Event
        window.addEventListener('hashchange', function () {
            //Show
            alert(location.hash);
        });
    </script>
</head>
<body>
	<a href="#point_a">Move To Point_A</a>
    <a href="#point_b">Move To Point_B</a>
</body>

</html>