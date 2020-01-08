<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>공지사항 작성</title>
    <link href="resources/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- Custom Stylesheet -->
    <link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
	
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
let charLimit = 4000;	
        $(function () {
        	$("#noticeLi").addClass("active");
            
            $('#summernote').summernote({
                height: 400,
                placeholder: "글을 입력하세요.",
                popover: {
                    image: [],
                    link: [],
                    air: []
                  },
                  callbacks: {
						onKeyup: function(e) {
						console.log("onKeydown");
						console.log($(this).val());
						let totalCharacters = stringToByte($(this).val());
							if (totalCharacters > charLimit) {
								$("#lengthBox").css("color", "red");
							} else {
								$("#lengthBox").css("color", "#999999");
							}
							
						$("#total-characters").text(totalCharacters);
						var t = e.currentTarget.innerText;
						if (t.trim().length >= charLimit) {
							if (e.keyCode != 8
								&& !(e.keyCode >= 37 && e.keyCode <= 40)
								&& e.keyCode != 46
								&& !(e.keyCode == 88 && e.ctrlKey)
								&& !(e.keyCode == 67 && e.ctrlKey))
									e.preventDefault();
								}
							},
						}
            }); 
            
            $("#total-characters").text(stringToByte($('#summernote').val()));
			$("#max").text(charLimit +"byte");
			$('.note-statusbar').hide();
			$("#frm").submit(vaildate);
        })
        
        function vaildate(){
        	let result = checkBoardConten($('#title').val(), $('#summernote').val());
        	return result;
        }
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
			<jsp:include page="../include/projectTab.jsp" />

			<div class="container-fluid mt-3">

						<div class="card">
							<div class="card-body">
                               <div class="col-md-10 offset-1"> 
                                    <div class="compose-content">
                                    <h3 class="text-center">Notice</h3><br>
                                        <form action="#">
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder="제목을 입력해주세요">
                                            </div>
                                            <div class="form-group">
                                               <!--  <textarea class="textarea_editor form-control bg-light" rows="15" placeholder="내용을 입력해주세요"></textarea> -->
                                                <textarea class="form-control bg-light" rows="10" cols="60" id="summernote" name="summernote" placeholder="내용을 입력해주세요"></textarea>
                                            </div>
                                        <h5 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i>파일첨부</h5>
                                            <div class="form-group">
                                                <div class="fallback">
                                                    <input class="l-border-1" name="file" type="file" multiple="multiple">
                                                </div>
                                            </div>
                                         
                                    </div>
                                    <div class="form-group text-center">
                                        <input type="submit" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10 mr-1" value="확인">
                                        <button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button">취소</button>
                                    </div>
                                    </form>
                                 </div>	 					
									
							<!--  여기까지  -->

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
    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
</body>
</html>