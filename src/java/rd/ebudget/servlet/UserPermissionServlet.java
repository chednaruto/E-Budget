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
import rd.ebudget.object.Budget.UserPermission;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

/**
 *
 * @author Mr.Tue
 */
public class UserPermissionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            boolean ret = false;
            String method = acc.IsNullToEmtyString(request.getParameter("user_permission[METHOD]"));
            DB2Manager dbms = new DB2Manager();
            String query = "SELECT COUNT(*) AS cc FROM e_budget.user_permission WHERE id = '"+request.getParameter("user_permission[id]")+"' and officeid='"+request.getParameter("user_permission[officeid]")+"'";
            ResultSet rs = dbms.GetDataAsResultSet(query);
            rs.next();
            if (method.equals("INSERT")) {
                UserPermission up = new UserPermission();
                up.setId(acc.IsNullToEmtyString(request.getParameter("user_permission[id]")));
                up.setOfficeid(acc.IsNullToEmtyString(request.getParameter("user_permission[officeid]")));
                up.setPermission_status(acc.IsNullToEmtyString(request.getParameter("user_permission[permission_status]")));
                up.setSuper_admin(acc.IsNullToEmtyString(request.getParameter("user_permission[super_admin]")));
                up.setAdmin(acc.IsNullToEmtyString(request.getParameter("user_permission[admin]")));
                up.setBoss(acc.IsNullToEmtyString(request.getParameter("user_permission[boss]")));
                up.setFinance(acc.IsNullToEmtyString(request.getParameter("user_permission[finance]")));
                up.setParcel(acc.IsNullToEmtyString(request.getParameter("user_permission[parcel]")));
                up.setProject_manager(acc.IsNullToEmtyString(request.getParameter("user_permission[project_manager]")));
                if(rs.getInt("cc")>0){
                    ret = up.UpdateUserPermission(up);
                }else{
                    ret = up.InsertUserPermission(up);
                }
                
            } else if (method.equals("UPDATE")) {
                UserPermission up = new UserPermission();
                up.setId(acc.IsNullToEmtyString(request.getParameter("user_permission[id]")));
                up.setOfficeid(acc.IsNullToEmtyString(request.getParameter("user_permission[officeid]")));
                up.setPermission_status(acc.IsNullToEmtyString(request.getParameter("user_permission[permission_status]")));
                up.setSuper_admin(acc.IsNullToEmtyString(request.getParameter("user_permission[super_admin]")));
                up.setAdmin(acc.IsNullToEmtyString(request.getParameter("user_permission[admin]")));
                up.setBoss(acc.IsNullToEmtyString(request.getParameter("user_permission[boss]")));
                up.setFinance(acc.IsNullToEmtyString(request.getParameter("user_permission[finance]")));
                up.setParcel(acc.IsNullToEmtyString(request.getParameter("user_permission[parcel]")));
                up.setProject_manager(acc.IsNullToEmtyString(request.getParameter("user_permission[project_manager]")));
                if(rs.getInt("cc")>0){
                    ret = up.UpdateUserPermission(up);
                }else{
                    ret = up.InsertUserPermission(up);
                }
            } else if (method.equals("DELETE")) {
                UserPermission up = new UserPermission();
                up.setId(acc.IsNullToEmtyString(request.getParameter("user_permission[id]")));
                up.setOfficeid(acc.IsNullToEmtyString(request.getParameter("user_permission[officeid]")));
                ret = up.DeleteUserPermission(up);
            }

            if (ret) {
                out.print("TRUE");
            } else {
                out.print("FALSE");
            }
            out.flush();
            out.close();
            rs.close();
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
