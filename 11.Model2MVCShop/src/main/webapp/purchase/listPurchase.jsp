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
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
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
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		
		 $(function() {
		
						
			$( "td.tno" ).css("color" , "green");
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "green");
			$( "td.cancel:contains('구매취소')" ).css("color" , "red");
			$( "td.cancel:contains('물건도착')" ).css("color" , "blue");
			$( "td.cancel:contains('리뷰작성')" ).css("color" , "brown");
			
			
			$( "td.cancel:contains('구매취소')" ).on("click" , function() {
				console.log($(this).attr("value"));
				self.location ="/purchase/updateTranCode?menu=search&tranCode=000&tranNo="+$(this).attr("value")
		});
			
			$( "td.cancel:contains('물건도착')" ).on("click" , function() {
				console.log($(this).attr("value"));
				self.location ="/purchase/updateTranCode?menu=search&tranCode=200&tranNo="+$(this).attr("value")
		});
			
			$( "td.cancel:contains('리뷰작성')" ).on("click" , function() {
				var tranNo=$(this).attr("value");
				console.log(tranNo);
				self.location ="/review/addReview.jsp?tranNo="+tranNo
		});
			
		
			
			
		});	
		
		
		 $(function(){
				
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
									
								//	alert("JSONData : \n"+JSONData);

									var displayValue = "<h4>"
																+":: 구매 정보 조회 ::<br/><br/>"
																+"구매번호 : "+JSONData.tranNo+"<br/>"
																+"구매방법 : "+JSONData.paymentOption+"<br/>"
																+"구매자성명 : "+JSONData.receiverName+"<br/>"
																+"구매자연락처 : "+JSONData.receiverPhone+"<br/>"
																+"배송지 : "+JSONData.divyAddr+"<br/>"
																+"구매수량 : "+JSONData.purchaseCount+"개<br/>"
																+"요청사항 : "+JSONData.divyRequest+"<br/>"
																+"배송희망일자 : "+JSONData.divyDate+"<br/>"
																+"</br>"+"<img src='/images/hot1585752371188.jpg' width='300' height='300' /><br/><br/>"

																+"</h4>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
									$("h4").remove();
									$( "#"+tranNo+"" ).html(displayValue);
								}
						});		
							
			});
				
				$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
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
									//alert("JSONData : \n"+JSONData);
									
									var displayValue = "<h3>"
																+":: 회원 조회 ::<br/>"
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDateString+"<br/>"
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h4").remove();
									$("h3").remove();
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
	       <h3>구매목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    </div>

		    
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="left">No</th>
            <th align="left" >상품번호</th>
            <th align="left">주문번호</th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">구매취소</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left" value="${purchase.tranNo }">${ i }</td>
			  <td align="left">${purchase.purchaseProd.prodNo}</td>
			  <td align="left">${purchase.tranNo}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">
			  <c:choose>
					<c:when test="${purchase.tranCode=='100' }">
					현재 <b>구매완료</b> 상태 입니다.
					</c:when>
					<c:when test="${purchase.tranCode=='200' }">
					현재 <b>배송중</b>입니다.
					</c:when>
					<c:when test="${purchase.tranCode=='300' }">
					<b>배송 완료</b>되었습니다.
					</c:when>
					<c:otherwise>
					<b>구매 취소</b>되었습니다.
					</c:otherwise>
				</c:choose>
			  </td>
			  <td align="left" class="cancel" value="${purchase.tranNo }">
			  	<c:if test="${purchase.tranCode=='100'}">
					구매취소
				</c:if>
				<c:if test="${purchase.tranCode=='200'}">
					물건도착
				</c:if>
				<c:if test="${purchase.tranCode=='300'}">
					리뷰작성
				</c:if>
			  </td>
			</tr>
          </c:forEach>
        <tr>

		<td colspan="11" id="${purchase.tranNo}"  bgcolor="#ffffff" height="1"></td>
		
	</tr>
<tr>		<td colspan="11" id="${purchase.buyer.userId}"  bgcolor="#ffffff" height="1"></td></tr>
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