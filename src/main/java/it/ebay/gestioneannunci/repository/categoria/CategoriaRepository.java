package it.ebay.gestioneannunci.repository.categoria;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import it.ebay.gestioneannunci.model.Categoria;

public interface CategoriaRepository extends CrudRepository<Categoria, Long> {

	@Query("from Categoria c inner join c.annunci where c.id = :id")
	Categoria findOneEager(Long id);
	
}
