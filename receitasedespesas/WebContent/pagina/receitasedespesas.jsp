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
		   				 
	   				 
	   				 	
	   				 	<input type="submit" name="salvar" value="Salvar" class="btn btn-success"/>
	     				<input type="button" id="botaoajax" value="Ajax"/>
	     			
	
						<div id="result1" />
	
					</div>
	   			</div>
				
			
		</form:form>

</t:template>