<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
			font-family: 'Gowun Batang', serif; 
     
        }
        
        blockquote {
  margin-left: 0px;
  margin-right: 0px;
  padding-left: 20px;
  padding-right: 20px;
  border-left: 10px solid #75574B;
}
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
	      <ol class="carousel-indicators">
	        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	        <li data-target="#myCarousel" data-slide-to="1"></li>
	        <li data-target="#myCarousel" data-slide-to="2"></li>
	      </ol>
	      <div class="carousel-inner" role="listbox">
	        <div class="item active">
	          <img class="first-slide" src="/images/mandoo.PNG" alt="First slide">
	          
	          <div class="container">
	            <div class="carousel-caption">
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img class="second-slide" src="/images/gajung.PNG" alt="Second slide">
	          <div class="container">
	            <div class="carousel-caption">
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img class="third-slide" src="/images/mandoo.PNG" alt="Third slide">
	          <div class="container">
	            <div class="carousel-caption">
	            </div>
	          </div>
	        </div>
	      </div>
	      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	      </a>
	      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	      </a>
	    </div>
	
	</div>


	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
	
<div class="row">

<br/><br/>
  <div class="col-sm-12 col-md-12 col-lg-12">
<blockquote>
  <p style="color:#75574B  ;"><b>이달의 Best 상품</b></p>
</blockquote>
</div>

  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="/images/ddc55d4ef3b0257f17c2bb8560a40c91.jpg" height="300" alt="...">
      <div class="caption">
        <h4 style="color:black;">Vintage Plate</h4>
        <p>31000원</p>
        <p><a href="/product/getProduct?menu=search&prodNo=10000" class="btn btn-default" role="button">상세정보</a> <a href="/purchase/addPurchase?menu=search&prodNo=10000" class="btn btn-default" role="button">구매</a></p>
      </div>
    </div>
  </div>
  
   <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="/images/ddd.PNG" height="300" alt="...">
      <div class="caption">
        <h4 style="color:black;">Wood Tray</h4>
        <p>12000원</p>
        <p><a href="/product/getProduct?menu=search&prodNo=10000" class="btn btn-default" role="button">상세정보</a> <a href="/purchase/addPurchase?menu=search&prodNo=10000" class="btn btn-default" role="button">구매</a></p>
      </div>
    </div>
  </div>
  
   <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="/images/1622711370004681.jpg" height="300" alt="...">
      <div class="caption">
        <h4 style="color:black;">Conchiglioni Rigati</h4>
        <p>14000원</p>
        <p><a href="/product/getProduct?menu=search&prodNo=10000" class="btn btn-default" role="button">상세정보</a> <a href="/purchase/addPurchase?menu=search&prodNo=10000" class="btn btn-default" role="button">구매</a></p>
      </div>
    </div>
  </div>
</div>



</div>
</body>
</html>