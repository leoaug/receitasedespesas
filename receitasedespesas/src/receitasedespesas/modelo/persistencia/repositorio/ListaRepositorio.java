package receitasedespesas.modelo.persistencia.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import receitasedespesas.modelo.entidade.Lista;

@Repository
public interface ListaRepositorio extends CrudRepository<Lista,Integer> {

}
