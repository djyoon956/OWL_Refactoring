let currentProjectIdx;
let currentProjectName;
let currentProjectStartDate;
let currentProjectEndDate;

function initProjcet(projectIdx, projectName, projectColor,projectStartDate, projectEndDate){
	currentProjectIdx  = projectIdx;
	currentProjectName = projectName;
	currentProjectStartDate = projectStartDate;
	currentProjectEndDate = projectEndDate;
	
	console.log("in it proejct");
	console.log(new Date(projectStartDate).toLocaleDateString());
	console.log(projectEndDate);
	
	initNotice();
	initKanban(projectIdx);
    initDashBoard(projectIdx, projectColor);
}