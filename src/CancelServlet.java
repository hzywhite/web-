

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

public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setCharacterEncoding("utf-8");
		//request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String phone = request.getParameter("phone");
		String flightno = request.getParameter("flightno");
		String seatno = request.getParameter("seatno");
		System.out.println("phone: "+phone+"flightno: "+flightno+"seatno: "+seatno);
		OrderDaoImpl order = new OrderDaoImpl();
		boolean flag = order.OrderCancel(phone,flightno,seatno);
		if (flag) {
			request.setAttribute("phone", phone);
			response.sendRedirect("order_ddcx.jsp?phone="+phone);
			
			
		} else {
			request.getRequestDispatcher("false.html").forward(request, response);
		}
		

	}

}
