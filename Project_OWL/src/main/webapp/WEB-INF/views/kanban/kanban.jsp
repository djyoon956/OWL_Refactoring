<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Summernote -->
<!-- 여기는 칸반 jsp -->
<style>

.columnSection {
	margin-left : 10px;
}

.assigneetitle {
	margin-left: 5px;
	font-weight: bold;
	font-size: 13px;
}

.assignee {
	font-family: "Nunito Sans", sans-serif;
	font-size: 13px;
	font-weight: 500;
}

.badgeIcon {
	display: inline-block;
	font-size: small;
	font-weight: bold;
	padding: 3px;
	color: black;
	margin-right: 7px;
	border-radius: 2px;
}

/* .badgeIcon2 {
	display: inline-block;
	background-color: #EC6550;
	font-size: small;
	font-weight: bold;
	padding: 3px;
	color: black;
	margin-right: 7px;
	border-radius: 2px;
} */

.floatRight {
	float: right;
	color: #326295;
}

.floatRight:hover {
	color: #326295;
}

.issuePiece:hover {
	box-shadow: 1.5px 1.5px 1.5px 1.5px #B4B1B1;
}

.issueTitle {
	font-family: "Nunito Sans", sans-serif;
	font-size: 16px;
	font-weight: 500;
}

.issuePiece {
	border: 2px solid #eeee;
	background-color: #fff;
	margin: 5px 10px 10px 10px; 
	padding: 10px 15px 15px 15px;
	font-size: 1.2em;
	width: 280px;
	height: 80px;
	border-radius: 3px;
	cursor: move;
}

.columnBody {
	border: 2px solid #e9e9e9;
	width: 320px;
	min-height: 20px;
	max-height: 550px;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin: 10px;
	border-radius: 3px;
	overflow-y: auto;
	background-color: #e9e9e9;
}

.columnBody:hover {
	border: 2px solid #DAD5D0;
}

.columnTitle {
	border: 4px solid #fff;
	background-color: #fff;
	height: 50px;
	margin-left: 20px;
	margin-right: 20px;
	padding-top: 12px;
	font-weight: 400;
	border-radius: 5px;
	border-bottom-color: #F9AFA4;
}

 #kanbanIn {
/*  #kanbanArea, */
	height: 700px;
	overflow-y: auto;
 	display: flex;
	flex-direction: row;
	flex-wrap: nowarp;
	flex-flow: row;
}


.cursor_pointer {
	cursor: pointer;
}

.leftdoor {
	background-color: #e9e9e9;
	margin-top: 20px;
	border : 1px solid #CBD7E3;
	margin-left : 0;
	hegiht: 300px;
}

.leftdoorheader {
	padding : 12px 20px 12px 20px;
}

.inputBox {
	width:75%; 
	height:60%;
}
</style>
 <!-- test textcomplete -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.textcomplete/1.8.5/jquery.textcomplete.min.js"></script>  
