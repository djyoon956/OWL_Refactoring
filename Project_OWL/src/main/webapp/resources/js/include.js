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
	$(".projectBody #tab-menu").css("font-family",font);
	$(".projectBody #tab-menu").css("border-bottom", "1px double " + subColor);
	/*$(".projectBody .nav-item.active a").css("border-bottom", "3px solid " + subColor);*/
	$(".projectBody #tab-menu .nav-item > .nav-link").css("color", subColor);
	$(".copyright").css("background-color", theme);
	$(".themeChange").css("background-color", theme);
	$("#sidebarnav").css("color", subColor);
	$("#dropdownMenuButton > .iconSizeBig").css("color", subColor);
}

function getTextColorFromBg(hexColor){
	console.log("in ");
	console.log(hexColor);
	let r;
	let g;
	let b;
	if(hexColor.startsWith("rgb")){
		let array = hexColor.split(",");
		r = parseInt(array[0].trim().replace("rgb(",""));
		g = parseInt(array[1].trim());
		b = parseInt(array[2].trim().replace(")",""));
	}else{
		r = hexColorToR(hexColor);
		g = hexColorToG(hexColor);
		b = hexColorToB(hexColor);
	}
		
    let o = Math.round(((r * 299) + (g * 587) + (b * 114)) /1000);
    let textColor = "white";
    if(o > 125) 
    	textColor="black";     

    return textColor;
}

function hexColorToR(hexColor){
	 return parseInt(hexColor.substring( 1, 3 ), 16 );
}
function hexColorToG(hexColor){
	return parseInt(hexColor.substring( 3, 5 ), 16 );
}
function hexColorToB(hexColor){
	return parseInt(hexColor.substring( 5, 7 ), 16 ) ;
}
