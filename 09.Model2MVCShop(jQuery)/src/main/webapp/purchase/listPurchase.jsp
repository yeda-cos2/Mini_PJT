<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>구매 목록조회</title>


<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();	
	   	}
	
	$(function(){
		
		$( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
			console.log($(this).attr("value"));
			self.location ="/purchase/getPurchase?tranNo="+$(this).attr("value")
	});
		
		$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			console.log($(this).attr("value"));
			self.location ="/user/getUser?userId="+$(this).attr("value")
	});
		
		$( "td.cancel:contains('구매취소')" ).on("click" , function() {
			console.log($(this).attr("value"));
			self.location ="/purchase/updateTranCode?menu=search&tranCode=000&tranNo="+$(this).attr("value")
	});
		
		$( "td.cancel:contains('물건도착')" ).on("click" , function() {
			console.log($(this).attr("value"));
			self.location ="/purchase/updateTranCode?menu=search&tranCode=200&tranNo="+$(this).attr("value")
	});
		
		
		$( ".ct_list_pop td:nth-child(1)" ).css("color" , "orange");
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "green");
		$( "td.cancel:contains('구매취소')" ).css("color" , "red");
		$( "td.cancel:contains('물건도착')" ).css("color" , "blue");

	});	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	
		<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center" value="${purchase.tranNo }">${ i }</td>
			<td></td>
			<td align="center" >
			${purchase.buyer.userId}
			
			</td>
		
		
		</td>
		<td></td>
		<td align="center">${user.userName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
		<td align="center">
		<c:choose>
		<c:when test="${purchase.tranCode=='100' }">
		현재 구매완료 상태 입니다.
		</c:when>
		<c:when test="${purchase.tranCode=='200' }">
		현재 배송중입니다.
		</c:when>
		<c:when test="${purchase.tranCode=='300' }">
		<b>배송 완료</b>되었습니다.
		</c:when>
		<c:otherwise>
		<b>구매 취소</b>되었습니다.
		
		</c:otherwise>
		</c:choose>
		</td>
		<td></td>
		<td align="left" class="cancel" value="${purchase.tranNo }">
		<c:if test="${purchase.tranCode=='100'}">
		구매취소
		</c:if>
		<c:if test="${purchase.tranCode=='200'}">
		물건도착
		</c:if>
		</td>
	</tr>
	<tr>

		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
		</c:forEach>
		
				
		
</table>
	
<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   <input type="hidden" name="menu" value=${param.menu}/>
		<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>