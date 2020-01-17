<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>

.badgeIcon {
	display : inline-block;
	background-color: #F4D452;
	font-size : small;
	font-weight : bold;
	padding:5px;
	color: black;
	margin-right: 5px;
	border-radius: 2px;
}

.floatRight {
	float: right;
	color:#326295;
}

.floatRight:hover {
	color :#326295;
}

.issuePiece:hover {
	box-shadow: 1.5px 1.5px 1.5px 1.5px #B4B1B1;
}

.badgeIcon2 {
	display : inline-block;
	background-color: #EC6550;
	font-size : small;
	font-weight : bold;
	padding:5px;
	color: black;
	margin-right: 5px;
	border-radius: 2px;
}

.issueTitle {
	font-family:"Nunito Sans", sans-serif;
	font-size: 16px;
	font-weight: 500;
}

.issuePiece {
    border: 2px solid #eeee;
	background-color : #fff;
	margin: 5px 10px 10px 10px;
	padding: 15px 10px 15px 10px;
	font-size: 1.2em;
	width: 280px;
	height : 80px;
	border-radius: 3px;
	cursor:move;
}

.columnBody {

    border: 2px solid #ECE7E2;
	width: 310px;
	min-height: 20px;
	max-height : 550px;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin: 10px;
	border-radius: 3px;
	overflow-y :auto;
	background-color:#ECE7E2;
}


.columnBody:hover {
	border: 2px solid #DAD5D0;
}

.columnTitle {
	border : 4px solid #fff;
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
 height: 500px; 
 overflow-y: scroll;
 display: flex;
 flex-direction: row;
 flex-wrap: nowarp;
 flex-flow: row;
}

</style>
  <script>
  $(function(){
	  var n = 3;
	  
    $('#addIssue').click (function() {
       console.log('addIssue click in');
		
		let newIssue = "";
		newIssue  += '<li class="issuePiece">';
		newIssue  += '<div>';
		newIssue  += '<label>';
		newIssue  += '<span class="badgeIcon2 float-left">Dev</span>';
		newIssue  += '<span class="issueTitle">Drive : Development</span>';
		newIssue  += '</label>'
		newIssue  += '<a style="float:right;" data-toggle="collapse" href="#detail">'
		newIssue  += '<i class="fas fa-ellipsis-v fa-sm"></i></a>'
		newIssue  += '</div>';
		newIssue  += '</li>';
       
		$('#sortable1').append(newIssue);
        });


    $( "#sortable1, #sortable2" ).sortable({
        connectWith: ".connectedSortable",
        dropOnEmpty: false        
      }).disableSelection();

    $('#addColumn').click(function() {
		var value =  "sortable" + n++;

		var result = "";
    		result += '<div class="columnSection">';
    		result += '<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>';
        	result += '<ul id="' + value + '"class="connectedSortable columnBody cursor">';
    		result += '<li class="issuePiece" style="display:none;">Item 1</li>';
        	result += '</ul></div>';

        console.log("result" + result);	
		$('#kanbanArea').append(result);

        console.log(value);
       	sortableFn(value);
        });

    function sortableFn (value)  {
       var value1 ='#' + value;
        $( value1 ).sortable({
            connectWith: ".connectedSortable",
            dropOnEmpty: false        
          }).disableSelection();
        }
    
  });
  </script>

<div id="totalbody" class="container-fluid mt-3">
	<div class="row">
	<div class="col-8" style="margin-left:30px;">
	<a href="#" data-toggle="modal" data-target="#addIssueModal">
	 <button id="addIssue" class="btn btn-primary"><i class="fas fa-italic"></i>&nbsp;New Issue</button>
	</a>	
	
	<button id="addColumn" class="btn btn-primary"><i class="fas fa-columns"></i>&nbsp;New Column</button>
	</div>
	<div class="col-2">
	<a href="#" data-toggle="modal" data-target="#labelEditModal">
		<button class="btn btn-primary"><i class="fas fa-tag"></i>&nbsp;Make Label</button>
	</a>	
	</div>
	</div>

	<div class="row" id="kanbanArea">
		<div class="columnSection">
				<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable1" class="connectedSortable columnBody cursor">
			    	<li class="issuePiece" style="display:none;">Item 1</li>   <!-- 무조건 있어야함!!! -->
					<li class="issuePiece">
						<div class="dropdown">
							<label>
							<span class="badgeIcon float-left">Dev</span>
							<span class="issueTitle">Drive : Development</span>
							</label>
							<a style="float:right;" data-toggle="dropdown" id="detailMenu" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-ellipsis-v fa-sm"></i></a>
						</div>
							<div style="margin-left: 60%;" class="dropdown-menu" aria-labelledby="detailMenu">
								<ul id="detail" class="collapse">
									<li>Edit Issue</li>
									<li>Remove Issue</li>
								</ul>
							</div>
					</li>
					<li class="issuePiece">
						<div>
							<label>
							<span class="badgeIcon float-left">Dev</span>
							<span class="issueTitle">Drive : Development</span>
							</label>
							<a style="float:right;" data-toggle="collapse" href="#detail">
							<i class="fas fa-ellipsis-v fa-sm"></i></a>
						</div>
					</li>
					
					
					
			</ul>
		</div>

		<div class="columnSection">
			<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable2" class="connectedSortable columnBody">
				<li class="issuePiece" style="display:none;">Item 1</li>
				<li class="issuePiece">
						<div>
							<label>
							<span class="badgeIcon2 float-left">Dev</span>
							<span class="issueTitle">Drive : Development</span>
							</label>
							<a style="float:right;" data-toggle="collapse" href="#detail">
							<i class="fas fa-ellipsis-v fa-sm"></i></a>
						</div>
					</li>
				<li class="issuePiece">
						<div>
							<label>
							<span class="badgeIcon2 float-left">Dev</span>
							<span class="issueTitle">Drive : Development</span>
							</label>
							<a style="float:right;" data-toggle="collapse" href="#detail">
							<i class="fas fa-ellipsis-v fa-sm"></i></a>
						</div>
					</li>
			</ul>
		</div>
		
	</div>
</div>

<!-- add issue modal -->
<jsp:include page="modal/addIssue.jsp" />
<jsp:include page="modal/labelEdit.jsp" />