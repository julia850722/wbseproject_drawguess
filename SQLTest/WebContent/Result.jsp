<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page contentType="text/html; charset=UTF-8"%>
<title>最終結果!!!!!!!!!!!!!</title>
</head>
<body>

<style type="text/css">img{border:0;}
li{list-style:none;}
img{border:0;}
body{ 
		background-image: url(images/1.jpg);
        background-repeat: no-repeat;
       	background-position: center;
        background-size: content;
        font-family: '微軟正黑體',sans-serif,'Open Sans';
        overflow:hidden;
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
        
div{border-radius: 10px;}
span{
font-family:微軟正黑體;

}
.user_callback #user_pic{position:relative;overflow:hidden;height:450px;width:1200px;z-index:2;margin:0 auto;}
.user_callback #user_pic ul{width:990px;height:285px;position:relative;top:20px;left:105px;}
.user_callback #user_pic ul li{position:absolute;}
.user_callback #user_pic ul img{position:relative;top:0;left:0;}

.user_callback #user_pic ul .user_pic1{top:-285px;left:-231px;z-index:0;}
.user_callback #user_pic ul .user_pic2{top:-23px;left: -99.5px;z-index:2;}
.user_callback #user_pic ul .user_pic3{top: 66px;left: 68px;z-index:3;}
.user_callback #user_pic ul .user_pic4{top:110px;left:247.5px;z-index:4;}
.user_callback #user_pic ul .user_pic5{top:110px;left:495px;z-index:3;}
.user_callback #user_pic ul .user_pic6{top:66px;left:695.5px;z-index:2;}
.user_callback #user_pic ul .user_pic7{top:-23px;left:852px;z-index:1;}
.user_callback #user_pic ul .user_pic8{top:-285px;left:1000px;z-index:0;}

.user_callback #user_pic ul .user_pic1 a{width:216.5px;height:248px;}
.user_callback #user_pic ul .user_pic2 a{width:225.5px;height:259px;}
.user_callback #user_pic ul .user_pic3 a{width:247.5px;height:285px;}
.user_callback #user_pic ul .user_pic4 a{width:247.5px;height:285px;}
.user_callback #user_pic ul .user_pic5 a{width:247.5px;height:285px;}
.user_callback #user_pic ul .user_pic6 a{width:247.5px;height:285px;}
.user_callback #user_pic ul .user_pic7 a{width:225.5px;height:259px;}
.user_callback #user_pic ul .user_pic8 a{width:216.5px;height:248px;}




.user_callback #user_pic ul li.user_pic1{opacity:0.2;filter:alpha(opacity:20);}
.user_callback #user_pic ul li.user_pic2{opacity:0.6;filter:alpha(opacity:60);}
.user_callback #user_pic ul li.user_pic3{opacity:0.8;filter:alpha(opacity:80);}
.user_callback #user_pic ul li.user_pic4{opacity:1;filter:alpha(opacity:100);}
.user_callback #user_pic ul li.user_pic5{opacity:1;filter:alpha(opacity:100);}
.user_callback #user_pic ul li.user_pic6{opacity:0.8;filter:alpha(opacity:80);}
.user_callback #user_pic ul li.user_pic7{opacity:0.6;filter:alpha(opacity:60);}
.user_callback #user_pic ul li.user_pic8{opacity:0.2;filter:alpha(opacity:20);}

.user_callback #user_pic ul li.user_pic1 img{width:216.5px;height:248px;}
.user_callback #user_pic ul li.user_pic2 img{width:225.5px;height:259px;}
.user_callback #user_pic ul li.user_pic3 img{width:230.5px;height:264px;}
.user_callback #user_pic ul li.user_pic4 img{width:247.5px;height:285px;}
.user_callback #user_pic ul li.user_pic5 img{width:247.5px;height:285px;}
.user_callback #user_pic ul li.user_pic6 img{width:230.5px;height:264px;}
.user_callback #user_pic ul li.user_pic7 img{width:225.5px;height:259px;}
.user_callback #user_pic ul li.user_pic8 img{width:216.5px;height:248px;}

.user_callback #user_pic span{display:inline-block;*display:inline;*zoom:1;width:150px;height:80px;position:absolute;top:160px;z-index:30;cursor:pointer;opacity:0.7;filter:alpha(opacity=70);}
.user_callback #user_pic:hover span{opacity:1;filter:alpha(opacity=100);}
.user_callback #user_pic span img{width:80px;height:80px;display:block;}
.user_callback #user_pic span.prev{background:url(5836af12Neb8a5654.png) no-repeat;position:absolute;top:100px;left:5px;display:inline-block; width:60px;height:60px;}
.user_callback #user_pic span.next{background:url(5836af12N536e472b.jpg) no-repeat;position:absolute;top:100px;right:5px;display:inline-block;width:60px;height:60px; }
.user_callback #user_pic span.prev:hover{background:url(19389726_1584761611536397_62178283_n.png) no-repeat;}
.user_callback #user_pic span.next:hover{background:url(19369538_1584761614869730_2126241027_n.jpg) no-repeat;}
.user_callback{background:#fffff;overflow:hidden;}</style>

<div class="user_callback">  
	<div class="user_pic" id="user_pic">   
		<span class="prev"></span>   <span class="next"></span>   
		<ul id="user_call">    
			<li class="user_pic1">
			<span><h3>第一位<br>所繪圖形</h3></span>
				<a href="#"> <img src="${photoURL1[0]}" alt="1" width="248" height="285" /></a>
			</li>    
			<li class="user_pic2"> 
			<span><h3>第二位<br>所猜答案：<br>${answer1[0]}</h3></span>
				<a href="#"> <img src="123.png" alt="1" width="248" height="285" /></a>
			</li>    
			<li class="user_pic3">
			<span><h3>第三位<br>所繪圖形</h3></span>
				<a href="#"> <img src="${photoURL1[1]}" alt="3" width="248" height="285" /></a>
			</li>    
			<li class="user_pic4">
			<span><h3>最後<br>的答案：<br>${answer1[1]}</h3></span>
				<a href="#"> <img src="123.png" alt="1" width="248" height="285" /></a>
			</li>    
			<li class="user_pic5"> 
				<a href="#"> <img src="123.png" alt="5" width="247" height="285" /></a>
			</li>    
			<li class="user_pic6">
				<a href="#"> <img src="123.png" alt="6" width="247" height="285" /></a>
			</li>    
			<li class="user_pic7">
				<a href="#"> <img src="123.png" alt="7" width="247" height="285" /></a> 
			</li>    
			<li class="user_pic8">
				<a href="#"> <img src="123.png" alt="8" width="247" height="285" /></a>
			</li>   
		</ul>  
	</div>
</div>

<script type="text/javascript">function arcSlip()
  {
	 var oPic=document.getElementById('user_pic');
	 var oPrev=getByClass(oPic,'prev')[0];
	 var oNext=getByClass(oPic,'next')[0];
	 
	 var aLi=oPic.getElementsByTagName('li');
	 
	 var arr=[];
	 
	 for(var i=0;i<aLi.length;i++)
	 {
	   var oImg=aLi[i].getElementsByTagName('img')[0];
	   
	 	 arr.push([parseInt(getStyle(aLi[i],'left')),parseInt(getStyle(aLi[i],'top')),
		           getStyle(aLi[i],'zIndex'),oImg.width,parseFloat(getStyle(aLi[i],'opacity')*100)]);
	 }
	 
	 
	 oPrev.onclick=function moveTP()
	 {
	     arr.push(arr[0]);
		 arr.shift();
		     for(var i=0;i<aLi.length;i++)
	         {
			     var oImg=aLi[i].getElementsByTagName('img')[0];
					
					aLi[i].style.zIndex=arr[i][2];
					startMove(aLi[i],{left:arr[i][0],top:arr[i][1],opacity:arr[i][4]});
					startMove(oImg,{width:arr[i][3]});
			 }
			
	 }
	 
	oNext.onclick=function moveTN()
	 {
	      arr.unshift(arr[arr.length-1]);
		  arr.pop();
		     for(var i=0;i<aLi.length;i++)
	         {
			     var oImg=aLi[i].getElementsByTagName('img')[0];
					
					aLi[i].style.zIndex=arr[i][2];
					startMove(aLi[i],{left:arr[i][0],top:arr[i][1],opacity:arr[i][4]});
					startMove(oImg,{width:arr[i][3]});
			 }
	 }
    var moveTime = setInterval (function(){
	
		oNext.click();
		
		},1000);
	$('#user_pic').hover(function(){
		;;
         clearInterval(moveTime);
            },function(){
        moveTime=setInterval(function(){	
		oNext.click();		
		},1000);
            });
				
 function getStyle(obj,name)
	 {
	       if(obj.currentStyle){ return obj.currentStyle[name]; }
		   else{ return getComputedStyle(obj,false)[name]; }
	 }
  } 
function getByClass(oParent,sClass)
  {
      var aResult=[];
	  var aEle=oParent.getElementsByTagName('*');
	  
		  for(var i=0;i<aEle.length;i++)
		  {
			 if(aEle[i].className==sClass)
			 {
				aResult.push(aEle[i]);
			 }
		  }
	  return aResult;
  }
function getStyle(obj,name)
  {
       if(obj.currentStyle)
	   {
	       return obj.currentStyle[name];
	   }
       
	   else
	   {
	       return getComputedStyle(obj,false)[name];
	   }
  }
 function startMove(obj,json,fnEnd)
  {
       clearInterval(obj.timer);
       obj.timer=setInterval(function()
	   {
		 var bStop=true;
		 for(var attr in json)
	     {	
			   var cur=0;
	
			   if(attr=='opacity')
			   {
					cur=Math.round(parseFloat(getStyle(obj,attr))*100);
			   }
			   else
			   {
					cur=parseInt(getStyle(obj,attr));
			   }
		  
			   var  speed=(json[attr]-cur)/6;
			   speed=speed>0?Math.ceil(speed):Math.floor(speed);
		   
			   if(cur!=json[attr]) bStop=false;
			 
			   if(attr=='opacity')
			   {
				   obj.style.filter='alpha(opacity:'+(cur+speed)+')';
				   obj.style.opacity=(cur+speed)/100;
			   }
			   else
			   {
				   obj.style[attr]=cur+speed+'px';
			   }
		 }
		 
		 if(bStop)
		 {
		     clearInterval(obj.timer);
			 if(fnEnd) fnEnd();
		 }
		 
	   },30)
	   
	 
  }

  arcSlip();
</script>

<%		
            int i= (int)request.getAttribute("result");
	ServletContext ansContext = this.getServletContext();
        	String strquiz = (String)ansContext.getAttribute("quiz");
        	
            if(i==1){out.print("<p><h1><font face='微軟正黑體' color='#f26101'>恭喜！您答對了！<p>正確解答是    "+strquiz+"</font></h1>");}
            else{out.print("<p><h1><font face='微軟正黑體' color='#f26101'>抱歉！您答錯了！<p>正確解答是    "+strquiz+"</font></h1>");}
            out.print("<form method='post' action='DeleteDBServlet' style='font-size:20px;'><input name='button' type='submit' id='button' value='清除資料庫'></form>");
            
  %>       

</body>
</html>

