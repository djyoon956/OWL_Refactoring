<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기는 칸반 jsp -->
<style>
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
	background-color: #F4D452;
	font-size: small;
	font-weight: bold;
	padding: 3px;
	color: black;
	margin-right: 7px;
	border-radius: 2px;
}

.badgeIcon2 {
	display: inline-block;
	background-color: #EC6550;
	font-size: small;
	font-weight: bold;
	padding: 3px;
	color: black;
	margin-right: 7px;
	border-radius: 2px;
}

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
	width: 310px;
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

#kanbanArea {
	height: 600px;
	overflow-y: scroll;
 	display: flex;
	flex-direction: row;
	flex-wrap: nowarp;
	flex-flow: row;
}



 
 

.cursor_pointer {
	cursor: pointer;
}
</style>
<script>
  $(function(){


	  $.ajax({
			url : 'GetLabelList.do',
			data : {'projectIdx' : ${project.projectIdx}},
			success : function(data) {
				console.log("Showlabel success");
				console.log(data);
				$('#labelList').empty();

				let lablist = "";
				
				 $.each(data,function(index, obj) {
					 console.log("each문 in")
					console.log(obj.labelIdx);
					console.log(obj.labelName);
					console.log(obj.labelColor);

					lablist +=  '<div class="row labelList" id="'+obj.labelIdx+'">';
					lablist +=  '<div class="col-lg-8">';
					lablist +=  '<span class="badgeIconinList" style="background-color: '+obj.labelColor+'">'+obj.labelName+'</span>';
					lablist +=  '</div>';
					lablist +=  '<div class="col-lg-2">';
					lablist +=  '<a>Edit</a>';
					lablist +=  '</div>'
					lablist +=  '<div class="col-lg-2">';
					lablist +=  '<a>Delete</a>';
					lablist +=  '</div></div><hr>';

					
					 });

					$('#labelList').append(lablist);
					 
			},error : function() {
				console.log("Showlabel error");
			}
		
			});





	  
	  var n = 3;
	  
    $('#addIssue').click (function() {
       console.log('addIssue click in');
		
		let newIssue = "";
		newIssue  += '<li class="issuePiece">';
		newIssue  += '<div class="dropdown">';
		newIssue  += '<label>';
		newIssue  += '<span class="badgeIcon float-left">Dev</span>';
		newIssue  += '<span class="issueTitle">Drive : Development</span>';
		newIssue  += '</label>';
		newIssue  += '<a href="javascript:void(0)" data-toggle="dropdown" id="dropdownIssueButton" aria-haspopup="true" aria-expanded="false" style="float:right">';
		newIssue  += '<i class="fas fa-ellipsis-v fa-sm"></i></a>';
		newIssue  += '<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">';
		newIssue  += '<ul class="list-style-none">';
		newIssue  += '<li class="pl-3"><a href="#editIssueModal" data-toggle="modal">Edit Issue</a></li>';
		newIssue  += '<li class="pl-3"><a href="#">Remove Issue</a></li>';
		newIssue  += '</ul></div></div>';
		newIssue  += '<div><label>';
		newIssue  += '<span class="assigneetitle"><i class="fas fa-user-check"></i>&nbsp; Assignee</span>';
		newIssue  += '<span class="assignee">Chloe</span>';
		newIssue  += '</label></div></li>';
	
       
		$('#sortable1').append(newIssue);

        });


    $( "#sortable000, #sortable0000, #sortable0, #sortable00" ).sortable({
        connectWith: ".connectedSortable",
        dropOnEmpty: false        
      }).disableSelection();



    function addColumn(projectidx, columnidx, colname) {

  		 console.log("addcolumn 함수타니?");
  		  
  		var value =  "sortable" + projectidx;

  		var result = "";
    		result += '<div class="columnSection">';
    		result += '<div class="columnTitle text-center mt-2"><h4>'+colname+'</h4></div>';
    		result += '<input type="hidden" name="'+projectidx+'">';
    		result += '<input type="hidden" name="'+columnidx+'">';
        	result += '<ul id="' + value + '"class="connectedSortable columnBody cursor ui-sortable">';
    		result += '<li class="issuePiece ui-sortable-handle" style="display:none;">Item 1</li>';
        	result += '</ul></div>';

        console.log("result" + result);	
  		$('#kanbanArea').append(result);

        console.log(value);
       	sortableFn(value);
        };



        function sortableFn (value)  {
            var value1 ='#' + value;
             $( value1 ).sortable({
                 connectWith: ".connectedSortable",
                 dropOnEmpty: false        
               }).disableSelection();
             }
         $("#openIssueBtn").click(function() {
             $("#openIssue").removeClass("d-none");
     		$("#closeIssue").hide();
     		$("#openIssue").show();
          });
         $("#closeIssueBtn").click(function() {
         	$("#closeIssue").removeClass("d-none");
     		$("#openIssue").hide();
     		$("#closeIssue").show();
          });

        

         
	$("#InsertColumnBtn").on("click", function () {	

		console.log("InsertColumnBtn in");
			$.ajax({
				url : 'InsertColumn.do',
				data : {'projectIdx' : ${project.projectIdx}, 'colname' : $('#colname').val()},
				success : function(data) {
					console.log(data);
					console.log(typeof(data));
					if(data > 0) {
		        		//successAlert("새로운 Column이 추가되었습니다.");

		        		 let proidx = ${project.projectIdx};
		        		 let colnm = $('#colname').val();
		        		 //console.log("여기작동하니?");
		        		 //console.log(proidx);
		        		 //console.log(colnm);
		        		 
		        		addColumn(proidx, data, colnm);

						
		        		$('#addColumnModal').modal("hide");
		        		$('#colname').val("");
					}else {
						errorAlert("Column 추가 실패");
					}
				},
				error : function(e) {
		        	errorAlert("Column 추가 error");
					}
				});
	});


	
	$("#addLabelBtn").on("click", function () {	
		
		console.log("addLabelBtn in");
		console.log($('#labelcolor').val());
		console.log($('#labelname').val());

		let lbcolor = $('#labelcolor').val();
		let lbname = $('#labelname').val();
			$.ajax({
				url : 'InsertLabel.do',
				data : {'projectIdx' : ${project.projectIdx}, 'labelColor' : $('#labelcolor').val(), 'labelName' : $('#labelname').val()},
				success : function(data) {
					console.log(data);  // 라벨번호 

				let labelpiece = "";
					labelpiece +=  '<div class="row labelList" id="'+data+'">';
					labelpiece +=  '<div class="col-lg-8">';
					labelpiece +=  '<span class="badgeIconinList" style="background-color: '+lbcolor+'">'+lbname+'</span>';
					labelpiece +=  '</div>';
					labelpiece +=  '<div class="col-lg-2">';
					labelpiece +=  '<a>Edit</a>';
					labelpiece +=  '</div>'
					labelpiece +=  '<div class="col-lg-2">';
					labelpiece +=  '<a>Delete</a>';
					labelpiece +=  '</div></div><hr>';
						
				$('#labelList').append(labelpiece);
					
				},
				error : function(e) {
		        	errorAlert("label 추가 error");
					}
				});
	});

	
	
  });

  function closeFn() {
  	$("#closeIssue").hide();
		$("#openIssue").hide();
   }
  </script>

