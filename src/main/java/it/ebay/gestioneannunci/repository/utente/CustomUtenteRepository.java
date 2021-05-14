package it.ebay.gestioneannunci.repository.utente;

import java.util.List;

import it.ebay.gestioneannunci.model.Utente;

public interface CustomUtenteRepository {

	List<Utente> findByExample(Utente example);
	
}
