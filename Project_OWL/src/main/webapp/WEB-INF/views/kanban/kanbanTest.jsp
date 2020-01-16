
<style>
.columnBody {
    border: 4px solid #eee;
 	background-color : #f0f3f7;
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

.columnBody li {
    border: 1px solid #dadde0;
	box-shadow : 4px #dadde0;
	background-color : #fff;
	margin: 5px 10px 10px 10px;
	padding: 15px;
	font-size: 1.2em;
	width: 280px;
	height : 80px;
	border-radius: 3px;
	cursor:pointer;
}

.columnBody:hover {
	border: 4px solid #c9ccd1;
}

.columnTitle {
	border : 1px solid #fff;
	background-color: #fff;
	height: 50px;
	margin-left: 20px;
	margin-right: 20px;
	padding-top: 12px;
	font-weight: 400;
	border-radius: 5px;
}

#kanbanArea {
	max-height: 500px;
}

</style>
  <script>
  $(function(){
	  var n = 3;
	  
    $('#addIssue').click (function() {
       console.log('addIssue click in');
		$('#sortable1').append('<li class="ui-state-default">New Issue</li>');
        });


    $( "#sortable1, #sortable2" ).sortable({
        connectWith: ".connectedSortable",
        dropOnEmpty: false        
      }).disableSelection();

    $('#addColumn').click(function() {
		var value =  "sortable" + n++;

		var result = "";
    		result += '<div><ul id="'+ value +'"class="connectedSortable columnBody">';
    		result += '<label>Undefined section</label>';
    		result += '<li class="ui-state-default">Item 1</li>';
    		result += '<li class="ui-state-default">Item 2</li></ul></div>';
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

	<a href="#" data-toggle="modal" data-target="#addIssueModal">
	<button id="addIssue" class="btn btn-primary">New Issue</button>
	</a>	
	<button id="addColumn" class="btn btn-primary">New Column</button>

	<div class="row" id="kanbanArea">

		<div class="columnSection">
				<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
			<ul id="sortable1" class="connectedSortable columnBody cursor">
							<li class="ui-state-default">Item 1</li>
							<li class="ui-state-default">Item 2</li>
			</ul>
		</div>

		<div class="columnSection">
						<div class="columnTitle text-center mt-2"><h4>Undefined section</h4></div>
		
			<ul id="sortable2" class="connectedSortable columnBody">
		
				<li class="ui-state-default"><span class="">Item 1</span></li>
				<li class="ui-state-default">Item 2</li>

			</ul>
		</div>
		
	</div>
</div>

<!-- add issue modal -->
<jsp:include page="modal/addIssue.jsp" />