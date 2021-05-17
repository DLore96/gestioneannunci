<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="it">
<head>
    <jsp:include page="../header.jsp" />
    <title>Aggiorna utente</title>

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

    <spring:hasBindErrors  name="utente_attribute">
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
            <h5>Modifica utente</h5>
        </div>
        <div class='card-body'>

            <h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

            <form:form modelAttribute="utente_attribute" method="post" action="${pageContext.request.contextPath}/areaprivata/saveEdit/" novalidate="novalidate" >

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Nome: <span class="text-danger">*</span></label>
                        <spring:bind path="nome">
                            <input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome" value="${utente_attribute.nome }" required>
                        </spring:bind>
                        <form:errors  path="nome" cssClass="error_field" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Cognome: <span class="text-danger">*</span></label>
                        <spring:bind path="cognome">
                            <input type="text" name="cognome" id="cognome" class="form-control" placeholder="Inserire cognome" value="${utente_attribute.cognome }" required>
                        </spring:bind>
                        <form:errors  path="cognome" cssClass="error_field" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Username: <span class="text-danger">*</span></label>
                        <spring:bind path="username">
                            <input type="text" class="form-control" name="username" id="username" placeholder="Inserire username" value="${utente_attribute.username }" required>
                        </spring:bind>
                        <form:errors  path="username" cssClass="error_field" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Password:</label>
                        <form:errors path="password" cssClass="error_field" />
                        <spring:bind path="password">
                            <input type="text" name="password" id="password"class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire la nuova password" autocomplete="new-password" >

                            <label>Conferma Password: <span class="text-danger">*</span></label>
                            <input type="text" class="form-control ${status.error ? 'is-invalid' : ''}" name="passwordNuova" id="passwordNuova" placeholder="conferma Password"  required>
                        </spring:bind>
                        <form:errors path="password" cssClass="error_field" />
                    </div>

                </div>

                <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
                <input type="hidden" name="id" id="id" class="form-control ${status.error ? 'is-invalid' : ''}" value="${utente_attribute.id }" required>


            </form:form>

            <!-- end card-body -->
        </div>
    </div>


    <!-- end container -->
</main>
<jsp:include page="../footer.jsp" />

</body>
</html>