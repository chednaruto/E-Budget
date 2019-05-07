package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.TermOfPaymentPlan;
import rd.ebudget.tools.Accessories;

public class TermOfPaymentPlanServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            boolean ret = false;
            String method = request.getParameter("term_of_payment_plan[METHOD]");
            if (method.equals("INSERT")) {
                TermOfPaymentPlan tp = new TermOfPaymentPlan();
                tp.setProject_id(request.getParameter("term_of_payment_plan[project_id]"));
                tp.setTerm_of_payment_plan_id(acc.IsNullToEmtyString(request.getParameter("term_of_payment_plan[term_of_payment_plan_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("term_of_payment_plan[term_of_payment_plan_id]")));
                tp.setTerm_of_payment_plan_deliver_date(acc.ChageDateFormat(request.getParameter("term_of_payment_plan[term_of_payment_plan_deliver_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                tp.setTerm_of_payment_plan_budget(Double.parseDouble(request.getParameter("term_of_payment_plan[term_of_payment_plan_budget]")));
                tp.setTerm_of_payment_plan_check_date(acc.ChageDateFormat(request.getParameter("term_of_payment_plan[term_of_payment_plan_check_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                tp.setTerm_of_payment_plan_approve_payment_date(acc.ChageDateFormat(request.getParameter("term_of_payment_plan[term_of_payment_plan_approve_payment_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                tp.setTerm_of_payment_plan_payment_date(acc.ChageDateFormat(request.getParameter("term_of_payment_plan[term_of_payment_plan_payment_date]"), "dd-MM-yyyy", "yyyy-MM-dd"));
                ret = tp.InsertTermOfPaymentPlan(tp);

            } else if (method.equals("DELETE")) {
                TermOfPaymentPlan tp = new TermOfPaymentPlan();
                tp.setProject_id(request.getParameter("term_of_payment_plan[project_id]"));
                tp.setTerm_of_payment_plan_id(Integer.parseInt(request.getParameter("term_of_payment_plan[term_of_payment_plan_id]")));
                ret = tp.DeleteTermOfPaymentPlan(tp);
            }
            if (ret) {
                out.write("TRUE");
            } else {
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
