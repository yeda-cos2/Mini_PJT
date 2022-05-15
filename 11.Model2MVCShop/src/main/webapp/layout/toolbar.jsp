<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">

<style>
.navbar-brand {font-family: 'Gowun Batang', serif; font-weight:bold; color:brown}
.navbar-brand li { font-family: 'Gowun Batang', serif;}
.navbar-header {font-family: 'Gowun Batang', serif;}
.nav { font-family: 'Gowun Batang', serif;, cursive; font-weight:bold; color:brown}
.navbar-right { font-family: 'Gowun Batang', serif;}
.navbar-fixed-top { font-family: 'Gowun Batang', serif;}
.navbar-default {font-family: 'Gowun Batang', serif;}
.navbar-toggle { font-family: 'Gowun Batang', serif;}
.navbar-collapse {font-family: 'Gowun Batang', serif;}

</style>
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default navbar-fixed-top" >
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">식탁의 온도</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">회원정보조회</a></li>
	                         </c:if>
	                         
	                         
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >판매상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">판매상품등록</a></li>
		                         <li><a href="#">판매상품관리</a></li>
		                         <li><a href="#">판매목록관리</a></li>
		                         <li class="divider"></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >상품구매</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">상품검색</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">구매이력조회</a></li>
	                         </c:if>
	                         
	                         <li><a href="#">최근본상품</a></li>
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >레시피</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">레시피검색</a></li>
              	             <li><a href="#">레시피등록</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">나의레시피</a></li>
	                         </c:if>
	                         
	                         <li><a href="#">최근본상품</a></li>
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                 
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">로그아웃</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	<script>

var userId="${sessionScope.user.userId}";
var userName="${sessionScope.user.userName}";
var phone="";

  (function() {
	  
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
 
  ChannelIO('boot', {
	 
    "pluginKey": "3310c66b-352b-4d99-abe5-07c258370f2d", //please fill with your plugin key
    "memberId": userId, //fill with user id
    "profile": {
      "name": userId, //fill with user name
      "mobileNumber": phone //fill with user phone number
    }
  });
</script>
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$( "a:contains('판매상품등록')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/addProduct");
		});
	 	
	 	$( "a:contains('판매목록관리')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('회원정보조회')" ) );
	 		$(self.location).attr("href","/purchase/listSale?menu=manage");
		}); 
	 	
	 	$( "a:contains('구매이력조회')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('회원정보조회')" ) );
	 		$(self.location).attr("href","/purchase/listPurchase?menu=search");
		}); 
	 	
	 	$( "a:contains('판매상품관리')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
	 	
		$( "a:contains('상품검색')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
		
		$( "a:contains('레시피검색')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/listRecipe");
		});
		
		$( "a:contains('레시피등록')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/addRecipe.jsp");
		});
	 	
		
	</script>  