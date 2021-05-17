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


<main role="main" class="container">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class='card'>
        <div class='card-header'>
            <h5>Dati utente</h5>
        </div>
        <div class='card-body'>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label><b>Nome:</b></label>
                    <h6>${utente_attribute.nome}</h6>
                </div>

                <div class="form-group col-md-6">
                    <label><b>Cognome:</b></label>
                    <h6>${utente_attribute.cognome}</h6>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label><b>Username:</b></label>
                    <h6>${utente_attribute.username}</h6>
                </div>

                <div class="form-group col-md-3">
                    <label><b>Credito Residuo:</b></label>
                    <h6>${utente_attribute.creditoResiduo}</h6>
                </div>
            </div>

            <div class="form-row">

                <div class="form-group col-md-6">
                    <label><b>Password:</b></label>
                    <h6 type="password">${utente_attribute.password}</h6>
                </div>

            </div>

            <input type="hidden" name="dateCreated" id="dateCreated" value="${ parsedDate}" required >
            <input type="hidden" name="password" id="password" value="${utente_attribute.password }">
            <input type="hidden" name="creditoResiduo" id="creditoResiduo" value="${utente_attribute.creditoResiduo }">
            <a class="btn  btn-sm btn-outline-primary ml-2 mr-2" style="float: right; width: 100px;" href="${pageContext.request.contextPath }/areaprivata/edit/${utente_attribute.id }">Edit</a>

            <!-- end card-body -->
        </div>
    </div>

    <div class="container">

        <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
            ${errorMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>

    </div> <!-- /container -->

    <jsp:include page="../footer.jsp" />

</main>

</body>
</html>