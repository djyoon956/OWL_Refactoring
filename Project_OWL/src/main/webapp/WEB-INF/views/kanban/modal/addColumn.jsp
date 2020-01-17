<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Summernote -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<script>
 $(function() {

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

<div id="addColumnModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">New Column</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<form id="myForm" action="InsertIssue.do" method="post" enctype="multipart/form-data">
			    <input type="hidden" id="projectIdx" name="projectIdx" value="${project.projectIdx}">
 				<div class="row">
					<div class="col-4">
						Column name
					</div>
					<div class="col-8">
						<div class="form-group">
							<input type="text" class="form-control input-default" placeholder="Issue Title" name="issueTitle" id="issueTitle">
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