<script>
  $(function(){
		var mentions = ['yuku_t'];
		
		$('#replycontent').textcomplete({
		    html: {
		        match: /\B@(\w*)$/,
		        search: function (term, callback) {
		            callback($.map(mentions, function (mention) {
		                return mention.indexOf(term) === 0 ? mention : null;
		            }));
		        },
		        index: 1 ,
		        replace: function (mention) {
		            return '@' + mention + ' '; 
		        } 
		    }
		}).overlay([
		     {
		        match: /\B@\w+/g,
		        css: {
		            'background-color': '#d8dfea'
		        }
		    } 
		]) ; 

	  function check() {
	
		if($('#labelcolor').val().trim() == "" || $('#labelcolor').val().trim() == null) {
			return false;
			}

		if($('#labelname').val().trim() == "" || $('#labelname').val().trim() == null) {
			return false;
			} 
	  };
	  
	

	$('#addLabelModal').on('show.bs.modal', function() { 	//프로젝트 내 라벨 리스트 출력 
		let projectidx = ${project.projectIdx};
		getLabelList("ShowLabelList", projectidx);

	});


	$('#addLabelModal').on('hidden.bs.modal', function() {  
			$('#labelcolor').val("");
			$('#labelname').val("");
			
			$('#addLabelBtn').removeClass("hidden");
			$('#editLabelBtn').addClass("hidden");
			$('#backBtn').addClass("hidden");
		});

	
         $("#openIssueBtn").click(function() {
            $("#-1Column").removeClass("d-none");
     		$("#-99Column").hide();
     		$("#-1Column").show();
          });

         
         $("#closeIssueBtn").click(function() {
         	$("#-99Column").removeClass("d-none");
     		$("#-1Column").hide();
     		$("#-99Column").show();
          });

     	
	$("#InsertColumnBtn").on("click", function () {	
		console.log("InsertColumnBtn in");
			$.ajax({
				url : 'InsertColumn.do',
				data : {'projectIdx' : ${project.projectIdx}, 'colname' : $('#colname').val()},
				success : function(data) {
			
					if(data != null) {
		        		 console.log('data : ' + data);
		        		addColumn(data);

    					$( ".sortableCol").sortable({
    				        connectWith: ".connectedSortable",
    				        dropOnEmpty: true,
    				        update: function(event, ui) {
								let target = $(ui.item).attr("id").replace("Issue","");
								let columnIdx = $(this).parent().attr("id").replace("Column","");
								let issues = [];
								$.each($(this)[0].children, function(){
									issues.push($(this).attr("id").replace("Issue","").trim())
								})
								
								if(issues.length == 0)
									return;
								
								$.ajaxSettings.traditional = true; 
								$.ajax({
									type : "POST",
									url : "MoveIssue.do",
									data : { 	projectIdx :  ${project.projectIdx}
												, targetIssueIdx : target
												, columnIdx : columnIdx
												, issues : issues },
									success : function(data) {
										console.log("success move issue");
									},
									error: function() {
										console.log("error move issue");
									}
								})
       				        }       
    				     }).disableSelection();

		        		$('#addColumnModal').modal("hide");
					}else {
						errorAlert("Column 추가 실패");
					}
				},
				error : function(e) {
		        	errorAlert("Column 추가 error");
					}
				});
	});



	
	$('#addIssueModal').on('hidden.bs.modal', function(){
		console.log('hidden 작동하니?');
		
		$('#issueTitle').val("");
		$('#isContent').summernote("reset");
		
		console.log($('#priorityCode').val());
		//$('#priorityCode option:eq(0)').attr('selected', 'selected');
		console.log($('#priorityCode option:eq(0)').val());
		console.log("after  :" +$('#priorityCode').val());
		
		//$('#priorityCode').find('option:first').attr('selected', 'selected')
		//$('#datepicker-autoclose').remove();
		//$('#priorityCode').find('option:first').attr('selected', 'selected');
		
	});



	$('#addColumnModal').on('hidden.bs.modal', function() {  
		$('#colname').val("");
	});
	

	$("#addLabelBtn").on("click", function () {	

		let lcolor = false;
		let lname = false;

		let lbcolor = $('#labelcolor').val();
		let lbname = $('#labelname').val();

		if($('#labelcolor').val().trim() != "" && $('#labelcolor').val().trim() != null) lcolor = true;
		if($('#labelname').val().trim() != "" && $('#labelname').val().trim() != null) lname = true;

		if(lcolor == true && lname == true) {
			$.ajax({
				url : 'InsertLabel.do',
				data : {'projectIdx' : ${project.projectIdx}, 'labelColor' : $('#labelcolor').val(), 'labelName' : $('#labelname').val()},
				success : function(labelIdx) {
					
				addLabel(labelIdx, lbcolor, lbname);

				$('#labelcolor').val("");
			    $('#labelname').val("");
				},
				error : function(e) {
		        	errorAlert("label 추가 error");
				}
			});
			
		}else {return false;}

		});

	
    $("#editColumnBtn").click(function() {
        $.ajax({
        	url : 'UpdateColumn.do',
        	data : { 'colname' : $("#editcolName").val(),'projectIdx' : ${project.projectIdx},'colIdx' :  $("#editcolIdx").val()}, 
        	success : function(data) {
            $("#" + data + "Column span").text($("#editcolName").val());
        		$("#editcolName").val("");
            	$('#editColumnModal').modal('hide');
	
            },
            error : function() {
            	errorAlert("칼럼 수정 error");
            }
        });
    });



	  $('#replyBtn').click (function() {
		  
		let replyct = $('#replycontent').val();
		  console.log(replyct);
		if(replyct == "" || replyct == null) {
			return false;
		}else {
			  $.ajax ({
			 		type :"POST",
					url : "InsertReply.do",
					data : { 'issueIdx' : $('#issueIdxNum').val()
								, 'content': $('#replycontent').val()
								, 'creator' : '${member.name}'},
					success : function(data) {
						
						  $('#replycontent').val("");
				    		setKanbanDetail(data.issueIdx);

					},error : function() {
			        	errorAlert("InsertReply error");
						}
					})   
			}
		}) 

$('#projectIdxNum').val( ${project.projectIdx});

});
</script>

