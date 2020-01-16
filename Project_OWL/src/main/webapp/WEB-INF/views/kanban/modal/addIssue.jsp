<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
 $(function() {
	$('#AssigneesBtn').click(function () {
		console.log('클릭된다');	
		$.ajax ({
			url : 'Assignees.do',
			success : function(data) {
				console.log('success in');
				console.log(data);
			}, error : function() {
				console.log('error in');
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
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-8">
						<div class="form-group">
							<input type="text" class="form-control input-default" placeholder="Issue Title">
						</div>
						<div class="form-group">
							<textarea class="form-control bg-light" rows="10" cols="60" placeholder="Issue Content"></textarea>
							<input type="file">
						</div>
					</div>
					<div class="col-4">
					<div class="form-group">
					<div class="row">
						<div class="col-4">Assignees</div>	
						<div class="col-8"><button class="btn-link" id="AssigneesBtn">No one - assigned</button></div>								
						
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Label</div>	
						<div class="col-8"><i class="fas fa-plus"></i></div>									
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Column</div>	
						<div class="col-8"><i class="fas fa-plus"></i></div>	
						</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Due Date</div>	
						<div class="col-8"><i class="fas fa-plus"></i></div>	
						</div>
					</div>
				</div>

			</div>
					<div class="modal-footer text-right">
					<button type="button" class="btn btn-primary">Save changes</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
		</div>
	</div>
</div>
</div>

