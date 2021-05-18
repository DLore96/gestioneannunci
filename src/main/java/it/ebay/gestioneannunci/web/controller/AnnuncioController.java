package it.ebay.gestioneannunci.web.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import it.ebay.gestioneannunci.model.Categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import it.ebay.gestioneannunci.model.Annuncio;
import it.ebay.gestioneannunci.model.Utente;
import it.ebay.gestioneannunci.service.annuncio.AnnuncioService;
import it.ebay.gestioneannunci.service.categoria.CategoriaService;
import it.ebay.gestioneannunci.service.utente.UtenteService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

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

    @GetMapping("/insert")
    public String inserisciAnnuncio(Model model, Principal principal) {
        Utente utenteInSessione = utenteService.findByUsername(principal.getName());
        Annuncio annuncio = new Annuncio();
        annuncio.setAperto(true);
        annuncio.setDataPubblicazione(new Date());
        annuncio.setUtente(utenteInSessione);
        annuncio.setCategorie(annuncio.getCategorie());
        List<Categoria> categorie = categoriaService.listAllElements();
        model.addAttribute("categoria_attribute", categorie);
        model.addAttribute("insert_annuncio_attribute", annuncio);
        return "annuncio/insert";
    }

    @PostMapping("/save")
    public String saveAnnuncio(@Valid @ModelAttribute("insert_annuncio_attribute") Annuncio annuncio, BindingResult result, RedirectAttributes redirectAttributes, Principal principal) {

        if (result.hasErrors())
            return "annuncio/insert";

        annuncio.setDataPubblicazione(new Date());

        annuncioService.inserisciNuovo(annuncio);

        redirectAttributes.addFlashAttribute("successMessage", "Operazione eseguita con successo!");

        return "redirect:/areaprivata";

    }

    @GetMapping("/show/{idAnnuncio}")
    public String showFilm(@PathVariable(required = true) Long idAnnuncio, Model model) {
        model.addAttribute("show_annuncio_attr", annuncioService.caricaSingoloElementoEagerUtente(idAnnuncio));
        model.addAttribute("show_categorie_attr", annuncioService.caricaSingoloElementoEagerCateogria(idAnnuncio));
        return "annuncio/show";
    }

}
