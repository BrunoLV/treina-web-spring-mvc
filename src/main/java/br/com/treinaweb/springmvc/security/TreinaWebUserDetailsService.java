package br.com.treinaweb.springmvc.security;

import br.com.treinaweb.springmvc.dominios.Usuario;
import br.com.treinaweb.springmvc.repositorios.RepositorioUsuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.HashSet;
import java.util.Set;

public class TreinaWebUserDetailsService implements UserDetailsService {

    @Autowired
    private RepositorioUsuario repositorio;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = repositorio.findByUsername(username);
        if (usuario == null) {
            throw new UsernameNotFoundException("Usuário não encontrado.");
        }
        Set<GrantedAuthority> perfis = new HashSet<>();
        perfis.add(new SimpleGrantedAuthority(usuario.getRole()));
        return new User(usuario.getUsername(), usuario.getPassword(), perfis);
    }

}
