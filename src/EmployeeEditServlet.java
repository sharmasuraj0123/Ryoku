import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet(name = "EmployeeEditServlet")
public class EmployeeEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request,1) || _Functions.isValidSession(request,2)){
            if (request.getParameter("updateEmp").toString().equals("1")){

                int person_id = _Functions.getInteger("" + request.getParameter("person_id"));
                int employee_id = _Functions.getInteger("" + request.getParameter("employee_id"));
                String emailAddress = "" + request.getParameter("emailAddress");
                String password_old = "" + request.getParameter("password_old");
                String firstName = "" + request.getParameter("firstName");
                String lastName = "" + request.getParameter("lastName");
                int mobile = _Functions.getInteger("" + request.getParameter("mobile"));
                String address = "" + request.getParameter("address");
                String city = "" + request.getParameter("city");
                String state = "" + request.getParameter("state");
                int zipCode = _Functions.getInteger("" + request.getParameter("zipCode"));
                int ssn = _Functions.getInteger("" + request.getParameter("SSN"));
                double hrPay = Double.parseDouble(request.getParameter("hourlyPay"));
                int mgr = 0;
                String manager = request.getParameter("manager");
                if (manager != null && manager.equals("on")){
                    mgr = 1;
                }
                try {
                    if (password_old.equals("")){
                        password_old = ManagerLevelTransaction.getEmployee(person_id).getPassword();
                    }

                    double rating = ManagerLevelTransaction.getEmployee(person_id).getRating();

                    ManagerLevelTransaction.editEmployee(employee_id, person_id, firstName
                        , lastName, emailAddress, password_old, address, city, state, zipCode,
                            mobile, ssn, hrPay, mgr,rating
                    );

                    response.sendRedirect("/my-account/employee/list");
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request, 1) || _Functions.isValidSession(request, 2)){

            int person_id = _Functions.getInteger(request.getParameter("id"));

            try {
                Employees employee = ManagerLevelTransaction.getEmployee(person_id);

                request.setAttribute("employee", employee);
                SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
                request.setAttribute("startDate", dateFormat.format(employee.getStartDate()));

                RequestDispatcher d = request.getServletContext().getRequestDispatcher("/my-account-mgr-edit-employee.jsp");
                d.forward(request,response);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        } else
            response.sendRedirect("/error401");
    }
}
