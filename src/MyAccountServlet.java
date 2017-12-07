import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "MyAccountServlet")
public class MyAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in post 0");
        if (request.getParameter("updateUser") != null ){
            System.out.println("in post");

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String emailAddress = request.getParameter("emailAddress");

            int mobile = _Functions.getInteger(request.getParameter("mobile"));

            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");

            int zipCode = _Functions.getInteger(request.getParameter("zipCode"));
            String pass = request.getParameter("password_old");

            int pid = Integer.parseInt(request.getParameter("person_id"));

            if (request.getParameter("updateUser").toString().equals("1")){
                System.out.println("in post 2");
                long cc = _Functions.getInteger(request.getParameter("creditCard"));

                int cid = _Functions.getInteger(request.getParameter("customer_id"));

                double rat = ((Customer)request.getSession().getAttribute("customer")).getRatings();

                try {
                    CRLevelTransactions.editCustomer(firstName, lastName, address, city, state, zipCode,
                            mobile, emailAddress, cc, rat, pid, cid, pass);
                    HttpSession session = request.getSession();
                    Customer curr_customer = CustomerLevelTransaction.getCustomer(pid);
                    request.getSession().setAttribute("customer", curr_customer);

                    response.sendRedirect("/my-account");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (request.getParameter("updateUser").toString().equals("2")){
                int ssn = _Functions.getInteger(request.getParameter("socialSecurityNumber"));
                System.out.println("ssn: " + ssn);
                int eid = _Functions.getInteger(request.getParameter("employee_id"));
                double rat = ((Employees)request.getSession().getAttribute("employee")).getRating();
                boolean isManager = ((Employees)request.getSession().getAttribute("employee")).isManager();
                int mgr = 0;
                if (isManager)
                    mgr = 1;
                double hpay = ((Employees)request.getSession().getAttribute("employee")).getHourlyPay();

                try {
                   ManagerLevelTransaction.editEmployee(eid,pid,firstName,lastName,emailAddress,pass,address,city,
                           state,zipCode,mobile,ssn,hpay,mgr,rat);

                    Employees e = ManagerLevelTransaction.getEmployee(pid);
                    request.getSession().setAttribute("employee", e);

                    response.sendRedirect("/my-account");
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/log-in.jsp");
        ServletContext dispatcher2 = request.getServletContext();
        RequestDispatcher dispatcher = null;

        HttpSession session = request.getSession();

        if (session != null){
            if (session.getAttribute("person_type") != null && (int)session.getAttribute("person_type") == 0){

                dispatcher = dispatcher2.getRequestDispatcher("/my-account.jsp");
                dispatcher.forward(request, response);
            } else if (session.getAttribute("person_type") != null && (int)session.getAttribute("person_type") == 1) {
                dispatcher = dispatcher2.getRequestDispatcher("/my-account-cr.jsp");
                dispatcher.forward(request, response);
            } else if (session.getAttribute("person_type") != null && (int)session.getAttribute("person_type") == 2) {
                dispatcher = dispatcher2.getRequestDispatcher("/my-account-mgr.jsp");
                dispatcher.forward(request, response);
            } else{
                response.sendRedirect("/log-in");
            }
        } else {
            response.sendRedirect("/log-in");
        }
    }
}
