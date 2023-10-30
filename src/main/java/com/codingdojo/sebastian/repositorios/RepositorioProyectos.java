package com.codingdojo.sebastian.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.sebastian.modelos.Proyecto;


public interface RepositorioProyectos extends CrudRepository<Proyecto, Long>{

	
	List <Proyecto> findAll();
	
	List<Proyecto> findByCreador_Id(Long creadorId);
	
	

	
}
