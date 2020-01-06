<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript" ></script>
<style>
#leftmenuArea{height:900px; width:235px; background-color:#3e3d3d; font-family:'Malgun Gothic',Dotum,AppleGothic,sans-serif;}
.siteMapBtn p {
   position: absolute;
   top: 10px;
   right: 40px;
   z-index: 1;
   display: block;
   font-size:3em;
   color: #444;
   cursor: pointer;
   transform: translate3d(0, 0, 0);
   transition: transform .4s;
}
</style>
<script>
$(document).ready(function(){
    $("#leftmenuArea").show();
    $(".siteMapBtn").click(function(){
       $(".siteMapBtn p").toggle();
    $('#leftmenuArea').animate({width:'toggle'});
    })

})
</script>
</head>
<body>
<div class="siteMapBtn">
	<!--<input id="topBtn" type="checkbox"><label for="topBtn">&equiv;</label>-->
	<p style="margin:0;">&equiv;닫힘</p>
	<p style="display:none;margin:0;">&equiv;열림</p>
</div>
<div id="leftmenuArea">
	
</div>


</body>
</html>
