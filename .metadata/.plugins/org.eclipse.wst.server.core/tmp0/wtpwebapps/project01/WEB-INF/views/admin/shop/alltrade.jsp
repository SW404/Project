<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<script src="/resources/pagination.js"></script>
<style>
@font-face {
    font-family: 'SBAggroL';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroL.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#menu {
	padding:10px;
	margin: 0px auto;
	font-size: 30px;
	font-family: 'SBAggroL';
}
#menu td{
	border: 3px solid black;
	padding: 10px;
}
.pagination {
	width:100%;
   margin: 0px auto;
   text-align:center;
}

.pagination a {
   padding: 10px 15px;
   text-decoration: none;
   margin:5px;
   color: gray;
   border : 1px solid #dedede;
}

.pagination .active {
	background: gray;
	color: white;
	
}

.pagination a:hover {
   background-color: #E2E2E2;
</style>
<html>
<div class="title" style="text-align:center;">
	<img src="/resources/AdminLogo.png" style="width:800px; height :200px;" onClick="location.href='/admin/index'">
</div>
<table id="menu" style="width:900px;">
		<tr>
			<td><a href="/admin/shop/insert">상품 등록</a></td>		
			<td><a href="/admin/shop/list">상품 목록</a></td>
			<td><a href="/admin/shop/alltrade">주문 목록</a></td>
			<td><a href="/admin/user/userlist">유저 목록</a></td>
		</tr>
</table>
<div style="margin:0px auto; margin-bottom:10px; text-align:center; font-family: 'SBAggroL';">
   <h2> 구매 내역 </h2>
   <table id="trade" style="margin:0px auto ;text-align:center; border:2px solid black; padding:10px; margin-bottom:50px;"></table>
   <script id="temp" type="text/x-handlebars-template">
   <tr>
      <td>구매자</td>
      <td>상품이미지</td>
      <td>상품이름</td>
      <td>주소</td>
      <td>날짜</td>
		<td>가격</td>
	  <td>배송현황</td>
      <td>배송 중</td>
	  <td>배송 완료</td>
   </tr>
   {{#each alltrade}}
      <tr class="row" bno="{{bno}}" uid="{{uid}}">
       <td class="uid">{{uid}}</td>
         <td><img src="/display?fileName={{bimage}}" width=150 class="image"></td>
         <td>{{btitle}}</td>
       <td>{{baddress}}</td>
       <td>{{bdate}}</td>
       <td>{{bsum}} 원</td>
		 <td>{{delivery}}</td>
		<td><button class="delivering">배송 중</button></td>
		<td><button class="complete">배송 완료</button></td>
      </tr>
   {{/each}}
   </script>
   <div class="pagination"></div>
</div>

<script>
	var page=1;
   var uid="${param.uid}";
   getTrade();
   
   $("#trade").on("click",'.delivering' ,function(){
	   	var row = $(this).parent().parent();
		var uid = row.attr("uid");
		$.ajax({
           type : "post",
           url : "/admin/deliveryUpdate",
           data: {uid:uid,delivery:'배송 중'},
           success : function(data) {
        	   window.location.reload();
           }
        });
	});
   
   $("#trade").on("click",'.complete' ,function(){
	   	var row = $(this).parent().parent();
		var uid = row.attr("uid");
		$.ajax({
          type : "post",
          url : "/admin/deliveryUpdate",
          data: {uid:uid,delivery:'배송 완료'},
          success : function(data) {
       	   window.location.reload();
          }
       });
	});
   
   
   function getTrade(){
         $.ajax({
            type : "get",
            url : "/admin/alltrade.json",
            data: {page:page},
            dataType : "json",
            success : function(data) {
               var template = Handlebars.compile($("#temp").html());
               $("#trade").html(template(data));
               $(".pagination").html(getPagination(data));
            }
         });
         
   }
   
   $(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getTrade();
	});
</script>