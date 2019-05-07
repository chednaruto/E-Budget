package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.Gov.RdGoal;
import rd.ebudget.tools.Accessories;

public class RDGoalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = acc.IsNullToEmtyString(request.getParameter("rd_goal[METHOD]"));
            boolean ret = false;
            if(method.equals("INSERT")){
                RdGoal rg = new RdGoal();
                rg.setRd_goal_id(acc.IsNullToEmtyString(request.getParameter("rd_goal[rd_goal_id]")));
                rg.setRd_goal_name(acc.IsNullToEmtyString(request.getParameter("rd_goal[rd_goal_name]")));
                rg.setRd_goal_status(acc.IsNullToEmtyString(request.getParameter("rd_goal[rd_goal_status]")));
                rg.setRd_strategic_id(acc.IsNullToEmtyString(request.getParameter("rd_goal[rd_strategic_id]")));
                if(rg.getRd_goal_id().isEmpty()){
                    ret = rg.InsertRdGoal(rg);
                }else{
                    ret = rg.UpdateRdGoal(rg);
                }
            }else{
               RdGoal rg = new RdGoal();
               rg.setRd_goal_id(acc.IsNullToEmtyString(request.getParameter("rd_goal[rd_goal_id]")));
               ret = rg.DeleteRdGoal(rg);
            }
            if(ret){
                out.print("TRUE");
            }else{
                out.print("FALSE");
            }
            out.flush();
            out.close();
        }catch(Exception ex){
            
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
