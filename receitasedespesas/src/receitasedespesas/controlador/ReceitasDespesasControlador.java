package receitasedespesas.controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.annotations.Proxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.init.ResourceReader.Type;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.validation.support.BindingAwareModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import receitasedespesas.modelo.entidade.ListaItem;
import receitasedespesas.modelo.entidade.ReceitaDespesa;
import receitasedespesas.modelo.persistencia.repositorio.ListaItemRepositorio;
import receitasedespesas.modelo.persistencia.repositorio.ReceitaDespesaRepositorio;
import receitasedespesas.validador.ReceitaDespesaValidador;

@Controller
public class ReceitasDespesasControlador {


	
	@Autowired
	private ListaItemRepositorio listaItemRepositorio;
	
	@Autowired
	private ReceitaDespesaRepositorio receitaDespesaRepositorio;
	
	@Autowired
	private ReceitaDespesaValidador receitaDespesaValidador;

	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(receitaDespesaValidador);
	}
	
	@RequestMapping(value = "/inicioReceitasDespesasControlador", method = RequestMethod.GET)
	public String index(Model model) throws Exception  {
		try {
			
			model.addAttribute("listaItemCategoria", listaItemRepositorio.findAll());		
			model.addAttribute("listaItemSubCategoria",new ArrayList<ListaItem>());		
			model.addAttribute("receitaDespesa",new ReceitaDespesa());
				
			ObjectMapper objectMapper = new ObjectMapper();		
			objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS,false);
			//objectMapper.configure(SerializationFeature.FAIL_ON_SELF_REFERENCES ,false);
			model.addAttribute("listaReceitaDespesa",objectMapper.writeValueAsString(receitaDespesaRepositorio.findAll()));
			
			System.out.println(objectMapper.writeValueAsString(receitaDespesaRepositorio.findAll()));
			
			return "receitasedespesas";
		} catch (Exception e) {
			throw e;
		}
	}

	@RequestMapping(value = "/processForm.html", params = "salvar", method = {RequestMethod.POST,RequestMethod.GET})
	public String salvar(@ModelAttribute("receitaDespesa") @Validated ReceitaDespesa receitaDespesa,
			BindingResult result, Model model, final RedirectAttributes redirectAttributes) {
		
		try {
			
		
			if (result.hasErrors()) {
				//redirectAttributes.addFlashAttribute("css", "error");
				redirectAttributes.addFlashAttribute("css", "error");
			} else {
				receitaDespesaRepositorio.save(receitaDespesa);	
			
				ObjectMapper objectMapper = new ObjectMapper();		
				objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS,false);
				model.addAttribute("listaReceitaDespesa",objectMapper.writeValueAsString(receitaDespesaRepositorio.findAll()));
				
				System.out.println(receitaDespesa);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("listaReceitaDespesa", receitaDespesaRepositorio.findAll());
		return "receitasedespesas";
	}
	
	@RequestMapping(value = "/carregarDespesasRepositorio" , method = {RequestMethod.POST,RequestMethod.GET})
	public void carregarDespesasRepositorio(Model model){
		System.out.println("teste");
		try {
			ObjectMapper objectMapper = new ObjectMapper();		
			objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS,false);
			model.addAttribute("listaReceitaDespesa",objectMapper.writeValueAsString(receitaDespesaRepositorio.findAll()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return "receitasedespesas";
	}
	
	@RequestMapping(value = "/editorReceitaDespesa" , method = RequestMethod.POST)
	public String  editorReceitaDespesa(@RequestParam String json,HttpServletResponse response){		
		

		try {
			System.out.println(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:inicioReceitasDespesasControlador";
	}
	
	@RequestMapping(value = "/listarSubCategoria.html", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String listarSubCategoria(@RequestParam("idLista") String request,Model model){
		
		Map<Integer,String> listas = new LinkedHashMap<Integer,String>();
		listas.put(1,"aeeeeee");

		
		StringBuilder builder = new StringBuilder();
		builder.append("<label for=\"listaItemSubCategoria.id\">Sub Categoria</label>");
		builder.append("<select id=\"idListaItemSubCategoria\" name=\"listaItemSubCategoria.id\" class=\"form-control\">"); 
			builder.append("<option value=\"NONE\">Selecionar</option>");
			builder.append("<option value=\"1\">boraaa</option>");
			builder.append("<option value=\"2\">verrr</option>");
		builder.append("</select>");
		
		
		return builder.toString();
		
	}
	

}
