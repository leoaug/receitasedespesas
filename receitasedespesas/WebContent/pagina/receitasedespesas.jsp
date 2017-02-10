<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template>
    
	    <form:form action="salvarReceitaDespesa" method="POST" commandName="receitaDespesa">
				
				<div class="panel panel-default">
	   				 <div class="panel-heading">Receitas e Despesas</div>
	   				 <div class="panel-body">
	   				 
		   				 
		   				 <div class="row">
		  					<div class="col-sm-4">
		  						<form:label path="idObjeto">Evento</form:label>
		  						<form:input path="idObjeto" cssClass="form-control"/>
		  					</div>
		  					<div class="col-sm-8">
		  						<form:label path="idEvento">Código Evento</form:label>
		  						<form:input path="idEvento" cssClass="form-control"/>
		  					</div>
						 </div>
		   				 
		   				 <div class="row">
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="listaItemCategoria">Categoria</form:label>
							  		<form:select id="idItemCategoria" path="listaItemCategoria" cssClass="form-control" >
							  			 <form:option value="NONE">Selecionar</form:option>
    									 <form:options items="${listaItemCategoria}"/>
							  		</form:select>
							  </div>
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="listaItemSubCategoria">Sub Categoria</form:label>
							  		<form:select path="listaItemSubCategoria" cssClass="form-control" >
							  			 <form:option value="NONE">Selecionar</form:option>
    									 <form:options items="${listaItemSubCategoria}"/>
							  		</form:select>
		  					  </div>
							
							  <!-- Add the extra clearfix for only the required viewport -->
							  <div class="clearfix visible-xs-block"></div>
							
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="nrValor">Valor</form:label>
		  							<form:input path="nrValor" cssClass="form-control"/>
							  		
							  		
							  </div>
							  <div class="col-sm-3 col-sm-1">
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
	   				 
	   				 	<div class="row">
	   				 		<div class="col">
	   				 			<div class="table-responsive">
		   				 			<table class="table table-striped table-hover">
									    <thead>
									      <tr>
									        <th>Firstname</th>
									        <th>Lastname</th>
									        <th>Email</th>
									      </tr>
									    </thead>
									    <tbody>
									      <tr>
									        <td>John</td>
									        <td>Doe</td>
									        <td>john@example.com</td>
									      </tr>
									      <tr>
									        <td>Mary</td>
									        <td>Moe</td>
									        <td>mary@example.com</td>
									      </tr>
									      <tr>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									    </tbody>
									</table>
	   				 			</div>
	   				 		</div>
	   				 	
	   				 	</div>
	   				 
	   				 	
	   				 	<input type="submit" name="salvar" value="Salvar" class="btn btn-success"/>
	     				<input type="button" id="botaoajax" value="Ajax"/>
	     			
	
						<div id="result1" />
	
					</div>
	   			</div>
				
			
		</form:form>

</t:template>