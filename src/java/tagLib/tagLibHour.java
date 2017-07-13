import java.io.IOException; 
import java.text.SimpleDateFormat; 
import java.util.Calendar;

import javax.servlet.jsp.JspException; 
import static javax.servlet.jsp.tagext.Tag.SKIP_BODY;
import javax.servlet.jsp.tagext.TagSupport;

public class tagLibHour extends TagSupport {


     public tagLibHour() { 
         super(); 
     }


     public int doStartTag() throws JspException { 
        try { 
            String formatoLong = "EEEEEE',' dd 'de' MMMM 'de' yyyy"; 
            SimpleDateFormat formatter = new SimpleDateFormat(formatoLong); 
            String horaAtual = formatter.format(Calendar.getInstance().getTime());

            pageContext.getOut().print(horaAtual); 
        } catch (IOException e) { 
            throw new JspException(e.getMessage()); 
        }

        return SKIP_BODY; 
     } 
     
     public int doEndTag() throws JspException { 
        return SKIP_BODY; 
     } 
}