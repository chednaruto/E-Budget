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
import rd.ebudget.object.Budget.Office;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

/**
 *
 * @author Mr.Tue
 */
public class GetOfficeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String officeLike = "";
            if (!acc.IsNullToEmtyString(request.getParameter("officeid")).isEmpty()) {
                officeLike = request.getParameter("officeid").substring(0, 2);
                String query = "select * from e_budget.office o where o.officeid like '" + officeLike + "%'";
                DB2Manager dbms = new DB2Manager();
                ResultSet rs = dbms.GetDataAsResultSet(query);
                Vector<Office> offices = new Vector<>();
                while (rs.next()) {
                    Office office = new Office();
                    office.setOfficeid(rs.getString("officeid"));
                    office.setOfficename(rs.getString("officename"));
                    office.setActive_status(rs.getString("active_status"));
                    office.setOffice_level(rs.getString("office_level"));
                    offices.add(office);
                }
                rs.close();
                dbms.closeConnection();

                Gson gson = new Gson();
                out.print(gson.toJson(offices));
                out.flush();
                out.close();

            }
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
