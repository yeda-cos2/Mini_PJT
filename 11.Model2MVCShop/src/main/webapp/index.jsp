<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	body {
  margin: 0;
              font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B
  
}

@import url('https://fonts.googleapis.com/css?family=Amatic+SC');
body {
    background-color: #ECE6CC ;
    height: 100vh;
    width: 100vw;
    overflow: hidden;
                  font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B
    
}

h1 {
    position: relative;
    margin: 0 auto;
    top: 15vh;
    width: 100vw;
    text-align: center;
    font-size: 6vh;
    color: #333;
    opacity: 2;
                      font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B
    
}

#cooking {
    position: relative;
    margin: 0 auto;
    top: 0;
    width: 75vh;
    height: 75vh;
    overflow: hidden;
}

#cooking #area {
    position: absolute;
    bottom: 0;
    right: 0;
    width: 50%;
    height: 50%;
    background-color: transparent;
    transform-origin: 15% 60%;
    animation: flip 2.1s ease-in-out infinite;
}

#cooking #area #sides {
    position: absolute;
    width: 100%;
    height: 100%;
    transform-origin: 15% 60%;
    animation: switchSide 2.1s ease-in-out infinite;
}

#cooking #area #sides #handle {
    position: absolute;
    bottom: 18%;
    right: 80%;
    width: 35%;
    height: 20%;
    background-color: transparent;
    border-top: 1vh solid #333;
    border-left: 1vh solid transparent;
    border-radius: 100%;
    transform: rotate(20deg) rotateX(0deg) scale(1.3, 0.9);
}
#cooking #area #sides #pan {
    position: absolute;
    bottom: 20%;
    right: 30%;
    width: 50%;
    height: 8%;
    background-color: #333;
    border-radius: 0 0 1.4em 1.4em;
    transform-origin: -15% 0;
}

#cooking #area #pancake {
    position: absolute;
    top: 24%;
    width: 100%;
    height: 100%;
    transform: rotateX(85deg);
    animation: jump 2.1s ease-in-out infinite;
}

#cooking #area #pancake #pastry {
    position: absolute;
    bottom: 26%;
    right: 37%;
    width: 40%;
    height: 45%;
    background-color: #333;
    box-shadow: 0 0 3px 0 #333;
    border-radius: 100%;
    transform-origin: -20% 0;
    animation: fly 2.1s ease-in-out infinite;
}

#cooking .bubble {
    position: absolute;
    border-radius: 100%;
    box-shadow: 0 0 0.25vh #4d4d4d;
    opacity: 0;
}

#cooking .bubble:nth-child(1) {
    margin-top: 2.5vh;
    left: 58%;
    width: 2.5vh;
    height: 2.5vh;
    background-color: #454545;
    animation: bubble 2s cubic-bezier(0.53, 0.16, 0.39, 0.96) infinite;
}

#cooking .bubble:nth-child(2) {
    margin-top: 3vh;
    left: 52%;
    width: 2vh;
    height: 2vh;
    background-color: #3d3d3d;
    animation: bubble 2s ease-in-out 0.35s infinite; 
}

#cooking .bubble:nth-child(3) {
    margin-top: 1.8vh;
    left: 50%;
    width: 1.5vh;
    height: 1.5vh;
    background-color: #333;
    animation: bubble 1.5s cubic-bezier(0.53, 0.16, 0.39, 0.96) 0.55s infinite;
}

#cooking .bubble:nth-child(4) {
    margin-top: 2.7vh;
    left: 56%;
    width: 1.2vh;
    height: 1.2vh;
    background-color: #2b2b2b;
    animation: bubble 1.8s cubic-bezier(0.53, 0.16, 0.39, 0.96) 0.55s infinite;
}

#cooking .bubble:nth-child(5) {
    margin-top: 2.7vh;
    left: 63%;
    width: 1.1vh;
    height: 1.1vh;
    background-color: #242424;
    animation: bubble 1.6s ease-in-out 1s infinite; 
}


@keyframes pulse {
    0% {
        transform: scale(1, 1);
        opacity: 0.25;
    }
    50% {
        transform: scale(1.2, 1);
        opacity: 1;
    }
    100% {
        transform: scale(1, 1);
        opacity: 0.25;
    }
}

@keyframes flip {
    0% {
        transform: rotate(0deg);
    }

    5% {
        transform: rotate(-27deg);
    }

    30%, 50% {
        transform: rotate(0deg);
    }

    55% {
        transform: rotate(27deg);
    }

    83.3% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(0deg);
    }
}

@keyframes switchSide {
    0% {
        transform: rotateY(0deg) ;
    }

    50% {
        transform: rotateY(180deg);
    }
    100% {
        transform: rotateY(0deg);
    }
}

@keyframes jump {
    0% {
        top: 24;
        transform: rotateX(85deg);
    }
    25% {
        top: 10%;
        transform: rotateX(0deg);
    }
    50% {
        top: 30%;
        transform: rotateX(85deg);
    }
    75% {
        transform: rotateX(0deg);
    }
    100% {
        transform: rotateX(85deg);
    }
}

@keyframes fly {
    0% {
        bottom: 26%;
        transform: rotate(0deg);
    }
    10% {
        bottom: 40%;
    }
    50% {
        bottom: 26%;
        transform: rotate(-190deg);
    }
    80% {
        bottom: 40%;
    }
    100% {
        bottom: 26%;
        transform: rotate(0deg);
    }
}

@keyframes bubble {
    0% {
        transform: scale(0.15, 0.15);
        top: 80%;
        opacity: 0;
    }
    50% {
        transform: scale(1.1, 1.1);
        opacity: 1;
    }
    100% {
        transform: scale(0.33, 0.33);
        top: 60%;
        opacity: 0;
    }
}
	
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		

		   $( function() {
		         //==> 추가된부분 : "addUser"  Event 연결
		         $("a[href='#' ]:contains('JOIN')").on("click" , function() {
		            self.location = "/user/addUser"
		         });
		      });
		      
		      //============= 로그인 화면이동 =============
		      $( function() {
		         //==> 추가된부분 : "addUser"  Event 연결
		         $("a[href='#' ]:contains('LOGIN')").on("click" , function() {
		            self.location = "/user/login"
		         });
		         $("a[href='#' ]:contains(' LOGIN')").on("click" , function() {
		            self.location = "/user/login"
		         });
		      });
		
	</script>	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">식탁의 온도</a>
        	
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
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#"><span class="glyphicon glyphicon-log-in" aria-hidden="true"/> LOGIN</a></li>
	                 <li><a href="#" class="disabled">|</a></li>
	                 <li><a href="#">JOIN</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	<!--  화면구성 div end /////////////////////////////////////-->
	
	<body>
    <h1>식탁의 온도</h1>
    <div id="cooking">
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div id=area>
            <div id="sides">
                <div id="pan"></div>
                <div id="handle"></div>
            </div>
            <div id="pancake">
                <div id="pastry"></div>
            </div>
        </div>
    </div>
    
</body>
</body>

</html>