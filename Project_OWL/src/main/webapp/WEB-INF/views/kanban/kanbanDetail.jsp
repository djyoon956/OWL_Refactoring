<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

</style>
<script>
$(function() {
	$("#issueReply").summernote({
		height: 100,
        placeholder: "Leave a comment",
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']]
        ]
	});
});
</script>
<div class="container-fluid mt-2" style="padding:25px;">
	<div class="row">
		<div class="col-8">
		<div class="card">
			<div class="card-title mb-0 ml-2">
				<div><h2>Drive Development</h2></div>
			</div>
		<hr class="mt-1"> 
			<div class="card-body mt-0 mb-0" style="border: 1px solid; border-color:#e9e9e9;">
				<p>Task </p>
				<p>- 드라이브 디폴트 폴더 생성</p>
				<p>- 계층형 구조 </p>
				<p>- 휴지통 기능</p>
			</div>
			<div class="card-footer" style="padding:6px;border: 1px solid; border-color:#e9e9e9;"><a href="#"><i class="far fa-file mr-1"></i>owl_테이블 쿼리.txt</a></div>
			<div class="card-footer" style="padding:6px;border: 1px solid; border-color:#e9e9e9;"><a href="#"><i class="far fa-file mr-1"></i>owl_발표자료.ppt</a></div>
			<div class="card-body mt-0" style="border: 1px solid; border-color:#e9e9e9;">
              <div class="d-md-flex align-items-center">
				<ul class="timeline w-100">
				<li>
					<p> Crystal opened this issue 1/11</p>
				</li>
				<li>
					<p>1/12 edited </p>
				</li>
				<li>
					<p>1/14 edited</p>
				</li>
				<li>
					<p>1/16 moved this issue from 'to do' to 'done'</p>
				</li>
			</ul>
             <!-- 끝 -->
             </div>
          </div>
          <div class="card-body mt-0" style="border: 1px solid; border-color:#e9e9e9;">
          	Cindy : 화이띵  
          </div>
        <div class="card-body mt-0" style="border: 1px solid; border-color:#e9e9e9;">
          		<div class="col-12" style="border: 1px solid; border-color:#e9e9e9;">
          		 	<textarea class="form-control bg-light" rows="10" cols="10" placeholder="Leave a comment" name="" id="issueReply"></textarea>
          		</div>
          		<div class="col-2">
          			<button class="btn btn-secondary">comment</button>
          		</div>
          </div>
			<!--  카드 끝  -->
		</div>
		</div>
		<div class="col-4">
		<div class="form-group">
		<div class="row">
			<div class="col-4">Assignees
			</div>	
			<div class="col-8">
				Chloe
			</div>
		
		</div>
			</div>
			<hr>
		<div class="form-group">
			<div class="row">
			<div class="col-4">Label</div>	
			<div class="col-8" >
				<div style="background-color: #F4D452;padding:2px; padding-left:5px;">Dev</div>
			</div>									
		</div>
			</div>
			<hr>
		<div class="form-group">
			<div class="row">
			<div class="col-4">Priority</div>	
			<div class="col-8">
				<span class="badge badge-pill badge-danger font-14">High</span>
			</div>									
		</div>
			</div>
			<hr>
		<div class="form-group">
			<div class="row">
			<div class="col-4">Due Date</div>	
			<div class="col-8"><i class="fas fa-calendar mr-1"></i>
				     2020/01/20                        
            </div>	
		</div>
		</div>
			<hr>
		<div class="form-group">
			<div class="row">
				  <button class="btn w-100"><i class="fas fa-check mr-2 text-danger"></i>Close issue</button>                    
			</div>
		</div>
	</div>
</div>
<div class="text-center"><button class="btn btn-primary mr-1">목록</button>
<button class="btn btn-primary ml-1">수정</button>
</div>
</div>