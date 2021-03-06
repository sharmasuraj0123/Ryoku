import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "EmployeeListServlet")
public class EmployeeListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request, 2)) {

            try {
                ArrayList<Employees> employees = ManagerLevelTransaction.getEmployeesList();
                request.setAttribute("employeeList", employees);

                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/my-account-mgr-emp-list.jsp");
                dispatcher.forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("/error403");
        }
    }
}
