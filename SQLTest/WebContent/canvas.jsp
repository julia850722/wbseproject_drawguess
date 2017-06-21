<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Draw</title>
<script src = "lib/easel.js"></script>
		<link href="../_assets/css/shared.css" rel="stylesheet" type="text/css"/>
		<link href="../_assets/css/examples.css" rel="stylesheet" type="text/css"/>
		<script src="../_assets/js/examples.js"></script>
		<script src="../lib/easeljs-NEXT.combined.js"></script>
		<script src="http://code.createjs.com/easeljs-0.7.0.min.js"></script>
<style type = "text/css">
	body{ 
		background-image: url(images/1.jpg);
        background-repeat: no-repeat;
       	background-position: center;
        background-size: content;
        font-family: '微軟正黑體',sans-serif,'Open Sans';
        cursor: url('Handwriting.cur'), move;  	
        overflow-x:hidden;
        margin-top:-30px;	
        }
        
     #header {
		clear: both;
		height:120px;
		margin-top:-20px;
		margin-left: 0px auto;	
	}
	
	/* Logo */
	
	#logo h1 {
		margin: 0px;
		padding: 0px;
		margin-left: 35%;	
		margin-top:0%;
	}
           
        
          
     #showNumber{
		border:3px #304269 solid;
		width:95px;
		height:95px;
		border-radius:10px;
		background-color:white;
		left:0px;
	}
	
	#showNumber1{
		border:3px #304269 solid;
		width:95px;
		height:95px;
		border-radius:10px;
		background-color:white;
		left:0px;
	}
	#showNumber2{
		border:3px #304269 solid;
		width:95px;
		height:95px;
		border-radius:10px;
		background-color:white;
		left:0px;
	}
	#showNumber3{
		border:3px #304269 solid;
		width:95px;
		height:95px;
		border-radius:10px;
		background-color:white;
		left:0px;
	}
       	
	#showAnswer{
		border:3px #304269 solid;
		width:800px;
		height:50px;
		margin-left:auto;
		margin-right:auto;
		border-radius:10px;
		background-color:white;
		margin-top:30px;
		font-size:40px;
	}
	
	#drawAnswer{
		border:3px #304269 solid;
		width:800px;
		height:600px;
		margin-left:auto;
		margin-right:auto;
		border-radius:10px;
		background-color:white;
		padding:5px;
	}
	
	#canvas1{
		border:3px #91BED4 solid;
		border-radius:10px;
		position:absolute;
		left:20%;
		top:17%"
	}
	
	#people{
		position:absolute;
		margin-left:90%;
		margin-top:-5%;
	}
	
	input[type="text"]
	{
    	font-size:24px;
    	border:2px #91BED4 solid;
	}
	
	input{
		border:2px #91BED4 solid;
		border-radius:10px;
		background-color:white;
		width:100px;
		height:30px;
		font-size: 15px;
		color: #304269;
		font-weight:bold;
	}
	
	.box1{
	position: absolute;
	left:45%;
	top: 121%;
	border:2px #91BED4 solid;
	border-radius:10px;
	background-color:#D9E8F5;
	width:100px;
	height:30px;
	font-size: 20px;
	color: #304269;
	font-weight:bold;
	cursor: pointer;
	}
	
	.box1 span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
	}
		
	.box1 span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
	}
		
	.box1:hover span {
		  padding-right: 25px;
	}
		
	.box1:hover span:after {
		  opacity: 1;
		  right: 0;
	}
	
	
	div.circle_in_black{	
		margin-top:5px; 
		margin-left:5px; 
		margin-right:5px; 
		margin-bottom:10px;
		background-color:#000000;
		border-radius:99em;
		background-color:black;
		vertical-align : middle;
	}
			
	div.sizeSelected{
		background-color:#000000;
		border-radius:99em;
		border:2px grey solid;
	}
	
	div.color_in_blank{
		border-radius:99em;
		border:2px #ccc solid;
		margin-top:5px; 
		margin-left:5px; 
		margin-right:5px; 
		margin-bottom:5px;		
	}
	
	div.colorSelected{
		border-radius:99em;
		border:2px black solid;
		margin-top:5px; 
		margin-left:5px; 
		margin-right:5px; 
		margin-bottom:5px;
	}
	
	input[type=range] {
		-webkit-appearance: none;
		border: 1px solid white;
		width: 200px;
	}
		
	input[type=range]::-webkit-slider-runnable-track {
		width: 300px;
		height: 5px;
		background: #ddd;
		border: none;
		border-radius: 3px;
	}
		
	input[type=range]::-webkit-slider-thumb {
	    -webkit-appearance: none;
	    border: none;
	    height: 16px;
	    width: 16px;
	    border-radius: 50%;
	    background: goldenrod;
	    margin-top: -4px;
	}
		
	input[type=range]:focus {
	    outline: none;
	}
			
	input[type=range]:focus::-webkit-slider-runnable-track {
	  	background: #ccc;
	}
	
	input[type=range]::-moz-range-track {
	  	width: 300px;
	  	height: 5px;
	  	background: #ddd;
	  	border: none;
	  	border-radius: 3px;
	}
	
	input[type=range]::-moz-range-thumb {
	  	border: none;
	  	height: 16px;
	  	width: 16px;
	  	border-radius: 50%;
	 	background: goldenrod;
	}
	
	
	/*hide the outline behind the border*/
	
	input[type=range]:-moz-focusring {
	  	outline: 1px solid white;
	  	outline-offset: -1px;
	}
	
	input[type=range]::-ms-track {
	  	width: 300px;
	  	height: 5px;
	  /*remove bg colour from the track, we'll use ms-fill-lower and ms-fill-upper instead */
	  	background: transparent;
	  /*leave room for the larger thumb to overflow with a transparent border */
	  	border-color: transparent;
	  	border-width: 6px 0;
	  /*remove default tick marks*/
	  	color: transparent;
	}
	
	input[type=range]::-ms-fill-lower {
	  	background: #777;
	  	border-radius: 10px;
	}
	
	input[type=range]::-ms-fill-upper {
	  	background: #ddd;
	  	border-radius: 10px;
	}
	
	input[type=range]::-ms-thumb {
	  	border: none;
	  	height: 16px;
	  	width: 16px;
	  	border-radius: 50%;
	  	background: goldenrod;
	}
	
	input[type=range]:focus::-ms-fill-lower {
	  	background: #888;
	}
	
	input[type=range]:focus::-ms-fill-upper {
	  	background: #ccc;
	}
