package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.ProjectKPI;
import rd.ebudget.tools.Accessories;

public class ProjectKPIServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            String method = request.getParameter("project_kpi[METHOD]");
            boolean ret = false;
            if (method.equals("INSERT")) {
                ProjectKPI pk = new ProjectKPI();
                pk.setProject_kpi_id(acc.IsNullToEmtyString(request.getParameter("project_kpi[project_kpi_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("project_kpi[project_kpi_id]")));
                pk.setProject_id(request.getParameter("project_kpi[project_id]"));
                pk.setProject_kpi_name(request.getParameter("project_kpi[project_kpi_name]"));
                pk.setProject_kpi_past_performance(request.getParameter("project_kpi[project_kpi_past_performance]"));
                pk.setProject_kpi_goal_value(request.getParameter("project_kpi[project_kpi_goal]"));
                pk.setProject_kpi_point_one(request.getParameter("project_kpi[project_kpi_point_one]"));
                pk.setProject_kpi_point_two(request.getParameter("project_kpi[project_kpi_point_two]"));
                pk.setProject_kpi_point_three(request.getParameter("project_kpi[project_kpi_point_three]"));
                pk.setProject_kpi_point_four(request.getParameter("project_kpi[project_kpi_point_four]"));
                pk.setProject_kpi_point_five(request.getParameter("project_kpi[project_kpi_point_five]"));
                pk.setProject_kpi_result_value("");
                if (pk.getProject_kpi_id() > 0) {
                    ret = pk.UpdateProjectKPI(pk);
                }else{
                    ret = pk.InsertProjectKPI(pk);
                }
            } else if (method.equals("DELETE")) {
                ProjectKPI pk = new ProjectKPI();
                pk.setProject_kpi_id(Integer.parseInt(request.getParameter("project_kpi[project_kpi_id]")));
                ret = pk.DeleteProjectKPI(pk);
            }
            if(ret){
                out.write("TRUE");
            }else{
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
