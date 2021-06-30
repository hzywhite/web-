import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FlightsDao;
import com.dao.FlightsDaoImpl;
import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entity.Flights;
import com.entity.User;
 
public class ReserveServlet extends HttpServlet {
 
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    	//可以返回给浏览器中文的响应；
    	response.setContentType("text/html; charset=UTF-8");
    	
    	//使得Tomcat中可以显示中文
    	request.setCharacterEncoding("UTF-8"); 
    	
        //System.out.println("获取单值参数name:" + request.getParameter("name"));
    	String from = request.getParameter("From");
    	String to = request.getParameter("To");
    	String data = request.getParameter("Data");
    	
    	System.out.println("reserveServlet:"+from+to+data);
        
    	//输入为空
        FlightsDao flightsDaoImpl = new FlightsDaoImpl();
        //List<Flights> flight = flightsDaoImpl.inquire(from,to,data);
        //System.out.println(flight);
 
    }
 
}
