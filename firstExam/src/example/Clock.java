package example;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Clock {
	public String now() {
		Date nowDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("HH시 mm분 ss초");
		return format.format(nowDate);
	}
}
