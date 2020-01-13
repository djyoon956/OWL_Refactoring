<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <div class="modal fade" id="editProject">
         <div class="modal-dialog modal-dialog-centered" role="document">
	             <div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">
						<i class="far fa-sun"></i> 프로젝트 환경설정
					</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
 		             <h5>Color</h5>
 		             <input type="hidden" name="projectIdx"  id="projectIdx"> 
		             <input type="text" id="nowColor" class="complex-colorpicker form-control" value="">
                     <br>                        
                     <br>                
                     <h5>Favorite</h5>
                     <div style="position:relative;">
                     <p>해당 프로젝트를 즐겨찾기에 추가하시겠습니까?</p>
					        <div class="but r" id="but-2" style="float:right;   position:absolute; top: 0px; right: 0px;">
					          <input type="checkbox" class="chbox" name="chbox" onclick="EditProject(this)">
					          <div class="knobs"></div>
					          <div class="layer"></div>
					        </div>
		             </div>
		             <br>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-dismiss="modal" id="editBtn">적용하기</button>
                 </div>
             </div>
         </div>
     </div>