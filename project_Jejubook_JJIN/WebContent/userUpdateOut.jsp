<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/userUpdateOut.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/userUpdateOut.js?var=1"></script>
</head>
<body>
		<section id="chk_out">
			<div class="chk_msg">
				<div><p>정말로 탈퇴하시겠습니까?</p></div>
				<div>
					<form action="Controller.go" method="post">
						<input type="hidden" name="command" value="">
						<div>
							<p>휴대폰 또는 이메일</p><input type="text" name="id">
						</div>
						<div>
							<p>휴대폰 또는 이메일</p><input type="text" name="passwoard">
						</div>						
						<input type="submit" value="탈퇴">
						<input type="button" value="취소">
					</form>
				</div>
			</div>
		</section>
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
	                <section id="updateOut">
				        <div class="form">
				            <table>
				                <tr>
				                    <th>[ 이름 ]</th>                    
				                </tr>
				                 <tr>
				                    <td>${dto.name }</td>                    
				                </tr>
				                <tr>
				                    <th>[ 휴대폰 또는 이메일 ]</th>                    
				                </tr>
				                 <tr>
				                    <td>${dto.emailorphone }</td>                    
				                </tr>
				                <tr>
				                    <th>[ 생일 ]</th>                    
				                </tr>
				                 <tr>
				                    <td>${dto.birth }</td>                    
				                </tr>
				                <tr>
				                    <th>[ 성별 ]</th>                    
				                </tr>
				                 <tr>
				                    <td>${dto.gender==1?"여":"남" }</td>                    
				                </tr>
				                <tr>
				                    <th>[ 등급 ]</th>                    
				                </tr>
				                 <tr>
				                    <td>${dto.role=="member"?"회원":"임시" }</td>                    
				                </tr>
				                <tr>
				                    <th>[ 가입일자 ]</th>                    
				                </tr>
				                 <tr>
				                    <td>${dto.userdate }</td>                    
				                </tr>
				            </table>
				            <div class="button clearfix">
				            	<!-- location.href='Controller.go?command=userout&id=${dto.emailorphone }' -->
				                <div><input type="button" value="수정하기" onclick=""></div>
				                <div><input type="button" value="회원탈퇴" onclick="chkOut();"></div>
				            </div>
				        </div>
				        <div class="form" style="display: none">
				            <form action="Controller.go" method="post">
				                <input type="hidden" name="command" value="">
				                <table>
				                    <tr>
				                        <th>이름</th>                    
				                    </tr>
				                     <tr>
				                        <td><input type="text"></td>                    
				                    </tr>
				                    <tr>
				                        <th>휴대폰 또는 이메일</th>                    
				                    </tr>
				                     <tr>
				                        <td>$</td>                    
				                    </tr>
				                    <tr>
				                        <th>생일</th>                    
				                    </tr>
				                     <tr>
				                        <td>
				                            <select name="my_year" id="">
				                                <option value="2017">2017</option>
				                                <option value="2016">2016</option>
				                                <option value="2015">2015</option>
				                                <option value="2014">2014</option>
				                                <option value="2013">2013</option>
				                                <option value="2012">2012</option>
				                                <option value="2011">2011</option>
				                                <option value="2010">2010</option>
				                                <option value="2009">2009</option>
				                                <option value="2008">2008</option>
				                                <option value="2007">2007</option>
				                                <option value="2006">2006</option>
				                                <option value="2005">2005</option>
				                                <option value="2004">2004</option>
				                                <option value="2003">2003</option>
				                                <option value="2002">2002</option>
				                                <option value="2001">2001</option>
				                                <option value="2000">2000</option>
				                                <option value="1999">1999</option>
				                                <option value="1998">1998</option>
				                                <option value="1997">1997</option>
				                                <option value="1996">1996</option>
				                                <option value="1995">1995</option>
				                                <option value="1994">1994</option>
				                                <option value="1993">1993</option>
				                                <option value="1992">1992</option>
				                                <option value="1991">1991</option>
				                                <option value="1990">1990</option>
				                                <option value="1989">1989</option>
				                                <option value="1988">1988</option>
				                                <option value="1987">1987</option>
				                                <option value="1986">1986</option>
				                                <option value="1985">1985</option>
				                                <option value="1984">1984</option>
				                                <option value="1983">1983</option>
				                                <option value="1982">1982</option>
				                                <option value="1981">1981</option>
				                            </select>
				                            <select name="my_month" id="">
				                                <option value="0">월</option>
				                                <option value="01">1월</option>
				                                <option value="02">2월</option>
				                                <option value="03">3월</option>
				                                <option value="04">4월</option>
				                                <option value="06">6월</option>
				                                <option value="07">7월</option>
				                                <option value="08">8월</option>
				                                <option value="09">9월</option>
				                                <option value="10">10월</option>
				                                <option value="11">11월</option>
				                                <option value="12">12월</option>
				                            </select>
				                            <select name="my_day" id="">
				                                <option value="0">일</option>
				                                <option value="01">1일</option>
				                                <option value="02">2일</option>
				                                <option value="03">3일</option>
				                                <option value="04">4일</option>
				                                <option value="05">5일</option>
				                                <option value="06">6일</option>
				                                <option value="07">7일</option>
				                                <option value="08">8일</option>
				                                <option value="09">9일</option>
				                                <option value="10">10일</option>
				                                <option value="11">11일</option>
				                                <option value="12">12일</option>
				                                <option value="13">13일</option>
				                                <option value="14">14일</option>
				                                <option value="15">15일</option>
				                                <option value="16">16일</option>
				                                <option value="17">17일</option>
				                                <option value="18">18일</option>
				                                <option value="19">19일</option>
				                                <option value="20">20일</option>
				                                <option value="21">21일</option>
				                                <option value="22">22일</option>
				                                <option value="23">23일</option>
				                                <option value="24">24일</option>
				                                <option value="25">25일</option>
				                                <option value="26">26일</option>
				                                <option value="27">27일</option>
				                                <option value="28">28일</option>
				                                <option value="29">29일</option>
				                                <option value="30">30일</option>
				                                <option value="31">31일</option>
				                            </select>
				                        </td>                    
				                    </tr>
				                    <tr>
				                        <th>성별</th>                    
				                    </tr>
				                     <tr>
				                        <td>
				                            <input type="radio" name="gender" value="1"><span>여성</span>
				                            <input type="radio" name="gender" value="2"><span>남성</span>
				                        </td>                    
				                    </tr>
				                    <tr>
				                        <th>등급</th>                    
				                    </tr>
				                     <tr>
				                        <td>$</td>                    
				                    </tr>
				                    <tr>
				                        <th>가입일자</th>                    
				                    </tr>
				                     <tr>
				                        <td>$</td>                    
				                    </tr>
				                </table>
				                <div>
				                    <div><input type="button" value="수정하기" onclick=""></div>	                   
				                </div>
				            </form>
				        </div>
				   </section>	               
	            </div>
	        </div>	   
	    </section>	
	<%@ include file="footer.jsp" %>
</body>
</html>
