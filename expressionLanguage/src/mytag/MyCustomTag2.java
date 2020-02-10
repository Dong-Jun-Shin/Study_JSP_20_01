package mytag;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MyCustomTag2 extends SimpleTagSupport{
	
	@Override
	public void doTag() throws JspException, IOException {
		// JSP 페이지에 대한 정보를 가지고 있는 객체.
		JspContext context = this.getJspContext();
		// JspWriter 객체 반환.
		JspWriter out = context.getOut();
		// JspFragment 커스텀 태그의 몸체를 처리하는 객체
		JspFragment body = this.getJspBody();
		
		// body.invoke(null);
		
		StringWriter sw = new StringWriter();
		// 커스텀 태그의 몸체에 있는 내용을 추출한 다음, invoke(Writer w) 메서드의 인자로
		// 지정된 출력스트림에 추출된 내용을 출력한다.
		// 즉 추출된 커스텀 태그의 몸체를 sw에 출력한다. (String 버퍼에 출력한다.)
		body.invoke(sw);
		String str = sw.toString();
		out.print(str.toUpperCase());
		
		return;
	}
}
