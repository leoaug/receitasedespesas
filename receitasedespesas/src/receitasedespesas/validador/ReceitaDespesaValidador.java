package receitasedespesas.validador;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * @author Leonardo Silva
 */

import receitasedespesas.modelo.entidade.ReceitaDespesa;


@Component
public class ReceitaDespesaValidador  implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ReceitaDespesa.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ReceitaDespesa receitaDespesa = (ReceitaDespesa) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "descricaoEvento", "NotEmpty.receitaDespesa.descricaoEvento");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idEvento", "NotEmpty.receitaDespesa.idEvento");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "listaItemCategoria", "NotEmpty.receitaDespesa.listaItemCategoria");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "listaItemSubCategoria", "NotEmpty.receitaDespesa.listaItemSubCategoria");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idStatus", "NotEmpty.receitaDespesa.idStatus");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idCreditoDebito", "NotEmpty.receitaDespesa.idCreditoDebito");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "comentario", "NotEmpty.receitaDespesa.comentario");
		
		if(receitaDespesa.getDescricaoEvento() == null || receitaDespesa.getDescricaoEvento().equals("")){
			errors.rejectValue("descricaoEvento", "NotEmpty.receitaDespesa.descricaoEvento");
		}
		
		if(receitaDespesa.getIdEvento() == null || receitaDespesa.getIdEvento() <= 0){
			errors.rejectValue("idEvento", "NotEmpty.receitaDespesa.idEvento");
		}
		
		if(receitaDespesa.getIdStatus() != null && receitaDespesa.getIdStatus().equals(0)){
			errors.rejectValue("idStatus", "NotEmpty.receitaDespesa.idStatus");
		}
		
		if(receitaDespesa.getIdCreditoDebito() != null && receitaDespesa.getIdCreditoDebito().equals(0)){
			errors.rejectValue("idCreditoDebito", "NotEmpty.receitaDespesa.idCreditoDebito");
		}
		
		
	

		/*
		
		
		
		*/
		
		/*
		if( receitaDespesa.getListaItemCategoria().getId() != null){
			errors.rejectValue("country", "NotEmpty.userForm.country");
		}
		
		if (!user.getPassword().equals(user.getConfirmPassword())) {
			errors.rejectValue("confirmPassword", "Diff.userform.confirmPassword");
		}
		
		if (user.getFramework() == null || user.getFramework().size() < 2) {
			errors.rejectValue("framework", "Valid.userForm.framework");
		}

		if (user.getSkill() == null || user.getSkill().size() < 3) {
			errors.rejectValue("skill", "Valid.userForm.skill");
		}
		*/
	}

}
