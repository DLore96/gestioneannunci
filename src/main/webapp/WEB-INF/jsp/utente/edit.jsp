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

					<form:form modelAttribute="utente_attribute" method="post" action="${pageContext.request.contextPath}/utente/saveEdit/" novalidate="novalidate" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>nome <span class="text-danger">*</span></label>
								<spring:bind path="nome">
									<input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome" value="${utente_attribute.nome }" required>
								</spring:bind>
								<form:errors  path="nome" cssClass="error_field" />
							</div>
							
							<div class="form-group col-md-6">
								<label>cognome <span class="text-danger">*</span></label>
								<spring:bind path="cognome">
									<input type="text" name="cognome" id="cognome" class="form-control" placeholder="Inserire cognome" value="${utente_attribute.cognome }" required>
								</spring:bind>
								<form:errors  path="cognome" cssClass="error_field" />
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>username <span class="text-danger">*</span></label>
								<spring:bind path="username">
									<input type="text" class="form-control" name="username" id="username" placeholder="Inserire username" value="${utente_attribute.username }" required>
								</spring:bind>
								<form:errors  path="username" cssClass="error_field" />
							</div>
							
							<div class="form-group col-md-3">
								<label>Credito residuo <span class="text-danger">*</span></label>
								<spring:bind path="creditoResiduo">
									<input type="text" class="form-control ${status.error ? 'is-invalid' : ''}" name="creditoResiduo"
								   id="creditoResiduo" placeholder="Inserire il credito residuo"
								   value="${utente_attribute.creditoResiduo }" required>
								</spring:bind>
								<form:errors path="creditoResiduo" cssClass="error_field"/>
					</div>
						</div>
						
						<div class="form-row">
							
							<div class="form-group col-md-3">
								<label for="stato">Stato</label>
								<spring:bind path="stato">
							    <select class="form-control" id="stato" name="stato">
							    	<option value="${utente_attribute.stato }">${utente_attribute.stato }</option>
							    	<c:forEach items="${stati_attr }" var="statoItem">
							      		<option value="${statoItem }">${statoItem}</option>
							      	</c:forEach>
							    </select>
							    </spring:bind>
							    <form:errors path="stato" cssClass="error_field" />
							</div>
							
							<c:forEach items="${ruoloAttr}" var="itemRuolo">
								<div class="form-check">
									<div class=" form-group col-md-6">
						  				<input type="checkbox" name="ruoli" class="form-check-input" type="checkbox" value="${itemRuolo.id}" id="defaultCheck1"${utente_attribute.ruoli.contains(ruoloItem)?"checked":""}>
						  				<label class="form-check-label" for="defaultCheck1">${itemRuolo.descrizione}</label>
						 			 	<br/>
						 			</div>
						 		</div>
							</c:forEach>
							
						</div>
						
						<input type="hidden" name="id" id="id" class="form-control ${status.error ? 'is-invalid' : ''}" value="${utente_attribute.id }" required>
						<fmt:formatDate pattern='yyyy-MM-dd' var="parsedDate" type='date' value='${utente_attribute.dateCreated}' />
						<input type="hidden" name="dateCreated" id="dateCreated" value="${ parsedDate}" required >
						<input type="hidden" name="password" id="password" value="${utente_attribute.password }">	
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