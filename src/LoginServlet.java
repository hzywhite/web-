import java.io.IOException;
import com.dao.*;
import com.entity.User;
import com.mysql.cj.Session;
import com.util.*;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.entity.*;
import java.util.*;
import com.dao.*;
import com.util.DBconn;

public class LoginServlet extends HttpServlet {

	// 处理post请求
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 将响应设置为UTF-8编码，使得可以响应中文
		response.setContentType("text/html; charset=UTF-8");

		String phn = request.getParameter("phoneNumber");
		String pwd = request.getParameter("password");
		
		// 将name转换成可以接收中文
		byte[] bytes = phn.getBytes("ISO-8859-1");
		phn = new String(bytes, "UTF-8");
		
		System.out.println("phoneNumber="+phn);
		System.out.println("password="+pwd);
		
		System.out.println("LoginServlet:phoneNumber="+phn+"password="+pwd);
		
		// 处理登陆
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		
		boolean flag = userDaoImpl.login(phn, pwd);
		boolean flag2 = phn.equals("admin")&&pwd.equals("admin");
		
		if ((flag==true)&&!flag2) {
			//
			request.getRequestDispatcher("search.jsp").forward(request, response);
		} else if ((flag2==true)&&!flag){
			request.getRequestDispatcher("manager.jsp").forward(request, response);
		}else if (!flag2&&!flag){
			request.getRequestDispatcher("false.html").forward(request, response);
		}
		System.out.println("name:" + phn);
		System.out.println("password:" + pwd);
	}
}