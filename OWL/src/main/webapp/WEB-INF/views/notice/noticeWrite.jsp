<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>공지사항 작성</title>
    <link href="resources/css/style.css" rel="stylesheet">
    <jsp:include page="../include/headTag.jsp"/>
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
</head>

<script type="text/javascript">
        $(function () {
            $('#summernote').summernote({
                height: 400,
                placeholder: "내용을 입력해주세요.",
                popover: {
                    image: [],
                    link: [],
                    air: []
                  }
            }); 
        })
</script>
<style>
#noticeDelBtn:hover {
	 color : black; 
	 background-color: #808080;
	 border-color: #808080; 
}
 
/* summer note */
.panel-heading{
 	color: #333;
    background-color: #f0f3f7;
}
</style>
<body>
    <div id="main-wrapper">

        <!-- Top -->
        <jsp:include page="../include/top.jsp"/>
       
 		<!-- SideBar -->
        <jsp:include page="../include/sideBar.jsp"/>
         
        <!-- Content -->
		<div class="content-body">
			<!-- Project 상단 바 -->
			<%-- <jsp:include page="../project/projectTab.jsp" /> --%>

			<div class="container-fluid mt-3">

						<div class="card">
							<div class="card-body">
                               <div class="col-md-10 offset-1"> 
                                    <div class="compose-content">
                                    <h3 class="text-center">Notice</h3><br>
                                        <form action="#" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder="제목을 입력해주세요">
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control bg-light" rows="10" cols="60" id="summernote" name="summernote"></textarea>
                                            </div>
                                        <h5 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i>&nbsp;파일첨부</h5>
                                            <div class="form-group">
                                                <div class="fallback">
                                                    <input class="l-border-1" name="file" type="file" multiple="multiple">
                                                </div>
                                            </div>
                                    </div>
                                    <div class="form-group text-center">
                                         <input type="submit" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10 mr-2" value="확인">
                                        <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button" 
                                        onclick="location.href='Notice.do'" id="noticeDelBtn">취소</button> 
                                         </div>                   
                                    </div>
                                    </form>
                                 </div>	 					
									
							<!--  여기까지  -->

					<!-- </div> -->
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

	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
</body>
</html>