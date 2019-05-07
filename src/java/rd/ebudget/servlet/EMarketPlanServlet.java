package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.EMarketPlan;
import rd.ebudget.tools.Accessories;

public class EMarketPlanServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            boolean ret = false;
            String method = request.getParameter("e_marget_plan[METHOD]");
            if (method.equals("INSERT")) {
                EMarketPlan ep = new EMarketPlan();
                ep.setProject_id(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[project_id]")));
                ep.setContest_announcement_start(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[contest_announcement_start]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                ep.setContest_announcement_end(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[contest_announcement_end]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                ep.setOpen_envelope_start(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[open_envelope_start]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                ep.setOpen_envelope_end(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[open_envelope_end]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                ep.setApprove_start(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[approve_start]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                ep.setApprove_end(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[approve_end]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                ep.setSign_promise_start(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[sign_promise_start]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                ep.setSign_promise_end(acc.ChageDateFormat(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[sign_promise_end]")), "dd-MM-yyyy", "yyyy-MM-dd"));
                
                ret = ep.InsertEMarketPlan(ep);
            } else if (method.equals("DELETE")) {
                EMarketPlan ep = new EMarketPlan();
                ep.setProject_id(acc.IsNullToEmtyString(request.getParameter("e_marget_plan[project_id]")));
                ret = ep.DeleteEMarketPlan(ep);
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
