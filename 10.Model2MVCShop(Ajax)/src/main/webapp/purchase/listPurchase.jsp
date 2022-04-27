<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>���� �����ȸ</title>


<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	   	}
	
	$(function(){
		
		$( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
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
														+":: ���� ���� ��ȸ ::<br/><br/>"
														+"���Ź�ȣ : "+JSONData.tranNo+"<br/>"
														+"���Ź�� : "+JSONData.paymentOption+"<br/>"
														+"�����ڼ��� : "+JSONData.receiverName+"<br/>"
														+"�����ڿ���ó : "+JSONData.receiverPhone+"<br/>"
														+"����� : "+JSONData.divyAddr+"<br/>"
														+"���ż��� : "+JSONData.purchaseCount+"��<br/>"
														+"��û���� : "+JSONData.divyRequest+"<br/>"
														+"���������� : "+JSONData.divyDate+"<br/>"
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
		
		$( "td.cancel:contains('�������')" ).on("click" , function() {
			console.log($(this).attr("value"));
			self.location ="/purchase/updateTranCode?menu=search&tranCode=000&tranNo="+$(this).attr("value")
	});
		
		$( "td.cancel:contains('���ǵ���')" ).on("click" , function() {
			console.log($(this).attr("value"));
			self.location ="/purchase/updateTranCode?menu=search&tranCode=200&tranNo="+$(this).attr("value")
	});
		
		
		$( ".ct_list_pop td:nth-child(1)" ).css("color" , "orange");
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "green");
		$( "td.cancel:contains('�������')" ).css("color" , "red");
		$( "td.cancel:contains('���ǵ���')" ).css("color" , "blue");

	});	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
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
		���� ���ſϷ� ���� �Դϴ�.
		</c:when>
		<c:when test="${purchase.tranCode=='200' }">
		���� ������Դϴ�.
		</c:when>
		<c:when test="${purchase.tranCode=='300' }">
		<b>��� �Ϸ�</b>�Ǿ����ϴ�.
		</c:when>
		<c:otherwise>
		<b>���� ���</b>�Ǿ����ϴ�.
		
		</c:otherwise>
		</c:choose>
		</td>
		<td></td>
		<td align="left" class="cancel" value="${purchase.tranNo }">
		<c:if test="${purchase.tranCode=='100'}">
		�������
		</c:if>
		<c:if test="${purchase.tranCode=='200'}">
		���ǵ���
		</c:if>
		</td>
	</tr>
	<tr>

		<td colspan="11" id="${purchase.tranNo}"  bgcolor="#ffffff" height="1"></td>
		
	</tr>
<tr>		<td colspan="11" id="${purchase.buyer.userId}"  bgcolor="#ffffff" height="1"></td></tr>
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