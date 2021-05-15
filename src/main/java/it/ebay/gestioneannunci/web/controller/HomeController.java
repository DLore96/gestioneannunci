package it.ebay.gestioneannunci.web.controller;

import it.ebay.gestioneannunci.service.categoria.CategoriaService;
import it.ebay.gestioneannunci.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	private CategoriaService categoriaService;

	@RequestMapping(value = { "/home", "" }, method = {RequestMethod.GET, RequestMethod.POST})
	public String loginMessage(Model model) {
		model.addAttribute("list_categoria_attribute", categoriaService.listAllElements());
		return "index";
	}

}
