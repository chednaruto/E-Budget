package rd.ebudget.servlet.LookUp;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.Gov.RdTactics;
import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;


public class GetRDTactics extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String[] td_goal_id = request.getParameterValues("rd_goal_id[]");
            String condition = "";
            for (int i = 0; i < td_goal_id.length; i++) {
                condition += td_goal_id[i] + ",";
            }
            condition = condition.substring(0, condition.length() - 1);
            String query = "SELECT * FROM e_budget.rd_tactics WHERE rd_goal_id IN(" + condition + ") AND rd_tactics_status= 'Y'";
            DB2Manager mm = new DB2Manager();
            ResultSet rs = mm.GetDataAsResultSet(query);
            Vector<RdTactics> rdtactics = new Vector<>();
            RdTactics rdtactic ;
            while(rs.next()){
                rdtactic = new RdTactics();
                rdtactic.setRd_goal_id(rs.getString("rd_goal_id"));
                rdtactic.setRd_tactics_id(rs.getString("rd_tactics_id"));
                rdtactic.setRd_tactics_name(rs.getString("rd_tactics_name"));
                rdtactic.setRd_tactics_status(rs.getString("rd_tactics_status"));
                rdtactics.add(rdtactic);
            }
            mm.closeConnection();
            Gson gson = new Gson();
            out.print(gson.toJson(rdtactics));
            out.flush();
            out.close();
        }catch(Exception ex){
            ex.printStackTrace();
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

}
