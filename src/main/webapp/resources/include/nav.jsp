<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="w3-bar w3-light-grey">
	<a href="/bo/board" class="w3-bar-item w3-button"
		style="font-weight: bold; font-size: 20pt">TH Board</a>
	<div style="margin-right: 100px;" class="w3-right">
		<a href="/bo/board" class="w3-bar-item w3-button">게시판<i
			class="fas fa-chalkboard-teacher fa-2x"></i></a>
		<c:if test="${loginInfo != null}">
			<a href="/bo/logout" class="w3-bar-item w3-button"><i class="fas fa-sign-out-alt fa-2x"></i>로그아웃</a>
		</c:if>
		<c:if test="${loginInfo == null}">
			<div class="w3-dropdown-hover">
				<button class="w3-button">
					<i class="far fa-caret-square-down fa-2x"></i>
				</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
					<a href="/bo/login" class="w3-bar-item w3-button"><i
						class="fas fa-user fa-2x"></i>로그인</a> <a href="/bo/join"
						class="w3-bar-item w3-button"><i class="fas fa-user-plus fa-2x"></i>회원가입</a>
				</div>
			</div>			
		</c:if>
	</div>
</div>