<div id="totalbody" class="container-fluid mt-3">
	<div class="row">
		<div class="col-8" style="margin-left: 30px;">

			<a href="#" data-toggle="modal" data-target="#addIssueModal">
				<button id="addIssue" class="btn btn-primary">
					<i class="fas fa-italic"></i>&nbsp;New Issue
				</button>
			</a> <a href="#" data-toggle="modal" data-target="#addColumnModal">
				<button id="addColumn" class="btn btn-primary">
					<i class="fas fa-columns"></i>&nbsp;New Column
				</button>
			</a>

			<button id="openIssueBtn" class="btn btn-primary">
				<i class="fas fa-columns"></i>&nbsp;Open Issue
			</button>
			<button id="closeIssueBtn" class="btn btn-primary">
				<i class="fas fa-columns"></i>&nbsp;Close Issue
			</button>

		</div>
		<div class="col-2">
			<a href="#" data-toggle="modal" data-target="#addLabelModal">
				<button class="btn btn-primary">
					<i class="fas fa-tag"></i>&nbsp;Make Label
				</button>
			</a>
		</div>
	</div>

	<div class="row" id="kanbanArea">
		<!--  open issue -->
		<div class="columnSection" style="background-color: #e9e9e9;"
			id="openIssue">
			<div class="text-center mt-2 card-header">
				<h4> Open Issue
				<span class="float-right"><i class="fas fa-times cursor_pointer" onclick="closeFn()"></i></span>
				</h4>
			</div>
			<ul id="sortable0" class="connectedSortable columnBody">
				<li class="issuePiece d-none">Item 1</li>
				<li class="issuePiece"></li>
			</ul>
		</div>
		<!--  close issue -->
		<div class="columnSection d-none" style="background-color: #e9e9e9;"
			id="closeIssue">
			<div class="text-center mt-2 card-header">
				<h4>
					Close Issue<span class="float-right"><i
						class="fas fa-times cursor_pointer" onclick="closeFn()"></i></span>
				</h4>
			</div>
			<ul id="sortable00" class="connectedSortable columnBody">
				<li class="issuePiece d-none">Item 1</li>
				<li class="issuePiece"></li>
			</ul>
		</div>
		<!-- 칼럼 -->
		<div class="columnSection">

			<div class="columnTitle text-center mt-2 dropdown">
				<h4>Undefined section
					<a href="javascript:void(0)" data-toggle="dropdown" id="dropdownColBtn" aria-haspopup="true"
						aria-expanded="false" style="float: right"> 
					<i class="fas fa-ellipsis-v fa-sm"></i></a>
					
					<div class="dropdown-menu" aria-labelledby="dropdownColBtn">
						<ul class="list-style-none">
							<li class="pl-3"><a href="#editColumnModal" data-toggle="modal">Edit Column</a></li>
							<li class="pl-3"><a href="#">Remove Column</a></li>
						</ul>
					</div>
				</h4>
			</div>


			<ul id="sortable000" class="connectedSortable columnBody cursor">
				<li class="issuePiece" style="display: none;">Item 1</li>
				<!-- 무조건 있어야함!!! -->

				<li class="issuePiece">
					<div class="dropdown">
						<label> <span class="badgeIcon float-left">Dev</span> <span
							class="issueTitle">Drive : Development</span>
						</label> <a href="javascript:void(0)" data-toggle="dropdown"
							id="dropdownIssueButton" aria-haspopup="true"
							aria-expanded="false" style="float: right"> <i
							class="fas fa-ellipsis-v fa-sm"></i></a>
						<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">
							<ul class="list-style-none">
								<li class="pl-3"><a href="#editIssueModal"
									data-toggle="modal">Edit Issue</a></li>
								<li class="pl-3"><a href="#">Remove Issue</a></li>
							</ul>
						</div>
					</div>
					<div>
						<label> <span class="assigneetitle"><i
								class="fas fa-user-check"></i>&nbsp; Assignee</span> <span
							class="assignee">Chloe</span>
						</label>
					</div>
				</li>


				<li class="issuePiece">
					<div class="dropdown">
						<label> <span class="badgeIcon float-left">Dev</span> <span
							class="issueTitle">Drive : Development</span>
						</label> <a href="javascript:void(0)" data-toggle="dropdown"
							id="dropdownIssueButton" aria-haspopup="true"
							aria-expanded="false" style="float: right"> <i
							class="fas fa-ellipsis-v fa-sm"></i></a>
						<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">
							<ul class="list-style-none">
								<li class="pl-3"><a href="#editIssueModal"
									data-toggle="modal">Edit Issue</a></li>
								<li class="pl-3"><a href="#">Remove Issue</a></li>
							</ul>
						</div>
					</div>
					<div>
						<label> <span class="assigneetitle"><i
								class="fas fa-user-check"></i>&nbsp; Assignee</span> <span
							class="assignee">Chloe</span>
						</label>
					</div>
				</li>
			</ul>
		</div>

		<div class="columnSection">
			<div class="columnTitle text-center mt-2">
				<h4>Undefined section</h4>
			</div>
			<ul id="sortable0000" class="connectedSortable columnBody">
				<li class="issuePiece" style="display: none;">Item 1</li>
				<li class="issuePiece">
					<div class="dropdown">
						<label> <span class="badgeIcon2 float-left">Dev</span> 
						<span class="issueTitle">Drive : Development</span>
						</label> <a href="javascript:void(0)" data-toggle="dropdown"
							id="dropdownIssueButton" aria-haspopup="true"
							aria-expanded="false" style="float: right"> <i
							class="fas fa-ellipsis-v fa-sm"></i></a>
						<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">
							<ul class="list-style-none">
								<li class="pl-3"><a href="#editIssueModal" data-toggle="modal">Edit Issue</a></li>
								<li class="pl-3"><a href="#">Remove Issue</a></li>
							</ul>
						</div>
					</div>
					<div>
						<label> <span class="assigneetitle"><i
								class="fas fa-user-check"></i>&nbsp; Assignee</span> <span
							class="assignee">Chloe</span>
						</label>
					</div>
				</li>
				<li class="issuePiece">
					<div class="dropdown">
						<label> <span class="badgeIcon2 float-left">Dev</span> <span
							class="issueTitle">Drive : Development</span>
						</label> <a href="javascript:void(0)" data-toggle="dropdown"
							id="dropdownIssueButton" aria-haspopup="true"
							aria-expanded="false" style="float: right"> <i
							class="fas fa-ellipsis-v fa-sm"></i></a>
						<div class="dropdown-menu" aria-labelledby="dropdownIssueButton">
							<ul class="list-style-none">
								<li class="pl-3"><a href="#editIssueModal"
									data-toggle="modal">Edit Issue</a></li>
								<li class="pl-3"><a href="#">Remove Issue</a></li>
							</ul>
						</div>
					</div>
					<div>
						<label> 
							<span class="assigneetitle">
							<i class="fas fa-user-check"></i>&nbsp; Assignee</span> 
							<span class="assignee">Chloe</span>
						</label>
					</div>
				</li>
			</ul>
		</div>

	</div>
</div>

<!-- add issue modal -->
<jsp:include page="modal/addIssue.jsp" />
<jsp:include page="modal/editIssue.jsp" />
<jsp:include page="modal/addColumn.jsp" />
<jsp:include page="modal/editColumn.jsp" />
<jsp:include page="modal/addLabel.jsp" />