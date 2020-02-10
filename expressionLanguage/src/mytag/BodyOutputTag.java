package mytag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class BodyOutputTag extends SimpleTagSupport{
	
	@Override
	public void doTag() throws JspException, IOException {
		// JspFragment 커스텀 태그의 몸체를 처리하는 객체
		JspFragment body = this.getJspBody();
		
		System.out.println("커스텀 태그의 바디가 실행되기 전");
		body.invoke(null);
		System.out.println("커스텀 태그의 바디가 실행되기 후");
	}
}
