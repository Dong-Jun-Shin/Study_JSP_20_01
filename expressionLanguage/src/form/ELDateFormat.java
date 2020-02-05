package form;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ELDateFormat {
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd(E) HH:mm:ss");

	public static String toFormat(Date date) {
		return df.format(date);
	}

	public static int getAge(String date) throws ParseException {
		// 받아온 문자 가공
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date inputDate = sdf.parse(date);
		
		// 현재 시간
		Date nowDate = new Date();

		//
		long ageMillis = nowDate.getTime() - inputDate.getTime();
		Date ageDate = new Date(ageMillis);
		
		Calendar ageCal = Calendar.getInstance();
		ageCal.setTime(ageDate);
		
		int age = ageCal.get(Calendar.YEAR) - 1970;

		return age;
	}
}
