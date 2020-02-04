let currentProjectIdx;
let currentProjectName;

function initProjcet(projectIdx, projectName, projectColor){
	currentProjectIdx  = projectIdx;
	currentProjectName = projectName;
	
	initNotice();
	initKanban(currentProjectIdx);
    initDashBoard(projectColor);
}