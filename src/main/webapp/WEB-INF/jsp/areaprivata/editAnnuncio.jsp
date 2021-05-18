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
    <title>Aggiorna annuncio</title>

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

<main role="main" class="container">

    <spring:hasBindErrors  name="annuncio_attribute">
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

    <div class='card'>
        <div class='card-header'>
            <h5>Modifica il tuo annuncio</h5>
        </div>
        <div class='card-body'>

            <h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

            <form:form modelAttribute="annuncio_attribute" method="post" action="${pageContext.request.contextPath}/annuncio/saveEditAnnuncio/" novalidate="novalidate" >

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Testo annuncio: <span class="text-danger">*</span></label>
                        <spring:bind path="testoAnnuncio">
                            <input type="text" name="testoAnnuncio" id="testoAnnuncio" class="form-control" placeholder="Inserire il testo dell'annuncio" value="${annuncio_attribute.testoAnnuncio }" required>
                        </spring:bind>
                        <form:errors  path="testoAnnuncio" cssClass="error_field" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Prezzo: <span class="text-danger">*</span></label>
                        <spring:bind path="prezzo">
                            <input type="number" name="prezzo" id="prezzo" class="form-control" placeholder="Inserire il prezzo" value="${annuncio_attribute.prezzo }" required>
                        </spring:bind>
                        <form:errors  path="prezzo" cssClass="error_field" />
                    </div>
                </div>
                <div class="form-row">
                	<div class="form-group col-md-6">
                	<label>Stato Annuncio:</label>
  						<div class="form-check">
    						<input name="aperto" class="form-check-input" type="radio" id="aperto"${annuncio_attribute.isAperto()==true?"checked":""}>
    						<label class="form-check-label" for="aperto">Annuncio aperto</label>
 						</div>
  						<div class="form-check">
    						<input name="aperto" class="form-check-input" type="radio" id="aperto"${annuncio_attribute.isAperto()==false?"checked":""}>
    						<label class="form-check-label" for="aperto">Annuncio chiuso</label>
  						</div>
					</div>
					<div class="form-check col-md-3">
						<label>Categorie:</label>
						<br>
						<c:forEach items="${list_categoria_attribute}" var="categoriaItem">
							<input style="margin-left: 0rem;" name="categorie" class="form-check-input" type="checkbox" value="${categoriaItem.id}" id="defaultCheck"${annuncio_attribute.getCategorie().contains(categoriaItem)==true?"checked":""}>
							<label class="form-check-label" for="defaultCheck" style="margin-left: 1.5em;">
									${categoriaItem.descrizione}
							</label>
							<br/>
						</c:forEach>
						<br/>
					</div>
                </div>
                
                <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
                <input type="hidden" name="id" id="id" class="form-control ${status.error ? 'is-invalid' : ''}" value="${annuncio_attribute.id }" required>


            </form:form>

            <!-- end card-body -->
        </div>
    </div>


    <!-- end container -->
</main>
<jsp:include page="../footer.jsp" />

</body>
</html>