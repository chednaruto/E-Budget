
package rd.ebudget.servlet.LookUp;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.User;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DataUser;

public class GetUserInfoEOffice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            DataUser user = authenUser("ECARUser", "ECARPass", acc.IsNullToEmtyString(request.getParameter("id")));
            if(user.isAuthen()){
                User u = new User();
                u.setId(user.getID());
                u.setTitle(user.getTITLE());
                u.setFname(user.getFNAME());
                u.setLname(user.getLNAME());
                u.setLevel(user.getLEVEL());
                u.setClass_data(user.getCLASSData());
                u.setClass_new(user.getCLASSNEW());
                u.setEmail(user.getEMAIL());
                u.setEmpstatus(user.getEMPSTATUS()=="" ? 0:Integer.parseInt(user.getEMPSTATUS()));
                u.setEmptype(user.getEMPTYPE()=="" ? 0:Integer.parseInt(user.getEMPTYPE()));
                u.setGroupname(user.getGROUPNAME());
                u.setIsadmin(user.getISADMIN());
                u.setOfficeid(user.getOFFICEID());
                u.setOfficename(user.getOFFICENAME());
                u.setPin(user.getPIN());
                u.setPosact(user.getPOSACT());
                u.setPosition_m(user.getPOSITIONM());
                u.setPosname(user.getPOSNAME());
                u.setSkillid(user.getSKILLID());
                if(u.CheckUsage(u)){
                    u.InsertUser(u);
                }else{
                    u.UpdateUser(u);
                }
            }
            
            
            Gson gson = new Gson();
            out.print(gson.toJson(user));
            out.flush();
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
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
