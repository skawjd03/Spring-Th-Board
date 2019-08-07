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
	<link rel="stylesheet" href="/bo/resources/css/post.css">
	<script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
	<title>POST PAGE</title>
</head>
<body>
	<%@include file="/resources/include/nav.jsp"%>
	<div class="container containerDiv">
		<div class="row">
			<table class="table table-striped postTable">
				<thead>
					<tr>
						<th class="viewPostTH" colspan="2">
							게시판 글보기
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="categoryTd" colspan="2">
							${postWithComment.post.postCategory}
						</td>
					</tr>
					<tr>
						<td class="TitleTd">글 제목</td>
						<td colspan="2">${postWithComment.post.postTitle}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${postWithComment.post.postWriter}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${postWithComment.post.postDate}</td>
					</tr>
					<tr class="contentTr">
						<td>내용</td>
						<td class="contentTd" colspan="2">
							${postWithComment.post.postContent}
						</td>
					</tr>
					<tr>
						<td>파일</td>
						<td colspan="2">
							<p style="display: inline-block;">${postWithComment.post.fileName}</p>
							<a href="/bo/post/filedown?fileName=${postWithComment.post.filePath}&fileOrgName=${postWithComment.post.fileName}">
								<input type="button" value="다운로드"/>
							</a>
						</td>
					</tr>
				</tbody>
			</table>

			<a id="listGO" href="/bo/board" class="btn btn-primary">목록</a>
			<c:if test="${loginInfo.userId == postWithComment.post.postWriter}">
				<a id="updateGO" href="/bo/update?postNo=${postWithComment.post.postNo}" class="btn btn-primary">수정</a>
				<a id="deleteGO" href="/bo/post/remove?postNo=${postWithComment.post.postNo}" class="btn btn-primary">삭제</a>
			</c:if>
			<table class="table table-striped commentTable">
				<thead>
					<tr>
						<th class="commentWriteTh" colspan="2">댓글 입력</th>
						<td class="commentBtnTh">
							<a class="btn btn-primary" id="commentBtn">댓글 등록</a>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="3">
							<c:if test="${loginInfo != null}">
								<textarea id="replyContent" rows="5" cols="100"></textarea>
							</c:if> 
							<c:if test="${loginInfo == null}">
								<textarea rows="5" cols="100" id="replyContent" disabled="disabled">로그인이 필요합니다.</textarea>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div id="commentField">
				<c:forEach items="${postWithComment.comment}" var="reply">
					<c:if test="${reply.lev == 1}">
						<div class="commentBox cBox_${reply.commentNo}">
					</c:if>
					<c:if test="${reply.lev != 1}">
						<div class="commentBox cBox_${reply.commentNo}" style="margin-left:${reply.lev*15}px">
					</c:if>
					<div class="profileImgBox">
						<img class="profileImg" src="${reply.userProfile }">
					</div>
					<div class="commentIdStar">
						<span class="commentId">${reply.userNick}</span>
						<p class="commentDateP">${reply.commentDate}</p>
					</div>
					<div class="commentContentDiv">
						<p class="commentContentP">${reply.commentContent}</p>
					</div>
					<div class="commentBtnDiv">
						<a class="thumbsBtn" onclick="thumbsup('${reply.commentNo}')">
							<i class="far fa-thumbs-up fa-1x"></i> 추천
							<p class="thumb_${reply.commentNo} thumbsP">${reply.commentThumbs}</p>
						</a>
						<c:if test="${loginInfo != null}">
							<a class="replyBtn" cNo="${reply.commentNo}">
								<i class="far fa-comment"></i> 댓글
							</a>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
	<div class="paginationDiv">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous">
					<a href="/bo/post?pageNum=${pageMaker.startPage-1}&postNo=${postWithComment.post.postNo}">이전</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
				<li class="paginate_button ${pageMaker.cri.pageNum == num? "active":"" }">
					<a href="/bo/post?pageNum=${num }&postNo=${postWithComment.post.postNo}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next">
					<a href="/bo/post?pageNum=${pageMaker.endPage+1}&postNo=${postWithComment.post.postNo}">다음</a>
				</li>
			</c:if>
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next">
					<a href="/bo/post?pageNum=${pageMaker.lastPage}&postNo=${postWithComment.post.postNo}">맨끝</a>
				</li>
			</c:if>
		</ul>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script>
	
		$('.replyBtn').on('click',function(){
			var cNo = $(this).attr('cNo');
			$('.replyBox').remove();
			$('.cBox_'+cNo).after($('<div class="replyBox">댓글달기 <input id="rereplyText" type="text"><div class="BtnReplyBoxDiv"><a class="cBtn" onclick="cancelB()">취소</a><br><a class="cBtn" onclick="rereply('+cNo+')">댓글</a></div>'));
		});
		
		function cancelB(){
			$('.replyBox').remove();			
		}
		
		$('#commentBtn').on('click',function(){
			if($('#replyContent').val() == null || $('#replyContent').val() == ''){
				alert('댓글 내용을 입력하세요.');
			}else{
				$.ajax({
					type:'post',
					url:'/bo/post/comment',
					data:{'commentPno':${postWithComment.post.postNo},'commentContent':$('#replyContent').val()},
					success:function(data){
						if(data == 'success'){
							location.reload();
						}else if(data == 'false'){
							alert('댓글 입력 오류');
						}
					}
				})
			}
		});
		
		function rereply(cno){
			if($('#rereplyText').val() == null || $('#rereplyText').val() ==  ''){
				alert('댓글 내용을 입력하세요.');
			}else{
				$.ajax({
					type:'post',
					url:'/bo/post/comment',
					data:{'commentParent':cno,'commentPno':${postWithComment.post.postNo},'commentContent':$('#rereplyText').val()},
					success:function(data){
						if(data == 'success'){
							location.reload();
						}else if(data == 'false'){
							alert('댓글 입력 오류');
						}
					}
				})
			}
		}
		
		function thumbsup(cno){
			$.ajax({
				type:'post',
				url:'/bo/post/thumbs',
				data:{'thumbsCno':cno},
				success:function(data){
					if(data == -2){
						alert('로그인이 필요한 기능입니다.');
					}
					$('.thumb_'+cno).html(data);
				}
			});
		}
		
	</script>
</body>

</html>