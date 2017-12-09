import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

@WebServlet(name = "MonthlySalesServlet")
public class MonthlySalesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("month-year") != null){
            DateFormat df = new SimpleDateFormat("yyyy-MM-d", Locale.ENGLISH);

            String month = request.getParameter("month-year").toString() + "-01" ;

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
            LocalDate date = LocalDate.parse(month, formatter);

            try {
                ArrayList<String> result = ManagerLevelTransaction.getSalesReportOfAMonth(date.getMonthValue(), date.getYear());

                request.setAttribute("result", result);
                RequestDispatcher d = request.getServletContext().getRequestDispatcher("/my-account-mgr-sales-report.jsp");
                d.forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (_Functions.isValidSession(request, 2)){

            RequestDispatcher d = request.getServletContext().getRequestDispatcher("/my-account-mgr-sales-report.jsp");
            d.forward(request, response);

        } else
            response.sendRedirect("/err9");
    }
}
