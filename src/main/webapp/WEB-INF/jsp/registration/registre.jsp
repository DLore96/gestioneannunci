<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="it">
	<head>
	  <!-- Required meta tags -->
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	  <!-- Bootstrap CSS -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" >
	
	  <title>Registrati</title>
</head>
<body>

	<main role="main" class="container">
	
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="alert alert-danger alert-dismissible fade show ${successMessage==null?'d-none': ''}" role="alert">
		  ${successMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<div class='card'>
		    <div class='card-header'>
		        <h5>Inserisci nuovo utente</h5> 
		    </div>
		    <div class='card-body'>
		    
		    		<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

					<form method="post" action="ExecuteRegistrationServlet" novalidate="novalidate" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>nome <span class="text-danger">*</span></label>
								<input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome" value="" required>
							</div>
							
							<div class="form-group col-md-6">
								<label>cognome <span class="text-danger">*</span></label>
								<input type="text" name="cognome" id="cognome" class="form-control" placeholder="Inserire cognome" value="" required>
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>username <span class="text-danger">*</span></label>
								<input type="text" class="form-control" name="username" id="username" placeholder="Inserire username" value="" required>
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>password <span class="text-danger">*</span></label>
								<input type="password" class="form-control" name="password" id="password" placeholder="Inserire password" value="" required>
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label> verifica password <span class="text-danger">*</span></label>
								<input type="password" class="form-control" name="passwordnuova" id="passwordnuova" placeholder="Inserire password" value="" required>
							</div>
						</div>
							
						<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>

					</form>

		    
		    
			<!-- end card-body -->			   
		    </div>
		</div>	
	</main>
    <jsp:include page="../footer.jsp" />

</body>
</html>