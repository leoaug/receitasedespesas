package receitasedespesas.modelo.persistencia.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import receitasedespesas.modelo.entidade.ListaItem;

@Repository
public interface ListaItemRepositorio extends CrudRepository<ListaItem,Integer> {

}
