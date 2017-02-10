package receitasedespesas.controlador;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import receitasedespesas.modelo.entidade.ListaItem;
import receitasedespesas.modelo.entidade.ReceitaDespesa;
import receitasedespesas.modelo.persistencia.repositorio.ListaItemRepositorio;
import receitasedespesas.modelo.persistencia.repositorio.ReceitaDespesaRepositorio;

@Controller
public class ReceitasDespesasControlador {


	
	@Autowired
	private ListaItemRepositorio listaItemRepositorio;
	
	@Autowired
	private ReceitaDespesaRepositorio receitaDespesaRepositorio;

	
	@RequestMapping(value = "/inicioReceitasDespesasControlador", method = RequestMethod.GET)
	public String index(@ModelAttribute("receitaDespesa") ReceitaDespesa receitaDespesa, ModelMap model) {
	
		Map<Integer,String> listasItens = new LinkedHashMap<Integer,String>();
		for(ListaItem listaItem  :	listaItemRepositorio.findAll()){
			listasItens.put(listaItem.getId(), listaItem.getDescricao());
		}	
		model.addAttribute("listaItemCategoria", listasItens);		
		model.addAttribute("listaItemSubCategoria",new LinkedHashMap<Integer,String>());
	
		model.addAttribute("receitaDespesa", receitaDespesa);
		
		return "receitasedespesas";
	}
	
	
	
	/*
	@RequestMapping(value = "/inicioReceitasDespesasControlador", method = RequestMethod.GET)
	public ModelAndView inicioReceitasDespesasControlador(ModelMap modelMap) {
	
		Map<Integer,String> listasItens = new LinkedHashMap<Integer,String>();
		for(ListaItem listaItem  :	listaItemRepositorio.findAll()){
			listasItens.put(listaItem.getId(), listaItem.getDescricao());
		}	
		modelMap.addAttribute("listaItemCategoria", listasItens);		
		modelMap.addAttribute("listaItemSubCategoria",new LinkedHashMap<Integer,String>());
		
		
		return new ModelAndView("receitasedespesas", "receitaDespesa", new ReceitaDespesa());
	}
*/
	@RequestMapping(value = "/salvarReceitaDespesa", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView salvarReceitaDespesa(ReceitaDespesa receitaDespesa, ModelMap modelMap) {

		receitaDespesaRepositorio.save(receitaDespesa);		
		modelMap.addAttribute(receitaDespesa);
		return new ModelAndView("receitasedespesas", "receitaDespesa",receitaDespesa);
	}
	
	@RequestMapping(value = "demo1", method = RequestMethod.GET)
	@ResponseBody
	public String demo1(ModelMap modelMap){
		
		return "testee" ;
	}

	
	@RequestMapping(value = "listarSubCategoria", method = RequestMethod.GET)
	public ModelAndView listarSubCategoria(@RequestParam("idLista") String request , ReceitaDespesa receitaDespesa, ModelMap modelMap){
		
		Map<Integer,String> listas = new LinkedHashMap<Integer,String>();
		listas.put(1,"aeeeeee");
		
		modelMap.replace("listaItemSubCategoria", listas);
		
		return new ModelAndView("receitasedespesas", "receitaDespesa", receitaDespesa);
		
	}
	
	@RequestMapping(value = "/processForm", params = "action2", method = RequestMethod.POST)
	public void action2() {
		System.out.println("Action2 block called");
	}
}
