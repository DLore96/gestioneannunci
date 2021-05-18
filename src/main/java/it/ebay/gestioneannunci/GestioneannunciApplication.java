package it.ebay.gestioneannunci;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import it.ebay.gestioneannunci.model.Categoria;
import it.ebay.gestioneannunci.model.Ruolo;
import it.ebay.gestioneannunci.service.annuncio.AnnuncioService;
import it.ebay.gestioneannunci.service.categoria.CategoriaService;
import it.ebay.gestioneannunci.service.ruolo.RuoloService;

@SpringBootApplication
public class GestioneannunciApplication implements CommandLineRunner {

	@Autowired
	private RuoloService ruoloServiceInstance;
	@Autowired
	private CategoriaService categoriaServiceInstance;
	@Autowired
	private AnnuncioService annuncioServiceInstance;
	

	public static void main(String[] args) {
		SpringApplication.run(GestioneannunciApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		if (ruoloServiceInstance.cercaPerDescrizioneECodice("Administrator", "ROLE_ADMIN") == null) {
			ruoloServiceInstance.inserisciNuovo(new Ruolo("Administrator", "ROLE_ADMIN"));
		}

		if (ruoloServiceInstance.cercaPerDescrizioneECodice("Classic User", "ROLE_CLASSIC_USER") == null) {
			ruoloServiceInstance.inserisciNuovo(new Ruolo("Classic User", "ROLE_CLASSIC_USER"));
		}
		
		if (categoriaServiceInstance.cercaPerDescrizioneCodice("informatica", "CAT_INFO") == null) {
			categoriaServiceInstance.inserisciNuovo(new Categoria("informatica","CAT_INFO"));
		}
		
		if (categoriaServiceInstance.cercaPerDescrizioneCodice("giardinaggio", "CAT_GAR") == null) {
			categoriaServiceInstance.inserisciNuovo(new Categoria("giardinaggio","CAT_GAR"));
		}
		
	}

}
