<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){

		$.ajax({
			url: "TEST.do",
			success: function (data) {
				if(data)
					$("h3").text("Connection 성공");
				else{
					$("h3").text("Connection 실패");
					$("h3").css("color","red");
					}
			},
			error: function () {
				
			}
		})

	})
		
	
	</script>
</head>
<body>
	<h3></h3>
</body>
</html>