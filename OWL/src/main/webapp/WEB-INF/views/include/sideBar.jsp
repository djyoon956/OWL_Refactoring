<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<jsp:include page="headTag.jsp"/>
<aside class="left-sidebar" data-sidebarbg="skin5">
    <div class="scroll-sidebar">
        <nav class="sidebar-nav">
            <ul id="sidebarnav" class="p-t-30">
            <li id="sidebarLable">MY</li>
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="far fa-user"></i><span class="hide-menu">MY TASK</span></a>
                    <ul aria-expanded="false" class="collapse  first-level">
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span class="hide-menu">DASHBOARD</span></a></li>
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span class="hide-menu">CALENDAR</span></a></li>
                    </ul>
                </li>
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="far fa-star"></i> <span class="hide-menu">FAVORITES</span></a>
                    <ul aria-expanded="false" class="collapse  first-level">
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span class="hide-menu">favorite1</span></a></li>
                    </ul>
                </li>
                <li>PROJECT</li>               
                <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="fas fa-desktop"></i><span class="hide-menu">PROJECT LIST</span></a>
                    <ul aria-expanded="false" class="collapse  first-level">
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span class="hide-menu"> Material Icons </span></a></li>
                        <li class="sidebar-item"><a href="#" class="sidebar-link"><span class="hide-menu"> Font Awesome Icons </span></a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</aside>