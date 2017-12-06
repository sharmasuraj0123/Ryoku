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
            if (request.getParameter("updateUser").toString().equals("1")){
                System.out.println("in post 2");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String emailAddress = request.getParameter("emailAddress");

                int mobile = Integer.parseInt(request.getParameter("mobile"));

                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");

                int zipCode = Integer.parseInt(request.getParameter("zipCode"));
                long cc = Integer.parseInt(request.getParameter("creditCard"));

                String pass = request.getParameter("password_old");

                int pid = Integer.parseInt(request.getParameter("person_id"));
                int cid = Integer.parseInt(request.getParameter("customer_id"));

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
