let currentProjectIdx;
let currentProjectName;
let currentProjectColor;
let currentProjectStartDate;
let currentProjectEndDate;

function initProjcet(projectIdx, projectName, projectColor,projectStartDate, projectEndDate){
	currentProjectIdx  = projectIdx;
	currentProjectName = projectName;
	currentProjectColor = projectColor;
	currentProjectStartDate = projectStartDate;
	currentProjectEndDate = projectEndDate;
	
	initNotice();
	initKanban(projectIdx);
    initDashBoard(currentProjectIdx);
    initDrive();
}