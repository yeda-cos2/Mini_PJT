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
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	
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
			initialView : 'dayGridMonth', // �ʱ� �ε� �ɶ� ���̴� Ķ���� ȭ��(�⺻ ����: ��)
			events:[
				{
					title:'��� Ʈ���� �԰�',
					start:'2022-05-04',
					end:'2022-05-05'
				},
				{
					title:'���� �Ǹ� �̺�Ʈ',
					start:'2022-05-20',
					end:'2022-05-25'
				}
			],
		headerToolbar : { // ����� ǥ���� �� ��
				start : 'prev next today',
				center : 'title',
				left:'addEventButton',


				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			titleFormat : function(date) {
				return date.date.year + '�� ' + (parseInt(date.date.month) + 1) + '��';
			},customButtons: {
                addEventButton: { // �߰��� ��ư ����
                    text : "���� �߰�",  // ��ư ����
                    click : function(){ // ��ư Ŭ�� �� �̺�Ʈ �߰�
                        $("#calendarModal").modal("show"); // modal ��Ÿ����

                        $("#addCalendar").on("click",function(){  // modal�� �߰� ��ư Ŭ�� ��
                            var content = $("#calendar_content").val();
                            var start_date = $("#calendar_start_date").val();
                            var end_date = $("#calendar_end_date").val();
                            
                            //���� �Է� ���� Ȯ��
                            if(content == null || content == ""){
                                alert("������ �Է��ϼ���.");
                            }else if(start_date == "" || end_date ==""){
                                alert("��¥�� �Է��ϼ���.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date Ÿ������ ���� �� Ȯ��
                                alert("�������� �����Ϻ��� �����Դϴ�.");
                            }else{ // �������� �Է� ��
                                var obj = {
                                    "title" : content,
                                    "start" : start_date,
                                    "end" : end_date
                                }//������ ��ü ����

                                console.log(obj); //������ �ش� ��ü�� �����ؼ� DB ���� ����
                            }
                        });
                    }
                }
            },


			//initialDate: '2021-07-15', // �ʱ� ��¥ ���� (�������� ������ ���� ��¥�� ���δ�.)
			selectable : true, // �޷� ���� �巡�� ��������
			droppable : true,
			editable : true,
			nowIndicator: true, // ���� �ð� ��ũ
			locale: 'ko' // �ѱ��� ����
		});
		calendar.render();
	});
	
	//============= ȸ���������� Event  ó�� =============	
	/* $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
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


	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
<div class="row">



<br/><br/>
  <div class="col-sm-12 col-md-12 col-lg-12">
<blockquote>
  <p style="color:#75574B  ;"><b>�̴��� Best ��ǰ</b></p>
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
        <p><a href="/product/getProduct?menu=manage&prodNo=${product.prodNo }" class="btn btn-default" role="button" >������</a> 
        <a href="/purchase/addPurchase?menu=${param.menu}&prodNo=${product.prodNo}" class="btn btn-default" role="button">����</a>
       
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
                    <h5 class="modal-title" id="exampleModalLabel">������ �Է��ϼ���.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">���� ����</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">���� ��¥</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                        <label for="taskId" class="col-form-label">���� ��¥</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">�߰�</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">���</button>
                </div>

            </div>
        </div>
        </div>
        


</body>
</html>