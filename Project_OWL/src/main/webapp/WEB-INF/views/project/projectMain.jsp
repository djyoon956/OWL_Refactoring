<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="project" value="${project}" scope="request" />
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>OWL</title>
    <jsp:include page="../include/headTag.jsp" />
    <link href="resources/css/project.css" rel="stylesheet">
    <!--  dashboard css -->
    <link href="resources/css/dashBoard.css" rel="stylesheet">

    <!-- DataTable -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.js"></script>

    <!-- SummerNote -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Toast Calendar -->
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
	<!-- If you use the default popups, use this. -->
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
    <script src="resources/js/notice.js"></script>
    <script src="resources/js/dashBoard.js"></script>
    <script src="resources/js/kanban.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
        		url:"GetProjectList.do",
        		data: {projectIdx: ${project.projectIdx}},
        		success:function(data){  
            		console.log(data);      		
        		    calendar = new CalendarInfo();
        				calendar.id = String(data.projectIdx);
        			    calendar.name = data.projectName;
        			    calendar.color = '#ffffff';
        			    calendar.bgColor = data.projectColor;
        			    calendar.dragBgColor = data.projectColor;
        			    calendar.borderColor = data.projectColor;
        			    addCalendar(calendar);
        			    console.log(calendar);			    						
        		    setSchedules();
        		}
            });
            
            setTheme("${setting.themeColor}", "${setting.font}");
            initNotice();
            
            let oldMenu = $("#projectMenu li:first");
            $("#projectMenu li").on("click", function () {
                console.log("in projectlsit :"+$(this).children(".nav-link").attr("href") );
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
				console.log("open MemberCheckModal");
				$("#projectMemebers").empty();
			 	$.ajax({
			 		type: "POST",
                    url: "GetProjectMember.do",
                    data: { projectIdx: ${project.projectIdx}},
                    success: function (data) {
                         console.log("GetProjectMember success");
                        $("#projectMemebersBox").empty();
                        let error = "onerror='this.src=\"resources/images/login/profile.png\"'";
                        $.each(data, function(index, element){
                     
                            let control = "<li class='mt-3'>"
		                				+ "	<img class='rounded-circle' width='40' "+error+"  src='upload/memeber/"+element.profilePic+"' alt='user'>"
		                				+ " 	<label class='ml-3 text-left' style='width: 250px'> "+element.name+" ( "+element.email+" ) </label>";

               				if(index == 0){
               					control += "<span class='ml-5 roleBadge pm'></span>";
               				}else{
            					control += "<span class='ml-5 roleBadge member'></span>";		
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
             });
            
            $("#addMemberOk").click(function () {
                console.log("in click");
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
                        projectIdx: ${project.projectIdx},
                        projectName: "${project.projectName}",
                        pm : "${member.name}",
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
          
        }); 
        
        function setChageView(target) {
            console.log("setChageView : " + target);
            if (target === "dash")
                setDashBoardData();
            else if (target === "calendar")
                setCalendarData();
            else if (target === "kanban")
                setKanbanData();
            else if (target === "notice")
                setNoticeData('${project.projectIdx}');
            else if (target === "drive")
                setDriveData();
        }

        function setDashBoardData() {
            console.log("in setDashBoardData");
        }

        function setCalendarData() {
            console.log("in setCalendarData");           
            refreshScheduleVisibility();
        }


        function setDriveData() {
            console.log("in setDriveData");
            /*  $.ajax({
                    type : "POST",
                    url : "GetDrive.do",
                    data : {projectIdx : ${project.projectIdx}},
                    success : function(data) {
                        console.log("setDriveData success");
                        $("#drive").html(data);
                    }, error : function(){
                    	console.log("setDriveData error");
                    }
                });  */
        }

        function addProjectMember() {
            let addProjectMembers = $('.addProjectMembers').toArray();
            console.log(addProjectMembers);
            let addEmail = $("#addProjectMemeberEmail").val();
            $("#addProjectMemeberEmail").val("");
            let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            if (!addEmail.match(regExp) || addProjectMembers.includes(addEmail)) {
                return;
            }

            $("#addMemberCount").text((addProjectMembers.length+1) + "명");
            let control = "<div class='input-group'>" 
			               + "<input type='hidden' class='addProjectMembers' name='addProjectMembers' value='" + addEmail + "'>" 
			               + "	<div class='form-control'>" 
			               + "		<i class='fas fa-envelope mr-2 iconSizeBig'></i>" + addEmail 
			               + "	</div>" 
			               + "	<div class='input-group-append memberDeleteButton'>" 
			               + "		<span class='input-group-text'><i class='far fa-times-circle font-weight-bold iconSizeBig'></i></span>" 
			               + "	</div>" 
			               + "</div>";
            $("#addMemberBox").prepend(control);

            $(".memberDeleteButton").click(function () {
                $(this).parent().remove();
            })
        }
        // 칸반 --> 
    	function addKanbanIssue(colIdx,obj){
        	console.log("in addKanbanIssue : "+colIdx);
        	console.log($("#"+colIdx+"Column > .columnBody"));
        	console.log("in addKanbanIssue2 : ");
        	
    		 let issue = '<li class="issuePiece">'
    				+		'<div class="dropdown">'
    				+			'<label> <span class="badgeIcon float-left" style="background-color: '+ obj.labelColor+'">' + obj.labelName + '</span>'
    				+			'<span class="issueTitle">' + obj.issueTitle + '</span>'
    				+			'</label>'
    				+			'<a href="javascript:void(0)" data-toggle="dropdown" id="dropdownIssueButton" aria-haspopup="true" aria-expanded="false" style="float: right">' 
    				+			'<i class="fas fa-ellipsis-v fa-sm"></i></a>'
    				+			'<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">'
    				+				'<ul class="list-style-none">'
    				+					'<li class="pl-3"><a href="#editIssueModal" data-toggle="modal">Issue detail</a></li>'
    				+					'<li class="pl-3"><a href="#">Remove Issue</a></li>'
    				+				'</ul>'
    				+			'</div>'
    				+		'</div>'
    				+		'<div>'
    				+			'<label>'
    				+			'<span class="assigneetitle">'
    				+			'<i class="fas fa-user-check"></i>&nbsp; Assignee</span> <span class="assignee">' + obj.assigned + '</span>'
    				+			'</label>'
    				+		'</div>'
    				+	'</li>';
    		
    			$("#"+colIdx+"Column > .columnBody").append(issue);
    		}


    	    function setKanbanData() {
    	       // console.log("in setKanbanData");
    	       // $('#kanbanArea').empty();
    	       //$('#kanbanArea').find(":not(('#openIssueColumn').children())").empty();
    	        $.ajax({
    				 url : 'GetColumn.do',
    				 data : {'projectIdx' :  ${project.projectIdx} },
    				 success : function(data) {
    					//console.log(data);   //projectIdx, issueTitle, assigned, labelName, labelColor, colIdx, colname
    					
    					$.each(data,function(index,obj) {
    						/* $('#kanbanArea').empty(); */
    						console.log("칸반");
    						console.log(obj.colIdx);
    						if(obj.colIdx == 0) {
    							if(obj.issueTitle != null) { 
    							 addKanbanIssue(obj.colIdx, obj); 
    							}
        					} else {
            				
    						if($('#'+obj.colIdx+'Column').length > 0) {// 칼럼 박스가 존재할때
    							 addKanbanIssue(obj.colIdx, obj); 
    		   					}
    						else{ // 칼럼 박스가 존재하지 않을때
        						
    							 addColumn(obj);
    							 if(obj.issueTitle != null) { addKanbanIssue(obj.colIdx,obj);  };
    							 
    						}
        					}
    					});
    					$( ".sortableCol").sortable({
    				        connectWith: ".connectedSortable",
    				        dropOnEmpty: true       
    				     }).disableSelection();
    				},
    				 error : function() {
    					console.log("getColum.do error");
    				}
    			}); 
    	    }

    	    
    	    function closeFn() {
    	      	$("#closeIssueColumn").hide();
    	    	$("#0Column").hide();
    	       }
    </script>
    <style type="text/css">
        .iconSizeBig {
            font-size: 1.2rem;
            line-height: 2rem;
            color: #326295;
        }
    </style>
</head>

<body>
    <!-- LOADER -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>

    <div id="main-wrapper">

        <!-- TOP -->
        <jsp:include page="../include/top.jsp" />

        <!-- SIDE BAR -->
        <jsp:include page="../include/sideBar.jsp" />

        <!-- CONTENT BOX -->
        <div class="page-wrapper">
            <!-- CONTENT MAIN -->
            <div class="container-fluid" style="background-color: white;padding:0">

                <!-- <div class="row">
					<div class="col-md-12">dfgdfgdsfds
					</div>
				</div> -->
                <div id="tab-menu">
                    <div class="row">
                        <div class="col-md-11">
                            <div id="tab-btn">
                                <ul id="projectMenu" class="nav nav-tabs" role="tablist"
                                    style="border-bottom-width: 0px;">
                                  <li class="nav-item">
                                        <a class="nav-link" href="#project" style="font-size: 20px; height: 51.979166px; padding-top: 12px;">${project.projectName}</a>
                                    </li>
                                    <li class="nav-item active">
                                        <a class="nav-link" data-toggle="tab" href="#dash">Dash Board</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#calendar">Calendar</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#kanban">Kanban Board</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#notice">Notice</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#drive">Drive</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#kanbanDetail">kanbanDetail</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="dropdown col-md-1 mt-2 text-center">
                            <a href="javascript:void(0)" data-toggle="dropdown" id="dropdownMenuButton"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user-cog iconSizeBig pt-2"></i></a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <ul class="list-style-none">
                                    <li class="pl-3"><a href="#memberEditModal" data-toggle="modal">프로젝트 멤버 추가</a></li>
                                    <li class="pl-3"><a href="#memberCheckModal" data-toggle="modal">프로젝트 멤버 확인</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div class=" tab-pane fade active show" id="dash" role="tabpanel">
                        <!-- 대시보드  -->
                        <jsp:include page="../dashBoard/projectDashboard.jsp" />
                    </div>
                    <div class=" tab-pane fade" id="calendar" role="tabpanel">
                        <jsp:include page="../calendar/projectCalendar.jsp" />
                    </div>
                    <div class=" tab-pane fade" id="kanban" role="tabpanel">
                        <jsp:include page="../kanban/kanban.jsp" />
                    </div>
                    <div class=" tab-pane fade" id="notice" role="tabpanel">
                        <jsp:include page="../notice/notice.jsp" />
                    </div>
                    <div class=" tab-pane fade" id="drive" role="tabpanel">
                        <jsp:include page="../drive/drive.jsp" />
                    </div>
                    <div class=" tab-pane fade" id="kanbanDetail" role="tabpanel">
                        <jsp:include page="../kanban/kanbanDetail.jsp" />
                    </div>
                </div>
            </div>

            <!-- BOTTOM -->
            <jsp:include page="../include/bottom.jsp" />
        </div>

    </div>

    <!-- MODAL -->
    <jsp:include page="modal/memberAdd.jsp" />
    <jsp:include page="modal/joinProjectMember.jsp" />
      <jsp:include page="modal/memberCheck.jsp" />

</body>