</style>
<script id="editable">
	var canvas, stage;
	var drawingCanvas;
	var oldPt;
	var oldMidPt;
	var title;
	var color;
	var stroke;
	var colors;
	var index;
	var temp;
	function init() {
		//Create a stage by getting a reference to the canvas
	    var canvas = document.getElementById('myCanvas'),
   			context = canvas.getContext('2d'); 
		context.fillStyle = 'rgb(255, 255, 255)';
			context.fillRect (0,0 , 700, 400); 
			var s = new createjs.Shape();  
			s.graphics.beginFill("#ff0000");  
			s.graphics.drawRect(0,0,700,400);  
			s.graphics.endFill();
			
	    var circle = document.getElementById('circle');
		circle.innerHTML =  '<div  class = "circle_in_black" style ="width:30px;height:30px;"onclick = "ChangeSize(3)"></div>';
		var range = document.getElementById('range');
		range.addEventListener("change", function(){circleChange(this.value)}, false);
		canvas = document.getElementById("myCanvas");
		index = 0;
		colors = ["#828b20", "#b0ac31", "#cbc53d", "#fad779", "#f9e4ad", "#faf2db", "#563512", "#9b4a0b", "#d36600", "#fe8a00", "#f9a71f"];
		//check to see if we are running in a browser with touch support
		stroke = 10;
		temp = "#000000";
		stage = new createjs.Stage(canvas);
		stage.autoClear = false;
		stage.enableDOMEvents(true);
		createjs.Touch.enable(stage);
		createjs.Ticker.setFPS(24);
		drawingCanvas = new createjs.Shape();
		stage.addEventListener("stagemousedown", handleMouseDown);
		stage.addEventListener("stagemouseup", handleMouseUp);
		title = new createjs.Text("Click and Drag to draw", "36px Arial", "#777777");
		title.x = 180;
		title.y = 200;
		stage.addChild(title);
		stage.addChild(drawingCanvas);
		stage.update();
	}
	
	function circleChange(value){
		var circle = document.getElementById('circle');
		circle.innerHTML =  '<div  class = "circle_in_black" style ="width:'+value+'px;height:'+value+'px;"onclick = "ChangeSize(3)"></div>';
		stroke = value;
		//document.getElementById('size1').className = 'sizeSelected';
	}
	function handleMouseDown(event) {
		if (!event.primary) { return; }
		if (stage.contains(title)) {
			stage.clear();
			stage.removeChild(title);
		}
		//color = colors[(index++) % colors.length];
		color = temp;
		//stroke = 1 * 30 + 10 | 0;
		
		oldPt = new createjs.Point(stage.mouseX, stage.mouseY);
		oldMidPt = oldPt.clone();
		stage.addEventListener("stagemousemove", handleMouseMove);
	}
	function handleMouseMove(event) {
		if (!event.primary) { return; }
		var midPt = new createjs.Point(oldPt.x + stage.mouseX >> 1, oldPt.y + stage.mouseY >> 1);
		drawingCanvas.graphics.clear().setStrokeStyle(stroke, 'round', 'round').beginStroke(color).moveTo(midPt.x, midPt.y).curveTo(oldPt.x, oldPt.y, oldMidPt.x, oldMidPt.y);
		oldPt.x = stage.mouseX;
		oldPt.y = stage.mouseY;
		oldMidPt.x = midPt.x;
		oldMidPt.y = midPt.y;
		stage.update();
	}
	function handleMouseUp(event) {
		if (!event.primary) { return; }
		stage.removeEventListener("stagemousemove", handleMouseMove);
		var c = document.getElementById('myCanvas');
		aaa = c.toDataURL();
		var a = document.getElementById('hid');
		a.value = aaa;
		var b = document.getElementById('text');
	    b.innerHTML = "<p>"+a.value+"</p>";
	}
	function ChangeColor(col,item){
		document.getElementById('color1').className = 'color_in_blank';
		document.getElementById('color2').className = 'color_in_blank';
		document.getElementById('color3').className = 'color_in_blank';
		document.getElementById('color4').className = 'color_in_blank';
		document.getElementById('color5').className = 'color_in_blank';
		document.getElementById('color6').className = 'color_in_blank';
		document.getElementById('color7').className = 'color_in_blank';
		document.getElementById('color8').className = 'color_in_blank';
		document.getElementById('color9').className = 'color_in_blank';
		document.getElementById('color10').className = 'color_in_blank';
		document.getElementById('color11').className = 'color_in_blank';
		if(col == 1){temp = "#FF0000";document.getElementById('color1').className = 'colorSelected';}
		if(col == 2){temp = "#000000";document.getElementById('color2').className = 'colorSelected';}
		if(col == 3){temp = "#FF8C00";document.getElementById('color3').className = 'colorSelected';}
		if(col == 4){temp = "#FFFF00";document.getElementById('color4').className = 'colorSelected';}
		if(col == 5){temp = "#00DD00";document.getElementById('color5').className = 'colorSelected';}
		if(col == 6){temp = "#0000AA";document.getElementById('color6').className = 'colorSelected';}
		if(col == 7){temp = "#BA55D3";document.getElementById('color7').className = 'colorSelected';}
		if(col == 8){temp = "#C0C0C0";document.getElementById('color8').className = 'colorSelected';}
		if(col == 9){temp = "#FFC0CB";document.getElementById('color9').className = 'colorSelected';}
		if(col == 10){temp = "#FFE4B5";document.getElementById('color10').className = 'colorSelected';}
		if(col == 11){temp = "#FFFFFF";document.getElementById('color11').className = 'colorSelected';}
		  event.preventDefault();
	}
