<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Choose Friend</title>
<style type = "text/css">
body {
	margin-top: -30px;
	padding: 0;
	background-image: url(images/1.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size: content;
    overflow-x:hidden;
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



.button {
		  display: inline-block;
		  border-radius: 10px;
		  background-color:#D9E8F5;
		  border: 2px #91BED4 solid;
		  color: #304269;
		  text-align: center;
		  font-size: 28px;
		  padding: 0px;
		  width:120px;
		  height:50px;
		  transition: all 0.5s;
		  cursor: pointer;
		  margin: 5px;
		  position: absolute;
		  left:45%;
		  top: 60%;
		  font-weight:bold;
}
.button span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
}
		
.button span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
}
		
.button:hover span {
		  padding-right: 25px;
}
		
.button:hover span:after {
		  opacity: 1;
		  right: 0;
}

input[type=checkbox]{
		vertical-align:middle;
		zoom:2;
}

</style>




</head>
<body>
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
	    		  '/me',
	    		  'GET',
	    		  {"fields":"id,name,friends{id,name,picture}"},
	    		  function(response) {
	    		      // Insert your code here
	    			  console.log('Successful login for: ' + response.name);
	    		      
	    			  var myobj = response.friends;
	 				 console.log(myobj.data[1].id); 
	 				 var i, j, x = "";
	 				x +="<p>";
	 				 x += "<form method='post' action='sort'>";
	 				x+= "<input type = 'hidden' name ='myId' value ='"+response.id+"'>";
	 				 for (i in myobj.data) {
	 					 x += "<td><input type='checkbox' name='friend' value='"+myobj.data[i].id+"' ><img src='"+myobj.data[i].picture.data.url+"' width='50'/>"+ myobj.data[i].name+"&nbsp;" +"</td>";
	 					 console.log(myobj.data[i].id);
	 				 }
	 				 x += "</tr>";
	 				 x += "<br><button class='button'><span>確認</span></button>";
	 				 x += "</form>";
	 				 
	 				 document.getElementById("status").innerHTML = x;
	    		  
				}/*,{scope: 'public_action, read_custom_friendlists'}*/);	
	  }
	  function logout(){
		  FB.logout(function(response) {
			  // user is now logged out
			});
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
					<h2 class="title">選擇與你共同遊玩的3位朋友:</h2>
						<p>
						<div style="clear: both;">&nbsp;</div>
							<div class="entry" id = "status">
							</div>
				</div>
			</div>
				
		</div>

	
</body>
</html>