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
	   				 
	   				 	<c:if test="${not empty msg}">
							<div class="alert alert-${css} alert-dismissible" role="alert">								
								<strong>${msg}</strong>
							</div>
						</c:if>
	   				 
		   				 
		   				 <div class="row">
		  					<spring:bind path="idObjeto">
			  					<div class="col-sm-4">
			  						<form:errors path="idObjeto" cssStyle="color: #ff0000;font-style: italic;font-weight: bold;" />
			  						<form:label path="idObjeto">Evento</form:label>
			  						<form:input path="idObjeto" cssClass="form-control"  />
			  						
			  					</div>
		  					</spring:bind>
		  					<spring:bind path="idEvento">
			  					<div class="col-sm-8">
			  						<form:errors path="idEvento" cssStyle="color: #ff0000;font-style: italic;font-weight: bold;" />
			  						<form:label path="idEvento">Código Evento</form:label>
			  						<form:input path="idEvento" cssClass="form-control"/>
			  									  						
			  					</div>
			  				</spring:bind>
						 </div>
		   				 
		   				    <!--  ver como fazer com a data
		   				 <div class="row">
							 
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="listaItemCategoria.id">Categoria</form:label>
							  		<form:select id="idItemCategoria" path="listaItemCategoria.id" cssClass="form-control">
							  			 <form:option value="NONE">Selecionar</form:option>
    									 <form:options items="${listaItemCategoria}" itemLabel="descricao" itemValue="id"/>
							  		</form:select>
							  </div>
							  
							  <div id="idListaItemSubCategoria" class="col-xs-6 col-sm-3">
							  		<form:label path="listaItemSubCategoria.id">Sub Categoria</form:label>
							  		<form:select id="idListaItemSubCategoria" path="listaItemSubCategoria.id" cssClass="form-control">
							  			 <form:option value="NONE">Selecionar</form:option>
    									 <form:options items="${listaItemSubCategoria}" itemLabel="descricao" itemValue="id"/>
							  		</form:select>
		  					  </div>
							 
						
							  <div class="clearfix visible-xs-block"></div>
							
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="nrValor">Valor</form:label>
		  							<form:input path="nrValor" cssClass="form-control"/>
							  		
							  		
							  </div>
							
							  <div class="col-sm-4 col-sm-2">
							  		<form:label path="dataLancamento">Data Lançamento</form:label>
							  		<form:input id="dataLancamento" type="text" path="dataLancamento"  cssClass="form-control"/>
							  </div>
								
						</div>
	   				 	
	   				 	<div class="row">
							  <div class="col-xs-6 col-sm-3">
								  	<form:label path="idStatus">Status</form:label>
								  	<form:select path="idStatus" cssClass="form-control" >
								  			 <form:option value="NONE">Selecionar</form:option>
	    									 <form:option label="Ativo" value="1"/>
	    									 <form:option label="Inativo" value="2"/>
								  	</form:select>
							  </div>
							  
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="idCreditoDebito">Crédito/Débito</form:label>
								  	<form:select path="idCreditoDebito" cssClass="form-control" >
								  			 <form:option value="NONE">Selecionar</form:option>
	    									 <form:option label="Crédito" value="1"/>
	    									 <form:option label="Débito" value="2"/>
								  	</form:select>
							  
							  </div>
							  
							  <div class="col-xs-6 col-sm-3">
							  		
							  		<form:label path="comentario">Crédito/Débito</form:label>
							  		<form:textarea path="comentario" cols="12" rows="5" cssClass="form-control"/>
							  
							  </div>
							  
						</div>
	   				 -->
	   				 	<div class="row">
	   				 		<div class="col">
	   				 			<div class="table-responsive">
		   				 			
		   				 		
		   				 			<table id="tableReceitasEdespesas" class="display" cellspacing="0" width="100%" style="overflow-x:auto">
										<thead>
											<tr>
												<th>Evento</th>
									        	<th>Cód Evento</th>
											</tr>
										</thead>
									</table>
		   				 		
		   				 			
	   				 			</div>
	   				 		</div>
	   				 	
	   				 	</div>
	   					
	   				 	<button type="submit" name="salvar"  class="btn btn-success">Salvar</button>
	   				 
					</div>
	   			</div>
				
			
		</form:form>
		<script type="text/javascript">
			
			var dados = eval('${listaReceitaDespesa}');
			var $j = jQuery.noConflict();
			
			
			var editor = new $j.fn.dataTable.Editor( {
					ajax:{
					  type : "POST",
					  data: function ( d ) {
						  $j('.DTED_Lightbox_Wrapper').hide();
						  $j('.DTED_Lightbox_Background').hide();
						  
						  var teste = "json="+JSON.stringify( d );
						  return teste;
					  },
					  url: "./editorReceitaDespesa",
					},
			        table: "#tableReceitasEdespesas",
			        idSrc:  'id',
			        fields: [ 
			        		{label: "Id:",name: "id", type: "hidden"},			        	
			        		{label: "Evento:",name: "idObjeto" }, 
			        		{label: "Cód Evento:",name: "idEvento"}
			        		]
		    });
		
			var table = $j('#tableReceitasEdespesas').DataTable( {

				dom: "Bfrtip",
		        order: [[ 1, 'asc' ]],
			
				"aaData": dados,		  
				"aoColumns": [
				    { "mData": "idObjeto"},
				    { "mData": "idEvento"}
				 ],
				
				 columns: [
			            {
			                data: null,
			                defaultContent: '',
			                className: 'select-checkbox',
			                orderable: false
			            },
			            { data: "idObjeto" },
			            { data: "idEvento" }			        
			      ],
				 
				 select: {
			            style:    'os',
			            selector: 'td'
			     },
			     buttons: [
			            { extend: "edit",   editor: editor, text: "Editar"},
			            { extend: "remove", editor: editor, text: "Excluir" }
			     ]
			});
			
			editor.on('edit', function ( e, json, data ) {
				  $j('.DTED_Lightbox_Wrapper').show();
				  $j('.DTED_Lightbox_Background').show();
			} );
			
			/* testar amanha
			
			,action: function ( e, dt, node, config ) {
		                    alert( 'Activated!' );
		                    $j('.DTED_Lightbox_Wrapper').show();
		  				  $j('.DTED_Lightbox_Background').show(); // disable button
		                } 
			
			
			*/
			
			
			


		</script>
</t:template>