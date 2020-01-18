<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="DetailBox" class="hidden">
    <div class="card">
        <div class="card-body">
            <div class="col-md-10 offset-1">
                <div class="compose-content">
                    <h3 class="text-center">Notice</h3><br>
                    <input type="text" name="title" id="title">
                    <div id="content" style="height: 300px;">
                    </div>
	                    <c:if test="${project.authority eq 'ROLE_PM'}">
							<input type="button" class="btn btn-primary" value="수정" >
							<input type="button" class="btn btn-danger" value="삭제" >
						</c:if>
					<input type="button" value="목록" class="btn btn-primary" onclick="setNoticeData(${project.projectIdx})">
                </div> 
            </div>
        </div>
    </div>
</div>
