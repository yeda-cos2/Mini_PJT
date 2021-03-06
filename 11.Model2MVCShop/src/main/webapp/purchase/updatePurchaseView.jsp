<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>회원정보수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 50px;
		font-family: 'Gowun Batang', serif; font-weight:bold; color:#75574B
	
}

</style>
	<script type="text/javascript">

	function fncUpdatePurchase() {
		//Form 유효성 검증
 		var receiverName = $("input[name='receiverName']").val();
 		var receiverPhone = $("input[name='receiverPhone']").val();
 		var purchaseCount = $("input[name='purchaseCount']").val();
 		var divyAddr = $("input[name='divyAddr']").val();
 		var divyDate = $("input[name='divyDate']").val();

		if (receiverName == null || receiverName.length < 1) {
			alert("이름은 반드시 입력하여야 합니다.");
			return;
		}
		if (receiverPhone == null || receiverPhone.length < 1) {
			alert("연락처는 반드시 입력하여야 합니다.");
			return;
		}
		if (purchaseCount == null || purchaseCount.length < 1) {
			alert("구매수량은 반드시 입력하셔야 합니다.");
			return;
		}
		if (divyAddr == null || divyAddr.length < 1) {
			alert("주소는 반드시 입력하셔야 합니다.");
			return;
		}

		if (divyDate == null || divyDate.length < 1) {
			alert("배송희망일자는 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase").submit();
	}

	
	
	$(function() {
		$("td.ct_btn01:contains('수정')").on("click", function() {
			fncUpdatePurchase();
		});
		
		 $( "td.ct_btn01:contains('취소')" ).on("click" , function() {
				$("form")[0].reset();
		});
		 
	});
</script>
<script type="text/javascript" src="../javascript/calendar.js">
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm"  method="post" action="/purchase/updatePurchase">

<input type="hidden" name="tranNo" value="${purchase.tranNo}">

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매정보수정</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자아이디 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${purchase.buyer.userId}</td>
					<td>	</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매방법 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<c:if test="${purchase.paymentOption!='2'}">
		현금구매
		</c:if>
		<c:if test="${purchase.paymentOption=='2'}">
		신용구매
		</c:if>
		</td>
	</tr>
	
	
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매자이름
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" value="${purchase.receiverName}" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매자 연락처 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverPhone" value="${purchase.receiverPhone}" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매자주소 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		
		<c:choose>
		<c:when test="${!(purchase.purchaseProd.proTranCode=='200'||purchase.purchaseProd.proTranCode=='300') }">
			<input type="text" name="divyAddr" value="${purchase.divyAddr}" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
						
						</c:when>
						
		<c:when test="${purchase.purchaseProd.proTranCode=='200' }">
						
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${purchase.divyAddr}</td>
					<td>	</td>
				</tr>
			</table>
			</c:when>
			
		
			</c:choose>
		</td>
	</tr>
	

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매수량
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="purchaseCount" value="${purchase.purchaseCount}" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매 요청사항 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="divyRequest" value="${purchase.divyRequest}" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">배송희망일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td width="200" class="ct_write01">
			<input 	type="text"  name="divyDate" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />
			<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
						onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>
