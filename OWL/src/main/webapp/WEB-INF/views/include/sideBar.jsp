<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script>
function InputTeam(){
    var newTeam = $("#teamTitle").val();
    console.log(newTeam);
	var plus = "";
	plus += "<li><a href='#'>" + newTeam + "</a></li>";
	$('#teamlist').append(plus);
}
</script>
<style>
.has-arrow i{
color: #a6a6a6;
}
</style>

<div class="nk-sidebar" style="border-right: 1px double #326295;">           
    <div class="nk-nav-scroll">
		<ul class="metismenu" id="menu" >
        <!-- My Part -->     
			<li class="mega-menu mega-menu-sm">
			<a href="javascript:void()"> <i class="fas fa-user-alt menu-icon"></i><span
					class="nav-text"> MY </span>
			</a>
				<ul class="collapse in">
					<li><a href="MyDashboard.do">DASHBOARD</a></li>
					<li><a href="Calendar.do">CALENDAR</a></li>
				</ul>
			</li>
            <li class="mega-menu mega-menu-sm">
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="fas fa-star menu-icon"></i><span class="nav-text">FAVORITE</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="./layout-one-column.html">⭐ [Drop the 4 bit] 맞집</a></li>
                    <li><a href="./layout-two-column.html">⭐ [TEAM2] 방방곳곳</a></li>
                    <li><a href="./layout-compact-nav.html">⭐ [TEAM3] 캠핑이지</a></li>
                </ul>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a class="has-arrow" href="javascript:void()" aria-expanded="false" id="team">
                    <i class="fas fa-users"></i><span class="nav-text" id="teamname">1팀</span>
                </a>
                <ul aria-expanded="false" id="teamlist">
                    <li style="cursor: pointer;"><a type= "button" data-toggle="modal" data-target="#newFolder"> <span style="font-size: 18px;">+</span> New Team</a></li>
                    <li><a href="#">1팀</a></li>
                    <li><a href="#">2팀</a></li>
                </ul>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a href="javascript:void()" onclick="location.href='ProjectDashBoard.do'"> 
                    <span style="color: #993366 !important;"><i class="fas fa-circle"></i></span>&emsp;&emsp;<span class="nav-text">Project 1</span>
                </a>
            </li> 
            <li class="mega-menu mega-menu-sm">
                <a href="javascript:void()" onclick="location.href='Drive.do'"> 
                    <span style="color: #669999 !important;"><i class="fas fa-circle"></i></span>&emsp;&emsp;<span class="nav-text">Project 2</span>
                </a>
            </li> 
            <li class="mega-menu mega-menu-sm">
                <a href="javascript:void()" onclick="location.href='kanbanMain.do'"> 
                    <span style="color: #b3b3ff !important;"><i class="fas fa-circle"></i></span>&emsp;&emsp;<span class="nav-text">kanban</span>
                </a>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a href="javascript:void()" onclick="location.href='kanbanMainiy.do'"> 
                    <span style="color: #3366cc !important;"><i class="fas fa-circle"></i></span>&emsp;&emsp;<span class="nav-text">kanban_iy</span>
                </a>
            </li>       
            <li class="mega-menu mega-menu-sm">
                <a href="javascript:void()" onclick="location.href='kanbanMainiyiy.do'"> 
                    <span style="color: #ff9933 !important;"><i class="fas fa-circle"></i></span>&emsp;&emsp;<span class="nav-text">kanban_iyiy</span>
                </a>
            </li>   
            <li class="mega-menu mega-menu-sm">
                <a href="javascript:void()" onclick="location.href='kanbanMaintest.do'"> 
                    <span style="color: #ff9933 !important;"><i class="fas fa-circle"></i></span>&emsp;&emsp;<span class="nav-text">testing_iy</span>
                </a>
            </li>                                                  
        </ul>
    </div>
</div>

           <!-- Modal -->
     <div class="modal fade" id="newFolder">
         <div class="modal-dialog modal-dialog-centered" role="document">
             <div class="modal-content">
                 <div class="modal-header" style="text-align: center;">
                     <h4 class="modal-title"><b>팀 생성하기</b></h4>
                     <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                     </button>
                 </div>
                 <div class="modal-body">
                     <h5>팀 이름</h5>
                     <input type="text" id="teamTitle" style="width:100%; height: 35px;">
                     <br>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                     <button type="button" class="btn btn-primary" onclick="InputTeam()">생성하기</button>
                 </div>
             </div>
         </div>
     </div>
