<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./css/style.css">
	<script src="./js/jquery-3.7.1.min.js"></script>
	<title>공지사항</title>
</head>
<body>
	<div class="card">
     <div class="card-header3"><h1><a href="./adminNoticeList.jsp">게시판</a></h1></div>
     <div class="card-view">
        <div class="title">
        	<!-- 내용을 DB에서 불러오기 -->
<%
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String USER = "jsp";
	String PASSWORD = "123456";
	
	String num = request.getParameter("num");
		
	Connection conn = null; //디비 접속 성공시 접속 정보 저장
	Statement stmt = null; //쿼리를 실행하기 객체 정보
	ResultSet rs = null;
	
	Exception exception = null;
	
	String name = "";
	String title = "";
	String content = "";
	String regdate = "";
	int hit = 0;
	
	String sql = null;
		
	try {			
			// 1. JDBC로 Oracle연결
		  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		  // System.out.println("오라클 접속 성공");
		  
			// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
		 	stmt = conn.createStatement();	// 2-1. Statement 생성
		 	rs = stmt.executeQuery("SELECT NUM, NAME, SUBJECT, CONTENT, REGDATE, HIT FROM BO_FREE WHERE NUM = " + num); // 2-2. SQL 쿼리 실행
		 	
		 // 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
		 	while (rs.next()) {
		 		name = rs.getString("NAME");
		 		title = rs.getString("SUBJECT");
		 		content = rs.getString("CONTENT");
		 		regdate = rs.getString("REGDATE").substring(0, 10);
		 		hit = rs.getInt("HIT");

%>
        	<h3><%= title %></h3>
        </div>
        <div class="myinfo">

	        <!-- 목록을 만드는 <dl>, <dt>, <dd> tag -->
	        <dl>
	            <dt>작성자</dt>
	            <dd><%= name %></dd>
	        </dl>
	        <dl>
	            <dt>날짜</dt>
	            <dd><%= regdate %></dd>
	        </dl>
	        <dl>
	            <dt>조회</dt>
	            <dd><%= hit %>회</dd>
	        </dl>
        </div>
        <div class="cont">
            <%= content %>
        </div>
<%
		 }
%>
     </div>
<%
	  } catch(Exception e) {
		  System.out.println("오라클 접속 오류: " + e);
	  	} finally {
		  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
		  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	  }
%>
     <div class="btn-view">
         <a href="./adminNoticeUpdateForm.jsp">수정</a>
     </div>
    </div>
</body>
</html>