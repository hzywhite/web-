
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FlightsDao;
import com.dao.FlightsDaoImpl;
import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entity.Flights;
import com.entity.User;
 
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
 
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    	//可以返回给浏览器中文的响应；
    	response.setContentType("text/html; charset=UTF-8");
    	
    	//使得Tomcat中可以显示中文
    	request.setCharacterEncoding("UTF-8"); 
    	
        //System.out.println("获取单值参数name:" + request.getParameter("name"));
    	String from = request.getParameter("from");
    	String to = request.getParameter("to");
    	String date = request.getParameter("date");

    	System.out.println("This is SearchServlet:");
    	System.out.println("searchServlet:from:"+from+"  to:"+to+"  date:"+date);
    	
    	if(from.equals(null)||to.equals(null)||date.equals(null)) {
    		//request.getRequestDispatcher("fail.html").forward(request, response);
    		System.out.println("三项输入不能为空！");
    		return;
    	}else {
    		   FlightsDaoImpl flightDaoImpl = new FlightsDaoImpl();
    			//flightDaoImpl.api("XIY", "PEK");
    		request.getRequestDispatcher("reserve.jsp").forward(request, response);
    	}
//        FlightsDao flightsDaoImpl = new FlightsDaoImpl();
//        
//        List<Flights> flight= flightsDaoImpl.inquire(from,to,date);
//        //System.out.println(flight);

    }
 
}
