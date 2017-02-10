//var $j = jQuery.noConflict();
jQuery.noConflict()(function($){
	$('#botaoajax').click(function(){
		$.ajax({
			type : 'GET' ,
			url : './demo1.html',
			success : function (result){
				$('#result1').html(result);
			}
		});
	});	
	
	$('#idItemCategoria').change(function(){
		$.ajax({
			type : 'GET' ,
			url : './listarSubCategoria.html',
			data: { idLista: this.value }
		});
			
	});
	
	$("#dataLancamento").datepicker();
});

