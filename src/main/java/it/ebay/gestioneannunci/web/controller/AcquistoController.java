package it.ebay.gestioneannunci.web.controller;

import it.ebay.gestioneannunci.model.Acquisto;
import it.ebay.gestioneannunci.model.Annuncio;
import it.ebay.gestioneannunci.service.acquisto.AcquistoService;
import it.ebay.gestioneannunci.service.annuncio.AnnuncioService;
import it.ebay.gestioneannunci.service.categoria.CategoriaService;
import it.ebay.gestioneannunci.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

@Controller
@RequestMapping(value = "/acquisto")
public class AcquistoController {

    @Autowired
    private AnnuncioService annuncioService;

    @Autowired
    private AcquistoService acquistoService;

    @Autowired
    private UtenteService utenteService;

    @GetMapping("/show/{idAnnuncio}")
    public String showAcquisto(@PathVariable(required = true) Long idAnnuncio, Model model) {
        Annuncio annuncio = annuncioService.caricaSingoloElementoEagerUtente(idAnnuncio);
        model.addAttribute("show_annuncio_attribute", annuncio);
        return "acquisto/show";
    }

    @PostMapping("/compra/{idAnnuncio}")
    public String compraAnnuncio(@PathVariable(required = true) Long idAnnuncio, Model model) {

        Annuncio annuncio = annuncioService.caricaSingoloElementoEagerUtente(idAnnuncio);
        Acquisto acquisto = new Acquisto(annuncio.getTestoAnnuncio(), new Date(), annuncio.getPrezzo(), annuncio.getUtente());

        if (annuncio.getUtente().getCreditoResiduo() < annuncio.getPrezzo()) {
            model.addAttribute("errorMessage", "Il credito non e' sufficiente per completare l'acquisto.");
            return "annuncio/list";
        }

        utenteService.sottraiCredito(annuncio.getUtente(), annuncio.getPrezzo());
        annuncio.setAperto(false);

        annuncioService.aggiorna(annuncio);
        acquistoService.inserisciNuovo(acquisto);

        model.addAttribute("successMessage", "Acquisto eseguito con successo!");
        return "acquisto/show";

    }

}
