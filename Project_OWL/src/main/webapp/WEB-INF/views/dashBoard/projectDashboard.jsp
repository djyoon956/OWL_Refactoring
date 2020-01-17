<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <!-- CONTENT MAIN -->
            <div class="container-fluid" style="padding:20px">
                <div class="row">
                <!--  my task -->
                    <div class="col-lg-6">
                        <div class="card dash_shadow dash_radius">
                         
                            <div class="card-body">
                            <h4 class="card-title">Task</h4>
                                <div class="d-md-flex align-items-center table-responsive">
                                  
		                             <table class="table table-striped table-bordered text-center" id="dashboardTable">
		                                <thead>
		                                    <tr>
		                                        <th scope="col">Project</th>
		                                        <th scope="col">Subject</th>
		                                        <th scope="col">Due Date</th>
		                                        <th scope="col">Priority</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                        <td>판매계획</td>
		                                        <td>로그인 view 구현</td>
		                                        <td class="text-danger">today</td>
		                                        <td><span class="badge badge-pill badge-danger font-14">high</span></td>
		                                    </tr>
		                                    <tr>
		                                        <td>판매계획</td>
		                                        <td>공지사항 게시판 기능 구현</td>
		                                        <td class="text-success">tomorrow</td>
		                                        <td><span class="badge badge-pill badge-warning font-14">low</span></td>
		                                    </tr>
		                                    <tr>
		                                        <td>후기관리</td>
		                                        <td>단체 채팅 기능 구현</td>
		                                        <td>1/18</td>
		                                        <td><span class="badge badge-pill badge-success font-14">medium</span></td>  
		                                    </tr>
		                                    <tr>
		                                        <td>후기관리</td>
		                                        <td>캘린더 뷰 구현</td>
		                                        <td>1/30</td>
		                                        <td><span class="badge badge-pill badge-warning font-14">low</span></td>
		                                    </tr>
		                                </tbody>
		                            </table>
                                </div>
                            </div>
                        </div>
                    <!-- </div>  -->
                    <!-- calendar -->
                     <!-- <div class="col-lg-6"> -->
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                            <h4 class="card-title">Calendar</h4>
                                <div class="d-md-flex align-items-center">
                                   
                                    <div id="dashCalendar" class="w-100 h-100"></div>
                                </div>
                            </div>
                        </div>
                      </div> 
               <!--  </div> -->
               <!--  <div class="row"> -->
                <!--  graph -->
              		 <div class="col-lg-6"> 
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                              <h4 class="card-title">Progress</h4>
                                <div class="align-items-center">
                                   <div class="w-100 pt-3">
                                    <div class="d-flex no-block align-items-center">
                                        <span>구매전략</span>
                                        <div class="ml-auto">
                                            <span>80%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 80%; background-color: #ccccff" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                 <div class="w-100 pt-3">
                                    <div class="d-flex no-block align-items-center">
                                        <span>판매계획</span>
                                        <div class="ml-auto">
                                            <span>34%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 34%; background-color:  #ffb1b9" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                 <div class="w-100 pt-3">
                                    <div class="d-flex no-block align-items-center">
                                        <span>후기관리</span>
                                        <div class="ml-auto">
                                            <span>95%</span>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 95%; background-color:lightgray;" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                              </div>
                            </div>
                        </div>
                        
                        
                    <!-- </div> -->
                 <!-- timeline  -->
                  <!-- <div class="col-lg-6"> -->
                        <div class="card dash_shadow dash_radius">
                            <div class="card-body">
                           	  <h4 class="card-title">Timeline</h4>
                                <div class="d-md-flex align-items-center">
								<ul class="timeline w-100">
								<li>
									<p class="float-right" >Mon, 20 Jan, 2020</p>
									<span class="badge badge-pill font-14 font-medium mb-1" style="background-color: #ffb1b9;">판매계획</span>
									<p>로그인 view 구현</p>
									<p>로그인 기능 구현</p>
								</li>
								<li>
									<p class="float-right">Tue, 21 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ffb1b9">판매계획</span>
										<p>공지사항 게시판 기능 구현</p>
										<p>공지사항 게시판 view 구현</p>
									<span class="badge badge-pill font-14 mb-1 mt-1 font-medium" style="background-color: lightgray">후기관리</span>
										<p>단체 채팅 view 구현</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ccccff">구매전략</span>
										<p>qna 게시판 view 구현</p>
								</li>
								<li>
									<p class="float-right">Wed, 22 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ccccff">구매전략</span>
										<p>qna 게시판 기능 구현</p>
								</li>
								<li>
									<p class="float-right">Thu, 23 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: lightgray">후기관리</span>
										<p>대시보드 view 구현</p>
								</li>
								<li>
									<p class="float-right">Fri, 24 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ccccff">구매전략</span>
										<p>탈퇴 view 구현</p>
								</li>
								<li>
									<p class="float-right">Sat, 25 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium mt-1" style="background-color: #ffb1b9">판매계획</span>
										<p>채팅 view 구현</p>
								</li>
								<li>
									<p class="float-right">Sun, 26 Jan, 2020</p>
									<span class="badge badge-pill font-14 mb-1 font-medium" style="background-color: lightgray">후기관리</span>
										<p>단체 채팅 기능 구현</p>
									<span class="badge badge-pill font-14 mb-1 font-medium" style="background-color:#ccccff">구매전략</span>
										<p>대시보드 기능 구현</p>
								</li>
							</ul>
                                    <!-- 끝 -->
                                </div>
                            </div>
                        </div>
                       </div>
                   </div>
                 </div>
            	<!-- </div> -->