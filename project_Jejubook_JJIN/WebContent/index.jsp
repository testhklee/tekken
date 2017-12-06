<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>jejubook</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main_info.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/main_info.js"></script>
</head>
<body>
	<header>
		<div id="header_inner" class="clearfix">
			<div class="main_logo"><a href="index.jsp"><img src="img/main_logo.png" alt="메인로고"></a></div>
			<div class="login">
				<form action="Controller.go" method="post">
					<input type="hidden" name="command" value="login">
					<table>
						<tbody>
							<tr>
								<td>이메일 또는 휴대폰</td>
								<td>비밀번호</td>
							</tr>
							<tr>
								<td><input type="text" name="id" autocomplete=off></td>
								<td><input type="password" name="mypassword" autocomplete=off></td>
								<td><input type="submit" value="로그인"></td>
							</tr>							
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</header>
	<section>
		<div id="box_inner" class="clearfix">
			<div class="content_01">
				<p>Jejubook에서 국내에 있는 친구, 가족, 지인들과<br>함께 이야기를 나눠보세요.</p>
				<img src="img/jeju_map.png" alt="">
			</div>
			<div class="content_02">
				<div class="join_txt">
					<p>가입하기</p>
					<p>오늘은 무료로 즐기실 수 있습니다.</p>
				</div>
				<div class="user_form">
					<form action="Controller.go" method="post" class="join_form">
						<input type="hidden" name="command" value="joinform">
						<div class="st clearfix">
							<div class="new_name">
								<div class="placeholder">성(姓)</div>
								<div class="input_form"><input type="text" name="lastName" autocomplete=off></div>
							</div>
							<div class="new_name">
								<div class="placeholder">이름(성은 제외)</div>
								<div class="input_form"><input type="text" name="firstName" autocomplete=off></div>
							</div>
						</div>
						<div class="st">
							<div class="placeholder">휴대폰 번호 또는 이메일</div>
							<div class="input_form"><input type="text" name="emailorphone" autocomplete=off></div>
						</div>
						<div class="st">
							<div class="placeholder">새 비밀번호</div>
							<div class="input_form"><input type="password" name="password" autocomplete=off></div>
						</div>
						<div class="my_birth">
							<h1>생일</h1>
							<div class="user_sel clearfix">
								<div class="year">
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
								</div>
								<div class="month">
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
								</div>
								<div class="day">
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
								</div>
							</div>
						</div>
						<div class="gender">
							<input type="radio" name="gender" value="1"><span>여성</span>
							<input type="radio" name="gender" value="2"><span>남성</span>
						</div>
						<div class="join_submit">
							<button type="submit" name="joinSubmit">계정 만들기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<address>
			<div>Jejubook ⓒ 2017</div>
		</address>
	</footer>
</body>
</html>