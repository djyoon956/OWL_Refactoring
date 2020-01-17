<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id="makeLabel" class="modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Make Label</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<form action="makeLabel" method="post" enctype="multipart/form-data">
			    <input type="hidden" id="projectIdx" name="projectIdx" value="${project.projectIdx}">
 				<div class="row">
 				<div class="col-4"> 
 				Label name
				 <input type="text" id="labelName" name="labelName" class=" form-control" >
				</div>
				<div class="col-4"> 
				Color
				 <input type="text" id="myColor" name="projectColor" class="complex-colorpicker form-control" value="#326295">
				</div>
				 <div class="col-4"> 
				 &nbsp;&nbsp;
				 <button type="button" class="btn btn-primary" data-dismiss="modal">Create label</button>
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


