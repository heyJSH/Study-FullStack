<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB와 연결 -->  
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConfig" %>
<%@ page import="java.lang.Exception" %>  

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>스타벅스 공지사항 상세내용</title>
  <!-- reset.css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
  <!-- google font & google material icon -->
  <!-- Google 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" href="./css/notice-detail.css" />
  
  <script defer src="./js/jquery-3.7.1.min.js"></script>
  
  <!-- Add icon library (페이스북 아이콘) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script defer src="./js/main.js"></script>
</head>

<body>
	<!-- 헤더 영역 공통 부분 -->
 	<%@ include file ="header.jsp" %>
	
	<!-- 공지사항 세부내용 들어오면 조회수(HIT) count 하기 -->
<%
String num = request.getParameter("num");
String subject = "";		// 공지사항 제목
String content = "";	// 공지사항 내용

Connection conn = null;     			// 디비 접속 성공시 접속 정보 저장
Statement stmt = null; 						// 쿼리 R 실행문
PreparedStatement pstmt = null;   // 쿼리를 실행하기 객체 정보
ResultSet rs = null;           		// SELECT 결과를 저장하는 정보

try {
	// 0. 오라클 DB 오류 안나도록 함
  Class.forName("oracle.jdbc.driver.OracleDriver");

	// 1. JDBC로 Oracle연결
  conn = DBConfig.getConnection();   // 주의: 접속 성공시 접속 정보 저장
  System.out.println("접속 성공");
  
	// 2. BO_FREE 테이블에 선택한 글 조회수 1 올리기
	String updateQuery = "UPDATE BO_FREE SET HIT = HIT + 1 WHERE NUM = ?";
	pstmt = conn.prepareStatement(updateQuery);
	pstmt.setInt(1, Integer.parseInt(num));
	
	pstmt.executeUpdate();
	
	// 3-1. 읽기를 위해 Statement 생성
	stmt = conn.createStatement();
	// 3-2. SQL 조회 쿼리 실행
	rs = stmt.executeQuery("SELECT NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num);
 	// 3-3. SQL 조회 쿼리 가져온 데이터를 자바 String 변수 set
 	if (rs.next()) {
 		subject = rs.getString("SUBJECT");
 		content = rs.getString("CONTENT");
 		
%>
	
	<!-- notice top -->
	<section>
		<div class="inner sub_tit_wrap">
			<div class="sub_tit_inner">
				<h2><img src="https://www.starbucks.co.kr/common/img/whatsnew/notice_tit.jpg" alt="공지사항"></h2>
	      <ul class="smap">
	      	<!-- 홈 버튼 누르면 스타벅스 메인 홈으로 이동 -->
          <li><a href="./index.jsp"><img src="https://image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로"></a></li>
          <li><img class="arrow" src="https://image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
          <li class="en"><a href="#">WHAT'S NEW</a></li>
          <li><img class="arrow" src="https://image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"></li>
          <li><a href="./notice.jsp" class="this">공지사항</a></li>
	      </ul>
			</div>
		</div>
	</section>
	
	<!-- notice contents -->
	<section>
		<div class="inner notice_det_wrap">
			<div class="notice_det_inner">
				<ul class="nmap">
					<li class="det__title">
						<%= subject %>
					</li>
					<!-- facebook 아이콘 추가 -->
					<li class="fa fa-facebook"><a href="https://www.facebook.com/?locale=ko_KR"></a></li>
				</ul>
			</div>
			<div class="notice__contents">
				<p><%= content %></p>
			</div>
			<!-- 목록 버튼 -->
			<div class="bottom">
			<input type="button" value="목록" onclick="location.href='notice.jsp'">
		</div>
		<!-- 윗글 & 아랫글 -->
		<div class="notice_det_list">
			<div class="prev">
				<h3>윗글</h3>
				<p>해당글이 없습니다.</p>
			</div>
			<div class="next">
				<h3>아랫글</h3>
				<p>시스템 개선 및 서비스 점검 안내</p>
			</div>
		</div>
		</div>
<%
 		}
  } catch(Exception e) {
	  // exception = e;
	  e.printStackTrace();
  } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>
	</section>

	
</body>
</html>