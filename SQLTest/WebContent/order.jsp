<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
		<script>
		// This is called with the results from from FB.getLoginStatus().
		  function statusChangeCallback(response) {
		    console.log('statusChangeCallback');
		    console.log(response);

		    if (response.status === 'connected') {
		      // Logged into your app and Facebook.
		      testAPI();
		    } else {
		      // The person is not logged into your app or we are unable to tell.
		      document.getElementById('status').innerHTML = 'Please log ' +
		        'into this app.';
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


		  function testAPI() {
		    console.log('Welcome!  Fetching your information.... ');
		    FB.api( //friend0
		    		  document.getElementById('friend0').value,
		    		  'GET',
		    		  {"fields":"id,name,friends{id,name,picture},picture"},
		    		  function(response) {
		    			  console.log('Successful login for: ' + response.name);
		    			  document.getElementById('player1').innerHTML = '<a style="valign=top;">Player1: <a><br><br><center><img src="'+response.picture.data.url+'"/><br>'+ response.name +'</center>';
		    			  
					});
		    FB.api( //friend1
		    		  document.getElementById('friend1').value,
		    		  'GET',
		    		  {"fields":"id,name,friends{id,name,picture},picture"},
		    		  function(response) {
		    			  document.getElementById('player2').innerHTML = '<a style="valign=top;">Player2: <a><br><br><center><img src="'+response.picture.data.url+'"/><br>'+ response.name +'</center>';
		    			  
					});
		    FB.api( //friend2
		    		  document.getElementById('friend2').value,
		    		  'GET',
		    		  {"fields":"id,name,friends{id,name,picture},picture"},
		    		  function(response) {
		    			  console.log('Successful login for: ' + response.name);
		    			  document.getElementById('player3').innerHTML = '<a style="valign=top;">Player3: <a><br><br><center><img src="'+response.picture.data.url+'"/><br>'+ response.name +'</center>';
		    			  
					});
		    FB.api( //friend3
		    		  document.getElementById('friend3').value,
		    		  'GET',
		    		  {"fields":"id,name,friends{id,name,picture},picture"},
		    		  function(response) {
		    			  console.log('Successful login for: ' + response.name);
		    			  document.getElementById('player4').innerHTML = '<a style="valign=top;">Player4: <a><br><br><center><img src="'+response.picture.data.url+'"/><br>'+ response.name +'</center>';
		    			  
					});
		  }
		  function logout(){
			  FB.logout(function(response) {
				  // user is now logged out
				});
		  }
		</script>
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.9&appId=122859488290006";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<script>

		
		
</script>
	<input type="hidden" name="friend0" value= ${FriendId.get(0)} id = "friend0">
	<input type="hidden" name="friend1" value= ${FriendId.get(1)} id = "friend1">
	<input type="hidden" name="friend2" value= ${FriendId.get(2)} id = "friend2">
	<input type="hidden" name="friend3" value= ${FriendId.get(3)} id = "friend3">
<style>
	body{
		margin-top: 0;
		padding: 0;
		background-image: url(images/1.jpg);
	    background-repeat: no-repeat;
	    background-position: center;
	    background-size: content;
	    overflow:hidden;
	    font-family: '微軟正黑體',sans-serif,'Open Sans';
	}
	h1{
		font-family:"微軟正黑體";
	}
	h2{
		valign:"top";
	}
	div{
		font-family:"微軟正黑體";
		font-size:32px;
	}
	table, tr, td{
		border-style: solid;
    	border-width: 5px;
    	valign: top;
	}
	td{
		height:250px;
		width:250px;
		
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

</style>
<div id="header">
		<div id="logo">
			<h1><img src="images/title4.png" width="1200"></h1>
		</div>
</div>
<center><h1>Hi!歡迎來到<a >你畫我猜</a> 你被加入新遊戲了!</h1></center>
<table align="center">
		<tr><td  valign="top"><div id="player1"></div></td>
		<td valign="top"><div id="player2"></div></td>
		<td valign="top"><div id="player3"></div></td> 
		<td valign="top"><div id="player4"></div></td></tr> 
</table> 
<br><br><br><br><br><br><br><br><br><br>
</body>
</html>