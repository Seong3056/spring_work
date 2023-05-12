<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>조회한 학생: ${stu.stuName}</h2>
	<p>
		국어: ${stu.kor }, 영어: ${stu.eng }, 수학: ${stu.math}, 총점: ${stu.total }, 평균: ${stu.average }
	</p>
	<a href="${pageContext.request.contextPath }/score/search"></a>
</body>
</html>