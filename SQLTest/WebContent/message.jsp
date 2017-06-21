<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知下一位</title>
<style type = "text/css">
body {
	margin: 0;
	padding: 0;
	background-image: url(images/1.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size: content;
    overflow:hidden;
    font-family: '微軟正黑體',sans-serif,'Open Sans';
}


h2{
	margin: 0px;
	padding: 0px;
	letter-spacing: -2px;
	text-transform: capitalize;
	font-weight: normal;
	color: #F26201;
	font-size: 5em;
}

strong{
	margin-top: 0;
	line-height: 150%;
	font-size: 25px;
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

/* Page */

#page {
	width: 850px;
	margin: 0px auto 0px auto;
	padding: 30px 0px 0 0px;
	border: 1px solid rgba(0,0,0,.05);
	box-shadow: 0px 0px 0px 10px rgba(0,0,0,0.03);
	border-radius: 8px;
	height:500px;
	overflow:hidden;
}

/* Content */

#content {
	float: left;
	width: 850px;
	padding-left: 20px;
}

.post {
	margin-bottom: 15px;
	overflow: hidden;
}


.post .title {
	padding-left: 0.5em;
	font-size: 40px;
	line-height: 40px;
	border-left: 4px solid #304269;
	color: #304269;
}
.post .entry {
	padding-bottom: 20px;
	text-align: center;
	width:800px;
	height:800px;
	overflow:hidden;
	word-break:break-all;
}

.box1{
	position: absolute;
	left:45%;
	top: 60%;
	border:2px #91BED4 solid;
	border-radius:10px;
	background-color:#D9E8F5;
	width:130px;
	height:50px;
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


input{
	border:2px #91BED4 solid;
	border-radius:10px;
	background-color:#D9E8F5;
	width:120px;
	height:50px;
	font-size: 20px;
	color: #304269;
	font-weight:bold;
}

.send{
	background-color: #3b5998;
	color: white; 
	border-style:none;
	border-radius:5px; 
	width:300px;
	height:50px;
	font-size:20px;"
	cursor: pointer;
}
</style>
</head>
<body>

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
  
    FB.api(
    		  '100000761018305',
    		  'GET',
    		  {"fields":"id,name,friends{id,name,picture}"},
    		  function(response) {
    		      // Insert your code here
    		          		      
    			  console.log('Successful login for: ' + response.name);
    		     
    		  
			}/*,{scope: 'public_action, read_custom_friendlists'}*/);	
  }
  function logout(){
	  FB.logout(function(response) {
		  // user is now logged out
		});
  }
  
  //我加的
  function sendMessage(){
	  
	//我加的 messanger發送訊息給好友----
    FB.ui({
    	  method: 'send',
    	  link: 'https://goo.gl/dShHch',
		  to:  	document.getElementById("friend1").value,
    });
  

  }
</script>
  <div id="header">
		<div id="logo">
			<h1><img src="images/title4.png" width="1200"></h1>
		</div>
	</div>


	<script>
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.9&appId=122859488290006";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	
	<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"></h2>
						<div style="clear: both;">&nbsp;</div>
							<div class="entry">
								<strong>
								<br>
								<br>
								<br>
								請傳訊息給下一位好友，<br>
								提醒他，換他囉！<br>
								按此<img src="images/finger" width="40"><br>
								
								</strong>
								<button onClick="sendMessage()" class="send">send message to next person!</button>
								<c:if test="${id == 1}">
								<input type="hidden" name="friend1" value= ${FriendId.get(1)} id = "friend1">
								</c:if>
								<c:if test="${id == 2}">
								<input type="hidden" name="friend2" value= ${FriendId.get(2)} id = "friend1">
								</c:if>
								<c:if test="${id == 3}">
								<input type="hidden" name="friend3" value= ${FriendId.get(3)} id = "friend1">
								</c:if>
							</div>
				</div>
			</div>
				
		</div>
</body>
</html>