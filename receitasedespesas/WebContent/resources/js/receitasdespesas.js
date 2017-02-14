var $j = jQuery.noConflict();
jQuery.noConflict()(function($){
	/*
	$j('#botaoajax').click(function(){
		$j.ajax({
			type : 'GET' ,
			url : './demo1.html',
			success : function (result){
				$j('#result1').html(result);
			}
		});
	});	
	*/
	$j('#idItemCategoria').change(function(){
		$j.ajax({
			type : 'GET' ,
			url : './listarSubCategoria.html',
			data: { idLista: this.value },
			success : function (result){
				$j('#idListaItemSubCategoria').html(result);
			}
		});
			
	});
	
	$j("#dataLancamento").datepicker();

});

