package it.ebay.gestioneannunci.repository.annuncio;

import java.util.List;

import it.ebay.gestioneannunci.model.Annuncio;

public interface CustomAnnuncioRepository {

	List<Annuncio> findByExample(Annuncio example);
	
}
