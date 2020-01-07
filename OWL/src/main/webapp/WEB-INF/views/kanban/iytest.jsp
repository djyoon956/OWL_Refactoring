<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>slide demo</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <style>
  #toggle {
    width: 100px;
    height: 100px;
    background: #ccc;
  }
  </style>
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(function () {
	  $( '#plzBtn' ).click(function() {
		  $( "#toggle" ).toggle( "slide" ,{direction:'right'},500);
		});
	  })

</script>
</head>
<body>
 
<button id="plzBtn">please</button>
<br><br><br><br><br><br>
<div id="toggle"></div>
 

 
</body>
</html>