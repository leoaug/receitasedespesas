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

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idObjeto", "NotEmpty.receitaDespesa.idObjeto");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idEvento", "NotEmpty.receitaDespesa.idEvento");
		/*
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "listaItemCategoria", "NotEmpty.receitaDespesa.listaItemCategoria");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "listaItemSubCategoria", "NotEmpty.receitaDespesa.listaItemSubCategoria");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idStatus", "NotEmpty.receitaDespesa.idStatus");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idCreditoDebito", "NotEmpty.receitaDespesa.idCreditoDebito");
		*/

		/*
		if(receitaDespesa.getIdObjeto() == null || receitaDespesa.getIdObjeto() <= 0){
			errors.rejectValue("idObjeto", "NotEmpty.receitaDespesa.idObjeto");
		}
		
		if(receitaDespesa.getIdEvento() == null || receitaDespesa.getIdEvento() <= 0){
			errors.rejectValue("idEvento", "NotEmpty.receitaDespesa.idEvento");
		}
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
