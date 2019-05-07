package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.Gov.RdTactics;
import rd.ebudget.tools.Accessories;

public class RDTacticsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            boolean ret = false;
            String method = acc.IsNullToEmtyString(request.getParameter("rd_tactics[METHOD]"));
            RdTactics rt = new RdTactics();
            rt.setRd_tactics_id(acc.IsNullToEmtyString(request.getParameter("rd_tactics[rd_tactics_id]")));
            if (method.equals("INSERT")) {
                rt.setRd_tactics_name(acc.IsNullToEmtyString(request.getParameter("rd_tactics[rd_tactics_name]")));
                rt.setRd_tactics_status(acc.IsNullToEmtyString(request.getParameter("rd_tactics[rd_tactics_status]")));
                rt.setRd_goal_id(acc.IsNullToEmtyString(request.getParameter("rd_tactics[rd_goal_id]")));
                if (rt.getRd_tactics_id().isEmpty()) {
                    ret = rt.InsertRdTactics(rt);
                } else {
                    ret = rt.UpdateRdTactics(rt);
                }
            } else if (method.equals("DELETE")) {
                ret = rt.DeleteRdTactics(rt);
            }
            if(ret){
                out.write("TRUE");
            }else{
                out.write("FALSE");
            }
            out.flush();
            out.close();
        } catch (Exception ex) {

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
