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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
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
        
        .tableheader th{
       text-align:center;
       }
    </style>
    
    <style>
	.page-header.text-info {font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B}
	.text-info {font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B}
	.row { font-family: 'Gowun Batang', serif;}
	.table.table-hover.table-striped { font-family: 'Gowun Batang', serif;}

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
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listSale").submit();
		}
		
		
		 $(function() {
		
						
			$( "td.buyer" ).css("color" , "green");
			$( "td.dv:contains('����ϱ�')" ).css("color" , "red");
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "green");
			
			$( "td.dv:contains('����ϱ�')" ).on("click" , function() {
				console.log("tranNo"+$(this).attr("value"));
				self.location ="/purchase/updateTranCode?menu=search&tranCode=100&tranNo="+$(this).attr("value")
		});
			
			
			
			$( "td.tno" ).on("click" , function() {
				console.log($(this).attr("value"));
						
				var tranNo =$(this).attr("value");
				
				$.ajax( 
						{
							url : "/purchase/json/getPurchase/"+tranNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								
								//alert("JSONData : \n"+JSONData);

								var displayValue = "<h5>"
															+":: ���� ���� ��ȸ ::<br/><br/>"
															+"���Ź�ȣ : "+JSONData.tranNo+"<br/>"
															+"���Ź�� : "+JSONData.paymentOption+"<br/>"
															+"�����ڼ��� : "+JSONData.receiverName+"<br/>"
															+"�����ڿ���ó : "+JSONData.receiverPhone+"<br/>"
															+"����� : "+JSONData.divyAddr+"<br/>"
															+"���ż��� : "+JSONData.purchaseCount+"��<br/>"
															+"��û���� : "+JSONData.divyRequest+"<br/>"
															+"���������� : "+JSONData.divyDate+"<br/>"

															+"</h5>";
								//Debug...									
								//alert(displayValue);
								$("h4").remove();
								$("h5").remove();
								$( "#"+tranNo+"" ).html(displayValue);
							}
					});		
						
			});
			
			$( "td.buyer" ).on("click" , function() {
				console.log($(this).attr("value"));
				var userId = $(this).text().trim();
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData.userId);
								
								var displayValue = "<h4>"
															+":: ȸ�� ��ȸ ::<br/>"
															+"���̵� : "+JSONData.userId+"<br/>"
															+"��  �� : "+JSONData.userName+"<br/>"
															+"�̸��� : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"����� : "+JSONData.regDateString+"<br/>"
															+"</h4>";
								//Debug...									
								//alert(displayValue);
								$("h5").remove();
								$("h4").remove();
								$( "#"+userId+"" ).html(displayValue);
							}
					});
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
	
		<div class="page-header text-info">
	       	       <h3 class=" text-info" style="color:#75574B;">
�ǸŸ����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary" style="color:black;">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    </div>

		    
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr class="tableheader">
            <th align="left">No</th>
            <th align="left" >��ǰ��ȣ</th>
            <th align="left">�������</th>
            <th align="left">�����Ȳ</th>
            <th align="left">����ȸ��</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			<td align="center">${ i }</td>
			
			<td align="center"  class="tno" id="${purchase.tranNo }" value="${purchase.tranNo }">${purchase.purchaseProd.prodNo }</td>
			 <c:choose>
			
				<c:when test="${purchase.tranCode.equals('100')}">
					<td align="center">���� <b>���ſϷ�</b> �����Դϴ�.
					</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="center">���� <b>�����</b> �����Դϴ�.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center"><b>�������</b> ��ǰ�Դϴ�.</td>
				</c:when>
				<c:otherwise>
					<td align="center">���� <b>��ۿϷ�</b> �����Դϴ�.</td>
				</c:otherwise>
			</c:choose>
			
			<td align="center" class="dv" value="${purchase.tranNo }">
			<c:if test="${user.role=='admin' }">
			<c:if test="${purchase.tranCode=='100'}">
			����ϱ�
			</c:if>
			</c:if>
			</td>
			<td align="center" class="buyer" id="${purchase.buyer.userId}" value="${purchase.buyer.userId }">${purchase.buyer.userId}</td>
			  
			</tr>
          </c:forEach>
		
		
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