let currentProjectIdx;
let currentProjectName;
let currentProjectColor;
let currentProjectStartDate;
let currentProjectEndDate;
let loginUser;

function initProjcet(email, projectIdx, projectName, projectColor,projectStartDate, projectEndDate){
	loginUser = email;
	currentProjectIdx  = projectIdx;
	currentProjectName = projectName;
	currentProjectColor = projectColor;
	currentProjectStartDate = projectStartDate;
	currentProjectEndDate = projectEndDate;
	
	initNotice();
	initKanban(projectIdx);
    initDashBoard(currentProjectIdx);
    initDrive();
    initCalendar(projectIdx, projectColor, projectStartDate, projectEndDate);
}