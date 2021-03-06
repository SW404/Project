<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
#mypet {
   width: 900px;
   margin: 0px auto;
   overflow: hidden;
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
   overflow:hidden;
}

.title {
   width: 150px;
}

.mpreply {
	margin-bottom:-7px;
	border:none;
	resize:none;
}

.row {
	padding:15px;
}

.modal2 
{ 
	position: absolute; top: 0; left: 0; width: 100%; height:2100px; 
	display: none; background-color: rgba(0, 0, 0, 0.4); 
	z-index:20;
} 

.modal_body2
{ 
	position: absolute; top: 50%; left: 50%; width: 1100px; 
	height: 600px; text-align: center; background-color: rgb(255, 255, 255); border-radius: 10px; 
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
	transform: translateX(-50%) translateY(-50%); 
	margin:0px auto;
	float:left;
	overflow:hidden;
}

.btn-close2 {
   width: 20px;
   height: 20px;
   float: right;
   cursor: pointer;
   margin:30px;
   z-index:20;
}

.petBox_content {
	padding : 10px;
	display:flex;
	flex-direction: column;
}

.petStargram_box {
	display:flex;
	margin-right:-50px;
}

.petStargram_content {
	width:400px;
	height:600px;
	padding:20px;
	text-align:left;
}

.reply_insertBox {
	padding-top:10px;
	height:100px;
}

#mp_writer {
	font-weight:bold;
	margin-left:5px;	
}

#mp_regdate {
	margin-left:45px;	
}

#likeImg, #chat {
	cursor:pointer;
	margin-right:15px;
}

#mpreply {
	border:none;
}

#insert {
	border:none;
	background:none;
	color:#3156f7;
}

.main_content {
	border-bottom:1px solid #dedede;
	height:450px;
	overflow-y: scroll;
}

.main_content::-webkit-scrollbar {
	display:none;
}

