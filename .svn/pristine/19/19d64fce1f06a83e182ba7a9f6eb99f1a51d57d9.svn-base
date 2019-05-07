
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.budget.BudgetCategory;
import rd.ebudget.tools.Accessories;

public class BudgetCategoryServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean ret = false;
        try (PrintWriter out = response.getWriter()) {
            Accessories ac = new Accessories();
            String mode = ac.IsNullToEmtyString(request.getParameter("budget_category[METHOD]"));
            if(mode.equals("INSERT")){
                BudgetCategory bc = new BudgetCategory();
                bc.setBudget_category_id(ac.IsNullToEmtyString(request.getParameter("budget_category[budget_category_id]")));
                bc.setBudget_category_name(ac.IsNullToEmtyString(request.getParameter("budget_category[budget_category_name]")));
                bc.setBudget_category_status(ac.IsNullToEmtyString(request.getParameter("budget_category[budget_category_status]")));
                bc.setBudget_type_id(ac.IsNullToEmtyString(request.getParameter("budget_category[budget_type_id]")));
                if(bc.getBudget_category_id().isEmpty()){
                    ret = bc.InsertBudgetCategory(bc);
                }else{
                    ret = bc.UpdateBudgetCategory(bc);
                }
            }else if(mode.equals("DELETE")){
                BudgetCategory bc = new BudgetCategory();
                bc.setBudget_category_id(ac.IsNullToEmtyString(request.getParameter("budget_category[budget_category_id]")));
                ret = bc.DeleteBudgetCategory(bc);
            }
            if (ret) {
                out.print("TRUE");
            }else{
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
