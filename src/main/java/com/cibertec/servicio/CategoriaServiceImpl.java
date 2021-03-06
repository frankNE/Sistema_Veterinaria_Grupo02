package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Categoria;
import com.cibertec.repositorio.CategoriaRepository;

@Service
public class CategoriaServiceImpl implements CategoriaService{

	@Autowired
	private CategoriaRepository repository;

	@Override
	public List<Categoria> listaCategoria() {
		return repository.findAll();
	}

	
}
