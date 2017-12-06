$(document).ready(function() {
	
	$(".admin_board_inner nav ul li").click(function() {
		
		var targerIndex = $(this).index();
		
		$(".board_tab").css("display","none");
		$(this).parents(".admin_board_inner").children(".board_tab").eq(targerIndex).css("display","block");
		
	}).eq(0).trigger("click");
	
});