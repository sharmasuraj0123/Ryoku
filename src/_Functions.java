import javax.servlet.http.HttpServletRequest;

public class _Functions  {
    public static boolean isValidSession(HttpServletRequest request, int level){

        if (level == 0){
            if (request.getSession().getAttribute("customer") == null)
                return false;
            return  (!(request.getSession().getAttribute("customer").toString().equals("")));
        }

        if (request.getSession().getAttribute("employee") == null)
            return false;
        Employees e = ((Employees)request.getSession().getAttribute("employee"));

        if (level == 1){
            if (!e.isManager())
                return true;
        }

        if (level == 2){
            if (e.isManager())
                return true;
        }

        return false;
    }

    public static int getInteger(String val){
        if (val == null) return 0;
        if (val.equals("")) return  0;
        else {
            int n = 0;
            try{
                n = Integer.parseInt(val);
            } catch (Exception e){
                n = 0;
            }
            return n;
        }
    }
}
