package it.ebay.gestioneannunci.web.controller;

import it.ebay.gestioneannunci.model.Annuncio;
import it.ebay.gestioneannunci.service.annuncio.AnnuncioService;
import it.ebay.gestioneannunci.service.categoria.CategoriaService;
import it.ebay.gestioneannunci.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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

}
