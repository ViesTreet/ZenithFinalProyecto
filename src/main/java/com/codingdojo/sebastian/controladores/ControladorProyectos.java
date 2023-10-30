package com.codingdojo.sebastian.controladores;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.sebastian.modelos.Pagina;
import com.codingdojo.sebastian.modelos.Proyecto;
import com.codingdojo.sebastian.modelos.Tarea;
import com.codingdojo.sebastian.modelos.Usuario;
import com.codingdojo.sebastian.servicios.Servicio;
import com.codingdojo.sebastian.servicios.ServicioProyectos;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorProyectos {

	@Autowired
	private Servicio su;
	
	@Autowired
	private ServicioProyectos sp;
	
	@GetMapping("/dashboard")
    public String dashboard(HttpSession session,
    						 @ModelAttribute("nuevaProyecto") Proyecto NuevoProyecto,
    						 Model model) {

		//Verificar usuario en sesion//
        Usuario usuarioTemporal = (Usuario)session.getAttribute("usuarioEnSesion");
        if(usuarioTemporal == null) {
            return "redirect:/";
        }
        //Verificar usuario en sesion//
        
        List<Proyecto> proyectos = sp.listaProyectoPorUsuario(usuarioTemporal);
        model.addAttribute("proyectos", proyectos);

        return "dashboard.jsp";
    }
	
	@GetMapping("/crear/proyectos")
	public String crearProyectos(HttpSession session ,@ModelAttribute("nuevoProyecto") Proyecto nuevoProyecto, Model model ) {
		
		//Verificar usuario en sesion//
        Usuario usuarioTemporal = (Usuario)session.getAttribute("usuarioEnSesion");
        if(usuarioTemporal == null) {
            return "redirect:/";
        }
        List<Proyecto> proyectos = sp.listaProyectoPorUsuario(usuarioTemporal);
        model.addAttribute("proyectos", proyectos);
        
        //Verificar usuario en sesion//
        return "formularioproyecto.jsp";
		
	}
	
	@PostMapping("/crearProyecto")
	public String crearProyecto(HttpSession session,
								@Valid @ModelAttribute("nuevoProyecto") Proyecto nuevoProyecto,
								Model model,BindingResult result) {
		//Verificar usuario en sesion//
        Usuario usuarioTemporal = (Usuario)session.getAttribute("usuarioEnSesion");
        if(usuarioTemporal == null) {
            return "redirect:/";
        }
        if(result.hasErrors()) {
            
            List<Proyecto> proyectos = sp.listaProyectoPorUsuario(usuarioTemporal);
            model.addAttribute("proyectos", proyectos);

            return "dashboard.jsp";
        }
        
        	// guardar proyecto nuevo
        	sp.crearProyectos(nuevoProyecto);
        	// Obtener la lista de proyectos actualizada
        	List<Proyecto> proyectos = sp.listaProyectoPorUsuario(usuarioTemporal);
        	// Agregar la lista actualizada de proyectos al modelo
        	model.addAttribute("proyectos", proyectos);
	       
        	// Redireccion a habitos por primera vez
        	List<Pagina> listaPaginasUsuario = nuevoProyecto.getProyectoPaginas();
        	for(Pagina pagina:listaPaginasUsuario) {
        		if(pagina.getTipoPagina().equals("habitos")) {
        			return "redirect:/paginas/"+pagina.getId();
        		}
        	}
        	return "redirect:/dashboard";
	}

	@PutMapping("/editarProyecto")
	public String editarProyecto(@RequestParam("titulo")String titulo, @RequestParam("descripcion")String descripcion, @RequestParam("proyectoId")Long id,HttpSession session){
		sp.editarProyecto(id, titulo, descripcion);
		return "redirect:/dashboard";

	}

	@GetMapping("/proyectos")
	public String proyectos(HttpSession session,Model model) {
		
		//Verificar usuario en sesion//
        Usuario usuarioTemporal = (Usuario)session.getAttribute("usuarioEnSesion");
        if(usuarioTemporal == null) {
            return "redirect:/";
        }
        //Verificar usuario en sesion//

        List<Proyecto> proyectosUsuario = sp.listaProyectoPorUsuario(usuarioTemporal);
        
        model.addAttribute("proyectos",proyectosUsuario);
		return "proyects.jsp";
	}
	
	@GetMapping("/proyectos/{proyectoId}")
	public String paginaProyectos(HttpSession session,Model model,@PathVariable("proyectoId") Long proyectoId) {
		// Verificar que el usuario esté en sesión
		Usuario usuarioTemporal = (Usuario) session.getAttribute("usuarioEnSesion");
		if (usuarioTemporal == null) {
			return "redirect:/";  
		}
		List<Proyecto> proyectosUsuario = sp.listaProyectoPorUsuario(usuarioTemporal);
        model.addAttribute("proyectos",proyectosUsuario);
		Proyecto proyectoQueMostrar = sp.encontrarProyecto(proyectoId);
		if (proyectoQueMostrar != null && proyectoQueMostrar.getCreador().getId() == usuarioTemporal.getId()) {
	        model.addAttribute("proyectoMostrar", proyectoQueMostrar);
	        return "paginas.jsp";
	    } else {
	        return "redirect:/dashboard"; // Redirigir al usuario a su dashboard si no es el creador
	    }
	}
	
	@GetMapping("/paginas/{paginaId}")
	public String irAPrimeraPagina(@PathVariable("paginaId") Long paginaId, HttpSession session, Model model) {
	    // Verificar que el usuario esté en sesión
	    Usuario usuarioTemporal = (Usuario) session.getAttribute("usuarioEnSesion");
	    if (usuarioTemporal == null) {
	        return "redirect:/";  
	    }
	    // Verificar que el usuario esté en sesión
	    // Obtener el proyecto con el ID proporcionado
	    Pagina paginaAEntrar = sp.encontrarPagina(paginaId);
	    List<Proyecto> proyectosUsuario = sp.listaProyectoPorUsuario(usuarioTemporal);
        model.addAttribute("proyectos",proyectosUsuario);
	    if(paginaAEntrar != null && paginaAEntrar.getUsuarioPagina().getId() == usuarioTemporal.getId()) {
	    	model.addAttribute("paginaMostrar",paginaAEntrar);
	    	if(paginaAEntrar.getTipoPagina().equals("habitos")) {
	    		return "paginaHabitos.jsp";
	    	
	    	} else if(paginaAEntrar.getTipoPagina().equals("bloc")) {
	    		return "paginaBloc.jsp";
	    	
	    	}else if(paginaAEntrar.getTipoPagina().equals("gestor")) {
	    		return "tareas.jsp"; 
	    	}else {
	    	
	    	return "redirect:/dashboard";
	    } 
	    } else {
	    	return "redirect:/dashboard";
	    }
	}
	
	@PostMapping("/bloc")
	public String crearDoc(@RequestParam("tipoTexto")String tipoTexto, @RequestParam("contenido")String contenido,@RequestParam("pagina")Long pagina,HttpSession session) {
		
		Usuario usuarioTemporal = (Usuario) session.getAttribute("usuarioEnSesion");
	    if (usuarioTemporal == null) {
	        return "redirect:/";  
	    }
		
		sp.crearTarea(pagina, contenido, null, tipoTexto, null, null, null);
		
		return "redirect:/paginas/"+pagina;
	}
	
	@PostMapping("/guardar-tarea")
	public ResponseEntity<String> guardarTarea(@RequestParam("tareaId") Long tareaId, @RequestParam("marcada") String marcada) {
		
		Tarea tareaCheckbox = sp.encontrarTarea(tareaId);
		tareaCheckbox.setEstado(marcada);
		sp.guardarTarea(tareaCheckbox);

	    return ResponseEntity.ok("Tarea actualizada");
	}

	@GetMapping("/premiun")
	public String premiun(HttpSession session,Model model) {
		// Verificar que el usuario esté en sesión
	    Usuario usuarioTemporal = (Usuario) session.getAttribute("usuarioEnSesion");
	    if (usuarioTemporal == null) {
	        return "redirect:/";  
	    }
	    // Verificar que el usuario esté en sesión
		
	    List<Proyecto> proyectosUsuario = sp.listaProyectoPorUsuario(usuarioTemporal);
        model.addAttribute("proyectos",proyectosUsuario);
	    
		return "premiun.jsp";
	}

	
	@PostMapping("/nueva_pagina/crear_tarea")
	public String crearTareaEnNuevaPagina(
	    @RequestParam("contenido") String contenido,
	    @RequestParam("estado") String estado,
	    @RequestParam("fechaCreacion") LocalDate fechaCreacion,
	    @RequestParam("fechaLimite") LocalDate fechaLimite,
	    @RequestParam("id-pagina") Long idPagina,
	    HttpSession session
	) {
		
		Usuario usuarioTemporal = (Usuario) session.getAttribute("usuarioEnSesion");
	    if (usuarioTemporal == null) {
	        return "redirect:/";  
	    }
	    // Llama al servicio para crear la tarea en la nueva página
	   sp.crearTarea(idPagina,contenido, null, null,fechaCreacion, fechaLimite, estado);

	    // Redirige a la página de la nueva página o a donde desees que el usuario vaya después de crear la tarea
	    return "redirect:/paginas/"+idPagina;
	}
	 
	 @GetMapping("/delete/{id}")
	 public String delete(@PathVariable("id")long id) {
		 sp.eliminarProyecto(id);
		 
		 return "redirect:/proyectos";
	 }
	 
	@PostMapping("/barraDeBusqueda")
	 public String busqueda(@RequestParam("busqueda")String busqueda,Model model , HttpSession session) {
		Usuario usuarioTemporal = (Usuario) session.getAttribute("usuarioEnSesion");
	    if (usuarioTemporal == null) {
	        return "redirect:/";  
	    }
	    
	    List<Pagina> paginasRelacionadas = sp.buscarPagina(busqueda);
	    
	    model.addAttribute("paginas",paginasRelacionadas);
	    
	    return "busqueda.jsp";
	}
	 
}

