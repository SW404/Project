<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.tbl_petInsert {
		margin:0px auto;
		font-family: 'SBAggroL';
	}
	
	.tbl_petInsert td {
		padding:10px;
	}
	
	.submit_btn {
		padding : 20px;
		background:#fa9678;
		border:none;
		color:white;
		font-family: 'SBAggroL';
	}
	
	.cancel_btn {
		padding : 20px;
		background:#232323;
		border:none;
		color:white;
		font-family: 'SBAggroL';
	}
</style>
<div style="text-align:center;position: relative; margin-bottom:70px;">
	<img src="/resources/board_banner.png" style="height:500px; width:100%;">
	<div class="body_banner"> 
		<div class="heading">
		  <div>
		    <p id="banner_top" class="slide-up">게시판</p>
		  </div>
		  <div class="notosanskr">
		    <p id="banner_bottom" class="slide-up">다양한 이야기들을 적어 함께 공유해주세요</p>
		  </div>
		</div>
	</div> 
</div>
<div id="page">
	<p class="small_title">펫스타그램</p>
	<p class="big_title">반려동물들을 마음껏 자랑해주세요</p>
	<form name="mpfrm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="uimage" value="${image}" size=80>
		<table class="tbl_petInsert">
			<tr>
				<td class="title" width=100>사진</td>
				<td width=700>
					<img id="mpimage" name="mpimage" src="https://via.placeholder.com//280x250" width=250/>
					<input type="file" id="file" name="file" accept="image/* "style=display:none;>
				</td>
			</tr>
			<tr>
				<td class="title" width=100>제목 :</td>
				<td width=600><input type="text" id="mptitle" name="mptitle" size=80></td>
			</tr>
			<tr>
            <td class="mpwriter" width=100>작성자</td>
            <td width=300><input type="text" name="mpwriter" value="${unickname}" size=10 style="border:none;" readonly></td>
         </tr>
			<tr>
				<td class="title" width=100>내용</td>
				<td width=700>
					<textarea rows="10" cols="80" id="mpcontent" name="mpcontent" style="resize:none;"></textarea>
				</td>
			</tr>		
		</table>
		<div style="text-align:center;margin-top:20px;">
			<input class="submit_btn" type="submit" value="사진 올리기">
			<input class="cancel_btn" type="button" onClick="location.href='/mypet/list'" value="등록취소">
		</div>
	</form>
</div>

<script>
	$(mpfrm).on("submit", function(e){
		e.preventDefault();
		var mptitle=$("#mptitle").val();
		var mpcontent=$("#mpcontent").val();
		var mpimage=$("#file").val();
		
		if(mpimage==""){
			alert("사진을 등록하세요!");
			return;
		}else if(mptitle==""){
			alert("제목을 입력하세요!");
			$("#mptitle").focus();
			return;
		}else if(mpcontent==""){
			alert("내용을 입력하세요!");
			$("#mpcontent").focus();
			return;
		}
		
		if(!confirm("사진을 등록하실래요?")) return;
		mpfrm.submit();
	});

	$("#mpimage").on("click", function(){
		$("#file").click();
	});

	//이미지 미리보기
	$("#file").on("change", function(e){
		var file=$("#file")[0].files[0];
		$("#mpimage").attr("src", URL.createObjectURL(file));
	});
</script>