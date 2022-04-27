<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>판매 목록조회</title>


<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
	
$(function(){
		
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			console.log($(this).attr("value"));
					
			var prodNo =$(this).attr("value");
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							
						//	alert("JSONData : \n"+JSONData);

							var displayValue = "<h4>"
														+":: 상품 조회 ::<br/><br/>"
														+"상품번호 : "+JSONData.prodNo+"<br/><br/>"
														+"상품명: "+JSONData.prodName+"<br/><br/>"
														+"상세정보 : "+JSONData.prodDetail+"<br/><br/>"
														+"재고 : "+JSONData.total+"<br/><br/>"
														+"제조일자 : "+JSONData.manuDate+"<br/><br/>"
														+"파일이미지  </br>"+"<img src='/images/uploadFiles/"+JSONData.fileName+"' width='300' height='300' /><br/>"
														+"</h4>";
							//Debug...									
							//alert(displayValue);
							$("h3").remove();
							$("h4").remove();
							$( "#"+prodNo+"" ).html(displayValue);
						}
				});
			
	});
		
		$( ".ct_list_pop td:nth-child(7)" ).on("click" , function() {
			console.log("tranNo"+$(this).attr("value"));
			self.location ="/purchase/updateTranCode?menu=search&tranCode=100&tranNo="+$(this).attr("value")
	});
		
		$( ".ct_list_pop td:nth-child(9)" ).on("click" , function() {
			console.log("userId:"+$(this).attr("value"));
			//self.location ="/user/getUser?userId="+$(this).attr("value")
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
		
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "orange");
		$( ".ct_list_pop td:nth-child(7)" ).css("color" , "red");
		$( ".ct_list_pop td:nth-child(9)" ).css("color" , "green");
});	

</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/purchase/listSale" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">판매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			전체  ${resultPage.totalCount } 건수,	현재 ${resultPage.currentPage} 페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품번호</td>
		<td class="ct_line02"></td>
		<%-- <td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>--%>
		<td class="ct_list_b">현재상태</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		
		<td class="ct_list_b">구매회원</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center" >${ i }</td>
			
			<td></td>
			<td align="left" value="${purchase.purchaseProd.prodNo }">${purchase.purchaseProd.prodNo }</td>
			<td></td>
			
			<c:choose>
			
				<c:when test="${purchase.tranCode.equals('100')}">
					<td align="left">현재 <b>구매완료</b> 상태입니다.
					</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="left">현재 <b>배송중</b> 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="left"><b>구매취소</b> 상품입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="left">현재 배송완료 상태입니다.</td>
				</c:otherwise>
			</c:choose>
			
			
			
			<td></td>
			<td align="center" value="${purchase.tranNo }">
			<c:if test="${user.role=='admin' }">
			<c:if test="${purchase.tranCode=='100'}">
			배송하기
			</c:if>
			</c:if>
			
			<td></td>
			<td align="left" value="${purchase.buyer.userId }">
				${purchase.buyer.userId}
			
		</tr>
		<tr>
			<td  colspan="11" id="${purchase.purchaseProd.prodNo }" bgcolor="#ffffff" height="1"></td></tr>
<tr>			<td id="${purchase.buyer.userId}"  bgcolor="#ffffff" height="1"></td>
			
		</tr>
	</c:forEach>	
	
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>