package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.ReceiveBudget;
import rd.ebudget.tools.Accessories;

public class BudgetReceiveServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean ret = false;
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = acc.IsNullToEmtyString(request.getParameter("receive_budget[METHOD]"));
            if (method.equals("INSERT")) {
                ReceiveBudget rb = new ReceiveBudget();
                rb.setReceive_budget_id(acc.IsNullToEmtyString(request.getParameter("receive_budget[receive_budget_id]")));
                rb.setBudget_category_id(acc.IsNullToEmtyString(request.getParameter("receive_budget[budget_category_id]")));
                rb.setBudget_type_id(acc.IsNullToEmtyString(request.getParameter("receive_budget[budget_type_id]")));
                rb.setBudget_total(Double.parseDouble(request.getParameter("receive_budget[budget_total]")));
                rb.setBudget_receive_year(acc.IsNullToEmtyString(request.getParameter("receive_budget[budget_receive_year]")));
                rb.setBudget_receive_date(acc.ChageDateFormat(request.getParameter("receive_budget[budget_receive_date]"),"dd-MM-yyyy","yyyy-MM-dd"));
                rb.setOfficeid(acc.IsNullToEmtyString(request.getParameter("receive_budget[officeid]")));
                rb.setDisbursement_category_id(acc.IsNullToEmtyString(request.getParameter("receive_budget[disbursement_category_id]")));
                if (rb.getReceive_budget_id().isEmpty()) {
                    ret = rb.InsertReceiveBudget(rb);
                } else {
                    ret = rb.UpdateReceiveBudget(rb);
                }
            } else if (method.equals("DELETE")) {
                ReceiveBudget rb = new ReceiveBudget();
                rb.setReceive_budget_id(acc.IsNullToEmtyString(request.getParameter("receive_budget[receive_budget_id]")));
                ret = rb.DeleteReceiveBudget(rb);
            }
            if (ret) {
                out.print("TRUE");
            } else {
                out.print("FALSE");
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
