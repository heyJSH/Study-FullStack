<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>스타벅스 공지사항 어드민</title>
</head>
<body>
    <!-- 1. 게시판의 화면은 class="card"로 적용 -->
    <div class="card">

        <!-- 1-1. 게시판 이름은 class="card-header"로  <div>로 구역 설정 -->
        <div class="card-header"><a href="#"><h1>스타벅스 공지사항 어드민</h1></a></div>

        <!-- 1-2. 내용은 class="card-body"로 <div>로 구역 설정 -->
        <div class="card-body">

            <!-- 검색어 입력하기 -->
            <input type="search" name="" id="" placeholder="검색어를 입력하세요."><a class="search" href="">검색</a>
            
            <!-- 내용을 HTML로 작성하기 -->
<%
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
  String USER = "jsp";
  String PASSWORD = "123456";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	Statement stmt = null; //쿼리를 실행하기 객체 정보
	ResultSet rs = null;
	
	Exception exception = null;
	
  try {
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  // System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	stmt = conn.createStatement();	// 2-1. Statement 생성
	  // FETCH FIRST 개수(숫자) ROWS ONLY → 상위 N개 출력
	 	rs = stmt.executeQuery("SELECT NUM, SUBJECT, HIT, REGDATE FROM BO_FREE ORDER BY NUM DESC fetch first 5 rows only"); // 2-2. SQL 쿼리 실행
		
	 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
	 	while(rs.next()) {
%>            
            <div class="content-box">
                <div><%= rs.getInt("NUM") %></div>
                <div class="title"><a href="#"><%= rs.getString("SUBJECT") %></a></div>
                <div><%= rs.getDate("REGDATE") %></div>
                <div class="delete"><button>X</button></div>
            </div>
<% 		 		
	 	}
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류: " + e);
  } finally {
	  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>
						<!-- 
            <ul class="number">
                <li><a href="#">&lt;</a></li>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">&gt;</a></li>
            </ul>
            -->
        </div>

        <!-- 1-3. 글쓰기 버튼은 class="btn"로 <div>로 구역 설정 -->
        <div class="btn">
            <a href="./adminNoticeInsertForm.jsp">글쓰기</a>
        </div>
    </div>
</body>
</html>