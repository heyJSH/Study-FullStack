<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>글쓰기</title>
</head>
<body>
    <div class="card">
        <div class="card-header1">
            <h1><a href="./adminNoticeList.jsp">스타벅스 공지사항 글 등록</a></h1>
        </div>
        <form action="./adminNoticeInsert.jsp" method="post">
	        <div class="card-write">
	            <div class="myinfo">
	                이름<input type="text" name="korname" placeholder="이름을 입력하세요.">
	                <!-- 
	                비밀번호<input type="password" placeholder="비밀번호를 입력하세요.">
	                -->
	            </div>
	            <div class="title-w">
	                제목<input type="text" name="title" placeholder="제목을 입력하세요.">
	            </div>
	            <div class="msg">
	                내용<textarea placeholder="내용을 입력하세요." name="content"></textarea>
	                <input type="file" name="filecontent" id="">
	            </div>
	        </div>
	        <div class="btn-w">
	        	<input type="submit" value="작성" class="input-btn-w"/>
        	</div>
        </form>
    </div>
</body>
</html>