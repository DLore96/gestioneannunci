<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp" />
    <title>Inserisci nuovo</title>

    <!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/static/assets/css/global.css" rel="stylesheet">
    <style>
        .error_field {
            color: red;
        }
        body {
            margin-bottom: 60px;
            padding-top: 6rem;
        }
    </style>

</head>
<body>
<jsp:include page="../navbar.jsp" />

<main role="main" class="container">

    <spring:hasBindErrors  name="insert_annuncio_attribute">
        <%-- alert errori --%>
        <div class="alert alert-danger " role="alert">
            Attenzione!! Sono presenti errori di validazione
        </div>
    </spring:hasBindErrors>

    <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
        ${errorMessage}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <div class="alert alert-success alert-dismissible fade show ${successMessage==null?'d-none': ''}" role="alert">
        ${successMessage}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>

    <div class='card'>
        <div class='card-header'>
            <h5>Inserisci nuovo annuncio</h5>
        </div>
        <div class='card-body'>

            <h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

            <form:form modelAttribute="insert_annuncio_attribute" method="post" action="${pageContext.request.contextPath}/annuncio/save" novalidate="novalidate" >

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Testo Annuncio <span class="text-danger">*</span></label>
                        <spring:bind path="testoAnnuncio">
                            <input type="text" name="testoAnnuncio" id="testoAnnuncio" class="form-control" placeholder="Inserire il testo" value="${insert_annuncio_attribute.testoAnnuncio }" required>
                        </spring:bind>
                        <form:errors  path="testoAnnuncio" cssClass="error_field" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Prezzo <span class="text-danger">*</span></label>
                        <spring:bind path="prezzo">
                            <input type="number" name="prezzo" id="prezzo" class="form-control" placeholder="Inserire il prezzo" value="${insert_annuncio_attribute.prezzo }" required>
                        </spring:bind>
                        <form:errors  path="prezzo" cssClass="error_field" />
                    </div>
                </div>

                <div class="form-row">
                    <c:forEach items="${categoria_attribute}" var="itemCategoria">
                        <div class="form-check">
                            <div class=" form-group col-md-6">
                                <input type="checkbox" name="categorie" class="form-check-input" type="checkbox" value="${itemCategoria.id}">
                                <label class="form-check-label">${itemCategoria.descrizione}</label>
                                <br/>
                            </div>
                        </div>
                        <form:errors  path="categorie" cssClass="error_field" />
                    </c:forEach>
                </div>

                <fmt:formatDate pattern='yyyy-MM-dd' var="parsedDate" type='date' value='${insert_annuncio_attribute.dataPubblicazione}' />
                <input type="hidden" name="dataPubblicazione" id="dataPubblicazione" value="${parsedDate}" required >
                <input type="hidden" name="utente" id="utente" value="${insert_annuncio_attribute.utente.id}">
                <input type="hidden" name="aperto" id="aperto" value="${insert_annuncio_attribute.isAperto() == true? 'true' : ''}">

                <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>

            </form:form>

            <!-- end card-body -->
        </div>
    </div>


    <!-- end container -->
</main>
<jsp:include page="../footer.jsp" />

</body>
</html>