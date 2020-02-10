package mytag;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MyCustomTag3 extends SimpleTagSupport {
	private int num1;
	private int num2;

	public int getNum1() {
		return num1;
	}
	
	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	@Override
	public void doTag() throws JspException, IOException {
		JspContext context = this.getJspContext();
		JspWriter out = context.getOut();

		int sum = getNum1() + getNum2();
		
		// out.println, print는 한번에 명령을 출력할지, 한번씩 명령을 출력할지 차이
		// 나중에 양이 많으면 Buffer를 이용하지만, 영향이 있을 가능성이 미약하게나마 있음
		out.println("<div>");
		out.println(getNum1() + " + " + getNum2() + " = " + sum);
		out.println("</div>");
	}

}
