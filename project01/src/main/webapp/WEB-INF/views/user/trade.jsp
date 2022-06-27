<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/resources/join.css" rel="stylesheet" >

<style>

.title_cart {
   font-size:30px;
   font-weight:bold;
   font-family: 'SBAggroL';
   margin:0px auto;
   margin-top:100px;
}

   .join_title {
   font-size:40px;
   font-weight:50px;
   margin:auto;
   text-align:center;
   margin : 100px 0px 10px 0px;
}

#join .title {
   display:inline-block;
   width:975px;
      font-size:30px;
      color:#4A4A4A;
      right:40%;
      margin-left : -570px;
}

#trade {
	margin:0px auto;
}

#trade .title {
	background:#dedede;
	text-align:center;
}

#trade td {
	padding:10px;
	font-family: 'SBAggroL';
}

.buyList {
	display:none;
	border:1px solid #dedede;
	padding:10px;
	text-align:center;
}

.buy_row:hover {
	cursor:pointer;
}
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/join_img/join_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">마이페이지</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">새로운 인연,포포펫에서 함께 만들어 가겠습니다</p>
		  </div>
		</div>
	</div>
</div>
  <div id="header_board">
     <a href="/user/update?uid=${vo.uid}">개인정보수정</a>
     <a href="/user/trade?uid=${vo.uid}">구매내역</a>
  </div>
<div>
   <p class="title_cart">구매내역</p>
   <table id="trade"></table>
   <script id="temp" type="text/x-handlebars-template">
	<tr class="title">
        <td colspan=2>배송 정보</td>
       	<td>금액</td>
		<td>배송 현황</td>
		<td>배송 취소</td>
	</tr>
   {{#each .}}
	<tr class="buy_row" onClick="listView({{bno}});" bno={{bno}}>
        <td><img src="/display?fileName={{bimage}}" width=70 class="image"></td>
        <td>{{btitle}}</td>
       	<td>{{bsum}} 원</td>
		<td>{{delivery}}</td>
		<td><button class="cancel-delivery">배송취소</button></td>
	</tr>
	<tr>
        <td colspan=7>
			<div class="buyList">
				<h2>주문 상세 정보</h2>
				<div style="display:none;" id="bno">{{bno}}</div>
				<div><span>배송지 정보 : </span>{{bdate}}</div>
				<div><span>배송 시작 날짜 : </span>{{baddress}}</div>
				<div><span>받으시는 분 : </span>{{bname}}</div>
				<div><span>휴대폰 번호 : </span>{{bphone}}</div>
				<div style="margin-top:30px;"><b>배송현황</b></div>
				<div style="display:flex; justify-content:center; align-items: center;">
					<div style="display:flex; flex-direction: column;">
						<img src="/resources/delivery_img/before-delivery.png" width=70>
						<label style="color:{{status delivery}}">배송 준비 중</label>
					</div>

					<img src="/resources/delivery_img/next.png" style="width:50px; height:50px;">

					<div style="display:flex; flex-direction: column;">
						<img src="/resources/delivery_img/delivery-ing.png" width=70>
						<label style="color:{{status2 delivery}}">배송 중</label>
					</div>

					<img src="/resources/delivery_img/next.png" style="width:50px; height:50px;">

					<div style="display:flex; flex-direction: column;">
						<img src="/resources/delivery_img/delivered.png" width=70>
						<label style="color:{{status3 delivery}}">배송 완료</label>
					</div>
				</div>
			</div>
		</td>
	</tr>
   {{/each}}
   </script>
   <script>
		Handlebars.registerHelper("status", function(delivery){
			if(delivery=="배송 전"){
				return "#eb5931";
			}else {
				return "black";
			}
		});
		
		Handlebars.registerHelper("status2", function(delivery){
			if(delivery=="배송 중"){
				return "#eb5931";
			}else {
				return "black";
			}
		});
		
		Handlebars.registerHelper("status3", function(delivery){
			if(delivery=="배송 완료"){
				return "#eb5931";
			}else {
				return "black";
			}
		});
	</script>
</div>

<script>
   var uid="${param.uid}";
   var manager="${manager}";
   var num=0;
   getTrade();
   
   $("#trade").on("click", "button", function(){
	   	var row = $(this).parent().parent();
		var bno = row.attr("bno");
		if(!confirm("주문을 취소하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/buy/delete",
			data: {bno:bno},
			success: function(){
			}
		});
		window.location.reload();
	});
   
	function listView(bno) {	
		var bno2=$("#bno").html();
		if (num == 1&&bno==bno2) {
			document.querySelector(".buyList").style.display = "none";
			num=0;
		} else if (num == 0&&bno==bno2) {
			document.querySelector(".buyList").style.display = "block";
	        num=1;
		}
	}	
   
   
   function getTrade(){
      var manager="${vo.manager}";
      if(manager < 1) {
         $.ajax({
            type : "get",
            url : "/user/trade.json",
            data : {uid:uid},
            dataType : "json",
            success : function(data) {
               var template = Handlebars.compile($("#temp").html());
               $("#trade").html(template(data));
            }
         });
         
      }else {
         $.ajax({
            type : "get",
            url : "/user/alltrade.json",
            dataType : "json",
            success : function(data) {
               var template = Handlebars.compile($("#temp").html());
               $("#trade").html(template(data));
            }
         });
      }
   }
</script>