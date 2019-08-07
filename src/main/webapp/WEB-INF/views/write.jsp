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
    <link rel="stylesheet" href="/bo/resources/css/write.css">
    <script src="https://kit.fontawesome.com/244e92cc7b.js"></script>
    <title>WRITE PAGE</title>
    <style type="text/css">
    	.where {
		  display: block;
		  margin: 25px 15px;
		  font-size: 11px;
		  color: #000;
		  text-decoration: none;
		  font-family: verdana;
		  font-style: italic;
		} 
.filebox{
	text-align: left;
}
.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
    margin-bottom: 5px;
}

@media(min-width: 768px) {
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.filebox .upload-thumb-wrap {
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.filebox .upload-display img {
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}
    </style>
</head>

<body>
    <%@include file="/resources/include/nav.jsp"%>    
    <div class="container updateDiv">
        <div class="row">
            <form id="writeForm" method="post" action="/bo/write" enctype="multipart/form-data" accept-charset="UTF-8">
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
                            	<input type="text" class="form-control" placeholder="글 제목(50 자)" id="postTitle" name="postTitle" maxlength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            	<input type="text" class="form-control" value="${loginInfo.userNick}" id="postWriter" name="postWriter" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            	<textarea class="form-control" id="postContent" placeholder="글 내용(2048 자)" name="postContent" maxlength="2048"></textarea>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="2" class="filebox bs3-primary preview-image">
		                        <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
								<label for="uploadFile">업로드</label> 
		                        <input type="file" name="uploadFile" id="uploadFile" class="upload-hidden">          	
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <input id="writeBtn" class="btn btn-primary pull-right" value="글쓰기" />
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
    	
   		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;  // 파일명 추출
	        }else {
	            var filename = $(this).val().split('/').pop().split('\\').pop(); // Old IE 파일명 추출
	        };
	        $(this).siblings('.upload-name').val(filename);
	    });
		
    	var imgTarget = $('.preview-image .upload-hidden');
    	imgTarget.on('change', function(){ //preview image
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();
	        if(window.FileReader){ //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
    	});
    </script>
</body>

</html>