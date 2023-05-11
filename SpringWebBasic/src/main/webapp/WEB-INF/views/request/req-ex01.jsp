<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>Request 컨트롤러를 이용한 처리 작업중</h2>
	<form action="/basic/request/basic01">
		<input type="submit" value="GET요청">
	</form>
	<form action="/basic/request/basic01" method="post">
		<input type="submit" value="POST요청">
	</form>
	
</body>
</html>