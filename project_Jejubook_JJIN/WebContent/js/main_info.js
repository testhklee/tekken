$(document).ready(function() {
	
	$(".placeholder").click(function() {
		$(this).parent().find("input").focus();
	});

	$(".input_form").keyup(function() {
		$(this).parent().find(".placeholder").css("display","none");
		
		if($(this).find("input").val()) {
			$(this).find("input").css("border","2px solid #779ddd");
		}
		
	});
	
	$(".input_form input").focusout(function() {
		if($(this).val()) {
			$(this).css("border","2px solid #779ddd");
		}else {
			$(this).css("border","2px solid red");		
			$(this).parent().parent().find(".placeholder").css("display","block");
		}

	});
	
	$(".join_form").submit(function() {
		
		var emailCheck = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var phoneCheck = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		var pw = $(".input_form:eq(3)").children().val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);		
		
		if(!$(".input_form:eq(0)").children().val() || !$(".input_form:eq(1)").children().val() || !$(".input_form:eq(2)").children().val() || !$(".input_form:eq(3)").children().val()) {
			alert("빈칸을 입력해주세요")
			return false;
		}else if($("input[name=gender]:checked").length == 0) {
			alert("성별을 선택해주세요")
			return false;
		}else {
			if(!emailCheck.test($(".input_form:eq(2)").children().val()) && !phoneCheck.test($(".input_form:eq(2)").children().val())) {
				alert("휴대폰 또는 이메일이 올바른 형식이 아닙니다");
				return false;
			}
			
			if($(".input_form:eq(3)").children().val().length < 8 || $(".input_form:eq(3)").children().val().length > 20) {
				alert("비밀번호를 8자 이상 20자 이하를 입력해주세요");
				return false;
			}else {
				if(num < 0 || eng < 0 || spe < 0 ){
					  alert("비밀번호를 영문,숫자,특수문자를 혼합하여 입력해주세요");
					  return false;
				}
			}
		}
		
	});
	
	function checkDate() {
		var checkDate = new Date();
		var tagetYear = document.getElementsByClassName("year")[0].getElementsByTagName("option");
		var tagetMonth = document.getElementsByClassName("month")[0].getElementsByTagName("option");
		var tagetDay = document.getElementsByClassName("day")[0].getElementsByTagName("option");
		
		for(var k = 0; k < tagetYear.length; k++) {
			if(checkDate.getFullYear()-19 == tagetYear[k].value) {
				tagetYear[k].selected = 1;
			}
		}
		
		for(var i = 0; i < tagetMonth.length; i++) {
			if(checkDate.getMonth() == i) {
				tagetMonth[i].selected = 1;
			}
		}
		
		for(var j = 0; j < tagetDay.length; j++) {
			if(checkDate.getDate() == j) {
				tagetDay[j].selected = 1;
			}
		}
		
	}
	checkDate();
	
	
});