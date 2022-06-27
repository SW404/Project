
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#about {
	}
	.box {
		width:450px;
		float:left;
	}
	.row {
	display:flex;
	flex-direction:column;
	float:left;
	margin:5px;
	width:320px;
	text-align:center;
	border: 1px solid #dedede;
	height: 400px;
	justify-content:center;
}

.row:hover {
	cursor:pointer;
}

.shop_image {
	width:300px;
	height:300px;
}

#shop {
	margin : 0px auto;
	width:1350px;
	padding-right:-10px;
	margin-bottom:100px;
}

.price {
	font-size:22px;
	font-weight:bold;
}

#banner_top {
	margin-left:130px;
}
#tbl_board {
	margin:0px auto;
	margin-bottom:100px;
}	

#tbl_board td {
	padding:15px;
}

#tbl_board .title {
	text-align:center;
	background:#EEEEEE;
	font-weight:bold;
	border-top:1px solid black;
}

#board_content {
	text-align:center;
}

#tbl_board .row_board {
	border-top:1px solid #dedede;
	border-bottom:1px solid #dedede;
	text-align:center;
}

#mypet {
   width: 900px;
   margin: 0px auto;
   overflow: hidden;
   margin-bottom:100px;
}

#pet_box {
   width: 280px;
   height:350px;
   margin: 10px;
   float: left;
   border: 1px solid #cecece;
   cursor: pointer;
   border-radius:10px;
   font-family: 'SBAggroL';
   background:white;
   overflow:hidden;
}

.petBox_content {
	padding : 10px;
	display:flex;
	flex-direction: column;
	text-align:left;
	font-size:17px;
}

#shop .title {
   width: 300px;
}

.modal2 
{ 
	position: absolute; top: 0; left: 0; width: 100%; height:1700px; 
	display: none; background-color: rgba(0, 0, 0, 0.4); 
	z-index:20;
} 

.modal_body2
{ 
	position: absolute; top: 50%; left: 50%; width: 1000px; 
	height: 400px; text-align: center; background-color: rgb(255, 255, 255); border-radius: 10px; 
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
	transform: translateX(-50%) translateY(-50%); 
	margin:0px auto;
	padding : 50px;
	float:left;
}

.btn-close2 {
   width: 20px;
   height: 20px;
   float: right;
   cursor: pointer;
}

.big_title {
	transform: translateY(-30px);
	background-color:white;
	width:200px;
	margin:0px auto;
}

.small_title {
	transform: translateY(-10px);
	margin-top:50px;
}

.plusView2 {
	padding:20px 50px;
	background:#232323;
	border:none;
	font-family: 'SBAggroL';
	color:white;
	font-size:18px;
}

.plusView {
	padding:20px 50px;
	background:#f77b52;
	border:none;
	font-family: 'SBAggroL';
	color:white;
	font-size:18px;
	margin-bottom:100px;
}

</style>
<div id="about">
	<jsp:include page="slick.jsp"/>
	
	<div><p class="small_title">new product</p></div>
	<div style="display:relative; text-align:center;">
		<p style="border:1px solid #232323; display:relative; z-index:-1;"></p>
		<div class="big_title">신규 상품</div>
	</div>
	
   	<table id="shop"></table>
	<script id="temp2" type="text/x-handlebars-template">
   {{#each .}}
      <tr class="row" id="{{id}}">
         <td ><img src="/display?fileName={{image}}" class="shop_image"></td><br>
         <td class="title">{{title}}</td><br>
		 <td class="price">{{price}}</td>
      </tr>
   {{/each}}
   </script>
   
   <button onClick="location.href='/shop/list'" class="plusView">더보기 + </button>
     
	<div style="background:#ff865e; height:800px; padding:10px;">
		<div>
			<div><p class="small_title" style="color:#e6bd8e">best pets</p></div>
			<div style="display:relative; text-align:center; color:white">
				<p style="border:1px solid white; display:relative; z-index:-1;"></p>
				<div class="big_title" style="background:#ff865e;">인기 포포펫</div>
			</div>
			<div id="mypet"></div>
			<button onClick="location.href='/mypet/list'" class="plusView2">더보기 + </button>
		</div>
	</div>
	   <script id="temp3" type="text/x-handlebars-template">
   {{#each .}}
      <div id="pet_box" class="btn-open-popup2">   
         	<p class="mpno" style=display:none;>{{mpno}}</p>
			<p class="uimage" style=display:none;>{{uimage}}</p>
			<p class="likeImg" style=display:none;>{{likeImg}}</p>
         	<p class="mpimage" style=display:none;>{{mpimage}}</p>      
         	<img src="/display?fileName={{mpimage}}" style="width:280px; height:250px;" >
         	<div class="petBox_content">
				<div><b class="mpwriter">{{mpwriter}}</b>&nbsp;&nbsp;<span class="mptitle">{{mptitle}}</span></div>
				<div style="display:flex;">좋아요 <p class="mpcount" id="mpnum">{{mpcount}}</p>개</div>				
         		<p class="mpregdate">{{mpregdate}}</p>
		 	</div>
      	</div>
   {{/each}}
   </script>
   
   <div><p class="small_title">best article</p></div>
	<div style="display:relative; text-align:center;">
		<p style="border:1px solid #232323; display:relative; z-index:-1;"></p>
		<div class="big_title">인기 글</div>
	</div>
   
   <table id="tbl_board"></table>
	<script id="temp1" type="text/x-handlebars-template">
      {{#each .}}
       <tr class="row_board">
         <td class="bno">{{bno}}</td>
         <td class="btitle">{{btitle}}</td>
         <td>{{bwriter}}</td>
         <td>{{bregdate}}</td>
		 <td>{{bcount}}</td>
      </tr>
      {{/each}}
   </script>
   
   <button onClick="location.href='/board/list'" class="plusView">더보기 + </button>
   
</div>

<script>
	getList();
	
	function getList() {
		$.ajax({
			type : "get",
			url : "/board.json",
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp1").html());
				$("#tbl_board").html(temp(data));
			}
		});
		
		$.ajax({
			type : "get",
			url : "/shop.json",
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp2").html());
				$("#shop").html(template(data));
			}
		});
		
		$.ajax({
			type : "get",
			url : "/mypet.json",
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp3").html());
				$("#mypet").html(template(data));
			}
		});
	}
	
	//board row를 클릭한경우
	$("#tbl_board").on(
			"click",
			".row_board",
			function() {
				var bno = $(this).find(".bno").html();
				location.href = "board/read?bno=" + bno + "&page=" + 1
						+ "&keyword=" + "";
	});
	
	//shop row를 클릭한경우
	   $("#shop").on("click", ".row", function(){
	     var id=$(this).attr("id");
	     location.href="shop/read?id=" + id + "&page=" + 1;
	   });
	
	//mypet row를 클릭한경우
	$("#mypet").on("click", function(){
		location.href="mypet/list";
	});
</script>