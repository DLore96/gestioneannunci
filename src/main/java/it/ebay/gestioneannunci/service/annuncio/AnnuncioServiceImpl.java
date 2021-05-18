package it.ebay.gestioneannunci.service.annuncio;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.ebay.gestioneannunci.model.Annuncio;
import it.ebay.gestioneannunci.model.Categoria;
import it.ebay.gestioneannunci.repository.annuncio.AnnuncioRepository;
import it.ebay.gestioneannunci.repository.categoria.CategoriaRepository;

@Service
@Transactional
public class AnnuncioServiceImpl implements AnnuncioService {

	@Autowired
	private AnnuncioRepository repository;
	
	@Autowired
	private CategoriaRepository categoriaRepository;
	
	@Override
	public List<Annuncio> listAllElements() {
		return (List<Annuncio>) repository.findAll();
	}

	@Override
	public Annuncio caricaSingoloElemento(Long id) {
		return repository.findById(id).orElse(null);
	}
	
	@Override
	public Annuncio caricaSingoloElementoEagerUtente(Long id) {
		return repository.findOneEagerUtente(id);
	}

	@Override
	public Annuncio caricaSingoloElementoEagerCateogria(Long id) {
		return repository.findOneEagerCategoria(id);
	}

	@Override
	public void aggiorna(Annuncio annuncioInstance) {
		
		repository.save(annuncioInstance);
		for(Categoria cat: repository.findById(annuncioInstance.getId()).get().getCategorie())
		System.out.println(cat.getDescrizione());
		
	}

	@Override
	public void inserisciNuovo(Annuncio annuncioInstance) {
        repository.save(annuncioInstance);

        if (annuncioInstance.getCategorie() != null) {

            for (Categoria categoriaItem : annuncioInstance.getCategorie()) {

                categoriaItem = categoriaRepository.findById(categoriaItem.getId()).get();
                categoriaItem.getAnnunci().add(annuncioInstance);
                categoriaRepository.save(categoriaItem);
            }
        }

    }

	@Override
	public void rimuovi(Annuncio annuncioInstance) {
		repository.delete(annuncioInstance);
	}

	@Override
	public List<Annuncio> findByExample(Annuncio annuncioInstance) {
		return repository.findByExample(annuncioInstance);
	}

	@Override
	public Annuncio caricaSingoloElementoEager(Long id) {
		return repository.findOneEager(id);
	}

}
