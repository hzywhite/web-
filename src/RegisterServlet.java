import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entity.User;
 
public class RegisterServlet extends HttpServlet {
 
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    	//���Է��ظ���������ĵ���Ӧ��
    	response.setContentType("text/html; charset=UTF-8");
    	
    	//ʹ��Tomcat�п�����ʾ����
    	request.setCharacterEncoding("UTF-8"); 
    	
        String usr = request.getParameter("username");
        String id = request.getParameter("IDNum");
        String phn = request.getParameter("phonenumber");
        String pwd = request.getParameter("password");
        
        User user = new User(usr,id,phn,pwd);
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        
        System.out.println("RegisterServlet:username="+usr+id+phn+pwd);
        //ע��ҳ��
        boolean flag = userDaoImpl.register(user);
        
        if(flag) {
        	//ע��ɹ�ҳ��
        	request.getRequestDispatcher("server.html").forward(request, response);
        }else {
        	request.getRequestDispatcher("registerFalse.html").forward(request, response);
        }
        
        // ����Ĵ�ӡ�Ǵ�ӡ������̨
        System.out.println("name:"+usr);
        System.out.println("IDNum:"+id);
        System.out.println("phone:"+phn);
        System.out.println("password:"+pwd);
    }
 
}
