package receitasedespesas.util;


import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @author Leonardo silva
 *
 */
public class DataUtil {
	
	

	
	public static Date stringToDate(String dataString, String formato)
			throws Exception {
		Date dataR = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(formato);
			dataR = sdf.parse(dataString);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dataR;
	}


	public static String dateToString(Date data, String formatoDestino)
			throws Exception {

		String dataString = "";
		try {
			if(data != null){
				SimpleDateFormat sdfDestino = new SimpleDateFormat(formatoDestino);
				dataString = sdfDestino.format(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return dataString;
	}



}
