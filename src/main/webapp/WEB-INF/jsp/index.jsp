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

	<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		${errorMessage}
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<main role="main">

	  <!-- Main jumbotron for a primary marketing message or call to action -->
	  <div class="jumbotron" >
	    <div class="container">
	      <h1 class="display-12">Benvenuto su EBAY!</h1>

			<form method="post" action="${pageContext.request.contextPath}/annuncio/list" style="padding-top: 3rem;" >

				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Titolo Annuncio:</label>
						<input type="text" name="testoAnnuncio" id="testoAnnuncio" class="form-control" placeholder="Inserire il titolo dell'annuncio" >
					</div>

					<div class="form-group col-md-6">
						<label>Prezzo:</label>
						<input type="text" name="prezzo" id="prezzo" class="form-control" placeholder="Inserire il prezzo" >
					</div>
				</div>

				<div class="form-row">

					<div class="form-check col-md-3">
						<label>Categoria:</label>
						<br>
						<c:forEach items="${list_categoria_attribute}" var="categoriaItem">
							<input style="margin-left: 0rem;" name="categorie" class="form-check-input" type="checkbox" value="${categoriaItem.id}" id="defaultCheck">
							<label class="form-check-label" for="${categoriaItem.id}" style="margin-left: 1.5em;">
									${categoriaItem.descrizione}
							</label>
							<br/>
						</c:forEach>
						<br/>
					</div>

				</div>

				<button type="submit" style="width: 100%; margin-top: 1rem;" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>

			</form>

	    </div>
	  </div>

		<a href="${pageContext.request.contextPath}/areaprivata">
			<div class="areautente">
				AREA UTENTE
			</div>
		</a>

		<jsp:include page="./footer.jsp" />
	</main>

  </body>
</html>