<div id="totalbody" class="container-fluid mt-3">
<input type="hidden" id="projectIdxNum">
    <div id="kanbanMainBox">

        <div class="row">
            <div class="col-2" style="margin-left: 30px;">

                <button id="openIssueBtn" class="btn btn-primary">
                    <i class="fas fa-columns"></i>&nbsp;Open
                </button>


                <button id="closeIssueBtn" class="btn btn-primary">
                    <i class="fas fa-columns"></i>&nbsp;Closed
                </button>

                <button class="btn btn-primary btn-link hidden ml-3" id="searchReturnBtn"><i class="fas fa-arrow-circle-left fa-3x"></i></button>

            </div>
            <div class="col-8">
                <a href="#" data-toggle="modal" data-target="#addIssueModal">
                    <button id="addIssuebtn" class="btn btn-primary">
                        <i class="fas fa-italic"></i>&nbsp;New Issue
                    </button>
                </a>
			<c:if test="${project.authority eq 'ROLE_PM'}">
                <a href="#" data-toggle="modal" data-target="#addColumnModal">
                    <button class="btn btn-primary">
                        <i class="fas fa-columns"></i>&nbsp;New Column
                    </button>
                </a>
                <a href="#" data-toggle="modal" data-target="#addLabelModal">
                    <button class="btn btn-primary">
                        <i class="fas fa-tag"></i>&nbsp;Make Label
                    </button>
                </a>
                <!-- --------------------알람 만들면 지울예정 ------------------------ -->
              <a href="#" data-toggle="modal" data-target="#confirmIssueModal">
                    <button class="btn btn-primary">
                        <i class="fas fa-tag"></i>&nbsp;Confirm Issue
                    </button>
                </a>
              <!-- ------------------------------------------------------------- -->
             </c:if>
             
             <!-- ------------Test------------------ -->
<!--              <div class="float-right">
                   <div class="input-group">
                        <input type="text" id="searchTestContent" class="form-control" placeholder="테스트중" >
                            <div class="input-group-append">
                                 <span class="input-group-text" id="basic-addon2" style="background-color: #326295"><button class="btn btn-primary btn-link" id="kanbanSearchTestBtn"><i class="fas fa-search" style="color:#f8f9fa"></i></button></span>
                        </div>
                   </div>
              	</div> -->
              	
             <!-- ----------------------------------- -->
              	
              	
             <div class="float-right">
                   <div class="input-group">
                        <input type="text" id="searchContent" class="form-control" placeholder="검색어를 입력하세요" aria-describedby="basic-addon2" >
                            <div class="input-group-append">
                                 <span class="input-group-text" id="basic-addon2" style="background-color: #326295"><button class="btn btn-primary btn-link" id="kanbanSearchBtn"><i class="fas fa-search" style="color:#f8f9fa"></i></button></span>
                        </div>
                   </div>
              	</div>
               <div class="float-right">
                     <select id="searchSelectBox" class="select2 form-control custom-select" style="width: 100%; height:36px;" >
                        <option value="" selected="selected">Select</option>
                        <option value="Label">Label</option>
                        <option value="Assignee">Assignee</option>
                        <option value="Priority">Priority</option>
                     </select>
                
				</div>

             
            </div>
        </div>

        <div class="row" id="kanbanArea">
        
        	  <div class="col-md-10 mt-4 ml-4 mr-4 hidden" id="searchBox" >
	  			     <div class="table-responsive m-t-40" style="clear: both;">
                        <table class="table table-hover">
                            <thead>       
                            <tr>
	                	 		<th class="text-center">Label</th>
	                	  		<th class="text-center">IssueTitle</th>
	                	  		<th class="text-center">Assigned</th>
	                	  		<th class="text-center">Priority</th>
	                	  		<th class="text-center">Due Date</th>
	                	  	</tr>
                            </thead>
                           <tbody>
<!--                                  <tr>
                                     <td class="text-center">4</td>
                                     <td>Down Coat</td>
                                     <td class="text-right"> 60 </td>
                                     <td class="text-right">$5 </td>
                                     <td class="text-right"> $300 </td>
                                </tr> -->
                            </tbody>
                        </table>
                     </div>
                   </div>
        
            <!--  open issue -->
            <!--  openIssueColumn -->

            <div class="columnSection leftdoor d-none" id="-1Column">
                <div class="text-center mt-2 leftdoorheader">
                    <h4> Open Issue
                        <span class="float-right"><i class="fas fa-times cursor_pointer" onclick="closeFn()"></i></span>
                    </h4>
                </div>
                <ul class="connectedSortable columnBody sortableCol" style="background-color:#bdbbbb">

                </ul>
            </div>
            <!--  close issue -->
            <div class="columnSection d-none leftdoor" id="-99Column">
                <div class="text-center mt-2 leftdoorheader">
                    <h4>
                        Close Issue<span class="float-right">
                            <i class="fas fa-times cursor_pointer" onclick="closeFn()"></i></span>
                    </h4>
                </div>
                <ul class="connectedSortable columnBody sortableCol" style="background-color:#bdbbbb">
                    <li class="issuePiece d-none"></li>
                </ul>
            </div>
            <div id="kanbanIn"> </div>
        </div>
    </div>
    
    <!-- kanbanDetailBox  -->
    <jsp:include page="detail.jsp" />

</div>

<!-- add issue modal -->
<jsp:include page="modal/addIssue.jsp" />
<jsp:include page="modal/addColumn.jsp" />
<jsp:include page="modal/editColumn.jsp" />
<jsp:include page="modal/addLabel.jsp" />
<jsp:include page="modal/comfirmIssue.jsp" />