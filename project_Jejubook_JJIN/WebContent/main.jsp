<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%-- <%
response.setHeader("Cache-control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<section id="user">
        <div class="inner clearfix">
            <div class="user_menu">
                <div class="my_info">
                    <p><span>[이름]</span></p>
                </div>
                <div class="menu">
                    <ul>
                        <li><a href="Controller.go?command=">내 글 보기</a></li>
                        <li><a href="Controller.go?command=">QnA</a></li>
                        <li><a href="Controller.go?command=">글쓰기</a></li>
                        <li><a href="Controller.go?command=userUpdateOut&id=${dto.emailorphone }">내 정보</a></li>
                    </ul>
                </div>
            </div>       
            <div class="user_contents">
                <div class="user_tab_menu">
                    <ul class="clearfix">
                        <li><a href="#">전체보기</a></li>
                        <li><a href="#">해수욕장/해양산책로</a></li>
                        <li><a href="#">전시관/영화촬영장</a></li>
                        <li><a href="#">음식</a></li>
                        <li><a href="#">숙박</a></li>
                        <li><a href="#">지도검색</a></li>
                    </ul>
                </div>
                <!-- 글 생성 for each  -->
                <div class="user_view clearfix">
                    <div class="content">
                        <div class="top">
                            <div class="user_thema"></div>
                            <div class="user_name">[이름]</div>
                        </div>
                        <div class="user_description">[글 내용]</div>
                        <div class="user_img">[글 사진]</div>
                    </div>                    
                    <div class="user_reple">
                        <div class="get_day"><p>[게시일]</p><span>게시됨</span></div>
                        <div class="user_reple_count">
                            <p>조회수 [count]</p>
                            <p>댓글 [count]</p>
                        </div>
                        <div class="user_reple_all">
                            <div class="F_reple_01">
                                <p>[이름]</p>
                                <p>[내용]</p>
                            </div>
                        </div>
                        <div class="my_reple_add">
                            <!--  리플 작성 폼 -->
                            <form action="" method="post">
                                <input type="hidden" name="command" value="">
                                <input type="hidden" name="" value="${dto.emailorphone }">
                                <input type="text" value="[이름]" readonly="readonly">
                                <input type="text" name="">
                                <input type="submit" value="댓글달기">
                            </form>
                        </div>
                    </div>
                    <div class="more_view">
                        
                    </div>
                    <div class="more_view_after">
                        <div class="google_API"></div>
                        <div class="info">
                            <h1>[이름] <span>[테마]</span></h1>
                            <p>[주소]</p>
                            <p>[전화번호]</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>		
	<%@ include file="footer.jsp" %>
</body>
</html>