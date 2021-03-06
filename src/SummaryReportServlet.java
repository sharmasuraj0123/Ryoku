import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SummaryReportServlet")
public class SummaryReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println(ManagerLevelTransaction.listMostSalesByCustRep());

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request, 2)){

            RequestDispatcher d = request.getServletContext().getRequestDispatcher("/my-account-mgr-summary-report.jsp");
            d.forward(request, response);

        } else
            response.sendRedirect("/err9");
    }
}
