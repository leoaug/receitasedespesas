package receitasedespesas.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import receitasedespesas.modelo.entidade.ReceitaDespesa;
import receitasedespesas.modelo.persistencia.repositorio.ListaRepositorio;

@Controller
public class ReceitasDespesasControlador {

	@Autowired
	private ListaRepositorio listaRepositorio;

	@RequestMapping(value = "/inicioReceitasDespesasControlador", method = RequestMethod.GET)
	public ModelAndView inicioReceitasDespesasControlador(ModelMap modelMap) {
		return new ModelAndView("receitasedespesas", "command", new ReceitaDespesa());
	}

	@RequestMapping(value = "/processForm", params = "salvar", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView salvar(ReceitaDespesa receitaDespesa, ModelMap modelMap) {
		System.out.println(receitaDespesa.getIdObjeto());
		
		//modelMap.addAttribute("idObjeto", receitaDespesa.getIdObjeto());
		//modelMap.addAttribute("idEvento", receitaDespesa.getIdEvento());
		
		listaRepositorio.findAll();
		
		modelMap.addAttribute(receitaDespesa);
		/**
		 * voltando para a mesma página
		 */
		return new ModelAndView("receitasedespesas", "command",receitaDespesa);
	}
	
	@RequestMapping(value = "demo1", method = RequestMethod.GET)
	@ResponseBody
	public String demo1(ModelMap modelMap){
		
		return "testee" ;
	}

	@RequestMapping(value = "/processForm", params = "action2", method = RequestMethod.POST)
	public void action2() {
		System.out.println("Action2 block called");
	}
}
