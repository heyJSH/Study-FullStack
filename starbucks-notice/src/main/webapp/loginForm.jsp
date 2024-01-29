<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타벅스 로그인</title>
  <!-- 파비콘 -->
  <link rel="icon" href="./images/favicon.ico" />
  <!-- reset.css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
  <!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Google 매트리얼 아이콘 -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <link rel="stylesheet" href="./css/loginForm.css" />
  
  <script defer src="./js/jquery-3.7.1.min.js"></script>
  <!-- lodash -->
  <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
  <!-- gsap -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
  <!-- gsap_scrolltoplugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>
  <!-- swiper -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

  <script defer src="./js/main.js"></script>
</head>
<body>
   <!-- 헤더 영역 공통 부분 -->
 	<%@ include file ="header.jsp" %>
  
  <!-- 로그인 -->
 	<div class="login-container">
 		<h2>로그인</h2>
 		<div class="login-box">
 			<div class="welcome">
 				<span>Welcome!</span>
 				<p>스타벅스 코리아에 오신 것을 환영합니다.</p>
 			</div>
	 		<form class="login-form" action="./login.jsp">
	 			<input type="text" id="userId" name="userId" placeholder="아이디를 입력해 주세요." required>
	 			<input type="text" id="userPw" name="userPw" placeholder="비밀번호를 입력해 주세요." required>
	 			<div class="save-Information">
	 				<ul class="save">
	 					<li>체크</li>
	 					<li>아이디 저장</li>
	 				</ul>
	 			</div>
	 			<input type="submit" id="login-btn" name="login-btn" value="로그인">
	 		</form>
 			<!-- 로그인 설명 -->
	 		<div class="explanation">
	 			<div class="ex1">
	 				* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길 바랍니다.
	 			</div>
	 			<div class="ex2">
	 				* 스타벅스 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상, Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
	 			</div>
	 		</div>
	 		
	 		<!-- 회원가입, 아이디 찾기, 비밀번호 찾기 -->
	 		<div class="login-menu">
				<ul class="menu">
					<li class="sign-up">
						<a href="#">회원가입</a>
					</li>
					<li class="id-search">
						<a href="#">아이디 찾기</a>
					</li>
					<li>
						<a href="#">비밀번호 찾기</a>
					</li>
				</ul>
	 		</div>
	 		
	 	</div>
	 	
 	</div>
</body>
</html>