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
 
    	//可以返回给浏览器中文的响应；
    	response.setContentType("text/html; charset=UTF-8");
    	
    	//使得Tomcat中可以显示中文
    	request.setCharacterEncoding("UTF-8"); 
    	
        String usr = request.getParameter("username");
        String id = request.getParameter("IDNum");
        String phn = request.getParameter("phonenumber");
        String pwd = request.getParameter("password");
        
        User user = new User(usr,id,phn,pwd);
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        
        System.out.println("RegisterServlet:username="+usr+id+phn+pwd);
        //注册页面
        boolean flag = userDaoImpl.register(user);
        
        if(flag) {
        	//注册成功页面
        	request.getRequestDispatcher("server.html").forward(request, response);
        }else {
        	request.getRequestDispatcher("registerFalse.html").forward(request, response);
        }
        
        // 这里的打印是打印到控制台
        System.out.println("name:"+usr);
        System.out.println("IDNum:"+id);
        System.out.println("phone:"+phn);
        System.out.println("password:"+pwd);
    }
 
}
