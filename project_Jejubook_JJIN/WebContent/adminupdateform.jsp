<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="board_tab">
        <h1>회원정보 수정</h1>
        <form action="Controller.go" method="post">
        <input type="hidden" name="command" value="adUserUpdate">
	        <table border="1">
	        	<tfoot>
	        		<tr>
	        			<td colspan="6">
	        				<input type="submit" value="수정">
	        				<input type="button" onclick="location.href='Controller.go?command=deleteOne&id=${dto.emailorphone}'" value="삭제">
	        			</td>
	        		</tr>
	        	</tfoot>
	        	<thead>
	            	<tr>
	                	<th>이름</th>
	                    <th>이메일 또는 휴대폰 번호</th>
	                    <th>생일</th>
	                    <th>성별</th>
	                    <th>회원,비회원 여부</th>
	                    <th>등급</th>                    
	                </tr>
	            </thead>
	            <tbody>
					<tr>
						<td>${dto.name }</td>
						<td><input type="text" name="id" value=${dto.emailorphone} readonly="readonly"></td>
						<td><input type="date" name="birth" value=${dto.birth }></td>
						<td>
							<select name="gender">
								<option value="1">여</option>
								<option value="2">남</option>								
							</select>
						</td>
						<td>
							<select name="enabled">
								<option value="Y">회원</option>
								<option value="N">비회원</option>								
							</select>
						</td>
						<td>
							<select name="role">
								<option value="admin">관리자</option>
								<option value="member">회원</option>								
							</select>
						</td>					
					</tr>
	            </tbody>	            
	        </table>
        </form>
    </div>
</body>
</html>