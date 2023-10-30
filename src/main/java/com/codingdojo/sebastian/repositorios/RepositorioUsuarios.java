package com.codingdojo.sebastian.repositorios;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.sebastian.modelos.Usuario;

public interface RepositorioUsuarios extends CrudRepository<Usuario,Long>{
	
	Usuario findByEmail(String email);
	
	
}
