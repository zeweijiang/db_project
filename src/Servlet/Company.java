package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class Company
 */
@WebServlet("/Company")
public class Company extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {

			// TODO Auto-generated method stub
			String order = request.getParameter("order");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			String companyName = request.getParameter("companyName");

			JSONArray companyid = Server.db.showcompanyid();

			JSONArray array = Server.db.showCompanies(order, city, state,
					country, companyName);

			request.setAttribute("type", "Company");
			request.setAttribute("data", array);
			request.setAttribute("companyid", companyid);
			for (int i = 0; i < companyid.length(); i++) {
				String cid = Integer.toString((int) ((JSONObject) (companyid
						.get(i))).get("cid"));
				JSONArray tmp = Server.db.canWorkFor(cid);
				request.setAttribute("companyid+" + cid, tmp);
			}
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		// TODO Auto-generated method stub
	}

}
