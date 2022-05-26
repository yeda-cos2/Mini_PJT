<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
		
	<!-- Fullcalendar -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	
	<style>
     body {
         padding-top : 70px;
		 font-family: 'Gowun Batang', serif; 
  
     }
     
     blockquote {
		  margin-left: 0px;
		  margin-right: 0px;
		  padding-left: 20px;
		  padding-right: 20px;
		  border-left: 10px solid #75574B;
	}

   #calendarBox{
            width: 70%;
            padding-left: 15%;
            
        }



   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			events:[
				{
					title:'우드 트레이 입고',
					start:'2022-05-04',
					end:'2022-05-05'
				},
				{
					title:'할인 판매 이벤트',
					start:'2022-05-20',
					end:'2022-05-25'
				}
			],
		headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				left:'addEventButton',


				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "일정 추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#calendarModal").modal("show"); // modal 나타내기

                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                            var content = $("#calendar_content").val();
                            var start_date = $("#calendar_start_date").val();
                            var end_date = $("#calendar_end_date").val();
                            
                            //내용 입력 여부 확인
                            if(content == null || content == ""){
                                alert("내용을 입력하세요.");
                            }else if(start_date == "" || end_date ==""){
                                alert("날짜를 입력하세요.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
                            }else{ // 정상적인 입력 시
                                var obj = {
                                    "title" : content,
                                    "start" : start_date,
                                    "end" : end_date
                                }//전송할 객체 생성

                                console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                            }
                        });
                    }
                }
            },


			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator: true, // 현재 시간 마크
			locale: 'ko' // 한국어 설정
		});
		calendar.render();
	});
	
	//============= 회원정보수정 Event  처리 =============	
	/* $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "#addCalendar" ).on("click" , function() {
				fncaddCalendar();

			});
			});
		*/
</script> 	
	<!-- Channel Plugin Scripts -->

<!-- End Channel Plugin -->
</head>
	
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
	      <ol class="carousel-indicators">
	        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	        <li data-target="#myCarousel" data-slide-to="1"></li>
	        <li data-target="#myCarousel" data-slide-to="2"></li>
	      </ol>
	      <div class="carousel-inner" role="listbox">
	        <div class="item active">
	          <img class="first-slide" src="/images/mandoo.PNG" alt="First slide">
	          
	          <div class="container">
	            <div class="carousel-caption">
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img class="second-slide" src="/images/gajung.PNG" alt="Second slide">
	          <div class="container">
	            <div class="carousel-caption">
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img class="third-slide" src="/images/111.PNG" alt="Third slide">
	          <div class="container">
	            <div class="carousel-caption">
	            </div>
	          </div>
	        </div>
	      </div>
	      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	      </a>
	      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	      </a>
	    </div>
	</div>


	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
<div class="row">



<br/><br/>
  <div class="col-sm-12 col-md-12 col-lg-12">
<blockquote>
  <p style="color:#75574B  ;"><b>이달의 Best 상품</b></p>
</blockquote>
</div>

 <c:set var="i" value="0" />
<c:forEach var="product" begin="0" end="2" items="${list}">
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
    				<c:choose>
    
    	<c:when test="${(product.fileName).contains('/')}">
    		<c:forEach var="name" items="${(product.fileName).split('/')[0]}">
		<img class="imange" src="/images/uploadFiles/${name}" width="320" height="300" ><br/>
			</c:forEach>
		
      </c:when>
		
		<c:otherwise>
		<img src="/images/uploadFiles/${product.fileName}" width="320" height="300"><br/>
		</c:otherwise>
		</c:choose>
      <div class="caption">
        <h4 style="color:black;">${product.prodName }</h4>
        <p>${product.price }</p>
        <p><a href="/product/getProduct?menu=manage&prodNo=${product.prodNo }" class="btn btn-default" role="button" >상세정보</a> 
        <a href="/purchase/addPurchase?menu=${param.menu}&prodNo=${product.prodNo}" class="btn btn-default" role="button">구매</a>
       
      </div>
    </div>
  </div>		
    </c:forEach>
 
 
    
  </div>
  

</div>

    	<div id='calendar'></div>
 <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>

            </div>
        </div>
        </div>
        


</body>
</html>