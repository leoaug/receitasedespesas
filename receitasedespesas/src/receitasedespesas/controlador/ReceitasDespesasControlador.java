package receitasedespesas.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import receitasedespesas.modelo.entidade.ReceitaDespesa;
import receitasedespesas.modelo.persistencia.repositorio.ListaRepositorio;

@Controller(value = "receitasDespesasControlador")
public class ReceitasDespesasControlador {

	@Autowired
	private ListaRepositorio listaRepositorio;

	@RequestMapping(value = "/employee", method = RequestMethod.GET)
	public ModelAndView showForm() {
		return new ModelAndView("employeeHome", "employee", new ReceitaDespesa());
	}

	@RequestMapping(value = "/processForm", params = "action1", method = RequestMethod.POST)
	public void action1() {
		System.out.println("Action1 block called");
	}

	@RequestMapping(value = "/processForm", params = "action2", method = RequestMethod.POST)
	public void action2() {
		System.out.println("Action2 block called");
	}
}
