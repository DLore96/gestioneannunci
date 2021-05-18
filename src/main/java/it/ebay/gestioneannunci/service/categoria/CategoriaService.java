package it.ebay.gestioneannunci.service.categoria;

import java.util.List;

import it.ebay.gestioneannunci.model.Categoria;

public interface CategoriaService {

	public List<Categoria> listAllElements();

	public Categoria caricaSingoloElemento(Long id);

	public Categoria findSingoloElementoEager(Long id);

	public void aggiorna(Categoria categoriaInstance);

	public void inserisciNuovo(Categoria categoriaInstance);

	public void rimuovi(Categoria categoriaInstance);
	
	public Categoria cercaPerDescrizioneCodice(String descrizione, String codice);
	
}
