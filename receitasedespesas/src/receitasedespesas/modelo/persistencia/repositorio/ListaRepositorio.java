package receitasedespesas.modelo.persistencia.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import receitasedespesas.modelo.entidade.Lista;

@Repository
public interface ListaRepositorio extends JpaRepository<Lista,Integer> {

}
