<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template>
    
    
	    <form:form action="processForm.html" method="post" commandName="receitaDespesa">
				
				<div class="panel panel-default">
	   				 <div class="panel-heading">Receitas e Despesas</div>
	   				 <div class="panel-body">
	   				 
	   				 	<c:if test="${not empty msgSucesso}">							
							<div class="alert alert-success">
  								<strong>Successo</strong> ${msgSucesso}
							</div>							
						</c:if>
	   					
	   					<c:if test="${not empty msgAviso}">
		   				 	<div class="alert alert-warning">
	  							<strong>Aviso!</strong> ${msgAviso}
							</div>
	   				 	</c:if>
	   				 	
	   				 	<c:if test="${not empty msgErro}">
		   				 	<div class="alert alert-danger">
	  							<strong>Erro</strong> ${msgErro}
							</div>
	   				 	</c:if>
		   				 
		   				 <div class="row">
		  					<spring:bind path="descricaoEvento">
			  					<div class="col-sm-2">
			  						<form:errors path="descricaoEvento" cssStyle="color: #ff0000;font-style: italic;font-weight: bold;" />
			  						<form:label path="descricaoEvento">Evento *</form:label>
			  						<form:input path="descricaoEvento" cssClass="form-control"  />
			  						
			  					</div>
		  					</spring:bind>
		  					<spring:bind path="idEvento">
			  					<div class="col-sm-2">
			  						<form:errors path="idEvento" cssStyle="color: #ff0000;font-style: italic;font-weight: bold;" />
			  						<form:label path="idEvento">Código Evento *</form:label>
			  						<form:input path="idEvento" cssClass="form-control"/>
			  									  						
			  					</div>
			  				</spring:bind>
						 </div>
		   				
		   				 <div class="row">
							 
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="listaItemCategoria.id">Categoria *</form:label>
							  		<form:select id="idItemCategoria" path="listaItemCategoria.id" cssClass="form-control">
							  			 <form:option label="NONE" value="0">Selecionar</form:option>
    									 <form:options items="${listaItemCategoria}" itemLabel="descricao" itemValue="id"/>
							  		</form:select>
							  </div>
							  
							  <div id="idListaItemSubCategoria" class="col-xs-6 col-sm-3">
							  		<form:label path="listaItemSubCategoria.id">Sub Categoria *</form:label>
							  		<form:select id="idListaItemSubCategoria" path="listaItemSubCategoria.id" cssClass="form-control">
							  			 <form:option label="NONE" value="0">Selecionar</form:option>
    									 <form:options items="${listaItemSubCategoria}" itemLabel="descricao" itemValue="id"/>
							  		</form:select>
		  					  </div>
							 
						
							  <div class="clearfix visible-xs-block"></div>
							
							  <div class="col-xs-2 col-sm-2">
							  		<form:label path="nrValor">Valor</form:label>
		  							<form:input path="nrValor" cssClass="form-control dinheiro"/>
							  		
							  		
							  </div>
							
							  <div class="col-sm-6 col-sm-4">
							  		<form:label path="dataLancamentoString">Data Lançamento</form:label>
							  		<form:input id="dataLancamento" type="text" path="dataLancamentoString" cssStyle="width: 25%"  cssClass="form-control"/>
							  </div>
								
						</div>
	   				 	
	   				 	<div class="row">
							  <div class="col-xs-6 col-sm-3">
								  	<form:label path="idStatus">Status *</form:label>
								  	<form:select path="idStatus" cssClass="form-control" >
								  			 <form:option label="NONE" value="0">Selecionar</form:option>
	    									 <form:option label="Ativo" value="1"/>
	    									 <form:option label="Inativo" value="2"/>
								  	</form:select>
							  </div>
							  
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="idCreditoDebito">Crédito/Débito *</form:label>
								  	<form:select path="idCreditoDebito" cssClass="form-control" >
								  			 <form:option label="NONE" value="0">Selecionar</form:option>
	    									 <form:option label="Crédito" value="1"/>
	    									 <form:option label="Débito" value="2"/>
								  	</form:select>
							  
							  </div>
							  
							  <div class="col-xs-6 col-sm-3">
							  		
							  		<form:label path="comentario">Comentário *</form:label>
							  		<form:textarea path="comentario" cols="12" rows="5" cssClass="form-control"/>
							  
							  </div>
							  
						</div>
						
						<div class="row">
							 <div class="col-xs-6 col-sm-3">
								<button type="submit" name="salvar"  class="btn btn-success">Salvar</button>
								<button type="submit" name="novo"  class="btn btn-success">Novo</button>
							</div>
						</div>
						<br/><br/>
	   				
	   				 	<div class="row">
	   				 		<div class="col">
	   				 			<div class="table-responsive">
		   				 			
		   				 		
		   				 			<table id="tableReceitasEdespesas" class="display" cellspacing="0" width="100%" style="overflow-x:auto">
										<thead>
											<tr>
												<th>Evento</th>
									        	<th>Cód Evento</th>
									        	<th>Categoria</th>
									        	<th>Sub Categoria</th>
									        	<th>Valor</th>
									        	<th>Data Lançamento</th>
									        	<th>Status</th>
												<th>Crédito/Débito</th>	
												<th>Comentário</th>
											</tr>
										</thead>
									</table>
		   				 		
		   				 			
	   				 			</div>
	   				 		</div>
	   				 	
	   				 	</div>
	   					
	   				 	
	   				 
					</div>
	   			</div>
				
			
		</form:form>
		<script type="text/javascript">
			
			var dados = eval('${listaReceitaDespesa}');
			var $j = jQuery.noConflict();
			
			var listaItemCategoria = eval('${listaItemCategoriaJson}');
			
			var editor = new $j.fn.dataTable.Editor( {
					ajax:{
					  type : "POST",			
					  contentType: "application/json",
					  dataType: "json",
					  
					  data: function ( d ) {							
						  var str = JSON.stringify( d );
						 
						  var action = "," + str.substring(str.indexOf("action") - 1,str.indexOf("data") - 2);	 
						  var jsonObject = str.substring(str.indexOf("{\"id\":"),str.length - 2);	
						  var slice1 = jsonObject.slice(0,jsonObject.length - 1);							  
						  var slice2 = jsonObject.slice(jsonObject.length - 1,jsonObject.length);		
						  var finalRsult = slice1 + action + slice2;
						  
						
						  
						  var pagina = str.substring(str.indexOf("action") + 9,str.indexOf("data") - 3);	
								
						
						  if(pagina == "edit"){
						  
						
						  	return finalRsult;
						  } else {
							 
							
							  var index2 = str.indexOf("\":{\"@");
							  var jsonObject2 = str.substring(28,index2);	
							  
							  //alert(str);
							  alert("{id:"+jsonObject2+ "}");
							  
							  return "{id:"+jsonObject2+ "}";
							
							  /*  
							  finalRsult = finalRsult.replaceAll("\"handler\":{},\"hibernateLazyInitializer\":{}},\"", ""); 
							  */
							
						  }
					  },
					  
					  url: "./editarOuExcluirReceitaDespesa"					  
					},
			        table: "#tableReceitasEdespesas",
			        idSrc:  'id',
			        fields: [ 
				        		{label: "Id:",name: "id", type: "hidden"},			        	
				        		{label: "Evento:",name: "descricaoEvento" }, 
				        		{label: "Cód Evento:",name: "idEvento" },
				        		{label: "Categoria:",name: "listaItemCategoria.id", type:"select", options:listaItemCategoria, id:"idItemCategoriaEditar"},
				        		{label: "Sub Categoria:",name: "listaItemSubCategoria.id", type:"select", options:listaItemCategoria},
				        		{label: "Valor:",name: "nrValor"},
				        		{label: "Data Lançamento:",name: "dataLancamentoString", type: "date", dateFormat: "dd/mm/yy"},
				        		{label: "Status:",name: "idStatus", type:"select", options: [{ label: "Ativo", value: "1" },{ label: "Inativo", value: "2" }]},
				        		{label: "Crédito/Débito:",name: "idCreditoDebito",type:"select" ,options: [{ label: "Crédito", value: "1" },{ label: "Débito", value: "2" }]},
				        		{label: "Comentário:",name: "comentario", type :"textarea"}
						
			        		]
		    });
		
			var table = $j('#tableReceitasEdespesas').DataTable( {

				dom: "Bfrtip",
		        order: [[ 1, 'asc' ]],
			
				"aaData": dados,		  
				"aoColumns": [
				    { "mData": "descricaoEvento"},
				    { "mData": "idEvento"},
				    { "mData": "listaItemCategoria.descricao"},
	        		{ "mData": "listaItemSubCategoria.descricao"},
	        		{ "mData": "nrValor"},
	        		{ "mData": "dataLancamentoString"},
	        		{ "mData": "idStatus",
	        			render: function ( data, type, row ) {
			        		
		        			if(data == 1){
		        				return "Ativo";
		        			} else {
		        				return "Inativo";
		        			}
	        			
	        			}
	        		},
	        		{ "mData": "idCreditoDebito" ,
						render: function ( data, type, row ) {
			        		
		        			if(data == 1){
		        				return "Crédito";
		        			} else {
		        				return "Débito";
		        			}
	        			
	        			}
		        	},
	        		{ "mData": "comentario"}
				 ],
				
				 columns: [
			           
			            { data: "descricaoEvento" },
			            { data: "idEvento" },
			            { data: "listaItemCategoria.descricao"},
		        		{ data: "listaItemSubCategoria.descricao"},
		        		{ data: "nrValor"},
		        		{ data: "dataLancamentoString"},
		        		{ data: "idStatus" 
		        		},
		        		
		        		{ data: "idCreditoDebito"},
		        		{ data: "comentario"}			        
			      ],
				 
				 select: {
			            style:    'os',
			            selector: 'td'
			     },
			     buttons: [
			            { extend: "edit",   editor: editor, text: "Editar"},				          
			            { extend: "remove", editor: editor, text: "Excluir"}

			           	]
			});

			
			$j('#idItemCategoriaEditar').change(function(){
				$j.ajax({
					type : 'GET' ,
					url : './listarSubCategoria.html',
					data: { idLista: this.value },
					success : function (result){
						$j('#idListaItemSubCategoria').html(result);
					}
				});
					
			});

			/*
			function carregarListaItemCategoria(){

				 $j.ajax({
	                  type: "POST",
	                  url: "./carregarListaItemCategoria",
	                  contentType: "application/json",
	                  data: function ( d ) {
							return JSON.stringify(d);
		              },
	                  dataType: "json"
	             });

			}
	*/
			
			/* funcionando
			
			@RequestMapping(value = "/editorReceitaDespesa" , method = RequestMethod.POST)
			@ResponseBody
			public ModelAndView  editorReceitaDespesa(@RequestBody ReceitaDespesa receitaDespesa){		
				
		
				try {
					System.out.println(receitaDespesa);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return new ModelAndView("receitasedespesas","receitaDespesa",new ReceitaDespesa()); 
			}
			
			 action: function ( e, dt, node, config ) {

				        	  $j.ajax({
				                  type: "POST",
				                  url: "./editorReceitaDespesa",
				                  contentType: "application/json",
				                  data: JSON.stringify( dt.row( { selected: true } ).data() ),
				                  dataType: "json"
				              });	


				        	  
			 } 
			
		

			class do botao Editar
			<a class="dt-button buttons-selected buttons-edit" tabindex="0" aria-controls="tableReceitasEdespesas" href="#">
			<span>Editar</span>
			</a>

			class do botao updae
			<button class="btn" tabindex="0">Update</button>
			
			*/
			
			
			


		</script>
</t:template>