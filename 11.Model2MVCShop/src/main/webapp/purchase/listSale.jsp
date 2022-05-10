<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
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
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listSale").submit();
		}
		
		
		 $(function() {
		
						
			$( "td.buyer" ).css("color" , "green");
			$( "td.dv:contains('배송하기')" ).css("color" , "red");
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "green");
			
			$( "td.dv:contains('배송하기')" ).on("click" , function() {
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
															+":: 구매 정보 조회 ::<br/><br/>"
															+"구매번호 : "+JSONData.tranNo+"<br/>"
															+"구매방법 : "+JSONData.paymentOption+"<br/>"
															+"구매자성명 : "+JSONData.receiverName+"<br/>"
															+"구매자연락처 : "+JSONData.receiverPhone+"<br/>"
															+"배송지 : "+JSONData.divyAddr+"<br/>"
															+"구매수량 : "+JSONData.purchaseCount+"개<br/>"
															+"요청사항 : "+JSONData.divyRequest+"<br/>"
															+"배송희망일자 : "+JSONData.divyDate+"<br/>"

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
															+":: 회원 조회 ::<br/>"
															+"아이디 : "+JSONData.userId+"<br/>"
															+"이  름 : "+JSONData.userName+"<br/>"
															+"이메일 : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"등록일 : "+JSONData.regDateString+"<br/>"
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
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       	       <h3 class=" text-info" style="color:#75574B;">
판매목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary" style="color:black;">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    </div>

		    
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr class="tableheader">
            <th align="left">No</th>
            <th align="left" >상품번호</th>
            <th align="left">현재상태</th>
            <th align="left">배송현황</th>
            <th align="left">구매회원</th>
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
					<td align="center">현재 <b>구매완료</b> 상태입니다.
					</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="center">현재 <b>배송중</b> 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center"><b>구매취소</b> 상품입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="center">현재 <b>배송완료</b> 상태입니다.</td>
				</c:otherwise>
			</c:choose>
			
			<td align="center" class="dv" value="${purchase.tranNo }">
			<c:if test="${user.role=='admin' }">
			<c:if test="${purchase.tranCode=='100'}">
			배송하기
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
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>