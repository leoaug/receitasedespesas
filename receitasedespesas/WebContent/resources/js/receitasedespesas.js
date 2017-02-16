var $j = jQuery.noConflict();
jQuery.noConflict()(function($){
	
	$j("#dataLancamento").mask("99/99/9999");
	
	 $(".idEvento").numeric();
	
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
	
	
	$j("#dataLancamento" ).datepicker({
         
		 monthNames: [
	            'Janeiro',
	            'Fevereiro',
	            'Março',
	            'Abril',
	            'Maio',
	            'Junho',
	            'Julho',
	            'Agostp',
	            'Setembro',
	            'Outubro',
	            'Novembro',
	            'Dezembro'
	        ],
	        monthNamesShort: [
	            'Jan',
	            'Fev',
	            'Mar',
	            'Abr',
	            'Mai',
	            'Jun',
	            'Jul',
	            'Ago',
	            'Set',
	            'Out',
	            'Nov',
	            'Dez'
	        ],
	        dayNames: [
	            'Domingo',
	            'Segunda',
	            'Terça',
	            'Quarta',
	            'Quinta',
	            'Sexta',
	            'Sábado'
	        ],
	        dayNamesShort: [
	            'Dom',
	            'Seg',
	            'Ter',
	            'Qua',
	            'Qui',
	            'Sex',
	            'Sab'
	        ],
	        dayNamesMin: [
	            'Do',
	            'Se',
	            'Te',
	            'Qu',
	            'Qu',
	            'Se',
	            'Sa'
	        ],
	        dateFormat: 'dd/mm/yy', 
	        firstDay: 0,
	        renderer: $.datepicker.defaultRenderer,
	        prevText: 'Anterior', 
	        prevStatus: 'Show the previous month',
	        prevJumpText: '&#x3c;&#x3c;', 
	        prevJumpStatus: 'Show the previous year',
	        nextText: 'Próximo', 
	        nextStatus: 'Mostrar o próx mês',
	        nextJumpText: '&#x3e;&#x3e;', 
	        nextJumpStatus: 'Show the next year',
	        currentText: 'Current',
	        currentStatus: 'Show the current month',
	        todayText: 'Today',
	        todayStatus: 'Show today\'s month',
	        clearText: 'Clear',
	        clearStatus: 'Erase the current date',
	        closeText: 'Done',
	        closeStatus: 'Close without change',
	        yearStatus: 'Show a different year',
	        monthStatus: 'Show a different month',
	        weekText: 'Wk',
	        weekStatus: 'Week of the year',
	        dayStatus: 'Select DD, M d',
	        defaultStatus: 'Selecione a data',
	        isRTL: false,
		 
		 
		 showOn: "both",
         lang: 'pt-BR',
         timezone: "-0200",
         buttonImage: "./resources/images/calendar.gif",
         buttonImageOnly: true
     });
	$j.datepicker.setDefaults($.datepicker.regional['pt-BR']);
	

	$j("input.dinheiro").maskMoney({showSymbol:true, symbol:"R$", decimal:",", thousands:"."});
	 
	
	 
	$j('#dataLancamento').blur(function(){
		
		var regExp = /^\d{2}\/\d{2}\/\d{4}$/;

		var date = $('#dataLancamento')[0]; 
		
		if(date.value != ""){
			if(!regExp.test(date)) {
				alert('Data inválida');
				$("#dataLancamento").val("");
			}
		}
	});
	
});




