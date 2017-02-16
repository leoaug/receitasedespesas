package receitasedespesas.controlador;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import receitasedespesas.bean.BeanSelect;
import receitasedespesas.modelo.entidade.ListaItem;
import receitasedespesas.modelo.entidade.ReceitaDespesa;
import receitasedespesas.modelo.persistencia.repositorio.ListaItemRepositorio;
import receitasedespesas.modelo.persistencia.repositorio.ReceitaDespesaRepositorio;
import receitasedespesas.util.DataUtil;
import receitasedespesas.validador.ReceitaDespesaValidador;

@Controller
public class ReceitaDespesaControlador {


	
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
			
			this.init(model, new ReceitaDespesa());
					
			return "receitasedespesas";
		} catch (Exception e) {
			throw e;
		}
	}
	
	public void init(Model model,ReceitaDespesa receitaDespesa){
		try {
			List <ListaItem> listaItens = (List<ListaItem>) listaItemRepositorio.consultarListaItemPorListaNome("lista_categoria");
			
			model.addAttribute("listaItemCategoria", listaItens);		
			model.addAttribute("listaItemSubCategoria",new ArrayList<ListaItem>());		
			model.addAttribute("receitaDespesa",receitaDespesa);
				
			ObjectMapper objectMapper = new ObjectMapper();		
			objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS,false);
			//objectMapper.configure(SerializationFeature.FAIL_ON_SELF_REFERENCES ,false);
			
			List <ReceitaDespesa> lista = (List<ReceitaDespesa>) receitaDespesaRepositorio.findAll();
			for(ReceitaDespesa receitaDespesaList: lista){
				receitaDespesaList.setDataLancamentoString(DataUtil.dateToString(receitaDespesaList.getDataLancamento(), "dd/MM/yyyy"));
				receitaDespesaList.setDataCriacaoString(DataUtil.dateToString(receitaDespesaList.getDataCriacao(), "dd/MM/yyyy"));
				receitaDespesaList.setDataAtualizacaoString(receitaDespesaList.getDataAtualizacao() == null ? null : DataUtil.dateToString(receitaDespesaList.getDataAtualizacao(), "dd/MM/yyyy"));
			}
			
			model.addAttribute("listaReceitaDespesa",objectMapper.writeValueAsString(lista));
			
			carregarJsonListaItemCategoriaSelect(model,listaItens);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void limparCampos(ReceitaDespesa receitaDespesa){
		
		try{
			
			receitaDespesa.setComentario("");
			receitaDespesa.setDescricaoEvento("");
			receitaDespesa.setIdEvento(null);
			receitaDespesa.getListaItemCategoria().setId(0);
			receitaDespesa.getListaItemSubCategoria().setId(0);
		} catch(Exception e){
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/processForm.html", params = "salvar", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView salvar(@ModelAttribute("receitaDespesa") @Validated ReceitaDespesa receitaDespesa,
			BindingResult result, Model model, final RedirectAttributes redirectAttributes) {
		
		try {
		
			if (result.hasErrors()) {
				model.addAttribute("msgAviso", "Campos com (*) são Obrigatórios");
			} else {
				
				receitaDespesa.setDataCriacao(new Date(System.currentTimeMillis()));
				receitaDespesa.setListaItemCategoria(listaItemRepositorio.findOne(receitaDespesa.getListaItemCategoria().getId()));  
				receitaDespesa.setListaItemSubCategoria(listaItemRepositorio.findOne(receitaDespesa.getListaItemSubCategoria().getId()));		
				receitaDespesa.setDataLancamento(DataUtil.stringToDate(receitaDespesa.getDataLancamentoString(), "dd/MM/yyyy") );
							
				receitaDespesaRepositorio.save(receitaDespesa);	
			
				model.addAttribute("receitaDespesa",receitaDespesa);
				
				model.addAttribute("msgSucesso", "Receita de Despesa salvo.");
				
				
			}
			
			limparCampos(receitaDespesa);
			
			init(model,receitaDespesa);
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msgErro", "Erro ao salvar a Receita de Despesa");
		}
		return new ModelAndView("receitasedespesas","receitaDespesa",receitaDespesa);
	}

	
	@RequestMapping(value = "/processForm.html", params = "novo", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView novo(Model model){
		init(model, new ReceitaDespesa());
		return new ModelAndView("receitasedespesas","receitaDespesa",new ReceitaDespesa());
	}
	
	@RequestMapping(value = "/editarOuExcluirReceitaDespesa" , method = {RequestMethod.POST})
	@ResponseBody
	public ModelAndView editarOuExcluirReceitaDespesa(@RequestBody ReceitaDespesa receitaDespesa,Model model){		
		

		try {
			if(receitaDespesa.getAction() != null && receitaDespesa.getAction().equals("edit")){
				receitaDespesa.setDataAtualizacao(new Date(System.currentTimeMillis()));
				receitaDespesa.setListaItemCategoria(listaItemRepositorio.findOne(receitaDespesa.getListaItemCategoria().getId()));  
				receitaDespesa.setListaItemSubCategoria(listaItemRepositorio.findOne(receitaDespesa.getListaItemSubCategoria().getId()));		
				receitaDespesa.setDataLancamento(DataUtil.stringToDate(receitaDespesa.getDataLancamentoString(), "dd/MM/yyyy") );
				
				receitaDespesaRepositorio.save(receitaDespesa);
			} else {
				receitaDespesaRepositorio.delete(receitaDespesaRepositorio.findOne(receitaDespesa.getId()) );
			}
			
			init(model,receitaDespesa);
			
			System.out.println(receitaDespesa);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ModelAndView("receitasedespesas","receitaDespesa",receitaDespesa); 
	}
	


	public void carregarJsonListaItemCategoriaSelect(Model model,List <ListaItem> listaItens ) throws Exception {
		try {
			
			ObjectMapper objectMapper = new ObjectMapper();		
			objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS,false);
			
			List <BeanSelect> lista = new ArrayList<BeanSelect>();
			for(ListaItem listaItem :  listaItens){
				BeanSelect beanSelect = new BeanSelect();
				beanSelect.setValue(listaItem.getId());
				beanSelect.setLabel(listaItem.getDescricao());
				
				lista.add(beanSelect);
			}
			
			model.addAttribute("listaItemCategoriaJson", objectMapper.writeValueAsString(lista)) ;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@RequestMapping(value = "/listarSubCategoria.html", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String listarSubCategoria(@RequestParam("idLista") String idLista,Model model){
		
		

		List <ListaItem> listaItens = (List<ListaItem>) listaItemRepositorio.consultarListaItemPorListaItemPai(Integer.parseInt(idLista));
		
		StringBuilder builder = new StringBuilder();
		builder.append("<label for=\"listaItemSubCategoria.id\">Sub Categoria</label>");
		builder.append("<select id=\"idListaItemSubCategoria\" name=\"listaItemSubCategoria.id\" class=\"form-control\">"); 
			builder.append("<option label=\"NONE\" value=\"0\">Selecionar</option>");
			for(ListaItem listaItem : listaItens){
				builder.append("<option value=\""+listaItem.getId()+"\">"+listaItem.getDescricao()+"</option>");
			}
		builder.append("</select>");
		
		
		return builder.toString();
		
	}
	

}
