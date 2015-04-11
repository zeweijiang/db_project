package Servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddEvent
 */
@WebServlet("/AddEvent")
public class AddEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEvent() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("./Event").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null) {
			request.getRequestDispatcher("index.jsp")
					.forward(request, response);
		} else {
			StringBuilder sb=new StringBuilder();
			try {
				java.util.Date startTime = new SimpleDateFormat(
						"MM/dd/yyyy HH:mm").parse(request
						.getParameter("startTime"));
				java.util.Date endTime = new SimpleDateFormat(
						"MM/dd/yyyy HH:mm").parse(request
						.getParameter("endTime"));
				if (Server.db.insertEvent(request.getParameter("eventName"),
						request.getParameter("cid"),
						request.getParameter("vid"),
						request.getParameter("tid"),
						request.getParameter("cssn"), startTime, endTime)) {
					request.setAttribute("notify", "Success!");
				} else {
					request.setAttribute("message",
							"Please check the field of the input!");
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				request.setAttribute("message",
						"Please check the field of the Date!");
			}
		}
		request.getRequestDispatcher("./Event").forward(request, response);
		// TODO Auto-generated method stub
	}
}
