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

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class Event
 */
@WebServlet("/Event")
public class Event extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Event() {
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
			String cname = request.getParameter("cname");
			String type = request.getParameter("type");
			String id = request.getParameter("id");
			String searchdate = request.getParameter("searchdate");
			java.util.Date date = null;
			try {
				if (searchdate != "" && searchdate != null)
					date = new SimpleDateFormat("dd/MM/yyyy HH:mm")
							.parse(searchdate);
				else
					date = null;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				request.setAttribute("message",
						"Please check the field of the Date!");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			}

			JSONArray array = Server.db
					.showEvents(order, cname, type, id, date);
			JSONArray customerid = Server.db.showcustomerid();
			JSONArray companyid = Server.db.showcompanyid();
			JSONArray eventtypeid = Server.db.showeventtypeid();
			JSONArray venueid = Server.db.showvenueid();

			request.setAttribute("type", "Event");
			request.setAttribute("data", array);
			request.setAttribute("customerid", customerid);
			request.setAttribute("companyid", companyid);
			request.setAttribute("eventtypeid", eventtypeid);
			request.setAttribute("venueid", venueid);

			for (int i = 0; i < array.length(); i++) {
				String eid = Integer
						.toString((int) ((JSONObject) (array.get(i)))
								.get("eid"));
				JSONArray tmp = Server.db.showPartipants(eid);
				request.setAttribute("array+" + eid, tmp);
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
	}

}
