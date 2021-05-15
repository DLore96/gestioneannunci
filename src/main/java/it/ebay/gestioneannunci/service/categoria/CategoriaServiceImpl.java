package it.ebay.gestioneannunci.service.categoria;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.ebay.gestioneannunci.model.Categoria;
import it.ebay.gestioneannunci.repository.categoria.CategoriaRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CategoriaServiceImpl implements CategoriaService {

	@Autowired
	private CategoriaRepository repository;
	
	@Override
	public List<Categoria> listAllElements() {
		return (List<Categoria>) repository.findAll();
	}

	@Override
	public Categoria caricaSingoloElemento(Long id) {
		return repository.findById(id).orElse(null);
	}

	@Override
	public Categoria findSingoloElementoEager(Long id) {
		return repository.findOneEager(id);
	}

	@Override
	public void aggiorna(Categoria categoriaInstance) {
		repository.save(categoriaInstance);
	}

	@Override
	public void inserisciNuovo(Categoria categoriaInstance) {
		repository.save(categoriaInstance);
	}

	@Override
	public void rimuovi(Categoria categoriaInstance) {
		repository.delete(categoriaInstance);
	}

}
