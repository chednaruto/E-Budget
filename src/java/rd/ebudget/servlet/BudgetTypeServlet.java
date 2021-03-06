
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.budget.BudgetType;
import rd.ebudget.tools.Accessories;

public class BudgetTypeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = acc.IsNullToEmtyString(request.getParameter("budget_type[METHOD]"));
            BudgetType bt = null;
            boolean ret = false;
            if(method.equals("INSERT")){
                bt = new BudgetType();
                bt.setBudget_type_id(acc.IsNullToEmtyString(request.getParameter("budget_type[budget_type_id]")));
                bt.setBudget_type_name(acc.IsNullToEmtyString(request.getParameter("budget_type[budget_type_name]")));
                bt.setBudget_type_status(acc.IsNullToEmtyString(request.getParameter("budget_type[budget_type_status]")));
                if(bt.getBudget_type_id().isEmpty()){
                    ret = bt.InsertBudgetType(bt);
                }else{
                    ret = bt.UpdateBudgetType(bt);
                }
            }else{
                bt = new BudgetType();
                bt.setBudget_type_id(acc.IsNullToEmtyString(request.getParameter("budget_type[budget_type_id]")));
                ret = bt.DeleteBudgetType(bt);
            }
            if(ret){
                out.print("TRUE");
            }else{
                out.print("FALSE");
            }
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
