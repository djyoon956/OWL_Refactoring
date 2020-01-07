<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script>
$(function() {

		  var sBtn = $("#tabList > li");    
		  sBtn.find("a").click(function(){   
		 //  sBtn.removeClass("active");     
		   console.log("디스 : " + this);
		   $(this).parent().addClass("active"); 
		  })
});
</script>
     <!-- Project 상단 바 -->
			<div id="tab-menu">
				<div class="row">
					<div class="col-md-11">
						<div id="tab-btn">
							<ul id="tabList">
								<li><a href="ProjectDashBoard.do">Dash Board</a></li>
								<li><a href="Calendar.do">Calendar</a></li>
								<li><a href="kanbanMainiy.do">Kanban Board</a></li>
								<li><a href="Notice.do">Notice</a></li>
								<li><a href="Drive.do">Drive</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-1 mt-2 text-center">
				<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="icon-settings iconSize"></i>
                  </a>
                     <div class=" dropdown-menu">
                         <div class="dropdown-content-body">
                             <ul>
                                 <li><a href="#memberEditModal" data-toggle="modal">프로젝트멤버  설정</a></li>
                                 <li><a href="#labelEditModal" data-toggle="modal">라벨 추가</a></li>
                             </ul>
                         </div>
                     </div>
                 </li>
					</div>
				</div>
			</div>
