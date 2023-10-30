package com.codingdojo.sebastian.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.sebastian.modelos.Tarea;

public interface RepositorioTareas extends CrudRepository<Tarea, Long>{

	List<Tarea> findAll();
}
