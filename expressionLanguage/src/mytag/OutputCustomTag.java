package mytag;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class OutputCustomTag extends SimpleTagSupport {
	private String value;
	private String addValue;

	public String getAddValue() {
		return addValue;
	}

	public void setAddValue(String addValue) {
		this.addValue = addValue;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<span>");
		out.println(getValue());
		if(getAddValue() != null) {
			out.println(getAddValue());
		}
		out.println("</span>");
	}
}
