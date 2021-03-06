<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ???? : http://getbootstrap.com/css/   ???? -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// font ////////////////////////// -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
body {
	padding-top: 50px;
	font-family: 'Gowun Batang', serif;
}
</style>


<style>
.page-header {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: brown
}

.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: brown
}

.row {
	font-family: 'Gowun Batang', serif;
}
</style>
     
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ?????????? Event  ó?? =============	
		 $(function() {
			//==> DOM Object GET 3???? ???? ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('????')" ).on("click" , function() {
					self.location = "/purchase/addPurchase?menu=${param.menu}&prodNo=${product.prodNo}"
				});
			
			 $( "button:contains('Ȯ??')" ).on("click" , function() {
					self.location = "/product/listProduct?menu=manage"
				});
			 
			 $( "button:contains('????')" ).on("click" , function() {
					history.go(-1);
				});
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ?鱸?? div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">??ǰ??????ȸ</h3>
			<br></br>
		</div>
		
		<div class="row">
			<img src="/images/uploadFiles/${product.fileName}" width="300" height="300"><br/>
		</div>
		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>??ǰ??ȣ</strong>
			</div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>

		<hr />

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>??ǰ??</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>????????</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>??ǰ????????</strong></div>
			<div class="col-xs-8 col-md-4">${product.total}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>????????</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		
		<hr/>
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>????</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		<hr/>
		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  		<c:if test="${param.menu=='manage'}">
	  			  			<button type="button" class="btn btn-default">Ȯ??</button>
	  		
			</c:if>
			<c:if test="${param.menu=='search'}">
	  			<button type="button" class="btn btn-default">????</button>
				</c:if>	
		
		<button type="button" class="btn btn-default">????</button>
				
				
				
	  		</div>
		</div>
		
		<br/>
		
		<div class="row">
			<h3 class=" text-info" style="color: #75574B;">????????</h3>
			<br/>
	<c:set var="i" value="0" />
<c:forEach var="review" items="${list}">
		<div class="caption">

        
        
        <blockquote>
  <footer>${review.content }</footer>
</blockquote>

        <hr/>
        </div>
        </c:forEach>
		</div>

 	</div> <!-- container -->
 	<!--  ȭ?鱸?? div Start /////////////////////////////////////-->

</body>

</html>