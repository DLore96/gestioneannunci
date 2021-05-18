package it.ebay.gestioneannunci.repository.categoria;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import it.ebay.gestioneannunci.model.Categoria;

public interface CategoriaRepository extends CrudRepository<Categoria, Long> {

	@Query("from Categoria c inner join c.annunci where c.id = :id")
	Categoria findOneEager(Long id);
	
	Categoria findByDescrizioneAndCodice(String descrizione, String codice);
	
	@Modifying
    @Query(value="delete from categoria_annuncio  where annuncio_id= :id", nativeQuery = true)
    void deleteCategoriaByAnnuncio(@Param("id") Long id);
	
}
