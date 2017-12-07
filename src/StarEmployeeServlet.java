import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "StarEmployeeServlet")
public class StarEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (_Functions.isValidSession(request, 2)) {

            try {

                String emp_data = ManagerLevelTransaction.listMostSalesByCustRep();

                String [] data = emp_data.split("~");

                for(int i=0;i < data.length;i++){
                    System.out.println(data[i]+"  ");
                }

                // add the attributes in request
                request.setAttribute("str-email",data[0]);
                request.setAttribute("str-address",data[1]);
                request.setAttribute("str-city",data[2]);
                request.setAttribute("str-state",data[3]);
                request.setAttribute("str-zipCode",data[4]);
                request.setAttribute("str-startDate",data[5]);
                request.setAttribute("str-hrPay",data[6]);
                request.setAttribute("str-rating",data[7]);
                request.setAttribute("str-revenue",data[8]);

                RequestDispatcher rd = request.getRequestDispatcher("/my-account-mgr-star-emp.jsp");
                rd.forward(request,response);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        } else {
            response.sendRedirect("/error403");
        }
    }
}
