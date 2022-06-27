<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<div id="page" style="margin:0px auto; text-align:center; font-family: 'SBAggroL';">
   <h1>상품 등록</h1> 
   <form name="shfrm" method="post" enctype="multipart/form-data">
      <table style="margin:0px auto; text-align:center;">
         <tr>
            <td class="title" width=100 style="margin:0px auto; text-align:center; border:3px solid black;">상품사진</td>
            <td width=700 style="margin:0px auto; text-align:center; border:3px solid black;">
               <img id="image" name="image" src="https://via.placeholder.com//300x200" width=250/>
               <input type="file" id="file" name="file" accept="image/* "style=display:none;>
            </td>
         </tr>
         <tr>
            <td class="title" width=100 style="margin:0px auto; text-align:center; border:3px solid black;">제목</td>
            <td width=400 style="margin:0px auto; text-align:center; border:3px solid black;"><input type="text" id="title" name="title" size=50></td>
         </tr>
         <tr>
               <td class="price" width=100 style="margin:0px auto; text-align:center; border:3px solid black;">가격</td>
               <td width=300 style="margin:0px auto; text-align:center; border:3px solid black;"><input type="text" id="price" name="price" size=10></td>
            </tr>
      </table>
      <div style="text-align:center;margin-top:20px;">
         <input type="submit" value="상품 올리기">
         <input type="reset" value="등록취소" onClick="location.href='/admin/index'">
      </div>
   </form>
</div>
</html>

<script>
   $(shfrm).on("submit", function(e){
      e.preventDefault();
      var title=$("#title").val();
      var image=$("#file").val();
      var price=$("#price").val();
      
      if(image==""){
         alert("사진을 등록하세요!");
         return;
      }else if(title==""){
         alert("제목을 입력하세요!");
         $("#title").focus();
         return;
      }else if(price=="" || price.replace(/[0-9]/g,'')){
         alert("가격을 숫자로 입력하세요!");
         $("#price").focus();
         return;
      }
      
      if(!confirm("상품을 등록하실래요?")) return;
      shfrm.submit();
   });
   
   $("#image").on("click", function(){
      $("#file").click();
   });
   
   //이미지 미리보기
   $("#file").on("change", function(e){
      var file=$("#file")[0].files[0];
      $("#image").attr("src", URL.createObjectURL(file));
   });
</script>