<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id="confirmIssueModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Comfirm Issue</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<!-- <form action="InsertIssue.do" method="post" enctype="multipart/form-data" id="addIssueForm">--> 				
			<div class="row">
					<div class="col-8">
						<div class="form-group">
							title을 여기다 적어요
						</div>
						<div class="form-group">
						<div class="contentbox">여기다 내용을 적어요.</div>
						
						</div>
						<div class="form-group">
							<i class="far fa-file-alt fa-lg" ></i> 여기다 파일명을 적어요.jpg,  또적어요.pdf
						</div>
					</div>
					<div class="col-4">
					<div class="form-group mb-3">
					<div class="row">
						<div class="col-4">Creator</div>	
						<div class="col-8">
						nyangkk@naver.com
						</div>
					
					</div>
						</div>
						<hr>
					<div class="form-group">
					<div class="row">
						<div class="col-4">Assignee</div>	
						<div class="col-8">
						jelee1223@naver.com
						</div>
					
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Label</div>	
						<div class="col-8">
						<span class="badgeIcon float-left" style="background-color: yellow">view</span>
						</div>									
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Priority</div>	
						<div class="col-8">
							urgent
						</div>									
					</div>
						</div>
						<hr>
					<div class="form-group">
						<div class="row">
						<div class="col-4">Due Date</div>	
						<div class="col-8">                                
                          2020-02-12
                         </div>	
					</div>
					</div>
				</div>
			</div> 
					<div class="modal-footer text-right">
					<input type="button" class="btn btn-primary" id="ComfirmBtn" value="Comfirm">
					<input type="button" class="btn btn-primary" id="RejectBtn" value="Reject">
					
					<!-- <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button> -->
				</div>
			<!-- </form> -->
		</div>
	</div>
</div>
</div>


