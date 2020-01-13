<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
     <!-- Project 상단 바 -->
			<div id="tab-menu">
				<div class="row">
					<div class="col-md-11">
						<div id="tab-btn">
							<ul id="tabList">
								<li id="dashLi"> <a href="#menu1">Dash Board</a></li>
								<li id="calLi"> <a href="#menu2">Calendar</a></li>
								<li id="kanbanLi"> <a href="#menu3">Kanban Board</a></li>
								<li id="noticeLi"> <a href="Notice.do">Notice</a></li>
								<li id="driveLi"> <a href="Drive.do">Drive</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-1 mt-2 text-center">
				<li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                         <i class="fas fa-user-cog iconSizeBig pt-2"></i>
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
