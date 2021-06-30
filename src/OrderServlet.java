 

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDaoImpl;
import com.entity.Order;
import com.dao.*;
/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//处理reserve.jsp点击Buy now!传来的数据：存入flights表里，并跳到此航班具体预定信息页面
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setCharacterEncoding("utf-8");
		//request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		String endcity = request.getParameter("endcity");
		String flightno = request.getParameter("flightno");
		String airline = request.getParameter("airline");
		String departdate = request.getParameter("departdate");
		String departtime = request.getParameter("departtime");
		String arrivaldate = request.getParameter("arrivaldate");
		String arrivaltime = request.getParameter("arrivaltime");
		String departport = request.getParameter("departport");
		String departportcode = request.getParameter("departportcode");
		String departterminal = request.getParameter("departterminal");
		String arrivalport = request.getParameter("arrivalport");
		String arrivalportcode = request.getParameter("arrivalportcode");
		String arrivalterminal = request.getParameter("arrivalterminal");
		//String minprice = request.getParameter("minprice");
		String reservationtime = request.getParameter("reservationtime");
		
		
		String str_i= request.getParameter("orderid");
		String cabin = "cla"+str_i;
		String p1 = "price1";
		String p2 = "price2";
		String p3 = "price3";
		String cabinname = request.getParameter(cabin);
		String minprice="0";
		String price1 = request.getParameter(p1);
		String price2 = request.getParameter(p2);
		String price3 = request.getParameter(p3);
		String seatclass = "";
		
		if(cabinname.compareTo("price1")==0) {
			minprice = price1;
			seatclass = "economy";
		}
		else if(cabinname.compareTo("price2")==0) {
			minprice = price2;
			seatclass = "business";
		}
		else if(cabinname.compareTo("price3")==0) {
			minprice = price3;
			seatclass = "first";
		}
		FlightsDaoImpl flightsDaoImpl = new FlightsDaoImpl();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间
		String str_date1 = formatter.format(currentTime); //将日期时间格式化
		reservationtime = currentTime.toString(); //将Date型日期时间转换成字符串形式
		boolean flag = false;
		System.out.println(minprice);
		if(!minprice.equals("0"))
			flag = flightsDaoImpl.reserveFlight(phone,city,endcity,flightno,departdate,departtime,arrivaldate,arrivaltime,departport,departterminal,arrivalport,arrivalterminal,minprice,reservationtime,airline,departportcode,arrivalportcode,seatclass);
		System.out.println(flag);
		if (flag) {
			request.getRequestDispatcher("order_ddcx.jsp").forward(request, response);
			
			//request.setAttribute("phone", wefly_phoneString);
			//String temp = (String)request.getAttribute("phone");
			//System.out.println("orderservelet"+temp);
			//request.("order.jsp").forward(request, response);
			//response.sendRedirect("order_inquiry.jsp?phone="+wefly_phoneString);
			//request.getRequestDispatcher("reserve.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("noseats.html").forward(request, response);
		}
		
			
		
	}

}
