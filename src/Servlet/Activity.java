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
 * Servlet implementation class Activity
 */
@WebServlet("/Activity")
public class Activity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Activity() {
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
			String typeName = request.getParameter("typeName");
			JSONArray eventtypeid = Server.db.showeventtypeid();
			JSONArray array = Server.db.showActivities(order, typeName);

			request.setAttribute("type", "Activity");
			request.setAttribute("data", array);
			request.setAttribute("eventtypeid", eventtypeid);

			for (int i = 0; i < eventtypeid.length(); i++) {
				String tid = Integer.toString((int) ((JSONObject) (eventtypeid
						.get(i))).get("tid"));
				JSONArray tmp = Server.db.canWorkForActivity(tid);
				request.setAttribute("eventtypeid+" + tid, tmp);
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
