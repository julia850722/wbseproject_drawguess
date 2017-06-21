<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Guess</title>
<style type = "text/css">
	body{ 
		background-image: url(images/1.jpg);
        background-repeat: no-repeat;
       	background-position: center;
        background-size: content;
        font-family: '微軟正黑體',sans-serif,'Open Sans';
        overflow-x:hidden;
        margin-top:-30px;	
        }
        
     /* Header */

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
	
	#people{
		position:absolute;
		margin-left:90%;
		margin-top:-5%;
	}
       	
	#showPicture{
		border:3px #304269 solid;
		width:800px;
		height:500px;
		margin-left:auto;
		margin-right:auto;
		margin-top:10px;
		border-radius:10px;
		background-color:white;
		
	}
	
	#guessPicture{
		border:3px #304269 solid;
		width:800px;
		height:100px;
		margin-left:auto;
		margin-right:auto;
		border-radius:10px;
		background-color:white;
		padding:5px;
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
	border:2px #91BED4 solid;
	border-radius:10px;
	background-color:#D9E8F5;
	width:100px;
	height:30px;
	font-size: 15px;
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
	
</style>

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
	    			  
				});
	    FB.api( //friend0
	    		  document.getElementById('friend1').value,
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture},picture"},
	    		  function(response) {
	    			  console.log('Successful login for: ' + response.name);
	    			  document.getElementById('showNumber1').innerHTML = '<center><img src="'+response.picture.data.url+'"height="80" width="80"/>';
	    			  
				});
	    FB.api( //friend0
	    		  document.getElementById('friend2').value,
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture},picture"},
	    		  function(response) {
	    			  console.log('Successful login for: ' + response.name);
	    			  document.getElementById('showNumber2').innerHTML = '<center><img src="'+response.picture.data.url+'"height="80" width="80"/>';
	    			  
				});
	    FB.api( //friend0
	    		  document.getElementById('friend3').value,
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture},picture"},
	    		  function(response) {
	    			  console.log('Successful login for: ' + response.name);
	    			  document.getElementById('showNumber3').innerHTML = '<center><img src="'+response.picture.data.url+'"height="80" width="80"/>';
	    			  
				});
	  }
</script>

</head>
<body>
	<div id="header">
		<div id="logo">
			<h1><img src="images/title4.png" width="1200"></h1>
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
	<div id="showPicture">
	
	<img src = "${photoURL}"></img>	
	
	</div>
	<br>
	<div id="guessPicture">
	<%--輸入--%>	
	<form method="post" action="AnswerUploadDBServlet" style="font-size:20px;">
		<strong>
		你覺得這是什麼呢？<br>
		請在下方列填入你的答案，並按確認鍵
		<br>
		</strong>
		<input type="text" name="guess" style="width:400px;height:30px;">
		&nbsp;&nbsp;&nbsp;
		<button class="box1"><span>確認</span></button>
	</form>
	</div>
</body>
</html>