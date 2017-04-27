package br.com.treinaweb.springmvc.repositorios;

import br.com.treinaweb.springmvc.dominios.Album;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RepositorioAlbum extends JpaRepository<Album, Long> {

    @Query("select a from Album a where a.nome like %:nome%")
    List<Album> findByNome(@Param("nome") String nome);

}
