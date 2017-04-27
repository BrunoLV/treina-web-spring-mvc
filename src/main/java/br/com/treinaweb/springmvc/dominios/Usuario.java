package br.com.treinaweb.springmvc.dominios;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "usr_usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "usr_id")
    private Long id;

    @Column(name = "usr_username", length = 10, nullable = false)
    @Size(min = 3, max = 10, message = "O nome do usuário deve conter entre 3 e 10 caracteres.")
    @NotEmpty(message = "O nome de usuário é obrigatório")
    private String username;

    @Column(name = "usr_password", length = 150, nullable = false)
    private String password;

    @Column(name = "usr_role", length = 20, nullable = false)
    private String role;

    public Usuario() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
