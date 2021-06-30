import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	public void init(ServletConfig config) {
		System.out.println("init of Hello Servlet");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		// ʹ��getHeaderNames������ȡ��������ݵ�ͷ��Ϣ
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String header = headerNames.nextElement();
			String value = request.getHeader(header);
			System.out.printf("%s\t%s%n", header, value);
		}

		try {
			response.getWriter().println("<h1>Hi Servlet!</h1>");
			response.getWriter().println(new Date().toLocaleString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}