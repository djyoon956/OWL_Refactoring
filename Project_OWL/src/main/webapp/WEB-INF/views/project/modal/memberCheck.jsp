<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	 .roleBadge{
	 	font-weight: bold; 
	   	width: 63px; 
	   	font-size :13px;
	   	height : 25px;
	   	border-radius: 10rem;
	   	padding: 0.20em 0.6em;
	   	line-height: normal;
	   	display: inline-block;
	   	text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	}
	
	.roleBadge.pm{
	    color: #fff;
	   	background-color: #2255a4;
	}
	.pm:after {
		content: "PM";
	}
	
	.roleBadge.member{
	 	color: #212529;
	    background-color: #ffb848;
	}
	.member:after {
		content: "Member";
}
</style>

<div id="memberCheckModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					<i class="icon-settings mr-2"></i>프로젝트 멤버
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body modal-scroll mx-3"> 
				<div>
					<ul class="list-style-none assignedto text-center" id="projectMemebers">
						<li class="mt-3">
							<img class="rounded-circle" width="40" src="resources/images/login/profile.png" alt="user">
							<label class="ml-3">윤다정 (dbsekwjdaa@naver.com)</label>
							<span class="ml-5  roleBadge pm" ></span>
						</li>
						<li class="mt-3">
							<img class="rounded-circle" width="40" src="resources/images/login/profile.png" alt="user">
							<label class="ml-3">윤다정 (dbsekwjdaa@naver.com)</label>
							<span class="ml-5 roleBadge member"> </span>
						</li>
						<li class="mt-3"> 
							<img class="rounded-circle" width="40" src="resources/images/login/profile.png" alt="user">
							<label class="ml-3">윤다정 (dbsekwjdaa@naver.com)</label>
							<span class="ml-5 roleBadge member">  </span>
						</li>
						<li class="mt-3">
							<img class="rounded-circle" width="40" src="resources/images/login/profile.png" alt="user">
							<label class="ml-3">윤다정 (dbsekwjdaa@naver.com)</label>
							<span class="ml-5 roleBadge member" >  </span>
						</li>
					</ul>
				</div>			
			</div>
		</div>
	</div>
</div>