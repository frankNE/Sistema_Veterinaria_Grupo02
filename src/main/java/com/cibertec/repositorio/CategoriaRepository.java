package com.cibertec.repositorio;


import org.springframework.data.jpa.repository.JpaRepository;

import com.cibertec.entidad.Categoria;

public interface CategoriaRepository  extends JpaRepository<Categoria, Integer>{
	
}
