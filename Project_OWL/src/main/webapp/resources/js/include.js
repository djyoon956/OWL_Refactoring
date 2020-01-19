'use strict';

function themeSetting(){
	$(".mySetting").each(function(){
		$(this).attr("style", "background-color : ${setting.themeColor} !important;");
	})

	$(".mainBody").css("font-family","${setting.font}");
}
