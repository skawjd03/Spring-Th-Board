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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
	<link rel="stylesheet" href="/bo/resources/css/write.css">
	<title>WRITE PAGE</title>
</head>

<body>
	<%@include file="/resources/include/nav.jsp"%>
	<div class="container updateDiv">
		<div class="row">
			<form id="writeForm" method="post" action="/bo/update/changepost">
				<input type="hidden" value="${bList.postNo}" name="postNo" />
				<table class="table table-striped updateTable">
					<thead>
						<tr>
							<th class="updateTableTh" colspan="2">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="td120">
								<select class="form-control" id="postCategory" name="postCategory">
									<option value="">카테고리</option>
									<option value="일반">일반</option>
									<option value="자유">자유</option>
									<option value="유머">유머</option>
									<option value="힙합">힙합</option>
									<option value="공지">공지</option>
								</select>
							</td>
							<td>
								<input type="text" class="form-control" placeholder="글 제목(50 자)" id="postTitle" name="postTitle" value="${bList.postTitle}" maxlength="50" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" class="form-control" value="${loginInfo.userNick}" id="postWriter" name="postWriter" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea class="form-control"id="postContent" placeholder="글 내용(2048 자)"value="${bList.postContent}" name="postContent" maxlength="2048"></textarea></td>
						</tr>
					</tbody>
				</table>
			</form>
			<input id="writeBtn" class="btn btn-primary pull-right" value="수정완료" />
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
    	$('#writeBtn').on('click',function(){
    		if($('#postCategory').val() == ''){
    			alert('카테고리를 선택해주세요.');
    			return;
    		}
    		if($('#postTitle').val() == ''){
    			alert('제목을 입력해주세요.');
    			$('#postTitle').focus();
    			return;
    		}
    		if($('#postContent').val() == ''){
    			alert('내용을 입력해주세요.');
    			$('#postContent').focus();
    			return;
    		}
    		$('#postWriter').val('${loginInfo.userId}');
    		$('#writeForm').submit();
    	})
    	
    </script>
</body>

</html>