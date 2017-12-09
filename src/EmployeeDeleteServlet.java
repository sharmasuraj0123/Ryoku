import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EmployeeDeleteServlet")
public class EmployeeDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request,1) || _Functions.isValidSession(request,2)){
            int pid = Integer.parseInt(request.getParameter("id"));
            try {
                ManagerLevelTransaction.deleteEmployee(pid, ManagerLevelTransaction.getEmployee(pid).getEmployeeId());
                response.sendRedirect("/my-account/employee/list");
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}
