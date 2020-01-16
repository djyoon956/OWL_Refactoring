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
            <!-- CONTENT MAIN -->
            <div class="container-fluid">
                <div class="row">
                <!--  my task -->
                    <div class="col-md-6">
                        <div class="card"  style="box-shadow: 3px 3px 3px 3px gray; border-radius: 0.25rem">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">My Task</h4>
                                                                   <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Description</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Making The New Suit</td>
                                        <td class="text-success">Progress</td>
                                        <td>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Update">
                                                <i class="mdi mdi-check"></i>
                                            </a>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Delete">
                                                </i><i class="mdi mdi-close"></i>
                                            </a>     
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Luanch My New Site</td>
                                        <td class="text-warning">Pending</td>
                                        <td>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Update">
                                                <i class="mdi mdi-check"></i>
                                            </a>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Delete">
                                                </i><i class="mdi mdi-close"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Maruti Excellant Theme</td>
                                        <td class="text-danger">Cancled</td>
                                        <td>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Update">
                                                <i class="mdi mdi-check"></i>
                                            </a>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Delete">
                                                </i><i class="mdi mdi-close"></i>
                                            </a>
                                        </td>  
                                    </tr>
                                </tbody>
                            </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- calendar -->
                     <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">calendar</h4>
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                <!--  graph -->
                <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">graph</h4>
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 <!-- timeline  -->
                  <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">timeline</h4>
                                        <h5 class="card-subtitle">Overview of Latest Month</h5>
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