package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.budget.DisbursementCategory;
import rd.ebudget.tools.Accessories;

public class DisbursementCategoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean ret = false;
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = acc.IsNullToEmtyString(request.getParameter("disbursement_category[METHOD]"));
            if (method.equals("INSERT")) {
                DisbursementCategory dc = new DisbursementCategory();
                dc.setDisbursement_category_id(acc.IsNullToEmtyString(request.getParameter("disbursement_category[disbursement_category_id]")));
                dc.setDisbursement_category_name(acc.IsNullToEmtyString(request.getParameter("disbursement_category[disbursement_category_name]")));
                dc.setDisbursement_category_status(acc.IsNullToEmtyString(request.getParameter("disbursement_category[disbursement_category_status]")));
                dc.setBudget_category_id(acc.IsNullToEmtyString(request.getParameter("disbursement_category[budget_category_id]")));
                if (dc.getDisbursement_category_id().isEmpty()) {
                    ret = dc.InsertDisbursementCategory(dc);
                } else {
                    ret = dc.UpdateDisbursementCategory(dc);
                }
            } else if (method.equals("DELETE")) {
                DisbursementCategory dc = new DisbursementCategory();
                dc.setDisbursement_category_id(acc.IsNullToEmtyString(request.getParameter("disbursement_category[disbursement_category_id]")));
                ret = dc.DeleteDisbursementCategory(dc);
            }
            if (ret) {
                out.print("TRUE");
            } else {
                out.print("FALSE");
            }
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
