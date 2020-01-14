<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="../include/headTag.jsp"/>

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

/* #kanbanArea {
	overflow-x: auto !important;
	white-space:nowrap;
	overflow-y: auto;
} */
</style>

  <!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
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
        console.log("여기오니?");
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
	console.log('여기는 함수');
       var value1 ='#' + value;
        $( value1 ).sortable({
            connectWith: ".connectedSortable",
            dropOnEmpty: false        
          }).disableSelection();
        }

    
  });
  </script>
</head>
<body>
<div id="totalbody" class="container-fluid mt-3">
	hello?12345677
	
	<button id="addIssue">ISSUE</button>
	<button id="addColumn">Column</button>

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
</body>
</html>