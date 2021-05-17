<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- navbar -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary">

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Menu</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/home">Home</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/home">Ricerca Annuncio</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/areaprivata/insert">Inserisci Annuncio</a>
        </div>
      </li>
      <sec:authorize access="hasRole('ADMIN')">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gestione Utenze</a>
	        <div class="dropdown-menu" aria-labelledby="dropdown01">
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/utente/search">Ricerca Utenti</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/utente/insert">Inserisci Utente</a>
	        </div>
	      </li>
	   </sec:authorize>
    </ul>

    <sec:authorize access="isAuthenticated()">
	     <p class="navbar-text">Utente: <sec:authentication property="principal.username" />
	     <a style="margin-left: 1em;" href="${pageContext.request.contextPath}/logout">Logout</a></p>
   </sec:authorize>
      <sec:authorize access="!isAuthenticated()">
          <a class="nav-link" style="color: #ffffff !important;" href="${pageContext.request.contextPath}/login">Login <span class="sr-only">(current)</span></a>
      </sec:authorize>
  </div>
</nav>
