/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rd.ebudget.servlet.LookUp;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.lookup.budget.BudgetCategory;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;
import rd.ebudget.tools.MysqlManager;

public class GetBudgetCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            DB2Manager mm = new DB2Manager();
            String budget_type_id = acc.IsNullToEmtyString(request.getParameter("budget_type_id"));
            String query = "SELECT * FROM e_budget.budget_category WHERE budget_category_status='Y' AND budget_type_id=" + budget_type_id;
            ResultSet rs = mm.GetDataAsResultSet(query);
            BudgetCategory bc = null;
            Vector<BudgetCategory> bcs = new Vector<>();
            while (rs.next()) {
                bc = new BudgetCategory();
                bc.setBudget_category_id(rs.getString("budget_category_id"));
                bc.setBudget_category_name(rs.getString("budget_category_name"));
                bc.setBudget_category_status(rs.getString("budget_category_status"));
                bc.setBudget_type_id(rs.getString("budget_type_id"));
                bcs.add(bc);
            }
            mm.closeConnection();
            Gson gson = new Gson();
            out.print(gson.toJson(bcs));
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
