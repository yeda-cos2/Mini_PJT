<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">

<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">


function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	console.log('${param.menu}');

}


let isEnd = false;

$(function(){
    $(window).scroll(function(){
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
        
        console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
        
        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
        if( scrollTop + windowHeight + 30 > documentHeight ){
        	fncGetList(1);
        }
    })
    fncGetList(1);
})

$(function() {
	 
	$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
		//Debug..
		fncGetList(1);
	});
	
	
	$( "td.ct_btn01:contains('정렬')" ).on("click" , function() {
		//Debug..
		fncGetList(1);
	});
	
	$( ".ct_list_pop td:nth-child(3)#search" ).on("click" , function() {
			console.log($(this).attr("value"));
		//	self.location ="/product/getProduct?menu=${param.menu}&prodNo="+$(this).attr("value")
			
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
							$("h4").remove();
							$( "#"+prodNo+"" ).html(displayValue);
						}
				});
			
	});
	
	$( ".ct_list_pop td:nth-child(3)#manage" ).on("click" , function() {
		console.log($(this).attr("value"));
		self.location ="/product/updateProduct?menu=${param.menu}&prodNo="+$(this).attr("value")

});
	
	
	//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	 
	 
});	


</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">

									${param.menu=='manage'?'상품관리':'상품목록조회'}</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">


							<option value="0"
								${!empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>상품번호</option>
							<option value="1"
								${!empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>상품명</option>
							<option value="2"
								${!empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>상품가격</option>
					</select> 
					<input type="text" id="keyword" name="searchKeyword" autocomplete="on" value="${!empty search.searchKeyword ? search.searchKeyword :"" }"  
						class="ct_input_g" style="width: 200px; height: 20px"/>
					</td>
					<td align="right" width="70">

						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">검색</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table width="180" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="left">
					<select name="sortCondition" class="ct_input_g" style="width: 90px">

							<option value="0"
								${!empty search.sortCondition && search.sortCondition==0 ? "selected" : ""}>낮은가격순</option>
							<option value="1"
								${!empty search.sortCondition && search.sortCondition==1 ? "selected" : ""}>높은가격순</option>
							<option value="2"
								${!empty search.sortCondition && search.sortCondition==2 ? "selected" : ""}>최신등록순</option>
					</select> 
					</td>
					<td align="left" width="70">

						<table  border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">정렬</td>
								<td width="14" height="2"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="sortCondition" value="${sortCondition}"/>





				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="margin-top: 10px;">
					<tr>
						<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재
							${resultPage.currentPage} 페이지</td>
					</tr>
					<tr>
						<td class="ct_list_b" width="100">No</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">상품명</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">가격</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">상품재고</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">등록일</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">현재상태</td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="808285" height="1"></td>
					</tr>
					<c:set var="i" value="0" />
					<c:forEach var="product" items="${list}" varStatus="status">
						<c:set var="i" value="${ i+1 }" />
						<tr class="ct_list_pop">
							<td align="center">${ i }</td>
							
							<td></td>
							
										<c:if test="${param.menu.contains('manage')}">
												<td align="left" id="manage" value="${product.prodNo }">${product.prodName}</td>
										</c:if>
										
									
										<c:if test="${param.menu.contains('search')}">
											<c:if test="${(product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300')&&(product.total==0)}">
												<td align="left" style="background-color:#B4A696">${product.prodName}</td>	
											</c:if>
											<c:if test="${!(product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300')}">
												<td align="left"	id="search"  value="${product.prodNo }">${product.prodName}</td>	
											</c:if>

								</c:if>

							<td></td>
							<td align="left">${product.price}</td>
							<td></td>
							<td align="left">${product.total}</td>
							<td></td>
							<td align="left">${product.regDate}</td>
							<td></td>
							<td align="left"><c:if test="${user.role=='user' }">
									<c:choose>
										<c:when
											test="${(product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300')&&(product.total==0)}">
											재고없음
										</c:when>
										<c:otherwise>
										판매중
										</c:otherwise>
									</c:choose>
								</c:if> <c:if test="${user.role=='admin' }">
									<c:choose>
										<c:when
											test="${product.proTranCode=='100'||product.proTranCode=='200'||product.proTranCode=='300'}">
			구매완료
			</c:when>
										<c:otherwise>
			판매중
			</c:otherwise>
									</c:choose>
								</c:if></td>
						</tr>
						<tr>
							<td  id="${product.prodNo }" colspan="11" bgcolor="#ffffff" height="1"></td>
						
						</tr>
					</c:forEach>
				</table> 
				
				
				
				<!-- PageNavigation Start... -->
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="margin-top: 10px;">
					<tr>
						<td align="center"><input type="hidden" id="currentPage"
							name="currentPage" value="" /> <jsp:include
								page="../common/pageNavigator.jsp" />
								
								
								</td>
					</tr>
				</table> <!-- PageNavigation End... -->
		</form>
	</div>

</body>
</html>