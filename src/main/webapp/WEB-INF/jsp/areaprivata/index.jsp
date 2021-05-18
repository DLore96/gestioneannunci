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

    <div class="jumbotron" style="background: #482ff7; color: #ffffff;">
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
            <a class="btn  btn-md btn btn-light ml-2 mr-2" style="float: right; width: 100px; color: #007BFF;" href="${pageContext.request.contextPath }/areaprivata/edit/${utente_attribute.id }">Edit</a>

            <!-- end card-body -->
            </div>

        </div>
    </div>
    <div class="card">
    <div class="text-white card-header" style="background: #46c3db;">
    	<h3 align="center">GESTIONE ANNUNCI</h3>
    </div>
    <div class=' card-body table-responsive' style="background: #46c3db;">
    	<table class='table table-striped' >
			<thead>
		    	<tr>
		        	<th class="listaAnnunci">Testo</th>
		            <th class="listaAnnunci">Prezzo</th>
		            <th class="listaAnnunci">Data di Pubblicazione</th>
		            <th class="listaAnnunci">Azioni</th>
		        </tr>
		    </thead>
		    	<tbody>
		        	<c:forEach items="${utente_attribute.getAnnunci() }" var="annuncioItem" varStatus="var">
                    	<tr>
                    		<td class="listaAnnunci">${annuncioItem.testoAnnuncio }</td>
                        	<td class="listaAnnunci">${annuncioItem.prezzo }</td>
                        	<td class="listaAnnunci">${annuncioItem.dataPubblicazione }</td>
							<td class="listaAnnunci">
								 <a class="btn  btn-sm btn-outline-light" data-toggle="modal" data-target="#exampleModalCenter${var.index}">
                                    Visualizza Dettagli
                                </a>
                                <c:if test="${annuncioItem.isAperto() == true }">
									<a class="btn  btn-sm btn-outline-warning ml-2 mr-2" href="${pageContext.request.contextPath }/annuncio/editAnnuncio/${annuncioItem.id }">Edit</a>
									 <a id="eliminaAnnuncio_#_${annuncioItem.id }" class="btn btn-outline-danger btn-sm link-for-modal " data-toggle="modal" data-target="#deleteModal">
              								  <i class='fa fa-chevron-left'></i>Elimina
                                     </a>
								</c:if>
	
							</td>
						</tr>

	<div class="modal fade" id="exampleModalCenter${var.index}"  role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
            <div class='text-white card-header' style="background: #fc5185;">
                <h3 align="center" style="color: #ffffff;">LISTA DEGLI ACQUISTI</h3>
            </div>
            <div class='card-body' style="background: #fc5185;">

                <div class='table-responsive'>
                    <table class='table table-striped ' >
                        <thead>
                        <tr>
                            <th class="listaAcquisti">Testo</th>
                            <th class="listaAcquisti">Prezzo</th>
                            <th class="listaAcquisti">Data di Pubblicazione</th>
                            <th class="listaAcquisti">Azioni</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${annuncio_list_attribute }" var="annuncioItem">
                            <tr>
                                <td class="listaAcquisti">${annuncioItem.descrizione }</td>
                                <td class="listaAcquisti">${annuncioItem.prezzo }</td>
                                <td class="listaAcquisti">${annuncioItem.dataAcquisto }</td>
                                <td class="listaAcquisti">
                                    <a class="btn  btn-sm btn-outline-light ml-2 mr-2" href="${pageContext.request.contextPath }/areaprivata/showAcquisto/${annuncioItem.id}">Visualizza Dettagli</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- end card-body -->
            </div>
        </div>

    </div> <!-- /container -->

    <script type="text/javascript">
        $(".link-for-modal").click(function(){
            <!-- mi prendo il numero che poi sarà l'id. Il 18 è perché 'changeStatoLink_#_' è appunto lungo 18  -->
            var callerId = $(this).attr('id').substring(18);
            <!-- imposto nell'hidden del modal l'id da postare alla servlet -->
            $('#idAnnuncio').val(callerId);
        });
    </script>

    <jsp:include page="../footer.jsp" />

</main>

</body>
</html>