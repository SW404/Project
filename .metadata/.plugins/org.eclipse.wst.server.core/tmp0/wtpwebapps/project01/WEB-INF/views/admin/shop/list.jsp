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
	<h1>상품 목록</h1>
	<div id="shop" style="margin:0px auto ;text-align:center; border:2px solid black;"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each shoplist}}
      		<tr class="box" id="{{id}}">
				<td width=200><img src="/display?fileName={{image}}" style=width:200px;></td>
				<td width=400><p>{{title}}</p></td>
				<td width=100><p>{{display price}}</p></td>
				<td width=100><button class="delete">삭제</td>
				<td width=100><button onClick="location.href='update?id={{id}}'">수정</td>
			</tr>
   		{{/each}}		
	</script>
	<script>
		Handlebars.registerHelper("display", function(price){
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		});
	</script>
	<div class="pagination"></div>
</div>
</html>

<script>	
	var page=1;
	getList();
	
	function getList(){
		$.ajax({
			type: "get",
			url: "/admin/list.json",
			data: {page: page},
			dataType: "json",
			success : function(data) {
	            var template = Handlebars.compile($("#temp").html());
	            $("#shop").html(template(data));
	            $(".pagination").html(getPagination(data));
			}
		});
	}
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
	
	$("#shop").on("click", ".delete", function(){
		var box = $(this).parent().parent();
		var id = box.attr("id");
		alert(id);
		if(!confirm("상품을 삭제하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/admin/delete",
			data: {id:id},
			success: function(){
				getList();
			}
		});
	});
</script>
