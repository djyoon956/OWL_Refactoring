<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Summernote -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

<script>

 var ordernum = 1; 
	

 $(function() {

	 let selectoption = '<option value="">Select</option>';
	
/*datwpicker*/
	 $('.mydatepicker').datepicker();
		 $('#datepicker-autoclose').datepicker({
			 dateFormat: 'yy-mm-dd' ,
	   		  autoclose: true,
	    	  todayHighlight: true
		 }); 
		
		/*Summer Note*/
		 $('#content').summernote({
		        placeholder: 'Write Issue content',
		        height: 120,
		        toolbar: [
		            ['style', ['bold', 'italic', 'underline', 'clear']],
		            ['font', ['strikethrough', 'superscript']],
		            ['fontsize'],
		            ['color'],
		            ['para', ['ul', 'ol', 'paragraph']],
		        ]
		      });

			
			$("#InsertIssueBtn").on("click", function () {		
			console.log('InsertIssueBtn 클릭되니1');
 				console.log('InsertIssueBtn 클릭되니1');
 				/* 			console.log('$("#projectIdx").val()' + '${project.projectIdx}');
				console.log('$("#issueTitle").val()' + $('#issueTitle').val());
				console.log('$("#content").summernote("code")' + $('#content').summernote('code'));
				console.log(' $("#assigned").val()' +  $('#assigned').val());
				console.log('$("#labelIdx").val()' + $('#labelIdx').val());
				console.log(' $("#dueDate").val()' + $('#datepicker-autoclose').val()); 
				console.log($('#multipartFile').val()); */

			    let formData = new FormData();
			    formData.append("projectIdx",'${project.projectIdx}');
			    formData.append('issueTitle',$('#issueTitle').val());
			    formData.append('content', $('#isContent').summernote('code'));
			    formData.append('orderNum', ordernum++);
			    formData.append('priorityCode', $('#priorityCode').val());			    
			    formData.append('assigned', $('#assigned').val());
			    formData.append('labelIdx', $('#labelIdx').val());
			    formData.append('dueDate', $('#datepicker-autoclose').val());
			    formData.append('colIdx', '-1');
			    $.each($("#multipartFiles")[0].files, function(i, file) {
			    	formData.append('multipartFiles', file);
			    }); 


				let istitle = $('#issueTitle').val();
				let isassignee = $('#assigned').val();
				
				$.ajax({
					url : 'InsertIssue.do',
			        type: "POST",
					enctype :'multipart/form-data',
					data : formData,
			        processData: false,
			        contentType: false,
			        cache: false,
			        timeout: 600000,
			        success: function (data) {
			        	console.log("ajax in");
			        	console.log(data);

			        	//console.log(data.labelName);
			        	//console.log(data.labelColor);
			        	
	 		        	if(data != null){
			        		successAlert("Issue 추가 완료");
			        		addKanbanIssue('-1', data);
			        		
			        	}else{
			        		errorAlert("Issue 추가 실패");
			        	}

	 		       	$( ".sortableCol").sortable({
				        connectWith: ".connectedSortable",
				        dropOnEmpty: true       
				     }).disableSelection(); 
			        },
			        error: function (e) {
			        	errorAlert("Issue 추가 실패");
			        }
			    });
		 	});




	 });

</script>

<style>
.btn-link {
	display: inline-block;
    padding: 0;
    font-size: inherit;
    color: #0366d6;
    text-decoration: none;
    white-space: nowrap;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: initial;
    border: 0;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}

</style>
<div id="addIssueModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">New Issue</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<form action="InsertIssue.do" method="post" enctype="multipart/form-data" id="addIssueForm">
			    <input type="hidden" id="projectIdx" name="projectIdx" value="${project.projectIdx}">
 				<div class="row">
					<div class="col-8">
						<div class="form-group">
							<input type="text" class="form-control input-default" placeholder="Issue Title" name="issueTitle" id="issueTitle">
						</div>
						<div class="form-group">
 							 <textarea class="form-control bg-light" rows="10" cols="50" placeholder="Issue Content" id="isContent" name="content"></textarea>
							 <input type="file" name="multipartFiles" id="multipartFiles" multiple="multiple"> 
						</div>
					</div>
					<div class="col-4">
					<div class="form-group">
					<div class="row">
						<div class="col-4">Assignees</div>	
						<div class="col-8">
							<select class="select2 form-control custom-select" name="assigned" id="assigned">
								<option value="">Select Assignee</option>
								<option value="Cathy">Cathy</option>
								<option value="Cindy">Cindy</option>
								<option value="Colin">Colin</option>
								<option value="Chloe">Chloe</option>
							</select>
						</div>
					
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Label</div>	
						<div class="col-8">
							<select class="select2 form-control custom-select" name="labelIdx" id="labelIdx">
								
							</select>
						</div>									
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Priority</div>	
						<div class="col-8">
							<select class="select2 form-control custom-select" name="priorityCode" id="priorityCode">
								<option value="" id="">Select</option>
								<option value="LOW">low</option>
								<option value="MEDIUM">medium</option>
								<option value="HIGH">high</option>
								<option value="URGENT">urgent</option>
								
							</select>
						</div>									
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Due Date</div>	
						<div class="col-8">                                
                           <input type="text" class="form-control" id="datepicker-autoclose" placeholder="yyyy-mm-dd" name="dueDate" >
                         </div>	
					</div>
					</div>
				</div>
			</div> 
					<div class="modal-footer text-right">
					<input type="button" class="btn btn-primary" id="InsertIssueBtn" value="Save changes">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>


