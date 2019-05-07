/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rd.ebudget.servlet.Dashboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

/**
 *
 * @author Mr.Tue
 */
public class DashBoardReceiveBudget extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            DB2Manager dbms = new DB2Manager();
            String ret = "";
            String query = "SELECT SUM(rb.budget_total) AS budget_total FROM e_budget.receive_budget rb "
                    + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                    + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                    + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id";
            ResultSet rs = dbms.GetDataAsResultSet(query);
            String[] colorAr = {"#f8bd19", "#33ccff", "#ffcccc", "#ccff66"};
            if (rs.next()) {
                ret = "'label': 'งบประมาณรวม,"
                        + "'tooltext': '',"
                        + "'color': '#ffffff',"
                        + "'value': '" + acc.NumberFormat(rs.getDouble("budget_total"), "####.##") + "',"
                        + "'category': [";
                query = "SELECT "
                        + "bt.budget_type_id,bt.budget_type_name, "
                        + "SUM(rb.budget_total) AS budget_total "
                        + "FROM e_budget.receive_budget rb "
                        + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                        + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                        + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                        + "GROUP BY bt.budget_type_id,bt.budget_type_name";
                rs = dbms.GetDataAsResultSet(query);

                int i = 0;
                while (rs.next()) {
                    ret += " {";
                    ret += "'label': '" + rs.getString("budget_type_name") + "',"
                            + "'color': '" + colorAr[i] + "',"
                            + "'value': '" + acc.NumberFormat(rs.getDouble("budget_total"), "####.##") + "',"
                            + "'category':[";
                    query = "SELECT "
                            + "bc.budget_category_id,bc.budget_category_name,"
                            + "SUM(rb.budget_total) AS budget_total "
                            + "FROM e_budget.receive_budget rb "
                            + "LEFT JOIN e_budget.disbursement_category dc ON rb.disbursement_category_id = dc.disbursement_category_id "
                            + "LEFT JOIN e_budget.budget_category bc ON dc.budget_category_id = bc.budget_category_id "
                            + "LEFT JOIN e_budget.budget_type bt ON bc.budget_type_id = bt.budget_type_id "
                            + "WHERE bt.budget_type_id =  " + rs.getString("budget_type_id")
                            + " GROUP BY bc.budget_category_id,bc.budget_category_name";
                    ResultSet rs1 = dbms.GetDataAsResultSet(query);
                    while (rs1.next()) {
                        ret += "{"
                                + "'label': '"+rs1.getString("budget_category_name")+"',"
                                + "'color': '"+colorAr[i]+"',"
                                + "'value': '"+acc.NumberFormat(rs1.getDouble("budget_total"), "####.##")+"'"
                                + "},";
                    }
                    ret = ret.substring(0, ret.length()-1);
                    ret += "]},";
                    i++;
                }

                ret += "]";
            }
            out.print(ret);
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
