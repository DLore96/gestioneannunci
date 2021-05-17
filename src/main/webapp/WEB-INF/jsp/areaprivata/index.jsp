<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html lang="it">
<head>

    <jsp:include page="../header.jsp" />
    <title>Dati Utente</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">
    <style>
        .error_field {
            color: red;
        }
    </style>
</head>
<body>

<jsp:include page="../navbar.jsp" />

<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
    ${errorMessage}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<main role="main" class="container">

    <div class="jumbotron" style="background: #007BFF; color: #ffffff;">
        <div class="container">
            <h1 class="display-4"><b>Dati Utente</b></h1>
            <p class="lead">Informazioni generali dei tuoi dati!</p>
            <div class='' style="margin-top: 2em;">

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <h4>Nome</h4>
                        <h6>${utente_attribute.nome}</h6>
                    </div>

                    <div class="form-group col-md-6">
                        <h4>Cognome</h4>
                        <h6>${utente_attribute.cognome}</h6>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <h4>Username</h4>
                        <h6>${utente_attribute.username}</h6>
                    </div>

                    <div class="form-group col-md-3">
                        <h4>Credito Residuo</h4>
                        <h6>${utente_attribute.creditoResiduo}</h6>
                    </div>
                </div>


            <div class="form-row">
            </div>
            

            <input type="hidden" name="dateCreated" id="dateCreated" value="${ parsedDate}" required >
            <input type="hidden" name="password" id="password" value="${utente_attribute.password }">
            <input type="hidden" name="creditoResiduo" id="creditoResiduo" value="${utente_attribute.creditoResiduo }">
            <a class="btn  btn-sm btn-outline-primary ml-2 mr-2" style="float: right; width: 100px;" href="${pageContext.request.contextPath }/areaprivata/edit/${utente_attribute.id }">Edit</a>

            <!-- end card-body -->

                <input type="hidden" name="dateCreated" id="dateCreated" value="${ parsedDate}" required >
                <input type="hidden" name="password" id="password" value="${utente_attribute.password }">
                <input type="hidden" name="creditoResiduo" id="creditoResiduo" value="${utente_attribute.creditoResiduo }">
                <a class="btn  btn-sm btn-outline-primary ml-2 mr-2" style="float: right; width: 100px;" href="${pageContext.request.contextPath }/areaprivata/edit/${utente_attribute.id }">Edit</a>

                <!-- end card-body -->
            </div>

        </div>
    </div>
    <div class="card">
    <div class="text-white card-header bg-info">
    	<h3 align="center"> GESTIONE ANNUNCI</h3>
    </div>
    <div class=' card-body table-responsive'>
    	<table class='table table-striped ' >
			<thead>
		    	<tr>
		        	<th>Testo</th>
		            <th>Prezzo</th>
		            <th>Data di Pubblicazione</th>
		            <th>Azioni</th>
		        </tr>
		    </thead>
		    	<tbody>
		        	<c:forEach items="${utente_attribute.getAnnunci() }" var="annuncioItem">
                    	<tr>
                    		<td>${annuncioItem.testoAnnuncio }</td>
                        	<td>${annuncioItem.prezzo }</td>
                        	<td>${annuncioItem.dataPubblicazione }</td>
							<td>
								 <a class="btn  btn-sm btn-outline-secondary" data-toggle="modal" data-target="#exampleModalCenter" >
                                    Visualizza Dettagli
                                </a>
                                <c:if test="${annuncioItem.isAperto() == true }">
									<a class="btn  btn-sm btn-outline-primary ml-2 mr-2" href="${pageContext.request.contextPath }/areaprivate/editAnnuncio/${annuncioItem.id }">Edit</a>
									 <a id="eliminaAnnuncio_#_${annuncioItem.id }" class="btn btn-outline-primary btn-sm link-for-modal" data-toggle="modal" data-target="#deleteModal">
              								  <i class='fa fa-chevron-left'></i>Elimina
            							</a>
								</c:if>
							</td>
						</tr>
						
						
						<!-- Modal Visualizzazione -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    	<div class="modal-dialog modal-dialog-centered" role="document">
        	<div class="modal-content">
            	<div class="modal-header bg-info">
                	<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        	<span aria-hidden="true">&times;</span>
                        </button>
                </div>
            	
            	<div class="modal-body">
           			<h4 style="padding: .5em;">Testo Annuncio: ${annuncioItem.testoAnnuncio}</h4>
            		<h5 style="padding: .5em;">Prezzo: ${annuncioItem.prezzo}</h5>
            		<h6 style="padding: .5em;">Data dell'annuncio: ${annuncioItem.dataPubblicazione}</h6>
            		<h6 style="padding: .5em;">Utente: ${annuncioItem.utente.nome} ${annuncioItem.utente.cognome}</h6>
            		<h6 style="padding: .5em;">Categoria: ${annuncioItem.categorie}</h6>
            	</div>
            	<div class="modal-footer ">
            		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            	</div>
            </div>
        </div>
    </div>
    <!-- MODAL CANCELLAZIONE -->
     <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
    	<div class="modal-dialog modal-dialog-centered" role="document">
        	<div class="modal-content">
            	<div class="modal-header ">
                	<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        	<span aria-hidden="true">&times;</span>
                        </button>
                </div>
                 <div class="modal-body">
	                Sei sicuro di voler cancellare l'ordine?
	            </div>
	            <form method="post" action="${pageContext.request.contextPath}/annuncio/delete">
		            <div class="modal-footer">
		            	<input type="hidden" name="idAnnuncio" id="idAnnuncio">
		                <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
		                <input type="submit" value="Continua"  class="btn btn-primary">
		            </div>
	            </form>
	        </div>
	    </div>
	</div>
					</c:forEach>
		        </tbody>
		</table>
	</div>
	</div>
	
    
     
	<script type="text/javascript">
		<!-- aggancio evento click al conferma del modal  -->
		$(".link-for-modal").click(function(){
			<!-- mi prendo il numero che poi sarà l'id. Il 18 è perché 'changeStatoLink_#_' è appunto lungo 18  -->
			var callerId = $(this).attr('id').substring(18);
			<!-- imposto nell'hidden del modal l'id da postare alla servlet -->
			$('#idAnnuncio').val(callerId);
		});
	</script>
	<!-- end Modal cancellazione -->

    <div>

        <div class='card' style="margin-bottom: 10em; margin-top: 2em;">
            <div class='card-header' style="background: orange">
                <h5 style="color: #ffffff;">Lista degli acquisti</h5>
            </div>
            <div class='card-body'>

                <div class='table-responsive'>
                    <table class='table table-striped ' >
                        <thead>
                        <tr>
                            <th>Testo</th>
                            <th>Prezzo</th>
                            <th>Data di Pubblicazione</th>
                            <th>Azioni</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${annuncio_list_attribute }" var="annuncioItem">
                            <tr>
                                <td>${annuncioItem.descrizione }</td>
                                <td>${annuncioItem.prezzo }</td>
                                <td>${annuncioItem.dataAcquisto }</td>
                                <td>
                                    <a class="btn  btn-sm btn-outline-secondary" data-toggle="modal" data-target="#exampleModalCenter" >
                                        Visualizza Dettagli
                                    </a>
                                </td>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <h4 style="padding: .5em;">Titolo: ${annuncioItem.descrizione}</h4>
                                                <h5 style="padding: .5em;">Pagato: ${annuncioItem.prezzo} Euro.</h5>
                                                <h6 style="padding: .5em;">Data Acquisto: ${annuncioItem.dataAcquisto}</h6>
                                                <h6 style="padding: .5em;">Venditore: ${annuncioItem.utente.nome} ${annuncioItem.utente.cognome}</h6>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- end card-body -->
            </div>
        </div>

    </div> <!-- /container -->

    <jsp:include page="../footer.jsp" />

</main>

</body>
</html>