<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Inserisci nuovo</title>
	
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
		
		<spring:hasBindErrors  name="insert_regista_attr">
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
		        <h5>Inserisci nuovo utente</h5> 
		    </div>
		    <div class='card-body'>
		    
		    		<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

					<form:form modelAttribute="insert_utente_attr" method="post" action="${pageContext.request.contextPath}/utente/save" novalidate="novalidate" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>nome <span class="text-danger">*</span></label>
								<spring:bind path="nome">
									<input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome" value="${insert_utente_attr.nome }" required>
								</spring:bind>
								<form:errors  path="nome" cssClass="error_field" />
							</div>
							
							<div class="form-group col-md-6">
								<label>cognome <span class="text-danger">*</span></label>
								<spring:bind path="cognome">
									<input type="text" name="cognome" id="cognome" class="form-control" placeholder="Inserire cognome" value="${insert_utente_attr.cognome }" required>
								</spring:bind>
								<form:errors  path="cognome" cssClass="error_field" />
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>username <span class="text-danger">*</span></label>
								<spring:bind path="username">
									<input type="text" class="form-control" name="username" id="username" placeholder="Inserire username" value="${insert_utente_attr.username }" required>
								</spring:bind>
								<form:errors  path="username" cssClass="error_field" />
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>password <span class="text-danger">*</span></label>
								<spring:bind path="password">
									<input type="password" class="form-control" name="password" id="password" placeholder="Inserire password" value="${insert_utente_attr.password }" required>
								</spring:bind>
								<form:errors  path="password" cssClass="error_field" />
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label> verifica password <span class="text-danger">*</span></label>
									<input type="password" class="form-control" name="passwordnuova" id="passwordnuova" placeholder="Inserire password" value="" required>
							</div>
						</div>
						
						<fmt:formatDate pattern='yyyy-MM-dd' var="parsedDate" type='date' value='${insert_utente_attr.dateCreated}' />
						<input type="hidden" name="dateCreated" id="dateCreated" value="${ parsedDate}" required >
						<input type="hidden" name="stato" id="stato" value="${insert_utente_attr.stato }">	
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