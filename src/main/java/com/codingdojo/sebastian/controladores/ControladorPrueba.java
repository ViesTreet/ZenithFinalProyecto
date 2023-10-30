package com.codingdojo.sebastian.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.sebastian.modelos.Pagina;
import com.codingdojo.sebastian.modelos.Proyecto;
import com.codingdojo.sebastian.modelos.Usuario;
import com.codingdojo.sebastian.servicios.ServicioProyectos;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPrueba {

	@Autowired
	private ServicioProyectos servicio;
	
	
	@GetMapping("/prueba")
	public String prueba(@ModelAttribute("prueba")Proyecto nuevoProyecto) {
		
		return "Prueba.jsp";
	}
	
	@PostMapping("/pruebaCrear")
	public String pruebaC(@Valid @ModelAttribute("prueba")Proyecto nuevoProyecto,BindingResult result) {
		if(result.hasErrors()) {
			return "Prueba.jsp";
		} else {
			Proyecto proyectoPlantilla = servicio.crearProyectos(nuevoProyecto);
			servicio.guardarProyecto(proyectoPlantilla);
			return "redirect:/";
		}
	}
	
	@GetMapping("/pruebaDoc")
	public String pruebaDoc(Model model,HttpSession session) {
		
		Usuario usuarioTemporal = (Usuario)session.getAttribute("usuarioEnSesion");
        if(usuarioTemporal == null) {
            return "redirect:/";
        }
		
        Pagina paginaprimera = servicio.encontrarPagina(7L);
        model.addAttribute("pagina",paginaprimera);
        
		return "pruebaDoc.jsp";
	}
	
	/*@PostMapping("/bloc")
	public String crearDoc(@RequestParam("tipoTexto")String TipoTexto,@RequestParam("contenido")String contenido,@RequestParam("pagina")Long pagina) {
		
		servicio.crearTarea(pagina, contenido, null, TipoTexto, null);
		
		return "redirect:/pruebaDoc";
	}
	*/
	//prueba a crear documento 
	
	@GetMapping("/documento")
	public String doc() {
		
		return "documento.jsp";
	}

}
