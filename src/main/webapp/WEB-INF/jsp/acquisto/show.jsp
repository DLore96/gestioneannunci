<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp" />
    <title>Visualizza elemento</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath }/assets/css/global.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../navbar.jsp" />

<main role="main" class="container">

    <div class="alert alert-success alert-dismissible fade show ${successMessage==null?'d-none': ''}" role="alert">
        ${successMessage}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
        ${errorMessage}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <div class='card'>
        <div class='card-header'>
            Visualizza dettaglio
        </div>

        <div class='card-body'>
            <dl class="row">
                <dt class="col-sm-3 text-right">Id:</dt>
                <dd class="col-sm-9">${show_annuncio_attribute.id}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Testo Annuncio:</dt>
                <dd class="col-sm-9">${show_annuncio_attribute.testoAnnuncio}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Prezzo:</dt>
                <dd class="col-sm-9">${show_annuncio_attribute.prezzo}</dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Data di Pubblicazione:</dt>
                <dd class="col-sm-9"><fmt:formatDate type = "date" value = "${show_annuncio_attribute.dataPubblicazione}" /></dd>
            </dl>

            <dl class="row">
                <dt class="col-sm-3 text-right">Categorie:</dt>
                <dd class="col-sm-9">${show_annuncio_attribute.categorie}</dd>
            </dl>

            <p>
                <a class="btn btn-primary btn-sm" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Info Utente
                </a>
            </p>
            <div class="collapse" id="collapseExample">
                <div class="card card-body">

                    <dl class="row">
                        <dt class="col-sm-3 text-right">Nome:</dt>
                        <dd class="col-sm-9">${show_annuncio_attribute.utente.nome}</dd>
                    </dl>
                    <dl class="row">
                        <dt class="col-sm-3 text-right">Cognome:</dt>
                        <dd class="col-sm-9">${show_annuncio_attribute.utente.cognome}</dd>
                    </dl>

                </div>
            </div>

        </div>

        <div class='card-footer'>
            <a href="${pageContext.request.contextPath }/annuncio" class='btn btn-outline-secondary' style='width:80px'>
                <i class='fa fa-chevron-left'></i> Back
            </a>
            <a id="compraAnnuncio_#_${show_annuncio_attribute.id }" class="btn btn-outline-primary btn-sm link-for-modal" data-toggle="modal" data-target="#confirmBuyModal">
                <i class='fa fa-chevron-left'></i> Compra
            </a>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="confirmBuyModal" tabindex="-1" role="dialog" aria-labelledby="confirmBuyModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmBuyModalLabel" style="color: #feb062;">Conferma Acquisto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h3 style="padding: .5em; color: #feb062;">Riepilogo acquisto:</h3>
                    <h4 style="padding: .5em; color: #575151;">Testo Annuncio: ${show_annuncio_attribute.testoAnnuncio}</h4>
                    <h5 style="padding: .5em; color: #575151;">Prezzo: ${show_annuncio_attribute.prezzo} Euro.</h5>
                    <h6 style="padding: .5em; color: #575151;">Data dell'annuncio: ${show_annuncio_attribute.dataPubblicazione}</h6>
                    <h6 style="padding: .5em; color: #575151;">Categoria: ${show_annuncio_attribute.categorie}</h6>
                </div>
                <form method="post" action="${pageContext.request.contextPath }/acquisto/compra/${show_annuncio_attribute.id}" >
                    <div class="modal-footer">
                        <input type="hidden" name="idAnnuncioAcquisto" id="idAnnuncioAcquisto">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
                        <input type="submit" value="Continua"  class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- end Modal -->
    <script type="text/javascript">
        $(".link-for-modal").click(function(){
            <!-- mi prendo il numero che poi sarà l'id. Il 18 è perché 'changeStatoLink#' è appunto lungo 18  -->
            var callerId = $(this).attr('id').substring(17);
            <!-- imposto nell'hidden del modal l'id da postare alla servlet -->
            $('#idAnnuncioAcquisto').val(callerId);
        });
    </script>

    <!-- end main container -->
</main>
<jsp:include page="../footer.jsp" />

</body>
</html>