package receitasedespesas.modelo.persistencia.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import receitasedespesas.modelo.entidade.ListaItem;

@Repository
public interface ListaItemRepositorio extends JpaRepository<ListaItem,Integer> {

	@Query("select listaItem from ListaItem listaItem where listaItem.lista.nome = ?1")
	List <ListaItem> consultarListaItemPorListaNome(String nome);
	
	@Query("select listaItem from ListaItem listaItem where listaItem.listaItemPai.id = ?1")
	List <ListaItem> consultarListaItemPorListaItemPai(Integer id);
	
	
}
