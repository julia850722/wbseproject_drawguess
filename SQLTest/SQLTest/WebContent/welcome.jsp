<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>你畫我猜</title>
<style type = "text/css">
body {
	margin-top: -100px;
	padding: 0;
	background-image: url(images/1.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size: content;
    overflow:hidden;
    font-family: '微軟正黑體',sans-serif,'Open Sans';
    overflow-x:hidden;
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
	margin-top:5%;
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
	text-align: justify;
	width:800px;
	height:800px;
	overflow:hidden;
	word-break:break-all;
}

.box1{
	position: absolute;
	left:50%;
	top: 88%;
	border:2px #91BED4 solid;
	border-radius:10px;
	background-color:#D9E8F5;
	width:150px;
	height:50px;
	font-size: 20px;
	color: #304269;
	font-weight:bold;
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

.box2{
	position: absolute;
	left:40%;
	top: 88%;
	cursor: pointer;
}


.loginStatus{
	position: absolute;
	left:37%;
	top: 96%;
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


button{
	border:2px #91BED4 solid;
	border-radius:10px;
	background-color:#D9E8F5;
	width:120px;
	height:50px;
	font-size: 20px;
	color: #304269;
	font-weight:bold;
}

</style>




</head>
<body>
	<div id="fb-root"></div>
	<script>
	var  logined = false;
		function statusChangeCallback(response) {
	    console.log('statusChangeCallback');
	    console.log(response);
	    // The response object is returned with a status field that lets the
	    // app know the current login status of the person.
	    // Full docs on the response object can be found in the documentation
	    // for FB.getLoginStatus().
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
	      logined = true;
	      testAPI();
	    } else if (response.status === 'not_authorized') {
	      // The person is logged into Facebook, but not your app.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this app.';
	    } else {
	      // The person is not logged into Facebook, so we're not sure if
	      // they are logged into this app or not.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into Facebook.';
	    }
	  }

	  // This function is called when someone finishes with the Login
	  // Button.  See the onlogin handler attached to it in the sample
	  // code below.
	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }

	  window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '122859488290006',
	    cookie     : true,  // enable cookies to allow the server to access 
	                        // the session
	    xfbml      : true,  // parse social plugins on this page
	    version    : 'v2.2' // use version 2.2
	  });

	  // Now that we've initialized the JavaScript SDK, we call 
	  // FB.getLoginStatus().  This function gets the state of the
	  // person visiting this page and can return one of three states to
	  // the callback you provide.  They can be:
	  //
	  // 1. Logged into your app ('connected')
	  // 2. Logged into Facebook, but not your app ('not_authorized')
	  // 3. Not logged into Facebook and can't tell if they are logged into
	  //    your app or not.
	  //
	  // These three cases are handled in the callback function.

	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  });

	  };

	  // Load the SDK asynchronously
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.9&appId=122859488290006";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));

	  // Here we run a very simple test of the Graph API after login is
	  // successful.  See statusChangeCallback() for when this call is made.
	  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	    });
	  }
	  
	  function fb_login(){
		  FB.login(function(response){
			  statusChangeCallback(response);
			  console.log(response);
		  },{scope:'public_profile,email'});
	  }
	  
	  function checking(){
		  console.log("checking");
		  if(logined == false){
			  console.log("please login");
			  alert("請先登入Facebook網站");
			  return;
		  }
		  else{
			  
			  window.location.href='ChooseFriends.jsp';
			  //window.open('http://www.google.com');
			  window.event.returnValue=false;
		  }
	  }
	</script>

	
	<div id="header">
		<div id="logo">
			<h1><img src="images/title4.png" width="1200"></h1>
		</div>
	</div>
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title">遊戲介紹</h2>
						<div style="clear: both;">&nbsp;</div>
							<div class="entry">
								<strong>
								想玩妙筆神猜，但身邊沒有這款桌遊，或是懶得去桌遊店嗎？<br>
								不用擔心，現在，坐在電腦前也可以玩！<br>	
								只要，登入FB，選擇隊友，並分配順序，就可以開始玩囉！<br>
								我們會發送訊息給你所選擇的好友們，通知他們遊戲開始。<br>
								首位玩家會從題庫中獲得一道題目，畫完提交後會傳給第二位玩家。<br>
								第二位玩家猜首位玩家畫的內容，回答完再傳給第三位玩家。<br>
								第三位玩家則是根據第二位玩家所提交的內容來畫，畫完提交給第四位玩家，
								以此類推。<br>
								</strong>
								<strong style="color:red">注意事項：選擇好友時，只能選擇共同好友哦！你如果是邊緣人的話，這款遊戲可能就不適合你呦！啾咪<3<br></strong>
								<form method="post">
								<button onClick="checking()" class="box1"><span>開始遊戲</span></button>
								</form>
								<%-- <form method="post" action="FBServlet">
								<input name="button" type="submit" class="box2" id="button" value="登入"></form>--%>
								<button onClick="fb_login()" class="box2">登入</button>
								<div class="fb-share-button" data-href="https://goo.gl/G8tDdu" data-layout="button" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse"></a></div>
								<div id="status" class="loginStatus"></div>
							</div>
				</div>
			</div>
				
		</div>

	
</body>
</html>