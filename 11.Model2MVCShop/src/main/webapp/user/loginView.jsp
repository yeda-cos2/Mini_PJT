<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 4px solid #D6CDB7;
            margin-top: 100px;
        }
        

    </style>
    
    <style type="text/css">
      .jumbotron{
        background-color:white;
        background-size: cover;
      }
</style>
    
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		
	</script>		
	
</head>

<body width="1000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
			<br/>
					<img src="/images/hot1613625568490.jpg"  width="400" height="430" /><br/>
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/>
				
		 	 		<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/bbbb.PNG"  width="300" height="150" /><br/></h1>

				<div class="jumbotron">
					<form class="form-horizontal">

						<div class="form-group">
							<label for="userId" class="col-sm-1 control-label">Id&nbsp;</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="userId"
									id="userId" placeholder="아이디" >
									
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-sm-1 control-label">pwd</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="password"
									id="password" placeholder="패스워드">
							</div>

				</div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-1 col-sm-6 text-center">
					      <button type="button" class="btn btn-default"  >로 &nbsp;그 &nbsp;인</button>
					      <a class="btn btn-default btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
								




							</div>
					  </div>
			
					</form>
			   	 </div>
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>