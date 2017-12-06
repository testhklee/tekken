<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
</head>
<body>
	<header>
		<div id="header_inner" class="clearfix">
			<div class="main_logo"><a href="Controller.go?command=login&id=${dto.emailorphone }&mypassword=${dto.password }"><img src="img/after_logo.png" alt="메인로고"></a></div>
			<div class="myrole clearfix">
         		<p>${dto.name }<span>님</span></p>
         		<div class="logout">
         			<button onclick="location.href='Controller.go?command=logout'">로그아웃</button>
         		</div>
     	 	</div>
		</div>
	</header>
</body>
</html>