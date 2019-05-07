package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.budget.ChangeBudget;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.EBudgetTools;

public class ChangeBudgetServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            boolean ret = false;
            String error_status = "";
            EBudgetTools ebt = new EBudgetTools();
            String method = request.getParameter("change_budget[METHOD]");
            if (method.equals("INSERT")) {
                ChangeBudget cb = new ChangeBudget();
                int change_budget_id = acc.IsNullToEmtyString(request.getParameter("change_budget[change_budget_id]")).isEmpty() ? 0:Integer.parseInt(request.getParameter("change_budget[change_budget_id]"));
                cb.setChange_budget_id(change_budget_id);
                cb.setOfficeid(acc.IsNullToEmtyString(request.getParameter("change_budget[officeid]")));
                cb.setBudget_total(Double.parseDouble(request.getParameter("change_budget[budget_total]")));
                cb.setFrom_disbursement_category_id(Integer.parseInt(request.getParameter("change_budget[from_disbursement_category_id]")));
                cb.setTo_disbursement_category_id(Integer.parseInt(request.getParameter("change_budget[to_disbursement_category_id]")));
                cb.setChange_budget_datetime(acc.ChageDateFormat(request.getParameter("change_budget[change_budget_datetime]"), "dd-MM-yyyy hh:mm:ss", "yyyy-MM-dd hh:mm:ss"));
                if(cb.getChange_budget_id()==0){
                    if(ebt.CheckBalance(cb.getFrom_disbursement_category_id(),request.getSession().getAttribute("E-Budget-OFFICEID").toString(), cb.getBudget_total())) {
                        ret = cb.InsertChangeBudget(cb);
                    }else{
                        error_status = "งบประมาณไม่พอทำรายการ";
                    }
                }else{
                    ret = cb.UpdateChangeBudget(cb);
                }
            }else if(method.equals("DELETE")){
                ChangeBudget cb = new ChangeBudget();
                cb.setChange_budget_id(Integer.parseInt(request.getParameter("change_budget[change_budget_id]")));
                ret = cb.DeleteChageBudget(cb);
            }
            
            if(ret){
                out.print("TRUE");
            }else{
                out.print(error_status);
            }
        } catch (Exception ex) {
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
