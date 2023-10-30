package com.codingdojo.sebastian.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.sebastian.modelos.Pagina;

public interface RepositorioPaginas extends CrudRepository<Pagina,Long>{
	
	List<Pagina> findAll();
	
	List<Pagina> findByNombreContainingIgnoreCase(String busqueda);
}
