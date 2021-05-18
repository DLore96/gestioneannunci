<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp" />
    <title>Pagina dei risultati</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            <h5>Lista dei risultati</h5>
        </div>
        <div class='card-body'>
            <a href="${pageContext.request.contextPath }/home" class='btn btn-outline-secondary' >
                <i class='fa fa-chevron-left'></i> Torna alla Ricerca
            </a>

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
                    <c:forEach items="${annuncio_list_attribute }" var="annuncioItem" varStatus="var">
                        <c:if test="${annuncioItem.isAperto() == true }">
                            <tr>
                                <td>${annuncioItem.testoAnnuncio }</td>
                                <td>${annuncioItem.prezzo }</td>
                                <td>${annuncioItem.dataPubblicazione }</td>
                                <td>
                                <a class="btn  btn-sm btn-outline-secondary" data-toggle="modal" data-target="#exampleModalCenter${var.index}" >
                                    Visualizza Dettagli
                                </a>
                                    <a class="btn  btn-sm btn-outline-primary ml-2 mr-2" href="${pageContext.request.contextPath }/acquisto/show/${annuncioItem.id }">Compra</a>
                                </td>

                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter${var.index}" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <h4 style="padding: .5em;">Testo Annuncio: ${annuncioItem.testoAnnuncio}</h4>
                                                <h5 style="padding: .5em;">Prezzo: ${annuncioItem.prezzo} Euro.</h5>
                                                <h6 style="padding: .5em;">Data dell'annuncio: ${annuncioItem.dataPubblicazione}</h6>
                                                <h6 style="padding: .5em;">Utente: ${annuncioItem.utente.nome} ${annuncioItem.utente.cognome}</h6>
                                                <h6 style="padding: .5em;">Categoria: ${annuncioItem.categorie}</h6>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- end card-body -->
        </div>
    </div>

    <!-- end container -->
</main>

<jsp:include page="../footer.jsp" />

</body>
</html>