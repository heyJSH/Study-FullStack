<!-- id, pw와 동일한 것을 count한 결과가 존재하면 실행 -->
<%@ page import="utils.DBConfig" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사용자 인증 처리</h2>
<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	Connection connection = null;         // 디비 접속 성공시 접속 정보 저장
  PreparedStatement pstmt = null;       // 쿼리를 실행하기 객체 정보
  ResultSet rs = null;           // SELECT 결과를 저장하는 정보
  
  // DB 접속
  try {
     connection = DBConfig.getConnection();   // 주의: 접속 성공시 접속 정보 저장
     System.out.println("접속 성공");
  } catch(SQLException se) {
     System.out.println("접속 실패");
  }
  // 아이디 비밀번호 체크
  int result = 0;
  
  try {
	  String sql = "SELECT count(*) as CNT FROM BO_FREE WHERE ID =? AND PW =?";
	  pstmt = connection.prepareStatement(sql);
	  pstmt.setString(1, userId);
	  pstmt.setString(2, userPw);
	  rs = pstmt.executeQuery();		// executeQuery : SELECT일 경우
	  
	  while(rs.next()) {
		  result = rs.getInt("CNT");
		  System.out.println("결과: " + result);	// 1이면 id/pw가 존재, 아니면 존재하지 않음
	  }
	  
	  if(result == 1) {		// 로그인 성공 => index.jsp
%>
	<script>
		alert('로그인 성공');
		location.href = './index.jsp';
	</script>
<%
	  } else {	// 로그인 실패 => loginForm.jsp
%>
	<script>
		alert('로그인 실패');
		location.href='./loginForm.jsp';
	</script>
<%
	  }
	  
  } catch(SQLException se) {
	  System.out.println("오라클 접속 오류:" + se);
  }
%>
</body>
</html>