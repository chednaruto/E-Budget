package rd.ebudget.servlet.LookUp;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.tools.DataUser;

/**
 *
 * @author Mr.Tue
 */
public class GetPersonInfo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String uid = request.getParameter("uid");
            DataUser user = authenUser("ECARUser", "ECARPass", uid);
            Gson gson = new Gson();
            out.print(gson.toJson(user));
            out.flush();
            out.close();
        }catch(Exception ex){
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static DataUser authenUser(java.lang.String checkUser, java.lang.String checkPass, java.lang.String uid) {
        rd.ebudget.tools.AuthenUserEofficeECar service = new rd.ebudget.tools.AuthenUserEofficeECar();
        rd.ebudget.tools.AuthenUserEofficeECarSoap port = service.getAuthenUserEofficeECarSoap();
        return port.authenUser(checkUser, checkPass, uid);
    }

}
