<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/assets/images/favicon.png">
    <title>OWL</title>
    <jsp:include page="../include/headTag.jsp"/>
    <link href="resources/css/project.css" rel="stylesheet">
</head>

<body>
	<!-- LOADER -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
   
    <div id="main-wrapper">
        
		<!-- TOP -->
        <jsp:include page="../include/top.jsp"/>
       
        <!-- SIDE BAR -->
        <jsp:include page="../include/sideBar.jsp"/>

		<!-- CONTENT BOX -->
        <div class="page-wrapper">
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Dashboard1</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- CONTENT MAIN -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">Site Analysis</h4>
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="tab-menu">
		<div class="row">
			<div class="col-md-11">
				<div id="tab-btn">
					<ul id="projectMenu" class="nav nav-tabs" role="tablist" style="border-bottom-width: 0px;">
						<li class="nav-item active">
							<a class="nav-link" data-toggle="tab" href="#dash">Dash Board</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#calendar">Calendar</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#kanban">Kanban Board</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#notice">Notice</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#drive">Drive</a>
						</li>
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
								<li><a href="#memberEditModal" data-toggle="modal">프로젝트멤버 설정</a></li>
								<li><a href="#labelEditModal" data-toggle="modal">라벨 추가</a></li>
							</ul>
						</div>
					</div>
				</li>
			</div>
		</div>

	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

			<!-- BOTTOM -->
            <jsp:include page="../include/bottom.jsp"/>
        </div>
    </div>
</body>