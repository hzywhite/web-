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
 
    	//���Է��ظ���������ĵ���Ӧ��
    	response.setContentType("text/html; charset=UTF-8");
    	
    	//ʹ��Tomcat�п�����ʾ����
    	request.setCharacterEncoding("UTF-8"); 
    	
        //System.out.println("��ȡ��ֵ����name:" + request.getParameter("name"));
    	String from = request.getParameter("From");
    	String to = request.getParameter("To");
    	String data = request.getParameter("Data");
    	
    	System.out.println("reserveServlet:"+from+to+data);
        
    	//����Ϊ��
        FlightsDao flightsDaoImpl = new FlightsDaoImpl();
        //List<Flights> flight = flightsDaoImpl.inquire(from,to,data);
        //System.out.println(flight);
 
    }
 
}
