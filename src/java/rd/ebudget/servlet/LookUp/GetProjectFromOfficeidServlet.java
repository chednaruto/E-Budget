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
import rd.ebudget.object.Budget.Project;
import rd.ebudget.tools.Accessories;
import rd.ebudget.tools.DB2Manager;

public class GetProjectFromOfficeidServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            String officeid = request.getParameter("officeid");
            String query = "SELECT * FROM e_budget.project p WHERE p.officeid='" + officeid + "'";
            DB2Manager dbms = new DB2Manager();
            ResultSet rs = dbms.GetDataAsResultSet(query);
            Vector<Project> projects = new Vector<>();
            while (rs.next()) {
                Project pj = new Project();
                pj.setProject_id(acc.IsNullToEmtyString(rs.getString("project_id")));
                pj.setProject_name(acc.IsNullToEmtyString(rs.getString("project_name")));
                projects.add(pj);
            }

            Gson gson = new Gson();
            out.print(gson.toJson(projects));
            out.flush();
            out.close();

            rs.close();
            dbms.closeConnection();
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
