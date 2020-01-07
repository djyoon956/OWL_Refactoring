<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="myProfileSetModal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title boldselect">
					<i class="far fa-sticky-note"></i> &nbsp;&nbsp;My Profile Setting
				</h4>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
			 <div class="default-tab">
			 
			 <ul class="nav nav-tabs mb-3" role="tablist">
                                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#profile">My profile</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#deleteAccount">Delete account</a>
                                        </li>

                                    </ul>
			 
			 
			 
			                                     <div class="tab-content">
			 
                    <div class="col-lg-12 tab-pane fade show active" id="profile" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
<!--                                 <h4 class="card-title">Vertical Form</h4>
 -->                                <div class="basic-form">
                                    <form action="Login.do" method="post">
                                        <div class="form-row">
                                        <div class="form-group col-md-6">
                                           <label>Your photo</label> <br>
                                          <img src="resources/images/users/8.jpg" class="rounded-circle" alt="" id="userImg">
                                             </div>

                                          <input type="file">
                                             
                                            <div class="form-group col-md-6">
                                                <label>Your name</label>
                                                <input type="text" class="form-control input-default" placeholder="name">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Your email</label>
                                                <input type="text" class="form-control input-default" placeholder="email adrress">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                        <div class="form-group  col-md-6">
                                            <label>Password</label>
                                            <input type="text" class="form-control input-default" placeholder="password">
                                        </div>
                                        <div class="form-group  col-md-6">
                                            <label>Password check+</label>
                                            <input type="text" class="form-control input-default" placeholder="password">
                                        </div>
										</div>
                                        <button type="submit" class="btn btn-dark">Save Change</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

<!-- 탈퇴시 탈퇴정보 적어주고, 마지막에 비밀번호 확인 후 탈퇴 ok  -->
                    <div class="col-lg-12 tab-pane fade" id="deleteAccount">
                        <div class="card">
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="Login.do" method="post">
                                        <div class="form-row">
                                        <div class="form-group col-md-6">
                                           <label>Your photo</label> <br>
                                          <img src="resources/images/users/8.jpg" class="rounded-circle" alt="" id="userImg">
                                             </div>
                                          <input type="file">
 
                                        </div>

                                        <button type="submit" class="btn btn-dark">Save Change</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


</div>

</div>
			</div>
		</div>
	</div>
</div>


