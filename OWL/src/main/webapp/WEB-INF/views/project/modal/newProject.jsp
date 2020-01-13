<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="modal fade" id="newProject">
         <div class="modal-dialog modal-dialog-centered" role="document">
             <div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					<i class="fas fa-desktop"></i> 프로젝트 생성
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
                 	 <h5>Name</h5>
                     <input type="text" id="projectTitle" style="width:100%; height: 40px;">
                     <br>
                     <br>
 		             <h5>Color</h5>
 		             <!-- <span style="float: right; font-size: 12px; color: grey;">원하는 색으로 프로젝트의 색상을 지정해주세요.&emsp;</span> -->
		             <input type="text" class="complex-colorpicker form-control" value="">
                     <br> 
                     <br> 
                     <h5>Period</h5>  
			          <div class="row form-group">
			                 <div class="col-md-5" style="padding-right: 0px;">
			                     <input type="text" class="form-control" placeholder="Start Date" id="startDate" data-dtp="dtp_l9lmR">
			                 </div>
			                 <div class="col-md-2 text-center" style="padding: 0px;">
			                 		<span>~</span>
			                 </div>
			                 <div class="col-md-5" style="padding-left: 0px;">
			                     <input type="text" class="form-control" placeholder="End Date" id="endDate" data-dtp="dtp_l9lmR">
			                 </div>
			          </div>                         
                     <br>                                      
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="InputProject()">생성하기</button>
                 </div>
             </div>
         </div>
     </div>