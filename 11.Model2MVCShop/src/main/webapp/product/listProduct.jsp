<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        div.thumbnail{
        height:500px;
        width:340px;
        
        }
        
        
       
    </style>
    
        <style>
	.page-header.text-info {font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B}
	.text-info {font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B}
	.row { font-family: 'Gowun Batang', serif;}
	.table.table-hover.table-striped { font-family: 'Gowun Batang', serif;}

</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
			console.log('${param.menu}');
		}
		
		 
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
				
				$( "button.btn.btn-default:contains('����')" ).on("click" , function() {
					fncGetList(1);
				 
			 });
				
				$( "button.btn.btn-default:contains('�˻�')" ).on("click" , function() {
					fncGetList(1);
				 
			 });
			 
				});
		 
		 
		 
	</script>
	
</head>

<body>

	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info" style="color:#75574B;">
	       <c:if test="${param.menu.contains('manage') }">
	       ��ǰ����
	       </c:if>
	       <c:if test="${param.menu.contains('search') }">
	       ��ǰ�����ȸ
	       </c:if>
	       </h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary" style="color:black;">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			
			<form class="form-inline" name="detailForm">
				<div class="col-md-6 text-right">
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${!empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>��ǰ��ȣ</option>
							<option value="1"
								${!empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>��ǰ��</option>
							<option value="2"
								${!empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>��ǰ����</option>
						</select>

					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="prodname"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
							
					<button type="button" class="btn btn-default">�˻�</button>
					</div>
					
				</div>
				<div class="col-md-6 text-left">
					<div class="form-group">
						<c:if test="${user.role=='user' }">
						<select class="form-control" name="sortCondition">
							<option value="0"
								${!empty search.sortCondition && search.sortCondition==0 ? "selected" : ""}>�������ݼ�</option>
							<option value="1"
								${!empty search.sortCondition && search.sortCondition==1 ? "selected" : ""}>�������ݼ�</option>
							<option value="2"
								${!empty search.sortCondition && search.sortCondition==2 ? "selected" : ""}>�ֽŵ�ϼ�</option>
								
						</select>
					</c:if>						
					</div>
					
					<c:if test="${user.role=='admin' }">
						<select class="form-control" name="sortCondition">
					<option value="3"
								${!empty search.sortCondition && search.sortCondition==3 ? "selected" : ""}>�Ǹ���</option>
								<option value="4"
								${!empty search.sortCondition && search.sortCondition==4 ? "selected" : ""}>�Ǹ�����</option>
						</select>
						</c:if>						
					<button type="button"  class="btn btn-default">����</button>
				</div>
					
					
						<input type="hidden" id="currentPage" name="currentPage" value="" />
				
		</form>
			
		

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->


		</div>
</div>
	
		
<div class="container">
	
<div class="row">
	<c:set var="i" value="0" />

<c:if test="${param.menu=='search'}">
<c:forEach var="product" items="${list}">
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
    				<c:choose>
    
    	<c:when test="${(product.fileName).contains('/')}">
    		<c:forEach var="name" items="${(product.fileName).split('/')[0]}">
		<img class="imange" src="/images/uploadFiles/${name}" width="320" height="300" ><br/>
			</c:forEach>
		
      </c:when>
		
		<c:otherwise>
		
		<img class="imange" src="/images/uploadFiles/${product.fileName}" width="320" height="300"><br/>
		</c:otherwise>
		</c:choose>
		
      <div class="caption">
        <h4 style="color:black;">${product.prodName }</h4>
        <p>${product.price }</p>
        
        <c:choose>
        
        <c:when test="${product.cancel=='1' }">
        <p style="color:red;">�Ǹ�����</p>
        <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button">������</a> 
        
        <a class="btn btn-default" disabled="disabled" role="button">����</a></p>
        </c:when>
        
        <c:otherwise>
        <p><a href="/product/getProduct?menu=search&prodNo=${product.prodNo }" class="btn btn-default" role="button">������</a> 
        <a href="/purchase/addPurchase?menu=search&&prodNo=${product.prodNo }" class="btn btn-default" role="button">����</a> 
        </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>		
    </c:forEach>
    </c:if>
    
<c:if test="${param.menu=='manage'}">
    <c:forEach var="product" items="${list}">
    
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
     <c:choose>
    
    	<c:when test="${(product.fileName).contains('/')}">
    		<c:forEach var="name" items="${(product.fileName).split('/')[0]}">
		<img src="/images/uploadFiles/${name}" width="320" height="300"><br/>
			</c:forEach>
		
      </c:when>                                                                                                                           
		
		<c:otherwise>
		<img src="/images/uploadFiles/${product.fileName}" width="320" height="300"><br/>
		</c:otherwise>
		</c:choose>
      <div class="caption">
        <h4 style="color:black;">${product.prodName }</h4>
        <p>${product.price }</p>
        <c:if test="${product.cancel=='1' }">
        <p style="color:red;">�Ǹ�����</p>
        </c:if>
        <p><a href="/product/getProduct?menu=manage&prodNo=${product.prodNo }" class="btn btn-default" role="button" >������</a> 
        <a href="/product/updateProduct?menu=${param.menu}&prodNo=${product.prodNo }" class="btn btn-default" role="button">����</a>
       
      </div>
    </div>
  </div>		
    </c:forEach>
    </c:if>
  </div>
		
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>