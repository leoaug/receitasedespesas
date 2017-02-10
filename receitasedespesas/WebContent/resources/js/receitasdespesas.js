//var $j = jQuery.noConflict();
$(document).ready(function(){
	$('#botaoajax').click(function(){
		$.ajax({
			type : 'GET' ,
			url : './demo1.html',
			success : function (result){
				$('#result1').html(result);
			}
		});
	});	
	
	$("#dataLancamento").datepicker();
});

