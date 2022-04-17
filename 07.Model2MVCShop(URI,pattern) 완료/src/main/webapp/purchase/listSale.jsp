<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�Ǹ� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
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
					<td width="93%" class="ct_ttl01">�Ǹ� �����ȸ</td>
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
			��ü  ${resultPage.totalCount } �Ǽ�,	���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<%-- <td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>--%>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>
		
		<td class="ct_list_b">����ȸ��</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			
			<td></td>
			<td align="left"><a href="/product/getProduct?prodNo=${purchase.purchaseProd.prodNo }&menu=${param.menu}">${purchase.purchaseProd.prodNo }</a></td>
			<td></td>
			
			<%-- <td align="left">${purchase.purchaseProd.prodName }</td>
			<td></td>--%>
			
			<c:choose>
				<c:when test="${purchase.tranCode.equals('100')}">
					<td align="left">���� ���ſϷ� �����Դϴ�.
					</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="left">���� ����� �����Դϴ�.</td>
				</c:when>
				<c:otherwise>
					<td align="left">���� ��ۿϷ� �����Դϴ�.</td>
				</c:otherwise>
			</c:choose>
			
			
			
			<td></td>
			<td align="left">
			
			<c:if test="${user.role=='admin' }">
			<c:choose>
			<c:when test="${purchase.tranCode=='100'}">
			���ſϷ� 
			<a href="/purchase/updateTranCode?menu=search&tranCode=${purchase.tranCode }&tranNo=${purchase.tranNo}">����ϱ�</a>
			</c:when>
			<c:when test="${purchase.tranCode=='200'}">
			�����
			</c:when>
			<c:when test="${purchase.tranCode=='300'}">
			��ۿϷ�
			</c:when>
			<c:otherwise>
			�Ǹ���
			</c:otherwise>
			</c:choose>
			</c:if>
			
			
			
			
			
			
			<td></td>
			<td align="left">
				<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
			
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
			
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>