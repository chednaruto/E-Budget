/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

public class ActiveDisableUserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String id = acc.IsNullToEmtyString(request.getParameter("id"));
            String officeid = acc.IsNullToEmtyString(request.getParameter("officeid"));
            DB2Manager dbms = new DB2Manager();
            boolean ret = false;
            ResultSet rs = dbms.GetDataAsResultSet("Select * from e_budget.user_permission where id='" + id + "' and officeid='" + officeid + "'");
            if (rs.next()) {
                if (acc.IsNullToEmtyString(rs.getString("permission_status")).equals("Y")) {
                    
                    ret = dbms.Excute("UPDATE e_budget.user_permission SET permission_status = 'N' WHERE id = '" + id + "' AND officeid='" + officeid + "'");
                } else {
                    ret = dbms.Excute("UPDATE e_budget.user_permission SET permission_status = 'Y' WHERE id = '" + id + "' AND officeid='" + officeid + "'");
                }
            }
            rs.close();
            dbms.closeConnection();
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
