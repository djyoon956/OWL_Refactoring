<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>

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

<div id="addColumnModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">New Column</h4>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body" style="margin-left: 10px">
				<form action="InsertColumn.do" method="post">
					<input type="hidden" id="projectIdx" name="projectIdx" value="${project.projectIdx}">
					<div class="row">
						<h5>Column name</h5>
						<input type="text" class="form-control input-default" placeholder="Issue Title" name="colname" id="colname">
					</div>
					<div class="modal-footer text-right">
						<input type="button" class="btn btn-primary" id="InsertColumnBtn" value="Create Column">
						<button type="button" class="btn btn-primary" data-dismiss="modal" >Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


