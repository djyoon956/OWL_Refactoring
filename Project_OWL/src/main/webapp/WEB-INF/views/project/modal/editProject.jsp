<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.knobs, .layer
{
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
}

.but
{
    position: relative;
    top: 50%;
    width: 80px;
    height: 40px;
    margin: -20px auto 0 auto;
    overflow: hidden;
}
z
.but.r, .but.r .layer
{
    border-radius: 100px;
}

.but.b2
{
    border-radius: 1px;
}

.chbox
{
    position: relative;
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
    opacity: 0;
    cursor: pointer;
    z-index: 3;
}

.knobs
{
    z-index: 2;
}

.layer
{
    width: 100%;
    background-color: #fcebeb;
    transition: 0.3s ease all;
    z-index: 1;
}


/* Button 2 */
#but-2 .knobs:before, #but-2 .knobs:after
{
    content: 'Y';
    position: absolute;
    top: 10px;
    left: 4px;
    width: 20px;
    height: 10px;
    color: #fff;
    font-size: 15px;
    font-weight: bold;
    text-align: center;
    line-height: 0;
    padding: 9px 4px;
    background-color: #F44336;
    border-radius: 50%;
    transition: 0.3s ease all;
}

#but-2 .knobs:after
{
    content: 'Y';
}

#but-2 .knobs:before
{
    content: 'N';
}

#but-2 .knobs:after
{
    right: -28px;
    left: auto;
    background-color: #03A9F4;
}

#but-2 .chbox:checked + .knobs:before
{
    left: -28px;
}

#but-2 .chbox:checked + .knobs:after
{
    right: 4px;
}

#but-2 .chbox:checked ~ .layer
{
    background-color: #ebf7fc;
}
</style>
   <div class="modal fade" id="editProject">
         <div class="modal-dialog modal-dialog-centered" role="document">
	             <div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title">
						<i class="far fa-sun"></i> 프로젝트 환경설정
					</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
					        <div class="but r but-2" id="" style="float:right;   position:absolute; top: 0px; right: 0px;">
					          <input type="checkbox" class="chbox" name="chbox">
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