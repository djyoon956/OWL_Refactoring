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

function initProjectController(){
	let oldMenu = $("#projectMenu li:nth-child(2)");
    $("#projectMenu li").on("click", function () {
        console.log("click!!!!");
        if($(this).children(".nav-link").attr("href") == "#project")
			return;
		
        let oldTab = $(oldMenu.children(".nav-link").attr("href"));
        oldMenu.removeClass("active");
        oldTab.removeClass("active show");

        $(this).addClass("active");
        let currentTab = $($(this).children(".nav-link").attr("href"));
        currentTab.addClass("active show");
        oldMenu = $(this);

        setChageView(currentTab.attr("id"));
    });

    $('#memberCheckModal').on('show.bs.modal', function(){
		$("#projectMemebers").empty();
	 	$.ajax({
	 		type: "POST",
            url: "GetProjectMember.do",
            data: { projectIdx: currentProjectIdx},
            success: function (data) {
                $("#projectMemebersBox").empty();
                let error = "onerror='this.src=\"resources/images/login/profile.png\"'";
                $.each(data, function(index, element){
                    let control = "<li class='mt-3'>"
	                				+ "	<img class='rounded-circle' width='40' src='upload/member/"+element.profilePic+"' "+error+"   alt='user'>"
	                				+ " 	<label class='ml-3 text-left' style='width: 250px'> "+element.name+" ( "+element.email+" ) </label>";

       				if(index == 0){
       					control += "<span class='ml-1 roleBadge pm' style='padding-top : 5px;'></span>";
       				}else{
    					control += "<span class='ml-1 roleBadge member' style='padding-top : 5px;'></span>";		
       				}	
       				
       				
       				if("${project.authority}" == 'ROLE_PM'){
       					if(index != 0){
       				control += "<a href='javascript:void(0)' data-toggle='dropdown' id = 'dropdownBtn' aria-haspopup='true' aria-expanded='false' style='float: right'>"; 
       				control +=  "<i class='fas fa-ellipsis-v'></i></a>";
       				control +=  "<div class='dropdown-menu' aria-labelledby='dropdownBtn'>";
       				control +=  "<ul class='list-style-none'>";
       				control +=  "<li class='pl-3'><a href='#' onclick='deleteMember( " +'"'+ element.email+'"'+")'>멤버 퇴출</a></li>";
       				control +=  "<li class='pl-3'><a href='#' onclick='transferAuthority(" +'"'+ element.email +'"'+")'>PM 양도</a></li>";
       				control +=  "</ul>";
       				control += "</div>";
       					}
       				}	 
       				control+= "</li>";
   					$("#projectMemebersBox").append(control);
                 }) 
            },
            error: function () {
                console.log("GetProjectMember error");
            }
		}) 
      });

    $('#memberEditModal').on('hidden.bs.modal', function(){
        $("#addMemberBox").empty();
       $("#addMemberOk").val("초대 메일 전송");
       $("#addMemberCount").text("0명");
     });
    
    $("#addMemberOk").click(function () {
        let addProjectMembers = [];
        $('.addProjectMembers').each(function(){
        	addProjectMembers.push($(this).val());
          })

        if(addProjectMembers.length < 1) return;

        $.ajaxSettings.traditional = true;
        $(this).val("초대 메일 전송중...");
        $.ajax({
            type: "POST",
            url: "AddProjectMember.do",
            data: {
                projectIdx: currentProjectIdx,
                projectName: "${project.projectName}",
                pm : loginUser,
                addProjectMembers: addProjectMembers
            },
            success: function (data) {
                console.log("addMemberOk success");
                $("#memberEditModal").modal("hide");
                $("#sendMemberCount").text(addProjectMembers.length);
                $("#sendMembers").empty();
                $.each(addProjectMembers, function(){
                    $("#sendMembers").append("<h5> - "+this+"</h5>")
                 })
                $("#openJoinProjectMemberModal").click();
            },
            error: function () {
                console.log("addMemberOk error");
            }
        });
    })    
    
    checkAlarmView();  
}