#submit {
	margin-right:-780px;
	padding : 20px;
	background:#fa9678;
	border:none;
	color:white;
	font-family: 'SBAggroL';
}
</style>
<body>
	<div style="text-align:center;position: relative; margin-bottom:70px;">
		<img src="/resources/board_banner.png" style="height:500px; width:100%;">
		<div class="body_banner"> 
			<div class="heading">
			  <div>
			    <p id="banner_top" class="slide-up">?????????</p>
			  </div>
			  <div class="notosanskr">
			    <p id="banner_bottom" class="slide-up">????????? ??????????????? ?????? ?????? ??????????????????</p>
			  </div>
			</div>
		</div> 
	</div>
	<div id="page" style="text-align:center;">
	   <div id="header_board">
			<a href="/board/list">???????????????</a>
			<a href="/mypet/list">???????????????</a>
		</div>
	   	<p class="small_title">???????????????</p>
		<p class="big_title">?????????????????? ????????? ??????????????????</p>
	   </div>
	
	   <table id="mypet"></table>
	   <script id="temp" type="text/x-handlebars-template">
		{{#each list}}
      	<div id="pet_box" class="btn-open-popup2">   
         	<p class="mpno" style=display:none;>{{mpno}}</p>
			<p class="uimage" style=display:none;>{{uimage}}</p>
			<p class="likeImg" style=display:none;>{{likeImg}}</p>
         	<p class="mpimage" style=display:none;>{{mpimage}}</p>      
         	<img src="/display?fileName={{mpimage}}" style="width:280px; height:250px;" >
         	<div class="petBox_content">
				<div><b class="mpwriter">{{mpwriter}}</b>&nbsp;&nbsp;<span class="mptitle">{{mptitle}}</span></div>
				<div style="display:flex;">????????? <p class="mpcount" id="mpnum">{{mpcount}}</p>???</div>				
         		<p class="mpregdate">{{mpregdate}}</p>
		 	</div>
      	</div>
   		{{/each}}
   	   </script>
	   <div>
	      <input type="submit" id="submit" value="?????? ?????????">
	   </div>
	   <div class="pagination"></div>
	<script src="/resources/pagination.js"></script>
	<button class="btn-open-popup2" style="display:none;">??????</button>
</body>
<div class="modal2">
   <div class="modal_body2">
      <img src="/resources/cancel.png" class="btn-close2">
      <div class="petStargram_box">
		<img id="mypet_image" style="width:600px;">
		<div class="petStargram_content">
			<p id="mp_no" style="display:none;"></p>
			<div class="main_content">
				<img id="mypet_uimage" style="border-radius:50%; width:32px; height:32px;">
				<span id="mp_writer"></span>
				<span id="mp_title"></span>
				<p id="mp_regdate">
				<hr>
				<div id="mpreplies"></div>
			</div>
			<div class="reply_insertBox">
				<label>?????????<span id="mp_count"></span>???</label>
				<div style="display:flex; padding:10px 0px;">
					<img id="likeImg" onClick="like();" width=25>
					<img id="chat" src="/resources/chat.png" onClick="chat();" style="width:22px; height:22px;">
				</div>
				<input type="text" id="mpreply" placeholder="????????????" size=40>
				<button id="insert">??????</button>
			</div>
		</div>
      </div>
      <hr/>
	<script id="temp_reply" type="text/x-handlebars-template">
	{{#each mprlist}}
		<div class="row" mprno="{{mprno}}">
			<img src="/display?fileName={{uimage}}" style="border-radius:50%; width:32px; height:32px;">
			<b><span>{{mpreplyer}}</span></b>
			<input type="text" class="mpreply" {{read mpreplyer}} value="{{mpreply}}" size=25>
			<span style="display:{{display mpreplyer}}; text-align:right;">
				<a class="delete">??????</a>
			</span>
			<p>{{mpreplydate}}</p>
		</div>
	{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(mpreplyer){
			if(mpreplyer!="${unickname}"){
				var btn=$("#mypet_upadte_btn");
				btn.css({
					"display" : "none"
				});
				return "none";
			}
		});
		
		Handlebars.registerHelper("read", function(mpreplyer){
			if(mpreplyer!="${unickname}"){
				var btn=$("#mypet_upadte_btn");
				btn.css({
					"display" : "none"
				});
				return "readonly";
			}
		});
	</script>
	<div class="mppagination"></div>
   </div>
</div>
<script>
   var searchType = '';
   var searchform = $("#searchForm");
   var page = "${param.page==null ? 1: param.page}";
   var keyword = "${param.keyword==null ? '': param.keyword}";
   var count = 0;
   var likeImg;
   getList();
   
   
   function chat() {
	   $("#mpreply").focus();
   }

   function like() {
	   var num=$("#mp_count").html();
	   likeImg = $('#likeImg').attr("src");
	   if(likeImg=="/resources/like_push.png"){
		   likeImg="/resources/like.png";
		   $("#likeImg").attr("src", likeImg);
		   count=-1;
		   num = parseInt(num) - 1;
		   $("#mp_count").html(num);
		   like_count(count);   
	   }else if(likeImg=="/resources/like.png"){
		   likeImg="/resources/like_push.png";
		   $("#likeImg").attr("src", likeImg);
		   count=1;
		   num = parseInt(num) + 1;
		   $("#mp_count").html(num);
		   like_count(count);
	   }
   }
   
   function like_count(mpcount) {
	   var mpno = $("#mp_no").html();
	   $.ajax({
	         type : "post",
	         url : "/mypet/like",
	         data : {
	            mpcount:mpcount,
	            mpno:mpno,
	            likeImg:likeImg
	         },
	         success : function(data) {
	         	alert("??????");
	         }
	      });
   }

   function getList() {
      keyword = $("#keyword").val();
      searchType = searchform.find("option:selected").val();
      $.ajax({
         type : "get",
         url : "/mypet/list.json",
         data : {
            page : page,
            keyword : keyword,
            searchType : searchType
         },
         dataType : "json",
         success : function(data) {
            var template = Handlebars.compile($("#temp").html());
            $("#mypet").html(template(data));

            //??????????????? ??????
            $(".pagination").html(getPagination(data));
         }
      });
   }

   //???????????? ???
   $("#submit").on("click", function() {
      location.href = "insert";
   });

   $("#mypet").on("click","#pet_box",function() {
	  var mpno = $(this).find(".mpno").html();
	  var likeImg = $(this).find(".likeImg").html();
	  var uimage = $(this).find(".uimage").html();
      var mpimage = $(this).find(".mpimage").html();
      var mptitle = $(this).find(".mptitle").html();
      var mpwriter = $(this).find(".mpwriter").html();
      var mpregdate = $(this).find(".mpregdate").html();
      var mpcount = $(this).find(".mpcount").html();
      
      $("#likeImg").attr("src", likeImg);
      $("#mypet_image").attr("src", "/display?fileName="+mpimage);
      $("#mypet_uimage").attr("src", "/display?fileName="+uimage);
      $("#mp_no").html(mpno);
      $("#mp_title").html(mptitle);
      $("#mp_writer").html(mpwriter);
      $("#mp_regdate").html(mpregdate);
      $("#mp_count").html(mpcount);
      
      modal2.style.display = 'block';
      getMyPetList();
   });
   //??????????????? ????????? ??????
   $("#search").on("click", function() {
      page = 1;
      getList();
   });

   //????????????????????? ????????? ?????????
   $("#keyword").on("keypress", function(e) {
      if (e.keyCode == 13)
         $("#search").click();
   });

   //????????? ????????? ????????? ??????
   $(".pagination").on("click", "a", function(e) {
      e.preventDefault();
      page = $(this).attr("href");
      getList();
   });
	
	$("#mpdelete").on("click", function(){
		var mpno="${param.mpno}";
		if(!confirm(mpno + "???(???) ???????????????????"))
			return;
		location.href = "delete?mpno=" + mpno;
	});
	
	//?????? ??????
	$("#mpreplies").on("click", ".delete", function() {
		var row = $(this).parent().parent();
		var mprno = row.attr("mprno");
		if(!confirm("????????? ???????????????????")) return;
		$.ajax({
			type: "post",
			url: "/mpreply/delete",
			data: {mprno:mprno},
			success: function(){
				getMyPetList();
			}
		});
	});

	//?????? ??????
	$("#insert").on("click", function() {
		var mpno=$("#mp_no").html();
		var mpreplyer = "${unickname}";
		var mpreply = $("#mpreply").val();
		var uimage="${image}";
		if (mpreply == "") {
			alert("????????? ???????????????!");
			$("#mpreply").focus();
			return;
		}
		if (!confirm("????????? ???????????????????"+mpno+mpreplyer+ mpreply))
			return;
		$.ajax({
			type : "post",
			url : "/mpreply/insert",
			data : {
				mpno : mpno,
				mpreplyer : mpreplyer,
				mpreply : mpreply,
				uimage : uimage,
			},
			success : function() {
				getMyPetList();
				$("#mpreply").val("");
			}
		});
	});

	function getMyPetList() {
		var mpno=$("#mp_no").html();
		$.ajax({
			type : "get",
			url : "/mpreply/list.json",
			dataType : "json",
			data : {
				page : page,
				mpno : mpno
			},
			success : function(data) {
				var template = Handlebars.compile($("#temp_reply").html());
				$("#mpreplies").html(template(data));
			}
		});
	}


	$("#delete").on("click", function() {
		var mpno = "${param.mpno}";
		if (!confirm(mpno + "???(???) ???????"))
			return;
		location.href = "delete?mpno=" + mpno;
	});
</script>
<script>
   const
   modal2 = document.querySelector('.modal2');
   const
   btnclose2 = document.querySelector('.btn-close2');
   const
   btnOpenPopup2 = document.querySelector('.btn-open-popup2');
   btnOpenPopup2.addEventListener('click', function() {
      modal2.style.display = 'block';
   });

   btnclose2.addEventListener('click', function() {
      modal2.style.display = 'none';
   });
</script>
