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
	<link rel="stylesheet" type="text/css" href="css/admin_info.css">
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
                    <li>회원정보</li>
                    <li>Q&A</li>
                    <li>메뉴3</li>
                    <li>메뉴4</li>
                    <li>메뉴5</li>
                </ul>
            </nav>
            <div class="board_tab">
            	<h1>회원정보</h1>
                <table>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>이메일 또는 휴대폰 번호</th>
                            <th>생일</th>
                            <th>성별</th>
                            <th>회원,비회원 여부</th>
                            <th>등급</th>
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test="${empty list }">
                    			<tr>
                    				<td colspan="7">회원정보가 존재하지 않습니다.</td>
                    			</tr>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach items="${list }" var="allDto">
                    				<tr>
										<td onclick="update('${allDto.emailorphone}');" class="detail">${allDto.name }</td>
										<td>${allDto.emailorphone}</td>
										<td>${allDto.birth }</td>
										<td>${allDto.gender==1?"여":"남" }</td>
										<td>${allDto.enabled=="Y"?"회원":"비회원" }</td>
										<td>${allDto.role }</td>
										<td>${allDto.userdate }</td>
									</tr>
                    			</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    </tbody>
                </table>
                <div class="page_list_num">
                	<ul class="clearfix">
                		<li><a href="Controller.go?command=adminUserInfo&pageNum=${begin-5 }"><img alt="왼쪽화살표" src="img/icon_left.png"></a></li>
	                	<c:forEach var="i" begin="${begin }" end="${end }" step="1">
	                		<li><a href="Controller.go?command=adminUserInfo&pageNum=${i }">${i }</a></li>	              
	                	</c:forEach>
	                	<li><a href="Controller.go?command=adminUserInfo&pageNum=${begin+5 }"><img alt="오른쪽화살표" src="img/icon_right.png"></a></li>
                	</ul>
                </div>
                <form action="Controller.go" method="post">
                	<input type="hidden" name="command" value="search">
                	<table>
                		<tr>
                			<td>
                				<select name="selOne">
                					<option value="name">이름</option>
                					<option value="id">이메일 또는 휴대폰</option> 
                					<option value="birth">생일</option>               					
                					<option value="gender">성별</option>
                					<option value="enabled">회원여부</option>
                					<option value="role">등급</option>
                				</select>
                			</td>
                			<td><input type="text" name="searchT"></td>
                			<td><input type="submit" value="검색"></td>
                		</tr>
                	</table>
                </form>
            </div>        
        </div>
    </section>
  	<%@ include file="footer.jsp" %>
</body>
</html>