package com.codingdojo.sebastian.servicios;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.sebastian.modelos.Pagina;
import com.codingdojo.sebastian.modelos.Proyecto;
import com.codingdojo.sebastian.modelos.Tarea;
import com.codingdojo.sebastian.modelos.Usuario;
import com.codingdojo.sebastian.repositorios.RepositorioPaginas;
import com.codingdojo.sebastian.repositorios.RepositorioProyectos;
import com.codingdojo.sebastian.repositorios.RepositorioTareas;
import com.codingdojo.sebastian.repositorios.RepositorioUsuarios;

@Service
public class Servicio {
	
	@Autowired
	private RepositorioUsuarios repoUsuario;
	
	@Autowired 
    private RepositorioProyectos rp;
    
    @Autowired
    private RepositorioTareas rt;
    
    @Autowired
    private RepositorioPaginas rpag;
	
    public Usuario encontrarUsuario(Long id) {
        return repoUsuario.findById(id).orElse(null);
    }

    public Usuario guardarUsuario(Usuario usuario) {
        return repoUsuario.save(usuario);
    }
	public Usuario registrar(Usuario nuevoUsuario,BindingResult result) {
		
		String contrasena = nuevoUsuario.getPassword();
		String confirmacion = nuevoUsuario.getConfirmPassword();
		if(!contrasena.equals(confirmacion)) {
			result.rejectValue("confirmacion","matches", "las contraseñas no coinciden");
		}
		
		String email = nuevoUsuario.getEmail();
		Usuario existeUsuario = repoUsuario.findByEmail(email);
		if(existeUsuario != null) {
			result.rejectValue("email","Unique","el correo ingresado ya se encuentra registrado");
		}
		
		if(result.hasErrors()) {
			return null;
		} else {
			String contra_encriptada = BCrypt.hashpw(contrasena, BCrypt.gensalt());
			nuevoUsuario.setPassword(contra_encriptada);
			return repoUsuario.save(nuevoUsuario);
		}
			
	}
	
	
	
	public Usuario login(String email, String password) {
		
		Usuario usuarioInicioSesion = repoUsuario.findByEmail(email);
		if(usuarioInicioSesion==null) {
			return null;
		}
		
		if(BCrypt.checkpw(password, usuarioInicioSesion.getPassword())) {
			return usuarioInicioSesion;
		} 
		
		return null;
		
		
	}
	
	public Usuario actualizarUsuario(Long id, Usuario usuarioModificado,BindingResult result) {
		Usuario usuarioExistente = repoUsuario.findById(id).orElse(null);
		
		if(usuarioExistente == null) {
			return null;
		}
		
		usuarioExistente.setNombre(usuarioModificado.getNombre());
		usuarioExistente.setApellido(usuarioModificado.getApellido());
		if(!usuarioModificado.getPassword().equals(usuarioModificado.getConfirmPassword())) {
			result.rejectValue("confirmacion","matches", "las contraseñas no coinciden");
		}
		
		if(result.hasErrors()) {
			return null;
		} else {
			String contraEncriptada = BCrypt.hashpw(usuarioModificado.getPassword(), BCrypt.gensalt());
			usuarioExistente.setPassword(contraEncriptada);
			return repoUsuario.save(usuarioExistente);
		}
		
	}
	
	public void eliminarUsuario(Long id) {
		Usuario usuarioEliminar = repoUsuario.findById(id).orElse(null);
		
		if(usuarioEliminar != null) {
			List<Proyecto> proyectosEliminar = usuarioEliminar.getMisProyectos();
			List<Tarea> tareasEliminar = usuarioEliminar.getMisTareas();
			List<Pagina> paginasEliminar = usuarioEliminar.getMisPaginas();
			
			for(Proyecto proyecto:proyectosEliminar) {
				rp.delete(proyecto);
			}
			for(Pagina pagina:paginasEliminar) {
				rpag.delete(pagina);
			}
			for(Tarea tarea:tareasEliminar) {
				rt.delete(tarea);
			}
			
			
			repoUsuario.delete(usuarioEliminar);
			
		} else {
			System.out.println("El usuario a eliminar no existe");
		}
	}
	
}
