<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="/bo/resources/css/login.css">
    <script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
    <title>LOGIN PAGE</title>
</head>

<body>
    <%@include file="/resources/include/nav.jsp"%>
    <div class="loginContainer">
        <div class="loginBox">
            <div class="loginInputBox">
                <form class="loginForm" method="POST" action="/bo/login/checklogin">
                    <div class="inputDiv">
	                    <c:if test="${errormap.errorId != null}">
		                   <i class="fas fa-user fa-2x loginIcon"></i>
		                   <input class="loginInput" type="text" id="userid" name="userId" placeholder="아이디를 입력하세요." value="${errormap.errorId}">
	                    </c:if>
	                    <c:if test="${errormap.errorId == null }">
		                   <i class="fas fa-user fa-2x loginIcon"></i>
		                   <input class="loginInput" type="text" id="userid" name="userId" placeholder="아이디를 입력하세요.">
	                    </c:if>
                    </div>
                    <div class="inputDiv">
                        <i class="fas fa-key fa-2x loginIcon"></i>
                        <input class="loginInput" type="password" name="userPass" placeholder="비밀번호를 입력하세요.">
                    </div>
                </form>
            </div>
            <div class="loginDiv centerDiv">
            	<c:if test="${errormap.loginErrorMsg != null}">
                    <p class="loginPtag">${errormap.loginErrorMsg}</p>
                </c:if>
            </div>
            <div class="loginDiv prightDiv">
                <input type="checkbox">
                <p class="loginPtag" style="color:black"> 아이디 저장</p>
            </div>
            <div class="loginDiv centerDiv">
                <a href="/bo/join">
                	<input class="loginBtn" type="button" value="회원가입">
                </a>
                <input class="joinBtn" type="button" value="로그인">
            </div>
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script>
    	$('.joinBtn').on('click',function(){
    		$('.loginForm').submit();
    	});
    </script>
</body>

</html>