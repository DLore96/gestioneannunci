package it.ebay.gestioneannunci.repository.annuncio;

import org.springframework.data.repository.CrudRepository;

import it.ebay.gestioneannunci.model.Annuncio;

public interface AnnuncioRepository extends CrudRepository<Annuncio, Long> {

}
