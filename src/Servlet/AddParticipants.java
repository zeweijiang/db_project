package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddParticipants
 */
@WebServlet("/AddParticipants")
public class AddParticipants extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddParticipants() {
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
			if (Server.db.insertParticipant(
					request.getParameter("eidforparticipant"),
					request.getParameter("ssnforparticipant"),
					request.getParameter("firstNameofParticipant"),
					request.getParameter("lastNameofParticipant"))) {
				request.setAttribute("notify", "Success!");
			} else {
				request.setAttribute("message",
						"Please check the field of the input!");
			}
		}
		request.getRequestDispatcher("./Event").forward(request, response);
		// TODO Auto-generated method stub
	}

}
