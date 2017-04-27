package br.com.treinaweb.springmvc.dominios;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "alb_album")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Album {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "alb_id")
    private Long id;

    @NotNull(message = "O nome é obrigatório")
    @NotEmpty(message = "O nome é obrigatório")
    @Size(min = 4, max = 10, message = "O nome do álbum deve conter entre 4 e 10 caracteres")
    @Column(name = "alb_nome", length = 10, nullable = false)
    private String nome;

    @NotNull(message = "O ano de lançamento é obrigatório")
    @Min(value = 1990, message = "O ano de lançamento deve ser a partir de 1990")
    @Max(value = 2030, message = "O ano de lançamento deve ser até 2030")
    @Column(name = "alb_ano_lancamento", nullable = false)
    private int anoDeLancamento;

    @OneToMany(mappedBy = "album", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
    private Set<Musica> musicas;

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

    public int getAnoDeLancamento() {
        return anoDeLancamento;
    }

    public void setAnoDeLancamento(int anoDeLancamento) {
        this.anoDeLancamento = anoDeLancamento;
    }

    public Set<Musica> getMusicas() {
        return musicas;
    }

    public void setMusicas(Set<Musica> musicas) {
        this.musicas = musicas;
    }
}
