<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
	<title>JOIN WELCOME PAGE</title>
	<style>
        #boardGoBtn{
            width: 200px;
            height: 40px;
            color: black;
        }
        .welcomeContainer{
        	margin-top: 50px;
        	text-align: center;
        }
        .welcomeImg{
         	width: 700px; 
         	height: 500px;
        }
    </style>
</head>
<body>
	<%@include file="/resources/include/nav.jsp"%>
	<div class="container welcomeContainer">
        <h1>${loginInfo.userNick}님 회원가입 환영합니다.</h1>
        <img src="/bo/resources/img/welcome.png" class="welcomeImg"><br>
        <a href="/bo/board"><input id="boardGoBtn" type="button" value="게시판으로"/></a>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>