<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>공지사항</title>
    <link href="resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- Custom Stylesheet -->
    <link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#noticeLi").addClass("active");
}); 
</script>
<body>
    <div id="main-wrapper">

        <!-- Top -->
        <jsp:include page="../include/top.jsp"/>
       
 		<!-- SideBar -->
        <jsp:include page="../include/sideBar.jsp"/>
         
        <!-- Content -->
        <div class="content-body">
        <!-- Project 상단 바 -->
        <jsp:include page="../include/projectTab.jsp"/>
        
            <div class="container-fluid mt-3">
                        <div class="card">
                            <div class="card-body">
                               <h3 class="text-center">Notice</h3>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration text-center">
                                        <thead>
                                            <tr>
                                                <th width="10%">NO</th>
                                                <th width="53%">제목</th>
                                                <th width="15%">작성자</th>
                                                <th width="15%">작성일</th>
                                                <th width="7%">조회</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>쉬지 말고 일하세요</td>
                                                <td>PM</td>
                                                <td>2020-01-10</td>
                                                <td>1</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>프로젝트가 얼마 안남았어요</td>
                                                <td>PM</td>
                                                <td>2020-01-08</td>
                                                <td>1234</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>화이팅합시다</td>
                                                <td>PM</td>
                                                <td>2020-01-09</td>
                                                <td>1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                             <div class="text-right mt-3 ">
                            	<!-- <a href="NoticeWrite.do"> -->
								<!--  <input type="button" class="btn btn-primary" value="글쓰기" id="notice" name="">&emsp;&emsp; -->
								
								<button class="btn btn-primary" type="submit" id="notice" name="" onclick="location.href='NoticeWrite.do'"><i class="icon-pencil"></i>&nbsp; 글쓰기</button>
								<!-- </a> -->
								&emsp;&emsp;
							  </div>
                            </div>
                </div>
            </div>
        </div>
        
        <!-- Bottom -->
		<jsp:include page="../include/bottom.jsp"/>
    </div>

    <!--Scripts-->
    <script src="resources/plugins/common/common.min.js"></script>
    <script src="resources/js/custom.min.js"></script>
    <script src="resources/js/settings.js"></script>
    <script src="resources/js/gleek.js"></script>
    <script src="resources/js/styleSwitcher.js"></script>
    <!-- data table -->
    <script src="resources/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
</body>
</html>