<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<spring:url value="/resources/js/jquery-2.2.4.min.js" var="jqueryJS" />	
	<script src="${jqueryJS}"></script>
	
	<spring:url value="/resources/js/jquery-ui.js" var="jqueryUIJS" />	
	<script src="${jqueryUIJS}" > </script>
		
	
	<spring:url value="/resources/js/jquery.dataTables.min.js" var="datatable" />
	<script src="${datatable}" ></script>
	
	<spring:url value="/resources/js/dataTables.buttons.min.js" var="datatableButtons" />
	<script src="${datatableButtons}" ></script>
	
	<spring:url value="/resources/editor/js/dataTables.editor.min.js" var="datatableEditors" />
	<script src="${datatableEditors}" ></script>
	
	<spring:url value="/resources/js/dataTables.select.min.js" var="datatableSelect" />
	<script src="${datatableSelect}" ></script>
		
		
	
	<spring:url value="/resources/editor/css/dataTables.editor.css" var="jquerydataTablesEditor" />
	<link href="${jquerydataTablesEditor}" rel="stylesheet" />
		
	
	
	<spring:url value="/resources/css/jquery.dataTables.css" var="jquerydataTables" />
	<link href="${jquerydataTables}" rel="stylesheet" />
	
	<spring:url value="/resources/css/jquery.dataTables.min.css" var="jquerydataTablesMin" />
	<link href="${jquerydataTablesMin}" rel="stylesheet" />
	
	<spring:url value="/resources/css/buttons.dataTables.min.css" var="jqueryButtonDataTablesMin" />
	<link href="${jqueryButtonDataTablesMin}" rel="stylesheet" />
	
	<spring:url value="/resources/css/select.dataTables.min.css" var="jquerySelectDataTablesMin" />
	<link href="${jquerySelectDataTablesMin}" rel="stylesheet" />
	
	 
	<spring:url value="/resources/editor/css/editor.dataTables.css" var="jqueryEditorDataTablesMin" />
	<link href="${jqueryEditorDataTablesMin}" rel="stylesheet" />
	
	
	<spring:url value="/resources/css/common.css" var="common" />
	<link href="${common}" rel="stylesheet" />
	
	<spring:url value="/resources/js/receitasdespesas.js" var="receitasdespesasJS" />
	<script src="${receitasdespesasJS}"></script>
	
	
	<spring:url value="/resources/bootstrap/js/bootstrap.min.js" var="bootsJS" />		
	<script src="${bootsJS}">	
	</script>	
	
	
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />

	
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
					
					
					<li class="nav-item">
        				<a class="nav-link" href="inicioReceitasDespesasControlador">Despesas e Receitas</a>
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

		<jsp:doBody />
			
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
