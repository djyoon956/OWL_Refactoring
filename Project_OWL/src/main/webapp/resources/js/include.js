'use strict';

function setTheme(theme, font){
	let subColor;
	if(theme == "black"){
		subColor = "white";		
		$(".sidebar-item > a").css("color", subColor);
	}else{
		subColor = "#326295";
		$(".sidebar-item > a").css("color", "#464a53");		
	}
	console.log("in set Theme");
	console.log(theme);
	console.log(font);
	console.log(subColor);
	$(".mySetting").each(function(){
		$(this).attr("style", "background-color : "+theme+" !important;");
	})
	
	$(".mainBody").css("font-family",font);
	$(".mainBody").css("background-color", theme);
	$(".projectBody").css("font-family",font);
	$(".projectBody").css("background-color", theme);
	$(".projectBody .tab-content").css("background-color", theme);
	$(".projectBody #tab-menu").css("background-color", theme);
	$(".projectBody #tab-menu").css("border-bottom", "1px double " + subColor);
	/*$(".projectBody .nav-item.active a").css("border-bottom", "3px solid " + subColor);*/
	$(".projectBody #tab-menu .nav-item > .nav-link").css("color", subColor);
	$(".copyright").css("background-color", theme);
	$("#sidebarnav").css("color", subColor);
	$("#dropdownMenuButton > .iconSizeBig").css("color", subColor);
}