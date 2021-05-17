<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Ricerca</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="${pageContext.request.contextPath}/assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
	
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<div class='card'>
		    <div class='card-header'>
		        <h5>Ricerca elementi</h5> 
		    </div>
		    <div class='card-body'>

					<form method="post" action="${pageContext.request.contextPath}/utente/list" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>Nome</label>
								<input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome" >
							</div>
							
							<div class="form-group col-md-6">
								<label>Cognome</label>
								<input type="text" name="cognome" id="cognome" class="form-control" placeholder="Inserire il cognome" >
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>Username</label>
								<input type="text" class="form-control" name="username" id="username" placeholder="Inserire username" >
							</div>
							<div class="form-group col-md-6">
								<label>Data di Creazione</label>
                        		<input class="form-control" id="dateCreated" type="date" placeholder="dd/MM/yy"
                            		title="formato : gg/mm/aaaa"  name="dateCreated" >
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label for="stato">Stato</label>
							    <select class="form-control" id="stato" name="stato">
							    	<option value=""> -- Selezionare una voce -- </option>
							      	<c:forEach items="${list_stati_attr }" var="statoItem">
							      		<option value="${statoItem}">${statoItem}</option>
							      	</c:forEach>
							    </select>
							</div>
							
							<c:forEach items="${ruoloAttr}" var="itemRuolo">
								<div class="form-check">
									<div class=" form-group col-md-6">
						  				<input type="checkbox" name="ruoli" class="form-check-input"  value="${itemRuolo.id}" id="defaultCheck${itemRuolo.id}">
						  				<label class="form-check-label" for="defaultCheck${itemRuolo.id}">${itemRuolo.descrizione}</label>
						 			 	<br/>
						 			</div>
						 		</div>
							</c:forEach>
						</div>
							
						<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
						<input class="btn btn-outline-warning" type="reset" value="Ripulisci">
					

						<a class="btn btn-outline-primary ml-2" href="${pageContext.request.contextPath }/utente/insert">Add New</a>
						
					</form>
		    
			<!-- end card-body -->			   
		    </div>
		</div>	
	
	
	<!-- end container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>