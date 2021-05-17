package it.ebay.gestioneannunci.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import it.ebay.gestioneannunci.model.Annuncio;
import it.ebay.gestioneannunci.model.EditAnnuncioParam;
import it.ebay.gestioneannunci.model.Utente;
import it.ebay.gestioneannunci.service.annuncio.AnnuncioService;
import it.ebay.gestioneannunci.service.categoria.CategoriaService;
import it.ebay.gestioneannunci.service.utente.UtenteService;

@Controller
@RequestMapping(value = "/annuncio")
public class AnnuncioController {

    @Autowired
    private AnnuncioService annuncioService;

    @Autowired
    private UtenteService utenteService;

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping
    public ModelAndView listAllAnnunci() {
        ModelAndView mv = new ModelAndView();
        List<Annuncio> annunci = annuncioService.listAllElements();
        mv.addObject("annuncio_list_attribute", annunci);
        mv.setViewName("annuncio/list");
        return mv;
    }

    @PostMapping("/list")
    public String listAnnunci(Annuncio annuncio, Model model) {
        annuncio.setAperto(true);
        model.addAttribute("annuncio_list_attribute", annuncioService.findByExample(annuncio));
        return "annuncio/list";
    }
    
    @PostMapping("/delete")
    public String deleteAnnuncio(@RequestParam(name="idAnnuncio", required = true) Long idAnnuncio, Model model, Principal principal) {
    	Utente utenteInSessione=utenteService.findByUsername(principal.getName());
    	annuncioService.rimuovi(annuncioService.caricaSingoloElemento(idAnnuncio));
    	model.addAttribute("utente_attribute", utenteInSessione);
    	
    	return "areaprivata/index";
    }
    
    @GetMapping("/editAnnuncio/{idAnnuncio}")
    public String editAnnuncio(@PathVariable(required = true) Long idAnnuncio, Model model) {
    	Annuncio annuncio= annuncioService.caricaSingoloElemento(idAnnuncio);
        model.addAttribute("annuncio_attribute", annuncio);
        return "areaprivata/editAnnuncio";
    }
    
    @PostMapping("/saveEditAnnuncio/")
	public String executeUpdateUtente(
			@Validated({EditAnnuncioParam.class}) @ModelAttribute("annuncio_attribute") Annuncio annuncio, BindingResult result,
			Model model, RedirectAttributes redirectAttrs) {
    	Annuncio annuncioDaAggiornare = annuncioService.caricaSingoloElementoEagerUtente(annuncio.getId());
    	annuncio.setDataPubblicazione(annuncioDaAggiornare.getDataPubblicazione());
    	annuncio.setUtente(annuncioDaAggiornare.getUtente());

		if (result.hasErrors()) {
			return "areaprivata/editAnnuncio";
		}
		annuncioService.aggiorna(annuncio);
		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
		return "redirect:/areaprivata";

	}

}
