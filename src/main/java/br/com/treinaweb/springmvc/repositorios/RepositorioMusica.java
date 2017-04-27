package br.com.treinaweb.springmvc.repositorios;

import br.com.treinaweb.springmvc.dominios.Musica;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RepositorioMusica extends JpaRepository<Musica, Long> {

    @Query("select m from Musica m where m.nome like %:nome%")
    List<Musica> findByNome(@Param("nome") String nome);

}
