<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="/bo/resources/css/join.css">
	<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
	<title>LOGIN PAGE</title>
</head>
<body>
	<%@include file="/resources/include/nav.jsp"%>
	<div class="joinContainer">
		<div class="joinBox">
			<div class="joinInputBox">
				<form id="joinForm" action="/bo/join/memberjoin"accept-charset="utf-8" method="POST" class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin">
					<h2 class="w3-center">회원가입</h2>
					<div class="w3-row w3-section">
						<div class="w3-col joinIconDiv">
							<i class="w3-xxlarge fa fa-user"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" id="userId" name="userId" type="text" placeholder="아이디">
						</div>
					</div>

					<div class="w3-row w3-section">
						<div class="w3-col joinIconDiv">
							<i class="fas fa-key fa-3x"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" id="userPass" name="userPass" type="password" placeholder="비밀번호">
							<div class="pswdlabel"></div>
						</div>
					</div>

					<div class="w3-row w3-section">
						<div class="w3-col joinIconDiv">
							<i class="far fa-envelope fa-3x"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" id="userEmail" name="userEmail" type="text" placeholder="이메일">
						</div>
					</div>

					<div class="w3-row w3-section">
						<div class="w3-col joinIconDiv">
							<i class="w3-xxlarge fa fa-phone"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" id="userPhone" name="userPhone" type="text" placeholder="휴대번호(-미포함)">
						</div>
					</div>

					<div class="w3-row w3-section">
						<div class="w3-col joinIconDiv">
							<i class="fas fa-signature fa-3x"></i>
						</div>
						<div class="w3-rest">
							<input class="w3-input w3-border" id="userNick" name="userNick" type="text" placeholder="닉네임">
						</div>
					</div>
				</form>
				<button id="joinBtn" class="w3-button w3-block w3-section w3-lw3-text-black w3-ripple w3-padding">회원가입</button>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script>
    	var id = false;
    	var pass = false;
    	var phones = false;
    	var email = false;
    	var nick = false;
    	
    	$('#userId').on('change',function(){
    		var getCheck = RegExp(/^[a-zA-Z0-9]{4,15}$/);
            if($('#userid').val() == ''){
               alert('아이디를 입력해주세요.');
               $("#userid").focus();
               id = false;
               return;
            }
            if(!getCheck.test($('#userid').val())){
               alert('아이디를 형식에 맞게 입력해주세요.');
               $("#userid").val("");
               $("#userid").focus();
               id = false;
               return;
            }
    		$.ajax({
    			type:'post',
    			url:'/bo/join/idcheck',
    			data:{'userId':$(this).val()},
    			success:function(data){
    				if(data == 0){
    					alert('사용 가능한 아이디입니다.');
    					id = true;
    				}else{
    					alert('이미 존재하는 아이디입니다.');
    					id = false;
    				}
    			}
    		});
    	});
    	
    	$('#userPhone').on('change',function(){
    		var phone = $(this).val();
    		var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
        	if(phonePattern.test(phone) && phone.length==11){
        	}else{
        		alert('전화번호를 제대로 입력해주세요.');
        		phones = false;
        		return;
        	}
    		$.ajax({
    			type:'post',
    			url:'/bo/join/phonecheck',
    			data:{'userPhone':phone},
    			success:function(data){
    				if(data != 0){
    					alert('이미 가입된 전화번호입니다.');
    					phones = false;
    				}else{
    					phones = true;
    				}
    			}
    		});
    	});
    	
    	$('#userPass').on('change',function(){
    		var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
            if(!reg.test($(this).val())){
               $('.pswdlabel').html(" 비밀번호는 8자 이상이어야 하며, 숫자/대소문자/특수문자를 모두 포함해야 합니다.");
               pass = false;
               return;
            }else{
               $('.pswdlabel').html('');
               pass = true;
               return;
            }
    	});
    	
    	$('#userNick').on('click',function(){
    		var nickreg = /^[a-zA-Z가-힣0-9]{3,15}$/;
            if(!nickreg.test($('#userNick').val())){
               alert('닉네임은 3~15글자 (한글,영대소문자,숫자)만 가능합니다.');
               $('#userNick').focus();
               nick = false;
               return;
            }else{
	            nick = true;            	
            }
    	});
    	
    	$('#userEmail').on('change',function(){
    		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    		  if ($('#userEmail').val().match(regExp) != null) {
    			  email = true;
    		  }
    		  else {
    			  alert('이메일 형식이 아닙니다.');
    			  email = false;
    			  $('#userEmail').focus();
    			  return;
    		  }
    	})
    	
    	$('#joinBtn').on('click',function(){
    		if(!id || !pass || !phones || !email || !nick){
    			alert('입력하지않은 정보가 있습니다.');
    			return;
    		}else{
    			$('#joinForm').submit();
    		}
    	});
    </script>
</body>

</html>