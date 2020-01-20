'use strict';

function setTheme(theme, font){
	console.log("in setTheme");
	console.log(theme);
	console.log(font);
	$(".mySetting").each(function(){
		$(this).attr("style", "background-color : "+theme+" !important;");
	})
	$(".mainBody").css("font-family",font);
}