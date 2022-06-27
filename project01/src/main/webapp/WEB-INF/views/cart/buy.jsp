<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
#row {
	width: 900px;
	overflow: hidden;
	margin: 0px auto;
	pointer:cursor;
}
.price {
	border-bottom:1px solid #dedede;
	text-align:center;
	padding:10px;
}

.title,.chk {
	border-right:1px solid #dedede;
	border-bottom:1px solid #dedede;
	text-align:center;
	padding:10px;
}

.bimage {
	border-bottom:1px solid #dedede;
}

.title_buy {
	background:#dedede;
	padding:5px;
	text-align:center;
}

#cart {
	margin:0px auto;
}

.title_cart {
	font-size:30px;
	font-weight:bold;
	font-family: 'SBAggroL';
	margin:0px auto;
	margin-top:100px;
	margin-bottom:30px;
}

#buy {
	font-family: 'SBAggroL';
	background:#ed7753;
	border:none;
	padding:15px;
	color:white;
	width:300px;
	font-size:20px;
	margin-top:50px;
}

.cart_tr td {
	font-family: 'SBAggroL';
	padding :10px;
}

.sum_box {
	margin-top:100px;
	width:900px;
	border:1px solid #aeaeae;
	padding:20px;
	text-align:right;
	font-family: 'SBAggroL';
}

.location_box {
	border:1px solid #aeaeae;
	padding:30px;
	width:900px;
	margin:0px auto;
}

.tbl_buy {
	font-family: 'SBAggroL';
}

.tbl_buy input{
	border:1px solid #aeaeae;
	padding:5px;
}

.tbl_buy tr {
	padding:10px;
}

.tbl_buy td {
	padding:10px;
	border-bottom:1px solid #aeaeae;
}

.tbl_buy .title{
	background:#dedede;
	width:100px;
}
</style>

<div id="page">
	<p class="title_cart">상품주문</p>
   <table id="cart"></table>
   <script id="temp" type="text/x-handlebars-template">
	<tr>
		 <td colspan=2 class="title_buy">상품 정보</td>
		 <td class="title_buy">금액</td>
    </tr>
   {{#each list}}
    <tr id="{{id}}" class="cart_tr">
         <td class="bimage" width=100><img src="/display?fileName={{image}}" width=70 class="image"></td>
         <td class="title row" width=400>{{title}}</td>
		 <td class="price" width=100>{{price}}</td>
    </tr>
   {{/each}}
	<tr>
		<td colspan=3><div class="sum_box" id="total" sum={{sum}}>총 결제 금액 &nbsp; <label style="font-size:25px;">${vo.sum},000원</label></div></td>
	</tr>
   </script>
   <p class="title_cart">배송 정보</p>
   <form name="frm2" action="" method="post" class="location_box">
      <table class="tbl_buy">
      	<tr>
      		<td colspan=3>
      			<div class="searchSelect_box">
		            <input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
		            <label style="margin-right:50px;">직접 입력</label>
		            <input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
		            <label>주문자 정보와 동일</label>
         		</div>
      		</td>
      	</tr>
      	 <tr>
         	<td class="title">받으실 분</td>
            <td width=500>
                 <input type="text" size=30 id="bname" required>
            </td>
         </tr>
         <tr>
         	<td class="title">받으실 곳</td>
            <td width=500>
                  <input type="text" name="zipcode" size=5 id="zipcode" readonly>
                  <button type="button" id="btn_search" class="btn">주소검색</button><br>
                  <input type="text" name="uaddress1" size=30 id="uaddress1" required><label> /</label>
                  <input type="text" name="uaddress2" size=10 id="uaddress2" placeholder="상세주소"><br>
            </td>
         </tr>
         <tr>
         	<td class="title">휴대폰 번호</td>
            <td width=500>
                 <input type="text" size=30 id="bphone" required>
            </td>
         </tr>
      </table>
   </form>
   
   <button id="buy" onclick="requestPay()">상품주문</button>
</div>

<script>
var bid = "${uid}";

	function search_check(num) {
	    if (num == '1') {
	    	$("#bname").val("");
	    	$("#bphone").val("");
	    	$("#uaddress1").val("");
	    	$("#uaddress2").val("");
	    } else {
	    	$("#bname").val("${vo.uname}");
	    	$("#bphone").val("${vo.uphone}");
	    	$("#uaddress1").val("${vo.uaddress1}");
	    	$("#uaddress2").val("${vo.uaddress2}");
	    }
	 }

   var page = 1;
   getList();
   
   $("#cart").on("click","#chkAll",function(){
        var checked = $('#chkAll').is(':checked');
        if(checked){
           $('input:checkbox').prop('checked',true);
        }else{
           $('input:checkbox').prop('checked',false);   
        }
     });
   
   function getList() {
      $.ajax({
         type : "get",
         url : "/cart/list.json",
         data : {page : page, uid:bid},
         dataType : "json",
         success : function(data) {
            var template = Handlebars.compile($("#temp").html());
            $("#cart").html(template(data));
            $(".pagination").html(getPagination(data));
         }
      });
   }
   
   //row를 클릭한경우
//       $("#cart").on("click", ".row", function(){
//         var id=$(this).parent().attr("id");
//         location.href="read?id=" + id + "&page=" + page;
//       });

   $(".pagination").on("click", "a", function(e) {
      e.preventDefault();
      page = $(this).attr("href");
      getList();
   });
   
</script>
<script>
   var bno = '${bno}';
   var uid = '${uid}';
   var bsum ='${vo.sum}' + '000';
   var bname = $("#bname").val();
   var bnickname='${vo.unickname}';
   var bemail='${vo.uemail}';
   var bphone = $("#bphone").val();
   var baddress =$("#uaddress1").val() + " " + $("#uaddress2").val();
   var btitle = '${vo.title}';
   var bprice = '${vo.price}';
   var bimage = '${vo.image}';
   var blink = '${vo.link}';
   
   //카카오결제API
   var IMP = window.IMP; // 생략 가능
      IMP.init("imp85774140"); // 예: imp00000000

   function requestPay() {
	   var bname = $("#bname").val();
	   var bphone = $("#bphone").val();
	   var baddress =$("#uaddress1").val() + " " + $("#uaddress2").val();
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
         pg : "kakaopay",
         pay_method : "card",
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : btitle,
         nickname : bnickname,
         amount : bsum,
         buyer_email : bemail,
         buyer_name : bname,
         buyer_tel : bphone,
         buyer_addr : baddress,
      }, function(rsp) { // callback
         if (rsp.success) { //결제성공
            $.ajax({
                  type : "post",
                  url : "/buy/insert",
                  data : {bno:bno, uid:uid, bsum:bsum, bemail:bemail, btitle:btitle, bnickname:bnickname, bname:bname,
                     baddress:baddress, bphone:bphone, bimage:bimage, blink:blink},
                  success : function() {
                	  $.ajax({
          				type: "post",
          				url: "/cart/deleteCart",
          				data:{uid:uid},
          				success:function(){
          					alert("성공");
          				}
          			});
                	location.href='/user/trade?uid='+uid;
                  }
            });
         } else { //결제실패
            var msg = '결제에 실패하였습니다.';
             msg += '에러내용 : ' + rsp.error_msg;
             
             alert(msg);
         }
      });
   }
   
   //주소 검색후 값 적용
   $("#btn_search").on("click", function(){
      new daum.Postcode({
         oncomplete: function(data){
            $("#uaddress1").val(data.address);
            $("#zipcode").val(data.zonecode);
            $("#uaddress1").focus();
         }
      }).open();   
   });
</script>