</script>	
<script>
	function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);

    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      //console.log('123');
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      
    }
  }

///********
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '{122859488290006}',
	    cookie     : true,  // enable cookies to allow the server to access 
	                        // the session
	    xfbml      : true,  // parse social plugins on this page
	    version    : 'v2.8' // use graph api version 2.8
	  });

	  FB.getLoginStatus(function(response) {
	    if (response.status === 'connected') { 
	        var accessToken = response.authResponse.accessToken;
	      } 
	    statusChangeCallback(response);
	  });

  };

  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.9&appId=122859488290006";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
  
  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api( //friend0
	    		  document.getElementById('friend0').value,
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture},picture"},
	    		  function(response) {
	    			  console.log('Successful login for: ' + response.name);
	    			  document.getElementById('showNumber').innerHTML = '<center><img src="'+response.picture.data.url+'" height="80" width="80"/>';
	    			  document.getElementById('FriendName0').value = response.name;
				});
	    FB.api( //friend0
	    		  document.getElementById('friend1').value,
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture},picture"},
	    		  function(response) {
	    			  console.log('Successful login for: ' + response.name);
	    			  document.getElementById('showNumber1').innerHTML = '<center><img src="'+response.picture.data.url+'"height="80" width="80"/>';
	    			  document.getElementById('FriendName1').value = response.name;
				});
	    FB.api( //friend0
	    		  document.getElementById('friend2').value,
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture},picture"},
	    		  function(response) {
	    			  console.log('Successful login for: ' + response.name);
	    			  document.getElementById('showNumber2').innerHTML = '<center><img src="'+response.picture.data.url+'"height="80" width="80"/>';
	    			  document.getElementById('FriendName2').value = response.name;
				});
	    FB.api( //friend0
	    		  document.getElementById('friend3').value,
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture},picture"},
	    		  function(response) {
	    			  console.log('Successful login for: ' + response.name);
	    			  document.getElementById('showNumber3').innerHTML = '<center><img src="'+response.picture.data.url+'"height="80" width="80"/>';
	    			  document.getElementById('FriendName3').value = response.name;
				});
	  }
