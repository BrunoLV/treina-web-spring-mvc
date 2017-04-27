package br.com.treinaweb.springmvc.dominios;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name = "mus_musicas")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Musica {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mus_id")
    private Long id;

    @Column(name = "mus_nome", nullable = false, length = 10)
    @Size(min = 3, max = 10, message = "O nome da música deve conter entre 3 e 10 caracteres.")
    @NotEmpty(message = "O nome é obrigatório")
    @NotNull(message = "O nome é obrigatório")
    private String nome;

    @Column(name = "mus_data_criacao", nullable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull(message = "A data de criação é obrigatória")
    private Date dataCriacao;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "alb_id")
    private Album album;

    public Musica() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }
}

