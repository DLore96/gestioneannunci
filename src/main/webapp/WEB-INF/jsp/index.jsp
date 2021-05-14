<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="it">
  <head>
    
    <jsp:include page="./header.jsp" />
    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    	body {
		  padding-top: 3.5rem;
		}	
    </style>
    
    <title>EBAY</title>
  </head>
  <body>
  
	<jsp:include page="./navbar.jsp" />
  
  
	<main role="main">

	  <!-- Main jumbotron for a primary marketing message or call to action -->
	  <div class="jumbotron" >
	    <div class="container">
	      <h1 class="display-3">Benvenuto su EBAY!</h1>

			<%--<form:form method="post" modelAttribute="show_annunci_attribute" action="showAnnunci" novalidate="novalidate">
				<div class="form-group col-md-12">

					<label for="contribuenteSearchInput">Contribuente:</label>
					<spring:bind path="annunci">
						<input class="form-control ${status.error ? 'is-invalid' : ''}" type="text" id="annunciSearchInput"
							   name="annunciInput" value="${edit_cartellaesattoriale_attribute.contribuente.nome}${empty edit_cartellaesattoriale_attribute.contribuente.nome?'':' '}${edit_cartellaesattoriale_attribute.contribuente.cognome}">
					</spring:bind>

					<input type="hidden" name="contribuente" id="contribuenteId" value="${edit_cartellaesattoriale_attribute.contribuente }">
					<form:has  path="contribuente.nome" cssClass="error_field" />

				</div>
			</form:form>--%>

	    </div>
	  </div>
	  
	  <div class="container">
	  
	  	<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
	  
	  
	    <!-- Example row of columns -->
	    <div class="row">
	      <div class="col-md-6">
	        <h2>Gestione Registi</h2>
	        <p>Questa funzionalità è realtiva alla Gestione dei Registi</p>
	        <p><a class="btn btn-primary" href="regista/search" role="button">Vai alla Funzionalità &raquo;</a></p>
	      </div>
	      <div class="col-md-6">
	        <h2>Gestione Film</h2>
	        <p>Questa funzionalità è realtiva alla Gestione di Film</p>
	        <p><a class="btn btn-primary" href="film/search" role="button">Vai alla Funzionalità &raquo;</a></p>
	      </div>
	    </div>
	    
	    <hr>
	
	  </div> <!-- /container -->
	
	</main>

	<script>
		$("#annuncioSearchInput").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "${pageContext.request.contextPath }/contribuente/searchContribuentiAjax",
					datatype: "json",
					data: {
						term: request.term,
					},
					success: function(data) {
						response($.map(data, function(item) {
							return {
								label: item.label,
								value: item.value
							}
						}))
					}
				})
			},
			//quando seleziono la voce nel campo deve valorizzarsi la descrizione
			focus: function(event, ui) {
				$("#annuncioSearchInput").val(ui.item.label);
				return false;
			},
			minLength: 2,
			//quando seleziono la voce nel campo hidden deve valorizzarsi l'id
			select: function( event, ui ) {
				$('#annuncioId').val(ui.item.value);
				//console.log($('#registaId').val())
				return false;
			}
		});
	</script>

	<jsp:include page="./footer.jsp" />
  </body>
</html>