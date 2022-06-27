<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/doctorlogin.css" rel="stylesheet" >

<div id="page">
	<div id="box">
		<h1>����ȸ������</h1>
		<form name="frm" method="get">
			<table>
				<tr>
					<td width=200 style="font-weight: bold;">�޴���</td>
					<td width=320 class="input-box">
						<input name="tel" type="text" class="tel" maxlength="13" placeholder="�ڵ�����ȣ"></td>
						
					<td style="font-weight: bold;" width=200>������</td>
					<td width=320 style="display: flex; margin-right: 10px;" class="input-box">
						<input style="margin-left:10px;" id="hname" name="hname" type="text" class="hospital" placeholder="������"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">���̵�</td>
					
					<td style="display: flex;" class="input-box">
					<input type="text" id = "did" name="did" style="width:200px;" placeholder="���̵�" autocomplete="username" required oninput = "checkId()" /> 
						<button id="btnCheck">�ߺ�üũ</button>
					<td style="font-weight: bold;">��ǥ����ó</td>
					<td><input type="text" class="htel" maxlength="13"  placeholder="��ǥ����ó"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">��й�ȣ</td>
					<td><input type="password" class="pass" id="pass1" placeholder="��й�ȣ"></td>
					<td style="font-weight: bold; height:150px;">��й�ȣȮ��</td>
					<td><input type="password" class="passchk" id="pass2"
						placeholder="��й�ȣȮ��">
						<div class="alert alert-success" style="color:blue" id="alert-success">��й�ȣ�� ��ġ�մϴ�.</div> 
						<div class="alert alert-danger"style="color:red" id="alert-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div></td>

				</tr>
				<tr>
					<td style="font-weight: bold;">�̸�</td>
					<td><input type="text" class="name" placeholder="�̸�"></td>
					<td style="font-weight: bold;">�̸���</td>
					<td><input type="text" class="email" placeholder="�̸���"></td>
				</tr>
				<tr>
					<td style="font-weight: bold;">�ּ�</td>
					<td>
						<div class="form-group">
							<input class="form-control" style="width: 55%; display: inline;"
								placeholder="�����ȣ" name="addr1" id="addr1" type="text"
								readonly="readonly">
							<button type="button" id="btnaddress" class="btn btn-default"
								onclick="execPostCode();">
								<i class="fa fa-search"></i> �˻�
							</button>
						</div>
						<div class="form-group">
							<input class="form-control" style="top: 5px;"
								placeholder="���θ� �ּ�" name="addr2" id="addr2" type="text"
								readonly="readonly" />
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="���ּ�" name="addr3"
								id="addr3" type="text" />
						</div>

					</td>
					<td style="font-weight: bold;">�̹���</td>
					<td><input type="file" name="file" style="display: none;">
						<div id="imgbox">
							<img id="image"style="float: left; "
							src="/resources/person.png" id="image" width=150>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<div id="btns">
			<button id="reset">���</button>
			<button id="insert">ȸ������</button>
			
		</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//��ȭ��ȣ �ڵ� - 
	$('.tel')
			.keydown(
					function(event) {
						var key = event.charCode || event.keyCode || 0;
						$text = $(this);
						if (key !== 8 && key !== 9) {
							if ($text.val().length === 3) {
								$text.val($text.val() + '-');
							}
							if ($text.val().length === 8) {
								$text.val($text.val() + '-');
							}
						}

						return (key == 8 || key == 9 || key == 46
								|| (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
					});
	$('.htel')
	.keydown(
			function(event) {
				var key = event.charCode || event.keyCode || 0;
				$text = $(this);
				if (key !== 8 && key !== 9) {
					if ($text.val().length === 3) {
						$text.val($text.val() + '-');
					}
					if ($text.val().length === 8) {
						$text.val($text.val() + '-');
					}
				}

				return (key == 8 || key == 9 || key == 46
						|| (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
			});
</script>
<script>
//�̹���Ŭ���ÿ�
	$(frm.file).on("change", function(e) {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});
</script>
<script>
//�ּҰ˻�
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

           // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
           // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
           var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
           var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

           // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
           // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
           if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5�ڸ� �������ȣ ���
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

//���̵� �ߺ�üũ
$(document).ready(function (){   
	   $("#btnCheck").on("click", function(event) {
	   var params = $("form").serialize(); // �ڵ����� ���±� �ȿ��ִ¾ֵ� �ָ���
	   
	   		$.ajax({
	   			url:"ex01_idcheck.jsp" //MVC�����̶�� .do�� �� ��  (C->H-> S->D)
	   			,dataType:"json"
	   			,type:"get"
	   			//,data:"empno="+$("#empno").val(); //id���� �־����ٸ� �̷��� �ص��ǳ� ������
	   			,data:params //�ٷ� �̷��� �൵ �� 
	   			,cache:false //���� ��û�� ������ db�� �ִ� �� �ٷ� �Ѹ��ڴ�
	   			,success:function(data){ //���������� �������� �����Ͱ� ���� ��
	   				//alert(data.count); //data�� JSON ���� ���� �� {"count":0} data.count�ϸ� 0�ƴϸ� 1
	   				if(data.count==1){ //�����
	   					$("#notice").css("color","red").text("�̹� ��� ���� empno(ID)�Դϴ�.");
	   				}else{//��밡��
	   					$("#notice").css("color","blue").text("��� ������ empno(ID)�Դϴ�.");
	   				}
	   			}
	   		});//ajax
	   });//click
   });//ready

   
	//��й�ȣ �� ��
	$(function(){ 
		$("#alert-success").hide(); 
		$("#alert-danger").hide(); 
		$("input").keyup(function(){ 
			var pass1=$("#pass1").val(); 
			var pass2=$("#pass2").val(); 
			if(pass1 != "" || pass2 != ""){ 
				if(pass1 == pass2){ 
					$("#alert-success").show();
					$("#alert-danger").hide(); 
					$("#submit").removeAttr("disabled"); 
				}else{ 
					$("#alert-success").hide();
					$("#alert-danger").show(); 
					$("#submit").attr("disabled", "disabled"); 
					} 
				} 
			}); 
		});

</script>