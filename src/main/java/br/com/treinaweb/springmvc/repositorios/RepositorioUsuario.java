package br.com.treinaweb.springmvc.repositorios;

import br.com.treinaweb.springmvc.dominios.Musica;
import br.com.treinaweb.springmvc.dominios.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RepositorioUsuario extends JpaRepository<Usuario, Long> {

    Usuario findByUsername(String username);

}
