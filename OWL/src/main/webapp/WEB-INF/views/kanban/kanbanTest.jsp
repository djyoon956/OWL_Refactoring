<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

.columnBody {
    border: 4px solid #eee;
 	background-color : #f0f3f7;
	width: 310px;
	min-height: 20px;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin: 10px;
	border-radius: 3px;
}

.columnBody li {
    border: 1px solid #dadde0;
	box-shadow : 4px #dadde0;
	background-color : #fff;
	margin: 5px 10px 10px 10px;
	padding: 5px;
	font-size: 1.2em;
	width: 285px;
	height : 80px;
	border-radius: 3px;
	cursor:pointer;
}

.columnBody:hover {
	border: 4px solid #c9ccd1;
}


#kanbanArea {
	overflow-x: auto !important;
	white-space:nowrap;
	overflow-y: auto;
}
</style>

<script>
  $(function(){
	  var n = 3;
	  
    $('#addIssue').click (function() {
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

<div id="totalbody" class="container-fluid mt-3 makeXscroll">
	hello?12
	

	<button id="addIssue">+ ISSUE</button>
	<button id="addColumn">+ Column</button>

	<div class="row" id="kanbanArea">


		<div class="columnSection">
		
			<ul id="sortable1" class="connectedSortable columnBody cursor">
				<label>Undefined section</label>
			
				<li class="ui-state-default">Item 1</li>
				<li class="ui-state-default">Item 2</li>
				<li class="ui-state-default">Item 3</li>
				<li class="ui-state-default">Item 4</li>
				<li class="ui-state-default">Item 5</li>
			</ul>
		</div>

		<div class="columnSection">
		
			<ul id="sortable2" class="connectedSortable columnBody">
				<label>Undefined section</label>
			
				<li class="ui-state-default">Item 1</li>
				<li class="ui-state-default">Item 2</li>
				<li class="ui-state-default">Item 3</li>
				<li class="ui-state-default">Item 4</li>
				<li class="ui-state-default">Item 5</li>
			</ul>
		</div>
		
	</div>
</div>
