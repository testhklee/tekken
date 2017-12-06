<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>

<%
/*
response.setHeader("Cache-control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
*/
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	
	//뒤로가기 강제 막기
	window.history.forward();
	
	function update(value) {		
		open("Controller.go?command=adminupdateform&userid=" + value,"","width=700px,height=200px");		
	}
	</script>
</head>
<body>
	<%@ include file="header.jsp" %>
  	<section id="admin_board">
        <div class="admin_board_inner clearfix">
            <h1>관리자 페이지</h1>
            <nav>
                <ul>
                    <li><a href="Controller.go?command=adminUserInfo&pageNum=1">회원정보</a></li>
                    <li>Q&A</li>
                    <li>메뉴3</li>
                    <li>메뉴4</li>
                    <li>메뉴5</li>
                </ul>
            </nav>
            <!-- <div class="board_tab">
            	
            </div>
            <div class="board_tab">
            	<h1>Q&A</h1>
            </div>
            <div class="board_tab">
            	<h1>메뉴3 제목</h1>
            </div>
            <div class="board_tab">
            	<h1>메뉴4 제목</h1>
            </div>
            <div class="board_tab">
            	<h1>메뉴5 제목</h1>
            </div> -->
        </div>
    </section>
  	<%@ include file="footer.jsp" %>
</body>
</html>