
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.SpecificMethodPlan;
import rd.ebudget.tools.Accessories;

public class SpecificMethodPlanServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            String method = request.getParameter("selection_method_plan[METHOD]");
            boolean ret = false;
            if(method.equals("INSERT")){
                SpecificMethodPlan sp = new SpecificMethodPlan();
                sp.setProject_id(request.getParameter("selection_method_plan[project_id]"));
                sp.setInvitation_announcement_start(acc.ChageDateFormat(request.getParameter("selection_method_plan[invitation_announcement_start]"),"dd-MM-yyyy","yyyy-MM-dd"));
                sp.setInvitation_announcement_end(acc.ChageDateFormat(request.getParameter("selection_method_plan[invitation_announcement_end]"),"dd-MM-yyyy","yyyy-MM-dd"));
                sp.setBoard_review_start(acc.ChageDateFormat(request.getParameter("selection_method_plan[board_review_start]"),"dd-MM-yyyy","yyyy-MM-dd"));
                sp.setBoard_review_end(acc.ChageDateFormat(request.getParameter("selection_method_plan[board_review_end]"),"dd-MM-yyyy","yyyy-MM-dd"));
                sp.setApprove_start(acc.ChageDateFormat(request.getParameter("selection_method_plan[approve_start]"),"dd-MM-yyyy","yyyy-MM-dd"));
                sp.setApprove_end(acc.ChageDateFormat(request.getParameter("selection_method_plan[approve_end]"),"dd-MM-yyyy","yyyy-MM-dd"));
                sp.setSign_promise_start(acc.ChageDateFormat(request.getParameter("selection_method_plan[sign_promise_start]"),"dd-MM-yyyy","yyyy-MM-dd"));
                sp.setSign_promise_end(acc.ChageDateFormat(request.getParameter("selection_method_plan[sign_promise_end]"),"dd-MM-yyyy","yyyy-MM-dd"));
                ret = sp.InsertSpecificMethodPlan(sp);
            }else if(method.equals("DELETE")){
                SpecificMethodPlan sp = new SpecificMethodPlan();
                sp.setProject_id(request.getParameter("selection_method_plan[project_id]"));
                ret = sp.DeleteSpecificMethodPlan(sp);
                
            }
            if(ret){
                out.write("TRUE");
            }else{
                out.write("FALSE");
            }
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

}
