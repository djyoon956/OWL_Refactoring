<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>

.issuePiece {
    border: 1px solid #dadde0;
    border-left: 7px solid red;
	background-color : #fff;
	margin: 5px 10px 10px 10px;
	padding: 15px;
	font-size: 1.2em;
	width: 280px;
	height : 80px;
	border-radius: 3px;
	cursor:pointer;
}

.columnBody {
    border: 4px solid #fff;
	width: 310px;
	min-height: 20px;
	max-height : 550px;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin: 10px;
	border-radius: 3px;
	overflow-y :auto;
}


.columnBody:hover {
	border: 4px solid #eeee;
}

.columnTitle {
	border : 4px solid #fff;
	background-color: #fff;
	height: 50px;
	margin-left: 20px;
	margin-right: 20px;
	padding-top: 12px;
	font-weight: 400;
	border-radius: 5px;
	border-bottom-color: #F9AFA4; 
}

#kanbanArea {
 height: 500px;
 overflow-y: scroll;
}

</style>
  <script>
  $(function(){
	  var n = 3;
	  
    $('#addIssue').click (function() {
       console.log('addIssue click in');
		$('#sortable1').append('<li class="issuePiece">New Issue</li>');
        });


    $( "#sortable1, #sortable2" ).sortable({
        connectWith: ".connectedSortable",
        dropOnEmpty: false        
      }).disableSelection();

    $('#addColumn').click(function() {
		var value =  "sortable" + n++;

		var result = "";
    		result += '<div class="columnSection">';
    		result += '<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>';
        	result += '<ul id="' + value + '"class="connectedSortable columnBody cursor">';
    		result += '<li class="issuePiece">Item 1</li>';
        	result += '<li class="issuePiece">Item 2</li></ul></div>';

        console.log("result" + result);	
		$('#kanbanArea').append(result);

        console.log(value);
       	sortableFn(value);
        });

    function sortableFn (value)  {
       var value1 ='#' + value;
        $( value1 ).sortable({
            connectWith: ".connectedSortable",
            dropOnEmpty: false        
          }).disableSelection();
        }
    
  });
  </script>

<div id="totalbody" class="container-fluid mt-3">
	<div class="row">
	<div class="col-8" style="margin-left:30px;">
	<a href="#" data-toggle="modal" data-target="#addIssueModal">
	 <button id="addIssue" class="btn btn-primary"><i class="fas fa-italic"></i>&nbsp;New Issue</button>
	</a>	
	
	<button id="addColumn" class="btn btn-primary"><i class="fas fa-columns"></i>&nbsp;New Column</button>
	</div>
	<div class="col-2">
	<a href="#" data-toggle="modal" data-target="#labelEditModal">
		<button class="btn btn-primary"><i class="fas fa-tag"></i>&nbsp;Make Label</button>
	</a>	
	</div>
	</div>

	<div class="row" id="kanbanArea">
		<div class="columnSection">
				<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable1" class="connectedSortable columnBody cursor">
					<li class="issuePiece">Item 1</li>
					<li class="issuePiece">Item 2</li>
			</ul>
		</div>

		<div class="columnSection">
			<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable2" class="connectedSortable columnBody">
				<li class="issuePiece"><span>Item 1</span></li>
				<li class="issuePiece">Item 2</li>

			</ul>
		</div>
		<div class="columnSection">
			<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable2" class="connectedSortable columnBody">
				<li class="issuePiece"><div class="labelColor"></div><span>Item 1</span></li>
				<li class="issuePiece">Item 2</li>

			</ul>
		</div>
		<div class="columnSection">
			<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable2" class="connectedSortable columnBody">
				<li class="issuePiece"><div class="labelColor"></div><span>Item 1</span></li>
				<li class="issuePiece">Item 2</li>

			</ul>
		</div>
		<div class="columnSection">
			<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable2" class="connectedSortable columnBody">
				<li class="issuePiece"><div class="labelColor"></div><span>Item 1</span></li>
				<li class="issuePiece">Item 2</li>

			</ul>
		</div>
	</div>
</div>

<!-- add issue modal -->
<jsp:include page="modal/addIssue.jsp" />
<jsp:include page="modal/labelEdit.jsp" />