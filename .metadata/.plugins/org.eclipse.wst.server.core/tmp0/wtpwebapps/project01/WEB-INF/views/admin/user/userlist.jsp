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
}
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
<div style="margin:0px auto; text-align:center; font-family: 'SBAggroL';">
   <h2> 유저 리스트 </h2>
   <table id="tbl_user" style="margin:0px auto ;text-align:center; border:2px solid black;" ></table>
   <script id="temp" type="text/x-handlebars-template">
   <tr>
      <td width=200>프로필사진</td>
      <td width=100>아이디</td>
      <td width=150>이름 / 닉네임</td>
      <td width=150>이메일</td>
      <td width=300>주소</td>
   </tr>
   {{#each userlist}}
      <tr class="row_user">
         <td><img src="/display?fileName={{bimage}}" width=150 class="image"></td>
       <td class="uid">{{uid}}</td>
       <td>{{uname}} / {{unickname}}</td>
         <td>{{uemail}}</td>
         <td>{{uaddress1}} _ {{uaddress2}}</td>
       <td>{{display status}}</td>
       <td><button class="updateButton" uid="{{uid}}" status="{{status}}">상태변경</button></td>
      </tr>
   {{/each}}
   </script>
   <div class="pagination"></div>
</div>
<script>
      Handlebars.registerHelper("display", function(status){
         if(status == 1) {
            return "미사용";
         }else if(status == 0) {
            return "사용 중";
         }
      });
   </script>


<script>
	var page=1;
   	getUser();

   	function getUser() {
        $.ajax({
           type : "get",
           url : "/admin/userlist.json",
           data: {page: page},
           dataType : "json",
           success : function(data) {
              var template = Handlebars.compile($("#temp").html());
              $("#tbl_user").html(template(data));
              $(".pagination").html(getPagination(data));
           }
        });
   	}
   	
   	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getUser();
	});
   
   $("#tbl_user").on(
         "click",
         ".updateButton",
         function() {
            var status = $(this).attr('status');
            var uid = $(this).attr('uid');
            if(status == 1) {
               status = 0;
            }else {
               status = 1;
            }
            alert(status + "_" + uid);
            $.ajax({
               type: "post",
               url: "/admin/statusUpdate",
               data: {uid:uid, status:status},
               success: function(){
                  getUser();
               }
            });
         });
   
</script>