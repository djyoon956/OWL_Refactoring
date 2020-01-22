'use strict';

function setTheme(theme, font){
	let subColor;
	if(theme == "black"){
		subColor = "white";
	}else{
		subColor = "#326295";
	}
	
	$(".mySetting").each(function(){
		$(this).attr("style", "background-color : "+theme+" !important;");
	})
	$(".mainBody").css("font-family",font);
	$(".mainBody").css("background-color", theme);
	$(".projectBody").css("font-family",font);
	$(".projectBody").css("background-color", theme);
	$(".projectBody .tab-content").css("background-color", theme);
	$(".projectBody #tab-menu").css("background-color", theme);
	$(".projectBody #tab-menu .nav-item > .nav-link").css("color", subColor);
	//$(".nav-tabs .nav-link.active").css("background-color","none");
	//$(".projectBody#tab-menu.nav-item>.nav-link.active").css("background-color", "none");
	//$(".projectBody #tab-menu .nav-item>.nav-link.active").css("color", "black");
}