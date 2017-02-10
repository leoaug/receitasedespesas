<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:template>
    
	    <form:form action="processForm.html" method="POST">
				
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
							  		<form:select path="listaItemCategoria" cssClass="form-control" >
							  			 <form:option value="NONE">Selecionar</form:option>
    									 <form:options items="${listaItemCategoria}"></form:options>
							  		</form:select>
							  </div>
							  <div class="col-xs-6 col-sm-3">
							  		<form:label path="listaItemCategoria">Sub Categoria</form:label>
							  		<form:select path="listaItemCategoria" cssClass="form-control" >
							  			 <form:option value="NONE">Selecionar</form:option>
    									 <form:options items="${listaItemCategoria}"></form:options>
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
	   				 
	   				 	
	   				 	<input type="submit" name="salvar" value="Salvar" class="btn btn-success"/>
	     				<input type="button" id="botaoajax" value="Ajax"/>
	     			
	
						<div id="result1" />
	
					</div>
	   			</div>
				
			
		</form:form>

</t:template>