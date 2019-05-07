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
import javax.servlet.http.HttpSession;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

/**
 *
 * @author Mr.Tue
 */
public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
             {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            boolean ret = false;
            if(acc.IsNullToEmtyString(request.getParameter("id")).isEmpty() || acc.IsNullToEmtyString(request.getParameter("officeid")).isEmpty()){
                ret = false;
            }else{
                String query = "select u.*,o.office_level from e_budget.user u LEFT JOIN e_budget.office o on o.officeid = u.officeid where u.id='"+request.getParameter("id")+"' and u.officeid='"+request.getParameter("officeid")+"'";
                DB2Manager dbms = new DB2Manager();
                ResultSet rs =  dbms.GetDataAsResultSet(query);
                if(rs.next()){
                    HttpSession session = request.getSession();
                    session.setAttribute("E-Budget", true);
                    session.setAttribute("E-Budget-OFFICEID", acc.IsNullToEmtyString(rs.getString("officeid")));
                    session.setAttribute("E-Budget-OFFICENAME", acc.IsNullToEmtyString(rs.getString("officename")));
                    session.setAttribute("E-Budget-DISPLAYNAME", acc.IsNullToEmtyString(rs.getString("title"))+acc.IsNullToEmtyString(rs.getString("fname")));
                    session.setAttribute("E-Budget-UID", acc.IsNullToEmtyString(rs.getString("id")));
                    session.setAttribute("E-Budget-POSITIONM", acc.IsNullToEmtyString(rs.getString("position_m")));
                    session.setAttribute("E-Budget-GROUPNAME", acc.IsNullToEmtyString(rs.getString("groupname")));
                    session.setAttribute("E-Budget-PIN", acc.IsNullToEmtyString(rs.getString("pin")));
                    session.setAttribute("E-Budget-OFFICELEVEL", acc.IsNullToEmtyString(rs.getString("office_level")));
                    query = "select * from e_budget.user_permission where id='"+request.getParameter("id")+"' and officeid='"+request.getParameter("officeid")+"'";
                    rs = dbms.GetDataAsResultSet(query);
                    rs.next();
                    session.setAttribute("E-Budget-Super-Admin", acc.IsNullToEmtyString(rs.getString("super_admin")));
                    session.setAttribute("E-Budget-Admin", acc.IsNullToEmtyString(rs.getString("admin")));
                    session.setAttribute("E-Budget-Project-Manager", acc.IsNullToEmtyString(rs.getString("project_manager")));
                    session.setAttribute("E-Budget-Boss", acc.IsNullToEmtyString(rs.getString("boss")));
                    session.setAttribute("E-Budget-Parcel", acc.IsNullToEmtyString(rs.getString("parcel")));
                    session.setAttribute("E-Budget-Finance", acc.IsNullToEmtyString(rs.getString("finance")));
                    ret = true;
                }
                rs.close();
                dbms.closeConnection();
                
            }
            
            if(ret){
                out.write("TRUE");
            }else{
                out.write("FALSE");
            }
            out.flush();
            out.close();
        }catch(Exception ex){
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
