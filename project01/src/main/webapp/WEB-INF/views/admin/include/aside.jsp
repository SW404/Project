<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

@font-face {
    font-family: 'SBAggroL';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroL.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#menu {
	width:1000px;
	padding:10px;
	font-size: 30px;
	text-align:center;
	margin:0px auto;
	transform: translateX(35%);
}
#menu td{
	border: 3px solid gray;
	padding: 10px;
}

a {
	text-decoration:none;
	color:red;
	font-family: 'SBAggroL';
}
</style>
<html>
<head>
</head>
<body>
	<table id="menu">
		<tr>
			<td width=200><a href="/admin/shop/insert">상품 등록</a></td>		
			<td width=200><a href="/admin/shop/list">상품 목록</a></td>
			<td width=200><a href="/admin/shop/alltrade">주문 목록</a></td>			
			<td width=200><a href="/admin/user/userlist">유저 목록</a></td>
		</tr>
	</table>
</body>	
</html>



