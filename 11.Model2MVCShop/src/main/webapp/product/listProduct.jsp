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
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
			 
				
			$("td.manage").css("color","brown");
			$("td.search").css("color","brown");

			
			$("td.manage").on("click" , function() {
				console.log($(this).attr("value"));
				self.location ="/product/updateProduct?menu=${param.menu}&prodNo="+$(this).attr("value")

			});
			
			$("td.search").on("click",function() {
				console.log($(this).attr("value"));
				self.location = "/product/getProduct?menu=${param.menu}&prodNo="
						+ $(this).attr("value")

			
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

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

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
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
							
					</div>

					<button type="button" class="btn btn-default">�˻�</button>
			

					<div class="form-group">
						<select class="form-control" name="sortCondition">
							<option value="0"
								${!empty search.sortCondition && search.sortCondition==0 ? "selected" : ""}>�������ݼ�</option>
							<option value="1"
								${!empty search.sortCondition && search.sortCondition==1 ? "selected" : ""}>�������ݼ�</option>
							<option value="2"
								${!empty search.sortCondition && search.sortCondition==2 ? "selected" : ""}>�ֽŵ�ϼ�</option>
						</select>
						
					</div>

					<button type="button"  class="btn btn-default">����</button>
						<input type="hidden" id="currentPage" name="currentPage" value="" />
				
				</form>
			</div>
		

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->


		</div>
		
		
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="center">��ǰ��</th>
            <th align="center">����</th>
            <th align="center">��ǰ���</th>
            <th align="center">�����</th>
            <th align="center">�������</th>
          </tr>
        </thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">${ i }</td>
						<c:if test="${param.menu.contains('manage')}">
							<td align="left" class="manage" value="${product.prodNo}">${product.prodName}</td>
						</c:if>


						<c:if test="${param.menu.contains('search')}">
							<c:if
								test="${(product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300')&&(product.total==0)}">
								<td align="left" style="background-color: #B4A696">${product.prodName}</td>
							</c:if>
							<c:if
								test="${!(product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300')}">
								<td align="left" class="search" value="${product.prodNo }">${product.prodName}</td>
							</c:if>

						</c:if>

						
						<td align="left">${product.price}</td>
						<td align="left">${product.total}</td>
						<td align="left">${product.regDate}</td>
						<td align="left"><c:if test="${user.role=='user' }">
								<c:choose>
									<c:when
										test="${(product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300')&&(product.total==0)}">
											������
										</c:when>
									<c:otherwise>
										�Ǹ���
										</c:otherwise>
								</c:choose>
							</c:if> <c:if test="${user.role=='admin' }">
								<c:choose>
									<c:when
										test="${product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300'}">
									���ſϷ�
									</c:when>
									<c:otherwise>
								�Ǹ���
							</c:otherwise>
								</c:choose>
							</c:if></td>
					</tr>
					
				</c:forEach>
				<tr>
						<td id="${product.prodNo }" colspan="11" bgcolor="#ffffff"
							height="1"></td>

					</tr>

			</tbody>

		</table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>