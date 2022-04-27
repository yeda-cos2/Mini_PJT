<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�Ǹ� �����ȸ</title>


<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
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
														+":: ��ǰ ��ȸ ::<br/><br/>"
														+"��ǰ��ȣ : "+JSONData.prodNo+"<br/><br/>"
														+"��ǰ��: "+JSONData.prodName+"<br/><br/>"
														+"������ : "+JSONData.prodDetail+"<br/><br/>"
														+"��� : "+JSONData.total+"<br/><br/>"
														+"�������� : "+JSONData.manuDate+"<br/><br/>"
														+"�����̹���  </br>"+"<img src='/images/uploadFiles/"+JSONData.fileName+"' width='300' height='300' /><br/>"
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
														+":: ȸ�� ��ȸ ::<br/>"
														+"���̵� : "+JSONData.userId+"<br/>"
														+"��  �� : "+JSONData.userName+"<br/>"
														+"�̸��� : "+JSONData.email+"<br/>"
														+"ROLE : "+JSONData.role+"<br/>"
														+"����� : "+JSONData.regDateString+"<br/>"
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
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
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
			<td align="center" >${ i }</td>
			
			<td></td>
			<td align="left" value="${purchase.purchaseProd.prodNo }">${purchase.purchaseProd.prodNo }</td>
			<td></td>
			
			<c:choose>
			
				<c:when test="${purchase.tranCode.equals('100')}">
					<td align="left">���� <b>���ſϷ�</b> �����Դϴ�.
					</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="left">���� <b>�����</b> �����Դϴ�.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="left"><b>�������</b> ��ǰ�Դϴ�.</td>
				</c:when>
				<c:otherwise>
					<td align="left">���� ��ۿϷ� �����Դϴ�.</td>
				</c:otherwise>
			</c:choose>
			
			
			
			<td></td>
			<td align="center" value="${purchase.tranNo }">
			<c:if test="${user.role=='admin' }">
			<c:if test="${purchase.tranCode=='100'}">
			����ϱ�
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