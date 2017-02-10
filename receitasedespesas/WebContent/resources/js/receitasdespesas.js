var $j = jQuery.noConflict();
$j(document).ready(function(){
	$j('#botaoajax').click(function(){
		$j.ajax({
			type : 'GET' ,
			url : './demo1.html',
			success : function (result){
				$j('#result1').html(result);
			}
		});
	});	
});