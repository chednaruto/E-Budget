package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.AllocateBudget;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.EBudgetTools;

public class AllocateBudgetServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            boolean ret = false;
            String error_status = "";
            EBudgetTools ebt = new EBudgetTools();
            String method = request.getParameter("allocate_budget[METHOD]");
            if (method.equals("INSERT")) {
                AllocateBudget ab = new AllocateBudget();
                ab.setProject_id(request.getParameter("allocate_budget[project_id]"));
                ab.setOfficeid(request.getParameter("allocate_budget[officeid]"));
                ab.setDisbursement_category_id(Integer.parseInt(request.getParameter("allocate_budget[disbursement_category_id]")));
                ab.setAllocate_budget_total(Double.parseDouble(request.getParameter("allocate_budget[allocate_budget_total]")));
                ab.setAllocate_budget_id(acc.IsNullToEmtyString(request.getParameter("allocate_budget[allocate_budget_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("allocate_budget[allocate_budget_id]")));
                if (ab.getAllocate_budget_id() != 0) {
                    ret = ab.UpdateAllocateBudget(ab);
                } else {
                    if(ebt.CheckBalance(ab.getDisbursement_category_id(),request.getSession().getAttribute("E-Budget-OFFICEID").toString(),ab.getAllocate_budget_total())){
                        ret = ab.InsertAllocateBudget(ab);
                    }else{
                        ret = false;
                        error_status = "งบประมาณไม่พอทำรายการ";
                    }
                }
            } else if (method.equals("DELETE")) {
                AllocateBudget ab = new AllocateBudget();
                ab.setAllocate_budget_id(acc.IsNullToEmtyString(request.getParameter("allocate_budget[allocate_budget_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("allocate_budget[allocate_budget_id]")));
                ret = ab.DeleteAllocateBudget(ab);
            }
            
            if(ret){
                out.write("TRUE");
            }else{
                out.write(error_status);
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