</script>
	


</head>
<body onload="init();">
	<div id="header">
		<div id="logo">
			<h1><img src="images/title4.png" width="1200"></h1>
		</div>
	</div>
	<div style="-webkit-tap-highlight-color:rgba(0,0,0,0)" onclick="return true">
		  	
			<div style = "position:absolute;left:5%; top:5%">
			 	
			    	<div class = "color_in_blank"style = "position:absolute; left:120px;top:120px; height : 50px; width:50px; background-color:#FF0000;" onclick = "ChangeColor(1,this)" id = "color1"></div>
					<div class = "color_in_blank"style = "position:absolute; left:60px;top:120px; height : 50px; width:50px; background-color:#000000;" onclick = "ChangeColor(2,this)"id = "color2"></div>
					<div class = "color_in_blank"style = "position:absolute; left:120px;top:180px; height : 50px; width:50px; background-color:#FF8C00;" onclick = "ChangeColor(3,this)"id = "color3"></div>
					<div class = "color_in_blank"style = "position:absolute; left:60px;top:180px; height : 50px; width:50px; background-color:#FFFF00;" onclick = "ChangeColor(4,this)"id = "color4"></div>
					<div class = "color_in_blank"style = "position:absolute; left:120px;top:240px; height : 50px; width:50px; background-color:#00DD00;" onclick = "ChangeColor(5,this)"id = "color5"></div>
					<div class = "color_in_blank"style = "position:absolute; left:60px;top:240px; height : 50px; width:50px; background-color:#0000AA;" onclick = "ChangeColor(6,this)"id = "color6"></div>
					<div class = "color_in_blank"style = "position:absolute; left:120px;top:300px; height : 50px; width:50px; background-color:#BA55D3;" onclick = "ChangeColor(7,this)"id = "color7"></div>
					<div class = "color_in_blank"style = "position:absolute; left:60px;top:300px; height : 50px; width:50px; background-color:#C0C0C0;" onclick = "ChangeColor(8,this)"id = "color8"></div>
					<div class = "color_in_blank"style = "position:absolute; left:120px;top:360px; height : 50px; width:50px; background-color:#FFC0CB;" onclick = "ChangeColor(9,this)"id ="color9"></div>
					<div class = "color_in_blank"style = "position:absolute; left:60px;top:360px; height : 50px; width:50px; background-color:#FFE4B5;" onclick = "ChangeColor(10,this)"id = "color10"></div>
					<div class = "color_in_blank"style = "position:absolute; left:0px;top:360px; height : 50px; width:50px;" onclick = "ChangeColor(11,this)"id = "color11"><img src="eraser.png" height = 50px; width=50px;></div>
					<div style ="position:absolute; left:-60px;top:450px; width:50px; height:50px;text-align:center;">
					<input  style ="position:absolute;left:50px; top:-10px" type="range" id = "range" min = "10" max = "50" value = "20">
					<div  id = "circle" style = "display:inline-block;position: relative;transform:translateY(-50%);"></div>
					</div>
			</div>
			
	</div>
	
	<div id="people">
		<div id="showNumber">
		</div>
	<img src = "images/arrow.png" height="40" width="40" style="margin-left:30px"></img>
		<div id="showNumber1">
		</div>
	<img src = "images/arrow.png" height="40" width="40" style="margin-left:30px"></img>
		<div id="showNumber2">
		</div>
	<img src = "images/arrow.png" height="40" width="40" style="margin-left:30px"></img>
		<div id="showNumber3">
		</div>
	</div>
	
	<input type="hidden" name="friend0" value= ${FriendId.get(0)} id = "friend0">
    <input type="hidden" name="friend1" value= ${FriendId.get(1)} id = "friend1">
    <input type="hidden" name="friend2" value= ${FriendId.get(2)} id = "friend2">
    <input type="hidden" name="friend3" value= ${FriendId.get(3)} id = "friend3">
    
    
	
	<div id="showAnswer">
	<%--顯示題目--%>	
	<% 
	 	ServletContext quizContext = this.getServletContext();
    	int playerId = (int)quizContext.getAttribute("id"); //get player's id(1st, 2nd...)
  
		String quiz = (String) quizContext.getAttribute("quiz");
		String answer = (String) request.getAttribute("answer");
		if(playerId == 1)
		{
			out.println(quiz);
		}else
		{
			out.println(answer);
		}
	%>
	</div>
	
	<br>
	<div id="drawAnswer">
	<%--輸入--%>	
	<form method="post" action='FileUploadDBServlet' style="font-size:20px;">
		<strong>
		你覺得這是什麼呢？<br>
		請在下方畫出你的答案，確認後按送出鍵
		<br>
		</strong>
		<div id="canvas1">
		<canvas id="myCanvas" width="800" height="500"></canvas>
		</div>
		<input type = "hidden" value = "" id = "hid" name = "hid">
		<input type = "hidden" value = "" id = "FriendName0" name = "FriendName0">
		<input type = "hidden" value = "" id = "FriendName1" name = "FriendName1">
		<input type = "hidden" value = "" id = "FriendName2" name = "FriendName2">
		<input type = "hidden" value = "" id = "FriendName3" name = "FriendName3">
		<button class="box1"><span>確認</span></button>
		
	</form>
	</div>
</body>
</html>