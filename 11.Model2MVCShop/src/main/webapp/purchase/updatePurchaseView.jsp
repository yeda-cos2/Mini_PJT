<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>ȸ����������</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script type="text/javascript">

	function fncUpdatePurchase() {
		//Form ��ȿ�� ����
 		var receiverName = $("input[name='receiverName']").val();
 		var receiverPhone = $("input[name='receiverPhone']").val();
 		var purchaseCount = $("input[name='purchaseCount']").val();
 		var divyAddr = $("input[name='divyAddr']").val();
 		var divyDate = $("input[name='divyDate']").val();

		if (receiverName == null || receiverName.length < 1) {
			alert("�̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (receiverPhone == null || receiverPhone.length < 1) {
			alert("����ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (purchaseCount == null || purchaseCount.length < 1) {
			alert("���ż����� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (divyAddr == null || divyAddr.length < 1) {
			alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		if (divyDate == null || divyDate.length < 1) {
			alert("���������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase").submit();
	}

	
	
	$(function() {
		$("td.ct_btn01:contains('����')").on("click", function() {
			fncUpdatePurchase();
		});
		
		 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
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
					<td width="93%" class="ct_ttl01">������������</td>
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
			�����ھ��̵� 
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
			���Ź�� 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		<c:if test="${purchase.paymentOption!='2'}">
		���ݱ���
		</c:if>
		<c:if test="${purchase.paymentOption=='2'}">
		�ſ뱸��
		</c:if>
		</td>
	</tr>
	
	
		<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			�������̸�
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
			������ ����ó 
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
			�������ּ� 
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
			���ż���
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
			���� ��û���� 
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
		<td width="104" class="ct_write">����������</td>
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
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						���
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
