<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 
 <!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
      <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
	<!--  ///////////////////////// font ////////////////////////// -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


    
    
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <!-- 로컬 파일 summernote css/js -->
   <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="/javascript/summernote-lite.js"></script>
  <script src="/javascript/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="/css/summernote-lite.css">
  <!--  -->
    
	
   
	<style>
 		body {
            padding-top : 50px;
            font-family: 'Gowun Batang', serif;
        }
     </style>
     
     <style>
	.page-header {font-family: 'Gowun Batang', serif; font-weight:bold; color:brown}
	.text-info {font-family: 'Gowun Batang', serif; font-weight:bold; color:brown}
	.row { font-family: 'Gowun Batang', serif;}
	</style>
     
     
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('구매')" ).on("click" , function() {
					self.location = "/purchase/addPurchase?menu=${param.menu}&prodNo=${product.prodNo}"
				});
			
			 $( "button:contains('확인')" ).on("click" , function() {
					self.location = "/product/listProduct?menu=manage"
				});
			 
			 $( "button:contains('취소')" ).on("click" , function() {
					history.go(-1);
				});
			 
			 
		});
		
	</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">상품상세조회</h3>
			<br></br>
		</div>
		
		<div class="row">
				<c:choose>
		<c:when test="${(product.fileName).contains('/')}">
		<c:forEach var="name" items="${(product.fileName).split('/')}">
		<img src="/images/uploadFiles/${name}" width="300" height="300"><br/>
		</c:forEach>
		</c:when>
		
		<c:otherwise>
		<img src="/images/uploadFiles/${product.fileName}" width="300" height="300"><br/>
		</c:otherwise>
		</c:choose>
		</div>
		<hr />

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품재고수량</strong></div>
			<div class="col-xs-8 col-md-4">${product.total}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		
		<hr/>
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		<hr/>
				
				

		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  		<c:if test="${param.menu=='manage'}">
	  		<button type="button" class="btn btn-default">확인</button>
	  		
			</c:if>
			<c:if test="${param.menu=='search'}">
	  			<button type="button" class="btn btn-default">구매</button>
		<button type="button" class="btn btn-default">취소</button>
				</c:if>	
		
				
	  		</div>
		</div>
		
		<br/>


		<div class="page-header">
			<h2>Review</h2>
		</div>
		
		
<div class="form-group">
     <label>내용</label>
     <textarea id="summernote" class="form-control" name="content">
      
     </textarea>
    <script>
      $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        height: 300
      });
    </script>
  </div>

		
		
	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>