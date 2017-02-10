package receitasedespesas.modelo.persistencia.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import receitasedespesas.modelo.entidade.ReceitaDespesa;

@Repository
public interface ReceitaDespesaRepositorio extends CrudRepository<ReceitaDespesa,Integer> {
}
