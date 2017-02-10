<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	
	
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
	
	
	<spring:url value="/resources/js/jquery.js" var="jqueryJS" />	
	<script type="text/javascript">
		if (typeof jQuery == 'undefined') {
		    var script = document.createElement('script');
		    script.type = "text/javascript";
		    script.src = "${jqueryJS}";
		    document.getElementsByTagName('head')[0].appendChild(script);
		}
	</script>
	
	<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootsJS" />		
	<script type="text/javascript">
		if (typeof jQuery == 'undefined') {
		    var script = document.createElement('script');
		    script.type = "text/javascript";
		    script.src = "${bootsJS}";
		    document.getElementsByTagName('head')[0].appendChild(script);
		}
	</script>	
	
	<spring:url value="/resources/js/receitasdespesas.js" var="receitasdespesasJS" />		
	<script type="text/javascript">
		if (typeof jQuery == 'undefined') {
		    var script = document.createElement('script');
		    script.type = "text/javascript";
		    script.src = "${receitasdespesasJS}";
		    document.getElementsByTagName('head')[0].appendChild(script);
		}
	</script>
	
	
	
	
	<title>Página Principal</title>
</head>


<body>
	
	
	<nav id="mainNav" class="navbar navbar-default navbar-static-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
				</button>
				
				<a href="#" style="font-size: 16px !important; font-weight: bolder !important;" class="navbar-brand" >Despesas e Receita </a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
								Administrativo 
								<span class="caret"></span>
							</a>						
						</li>
									
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								Clientes 
								<span class="caret"></span>
							</a>								
						</li>
				
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								Oportunidades
								<span class="caret"></span>
							</a>							
						</li>
				
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								Contratos
								<span class="caret"></span>
							</a>						
						</li>
					
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								Operacional
								<span class="caret"></span>
							</a>						
						</li>
					
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								Estoque
								<span class="caret"></span>
							</a>						
						</li>
					
					<li>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							Financeiro
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="inicioReceitasDespesasControlador.html">Despesas e Receitas</a>
							</li>
						</ul>	
				   </li>
					
					
				</ul>

		

				<ul class="nav navbar-nav navbar-right">
			
					<li>
					 	logout
					</li>

				</ul>
			</div>
			
		</div>
		
	</nav>


	<!-- Começo do body -->
	<div class="container-fluid">

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
		
	</div>

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<p class="text-muted logo" style="font-weight: bolder !important;">
					<span style="float:left !important">
						 :: Receita e Despesas :: 
					</span>
					
					</p>
				</div>
			</div>
	
		</div>
	</footer>
	
	
	
</body>


</html>