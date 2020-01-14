<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="addIssueModal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title boldselect">
					<i class="far fa-sticky-note"></i> &nbsp;&nbsp;I s s u e
				</h4>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="Login.do" method="post" class=" mb-3 login-input">
					<div class="form-group row">
						<div class="col-2">Issue name</div>
						<div class="col-10">
							<input type="text" class="form-control input-default">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-2">Column name</div>
						<div class="col-10">
							<select class="form-control" id="val-skill" name="val-skill">
								<option value="">Please select</option>
								<option value="to-do">to-do</option>
								<option value="done">done</option>
								<option value="doing">doing</option>
								<option value="delay">delay</option>
								<option value="development">development</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-2">Assignee</div>
						<div class="col-10">
							<i class="far fa-user-circle"></i> Unassigned
						</div>
					</div>
					<div class="form-group row">
						<div class="col-2">Due date</div>
						<div class="col-10">
							
                              <input type="text" class="form-control" placeholder="YYYY-MM-DD" id="issueDate"  data-dtp="dtp_l9lmR">
                              <!-- 								<span class="input-group-append"> 
								<span class="input-group-text"> 
								<i class="mdi mdi-calendar-check"></i></span></span> -->
							
						</div>
					</div>
					<div class="form-group row">
						<div class="col-2">Projects</div>
						<div class="col-10">
							<select class="form-control" id="val-skill" name="val-skill">
								<option value="">Please select</option>
								<option value="1project">1project</option>
								<option value="2project">2project</option>
								<option value="3project">3project</option>
								<option value="4project">4project</option>
								<option value="5project">5project</option>
							</select>
						</div>
					</div>
					<input type="submit" class="btn login-form__btn submit w-100" value="Enroll">
				</form>

				<div class="modal-content" style="background-color: #f0f3f7">
					<div class="modal-header">
						<h5 class="modal-title" style="color: #336699">
							<i class="far fa-comment"></i>&nbsp;&nbsp;message
						</h5>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="message-text" class="col-form-label boldselect">Message:</label>
								<textarea class="form-control" id="message-text"
									style="overflow-y: scroll; width: 100%"
									placeholder="Ask a question or post an update.."></textarea>
								<input type="file">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">Comment</button>
							</div>


							<div class="card-body" style="overflow-y: scroll" id="infolist">
								<div class="media media-reply">
									<div class="media mt-3">
										<img class="mr-3 circle-rounded circle-rounded" src="/src/main/webapp/resources/images/avatar/4.jpg" width="50" height="50"
											alt="Generic image">
										<div class="media-body">
											<div class="d-sm-flex justify-content-between mb-2">
												<h5 class="mb-sm-0">Cindy
												<small class="text-muted ml-3">about 3 days ago</small>
												</h5>
											</div>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
												metus scelerisque ante sollicitudin. Cras purus odio,
												vestibulum in vulputate at, tempus viverra turpis. </p>
										</div>
									</div>
								</div>
								
								
								
								<div class="media media-reply">
									<div class="media mt-3">
										<img class="mr-3 circle-rounded circle-rounded"
											src="main/webapp/images/avatar/4.jpg" width="50" height="50"
											alt="Generic image">
										<div class="media-body">
											<div class="d-sm-flex justify-content-between mb-2">
												<h5 class="mb-sm-0">Cindy
												<small class="text-muted ml-3">about 3 days ago</small>
												</h5>
											</div>
											<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
												metus scelerisque ante sollicitudin. Cras purus odio,
												vestibulum in vulputate at, tempus viverra turpis. Fusce
												condimentum nunc ac nisi vulputate fringilla. Donec lacinia
												congue felis in faucibus.</p>
										</div>
									</div>
								</div>
								
								
								

								
		
								
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>