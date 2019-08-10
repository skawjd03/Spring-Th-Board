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
    <link rel="stylesheet" href="/bo/resources/css/board.css">
    <title>BOARD PAGE</title>
</head>

<body>
	<%@include file="/resources/include/nav.jsp"%>

    <div class="boardContainer">
        <div class="boardBox">
            <div class="pull-right amountDiv">
                <select name="" id="amount">
                    <option value="">--</option>
                    <option value="10">10개씩</option>
                    <option value="20" selected="selected">20개씩</option>
                    <option value="30">30개씩</option>
                </select>
            </div>
            <table class="table table-striped boardTable">
                <thead>
                    <th class="th100">글번호</th>
                    <th class="th100">카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th class="th100">작성일</th>
                    <th class="th100">조회수</th>
                </thead>
                <tbody>
                    <c:forEach var="post" items="${list}">
						<tr>
							<td>${post.postNo}</td>
							<td>${post.postCategory}</td>
							<td><a class="postGo" href="/bo/post?postNo=${post.postNo}">${post.postTitle}</td>
							<td>${post.postWriter}</td>
							<td>${post.postDate}</td>
							<td>${post.postHit}</td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
            <div class="searchDiv">
                <label class="searchLabel">검색</label> 
                <input type="text" id="keyword">
                <button id="searchBtn" name="searchBtn" type="submit" class="btn"></button>
                <select id="type">
                    <option value="TC" ${pageMaker.cri.type eq 'TC' ? 'selected' : ''}>제목+내용</option>
                    <option value="T" ${pageMaker.cri.type eq 'T' ? "selected" : ''}>제목</option>
                    <option value="C" ${pageMaker.cri.type eq 'C' ? "selected" : ''}>내용</option>
                    <option value="W" ${pageMaker.cri.type eq 'W' ? "selected" : ''}>작성자</option>
                    <option value="TWC" ${pageMaker.cri.type eq 'TWC' ? "selected" : ''}>전체</option>
                </select>
            </div>
            <div class="pull-right writeBtnDiv">
            	<c:if test="${loginInfo != null}">
	                <a href="/bo/write"><button>글쓰기</button></a>        	
            	</c:if>
            </div>
            <div class="paginationDiv">
                <ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage-1 }">이전</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cri.pageNum == num? "active":"" }">
							<a href="${num }">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage+1 }">다음</a>
						</li>
					</c:if>
					<c:if test="${pageMaker.next }">
						<li class="paginate_button next">
							<a href="${pageMaker.lastPage }">맨끝</a>
						</li>
					</c:if>
                </ul>
            </div>
        </div>
    </div>

	<form id="listGetForm" action="/bo/board" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script>
    	var actionForm = $("#listGetForm");
    	
	    $('#searchBtn').on('click', function(e) {
			$("input[name='keyword']").val($('#keyword').val());
			$("input[name='type']").val($("#type option:selected").val());
			$("input[name='pageNum']").val(1);
			actionForm.submit();
		});
	    
	    $("#keyword").keyup(function(key) {
			if (key.keyCode == 13) {
				$("input[name='keyword']").val($('#keyword').val());
				$("input[name='type']").val($("#type option:selected").val());
				$("input[name='pageNum']").val(1);
				actionForm.submit();
			}
		});
	    
	    $('#amount').on('change', function(e) {
			$("input[name='amount']").val($('#amount option:selected').val());
			actionForm.submit();
		});
	    
	    $(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
    </script>
</body>

</html>