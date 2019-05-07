package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

public class ActiveProjectServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String method = acc.IsNullToEmtyString(request.getParameter("activeProject[METHOD]"));
            DB2Manager dbms = new DB2Manager();
            boolean ret = false;
            if (method.equals("INSERT")) {
                String query = "UPDATE e_budget.project SET "
                        + "purchase_sub_type_id=" + acc.IsNullToEmtyString(request.getParameter("activeProject[purchase_sub_type_id]")) + ", "
                        + "officeid_active='" + acc.IsNullToEmtyString(request.getParameter("activeProject[officeid]")) + "', "
                        + "project_active_status='Y' "
                        + "WHERE project_id='" + acc.IsNullToEmtyString(request.getParameter("activeProject[project_id]")) + "'";
                ret = dbms.Excute(query);
            } else if (method.equals("DELETE")) {
                String query = "UPDATE e_budget.project SET "
                        + "purchase_sub_type_id=NULL, "
                        + "officeid_active='', "
                        + "project_active_status='' "
                        + "WHERE project_id='" + acc.IsNullToEmtyString(request.getParameter("activeProject[project_id]")) + "'";
                ret = dbms.Excute(query);
            }
            if(ret){
                out.print("TRUE");
            }else{
                out.print("FALSE");
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
