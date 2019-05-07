package rd.ebudget.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rd.ebudget.object.Budget.ProjectRisk;
import rd.ebudget.tools.Accessories;

public class ProjectRiskServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Accessories acc = new Accessories();
            //acc.ListRequest(request);
            boolean ret = false;
            String method = request.getParameter("project_risk[METHOD]");
            if (method.equals("INSERT")) {
                ProjectRisk pr = new ProjectRisk();
                pr.setProject_id(request.getParameter("project_risk[project_id]"));
                pr.setProject_risk_id(acc.IsNullToEmtyString(request.getParameter("project_risk[project_risk_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("project_risk[project_risk_id]")));
                pr.setProject_risk_name(request.getParameter("project_risk[project_risk_name]"));
                if(pr.getProject_risk_id()>0){
                    ret = pr.UpdateProjectRisk(pr);
                }else{
                    ret = pr.InsertProjectRisk(pr);
                }
            } else if (method.equals("DELETE")) {
                ProjectRisk pr = new ProjectRisk();
                pr.setProject_id(request.getParameter("project_risk[project_id]"));
                pr.setProject_risk_id(acc.IsNullToEmtyString(request.getParameter("project_risk[project_risk_id]")).isEmpty() ? 0 : Integer.parseInt(request.getParameter("project_risk[project_risk_id]")));
                ret = pr.DeleteProjectRisk(pr);
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
